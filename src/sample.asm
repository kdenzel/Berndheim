		include "src/utils.inc"
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Interrupt addresses
		section "vblank_interrupt", rom0[$40]
VBlank:	
		reti
		
		SECTION "LCD controller status interrupt", ROM0[$0048]
;; HACK!!!!!!!!!!!!!
;; there's some sort of bug in the emulator which needs to be fixed,
;; which screws up the program counter immediately after it exits a halt.
;; this nop protects against that for now.
		nop
		jp isr_wrapper
		
		SECTION "Timer overflow interrupt", ROM0[$0050]
		nop
		jp isr_wrapper
		
		section "sample", rom0
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		
		def TILES_COUNT equ (384)
		def BYTES_PER_TILE equ (16)
		def TILESET_SIZE equ (TILES_COUNT * BYTES_PER_TILE)
		
		def TILEMAPS_COUNT equ (1)
		def BYTES_PER_TILEMAP equ (32 * 32)
		def TILEMAPS_SIZE equ (TILEMAPS_COUNT * BYTES_PER_TILEMAP)
		
		def GRAPHICS_DATA_ADDRESS_END equ ($8000)
		def TILESET_DATA_ADDRESS_START equ (GRAPHICS_DATA_ADDRESS_END - TILEMAPS_SIZE - TILESET_SIZE)
		
		def TILEMAPS_DATA_ADRESS_START equ(GRAPHICS_DATA_ADDRESS_END - TILEMAPS_SIZE)
		
		def USE_TIMER equ (1)
		def TIMER_MODULO equ (135)
		
; load the graphics data from ROM to VRAM
		macro LoadGraphicsDataIntoVRAM
; load tileset from ROM to VRAM
		ld de, TILESET_DATA_ADDRESS_START
		ld hl, GRAPHICS_DATA_ADDRESS_END
		ld bc, TILESET_SIZE
		call Memcopy
		
; load tilemap from ROM to VRAM
	    ld de, TILEMAPS_DATA_ADRESS_START
		ld hl, GRAPHICS_DATA_ADDRESS_END + TILESET_SIZE
		ld bc, TILEMAPS_SIZE
		call Memcopy
		endm
		
Memcopy:	
		ld a, [de]
		ld [hli], a
		inc de
		dec bc
		ld a, b
		or a, c
		jp nz, Memcopy
		ret
		
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		
		rsset _RAM
		
		def WRAM_FRAME_COUNTER rb 1
		def WRAM_NOTE_INDEX rb 1
		
		def WRAM_END rb 0
		
; sanity checks
		def WRAM_USAGE equ (WRAM_END - _RAM)
		println "WRAM usage: {d:WRAM_USAGE} bytes"
		assert WRAM_USAGE <= $2000,  "Too many bytes used in WRAM"
		
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		
		
InitSample:	
; init the WRAM state
		copy [WRAM_FRAME_COUNTER], $FF
		
; 1. Power on APU
		copy [rNR52], AUDENA_ON
		copy [rNR50], $77
		copy [rNR51], $FF
		
		ld hl, erika
		call hUGE_init
		
; init the palette
		copy [rBGP], $E4 ; 11 10 01 00
		
		LoadGraphicsDataIntoVRAM
		
; set the graphics parameters and turn LCD back on
		copy [rLCDC], LCDCF_ON | LCDCF_BG8800 | LCDCF_BG9800 | LCDCF_BGON
		
		IF DEF(USE_TIMER)
		ld a, TIMER_MODULO
		ldh [rTMA], a
		ld a, 4 		; 4096 hz
		ldh [rTAC], a
		
		ld a, IEF_TIMER
		ldh [rIE], a
		ELSE
;; Enable the HBlank interrupt on scanline 0
		ldh a, [rSTAT]
		or a, STATF_LYC
		ldh [rSTAT], a
		xor a 			; ld a, 0
		ldh [rLYC], a
		
		ld a, IEF_LCDC
		ldh [rIE], a
		endc
		ei
		ret
		
UpdateSample:	
		
		UpdatePadInput
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		
		TestPadInput_Pressed PADF_A
		jr z, .button_a
		debugMsg "A BUTTON"
		ld de, $C6D6
		call play_sound
		.button_a
		
		TestPadInput_Pressed PADF_B
		jr z, .button_b
		debugMsg "B BUTTON"
		ld de, $C6F6
		call play_sound
		.button_b
		
		ret
		
play_sound:	
		copy [rNR10], $00
		copy [rNR11], $80
		copy [rNR12], $F0
		copy [rNR13], e
		copy [rNR14], d
		ret
		
; interrupt service routine (ISR)
isr_wrapper:	
		push af
		push hl
		push bc
		push de
		call hUGE_dosound
		pop de
		pop bc
		pop hl
		pop af
		reti
		
		export InitSample, UpdateSample
		
		
		
		section "graphics_data", rom0[TILESET_DATA_ADDRESS_START]
		
		incbin "./assets/tileset.chr"
		incbin "./assets/background.tlm"
		
		
