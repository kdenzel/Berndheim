		include "src/hardware.inc"
        include "src/erika_song.asm"
		
		section "header", rom0[$0100]
entrypoint:	
		
		di
		
		jp main
		
		ds ($0150 - @), 0
		
		
		
		macro DisableLCD
; wait for the vblank
		.wait_vblank\@
		ld a, [rLY]
		cp a, SCRN_Y
		jr nz, .wait_vblank\@
		
; turn the LCD off
		xor a
		ld [rLCDC], a
		endm
		
		
		section "main", rom0[$0150]
		
main:	
		
		DisableLCD
		call InitSample
        ei
		
MainLoop:	
		halt
		call UpdateSample
		jr MainLoop
