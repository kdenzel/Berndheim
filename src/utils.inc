		if !def(UTILS_RGBINC)
		def UTILS_RGBINC equ 1
		
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		
		include "src/hardware.inc"
		
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Macro-instructions
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		
; copy \2 into \1 through (a)
; example: copy [$FF84], 10
		macro copy
		ld a, \2
		ld \1, a
		endm
		
; read the keypad input into a pad input struct at address \1
; expected to be used only once in the main loop
; example: UpdatePadInput _HRAM + 4
		macro UpdatePadInput
		call ReadInput
		endm
		
; raise the zero flag if all keys in \2 are held in the pad input struct \1
; example: TestPadInput_HeldAll _RAM + 4, PADF_LEFT | PADF_DOWN
		macro TestPadInput_HeldAll
		ld a, [wCurKeys]
		and a, \1
		endm
		
; raise the zero flag if input \2 is pressed in the pad input struct \1
; example: TestPadInput_Pressed _HRAM + 12, PADF_LEFT
		macro TestPadInput_Pressed
		ld a, [wNewKeys]
		and a, \1
		endm
		
; raise the zero flag if input \2 is released in the pad input struct \1
; example: TestPadInput_Released _RAM + 24, PADF_A
		macro TestPadInput_Released
		ld a, [wNewKeys]
		and a, \1
		endm
		
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		
; debug_message macro for RGBDS compatible with BGB
; Usage: debug_message "Your message here"
		
		macro debugMsg
		ld d, d 		; no-op opcode used as BGB debug message marker
		jr .end\@ 		; jump over data payload
		dw $6464 		; ASCII 'dd' tag for debug messages
		dw $0000 		; identifier for message type
		db \1,0          ; null-terminated string message
		.end\@
		endm

		endc
		
		SECTION "Input Variables", WRAM0
wCurKeys:	db
wNewKeys:	db
		
		SECTION "Input", ROM0
		
ReadInput:	
;;  Poll buttons
		ld a, P1F_GET_BTN
		call .onenibble
		ld b, a
		
;;  Poll dpad
		ld a, P1F_GET_DPAD
		call .onenibble
		swap a
		xor a, b
		ld b, a
		
;;  Release
		ld a, P1F_GET_NONE
		ldh [rP1], a
		
;; Combine keys input
		ld a, [wCurKeys]
		xor a, b 		; A = keys changed state
		and a, b 		; A = keys that changed to pressed
		ld [wNewKeys], a
		ld a, b
		ld [wCurKeys], a
		ret
		
		.onenibble
		ldh [rP1], a 	; Switch the player one matrix on
		call .knownret 	; Burn 10 cycles
		ldh a, [rP1]
		ldh a, [rP1]
		ldh a, [rP1] 	; Key matrix has settled
		or a, $F0 		; A7-4 = 1, A3-0 = unpressed keys
		.knownret
		ret
