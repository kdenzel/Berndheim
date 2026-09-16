include "src/include/hUGE.inc"

SECTION "erika Song Data", ROMX

erika::
db 8
dw order_cnt
dw order1, order2, order3, order4
dw duty_instruments, wave_instruments, noise_instruments
dw routines
dw waves

order_cnt: db 6
order1: dw P1,P11,P29
order2: dw P1,P11,P29
order3: dw P2,P2,P2
order4: dw P2,P2,P2

P1:
 dn C_4,5,$000
 dn ___,0,$000
 dn ___,0,$000
 dn C#4,5,$000
 dn D#4,5,$000
 dn ___,0,$000
 dn D#4,5,$000
 dn ___,0,$000
 dn D#4,5,$000
 dn ___,0,$000
 dn G#4,5,$000
 dn ___,0,$000
 dn G#4,5,$000
 dn ___,0,$000
 dn C_5,5,$000
 dn ___,0,$000
 dn C_5,5,$000
 dn ___,0,$000
 dn ___,0,$000
 dn A#4,5,$000
 dn G#4,5,$000
 dn ___,0,$000
 dn C_3,15,$000
 dn ___,0,$000
 dn C_3,15,$000
 dn ___,0,$000
 dn C_3,15,$000
 dn ___,0,$000
 dn F#4,5,$000
 dn ___,0,$000
 dn G#4,5,$000
 dn ___,0,$000
 dn A#4,5,$000
 dn ___,0,$000
 dn C_3,15,$000
 dn ___,0,$000
 dn C_3,15,$000
 dn ___,0,$000
 dn C_3,15,$000
 dn ___,0,$000
 dn C_5,5,$000
 dn ___,0,$000
 dn ___,0,$000
 dn A#4,5,$000
 dn G#4,5,$000
 dn ___,0,$000
 dn C_3,15,$000
 dn ___,0,$000
 dn C_3,15,$000
 dn ___,0,$000
 dn C_3,15,$000
 dn ___,0,$000
 dn C_4,5,$000
 dn ___,0,$000
 dn ___,0,$000
 dn C#4,5,$000
 dn D#4,5,$000
 dn ___,0,$000
 dn D#4,5,$000
 dn ___,0,$000
 dn D#4,5,$000
 dn ___,0,$000
 dn G#4,5,$000
 dn ___,0,$000

P2:
 dn ___,0,$000
 dn ___,0,$000
 dn ___,0,$000
 dn ___,0,$000
 dn ___,0,$000
 dn ___,0,$000
 dn ___,0,$000
 dn ___,0,$000
 dn ___,0,$000
 dn ___,0,$000
 dn ___,0,$000
 dn ___,0,$000
 dn ___,0,$000
 dn ___,0,$000
 dn ___,0,$000
 dn ___,0,$000
 dn ___,0,$000
 dn ___,0,$000
 dn ___,0,$000
 dn ___,0,$000
 dn ___,0,$000
 dn ___,0,$000
 dn ___,0,$000
 dn ___,0,$000
 dn ___,0,$000
 dn ___,0,$000
 dn ___,0,$000
 dn ___,0,$000
 dn ___,0,$000
 dn ___,0,$000
 dn ___,0,$000
 dn ___,0,$000
 dn ___,0,$000
 dn ___,0,$000
 dn ___,0,$000
 dn ___,0,$000
 dn ___,0,$000
 dn ___,0,$000
 dn ___,0,$000
 dn ___,0,$000
 dn ___,0,$000
 dn ___,0,$000
 dn ___,0,$000
 dn ___,0,$000
 dn ___,0,$000
 dn ___,0,$000
 dn ___,0,$000
 dn ___,0,$000
 dn ___,0,$000
 dn ___,0,$000
 dn ___,0,$000
 dn ___,0,$000
 dn ___,0,$000
 dn ___,0,$000
 dn ___,0,$000
 dn ___,0,$000
 dn ___,0,$000
 dn ___,0,$000
 dn ___,0,$000
 dn ___,0,$000
 dn ___,0,$000
 dn ___,0,$000
 dn ___,0,$000
 dn ___,0,$000

P11:
 dn G#4,5,$000
 dn ___,0,$000
 dn C_5,5,$000
 dn ___,0,$000
 dn C_5,5,$000
 dn ___,0,$000
 dn ___,0,$000
 dn A#4,5,$000
 dn G#4,5,$000
 dn ___,0,$000
 dn C_3,15,$000
 dn ___,0,$000
 dn C_3,15,$000
 dn ___,0,$000
 dn C_3,15,$000
 dn ___,0,$000
 dn F#4,5,$000
 dn ___,0,$000
 dn G#4,5,$000
 dn ___,0,$000
 dn A#4,5,$000
 dn ___,0,$000
 dn C_3,15,$000
 dn ___,0,$000
 dn C_3,15,$000
 dn ___,0,$000
 dn C_3,15,$000
 dn ___,0,$000
 dn C_5,5,$000
 dn ___,0,$000
 dn ___,0,$000
 dn A#4,5,$000
 dn G#4,5,$000
 dn ___,0,$000
 dn C_3,15,$000
 dn ___,0,$000
 dn C_3,15,$000
 dn ___,0,$000
 dn C_3,15,$000
 dn ___,0,$000
 dn F#4,5,$000
 dn ___,0,$000
 dn ___,0,$000
 dn G#4,5,$000
 dn A#4,5,$000
 dn ___,0,$000
 dn A#4,5,$000
 dn ___,0,$000
 dn A#4,5,$000
 dn ___,0,$000
 dn A#4,5,$000
 dn ___,0,$000
 dn D#5,5,$000
 dn ___,0,$000
 dn ___,0,$000
 dn C#5,5,$000
 dn C_5,5,$000
 dn ___,0,$000
 dn C_3,15,$000
 dn ___,0,$000
 dn C_3,15,$000
 dn ___,0,$000
 dn C_3,15,$000
 dn ___,0,$000

P29:
 dn F#4,5,$000
 dn ___,0,$000
 dn G#4,5,$000
 dn ___,0,$000
 dn A#4,5,$000
 dn ___,0,$000
 dn A#4,5,$000
 dn ___,0,$000
 dn A#4,5,$000
 dn ___,0,$000
 dn A#4,5,$000
 dn ___,0,$000
 dn D#5,5,$000
 dn ___,0,$000
 dn ___,0,$000
 dn C#5,5,$000
 dn C_5,5,$000
 dn ___,0,$000
 dn C_3,15,$000
 dn ___,0,$000
 dn C_3,15,$000
 dn ___,0,$000
 dn C_3,15,$000
 dn ___,0,$000
 dn ___,0,$B00
 dn ___,0,$000
 dn ___,0,$000
 dn ___,0,$000
 dn ___,0,$000
 dn ___,0,$000
 dn ___,0,$000
 dn ___,0,$000
 dn ___,0,$000
 dn ___,0,$000
 dn ___,0,$000
 dn ___,0,$000
 dn ___,0,$000
 dn ___,0,$000
 dn ___,0,$000
 dn ___,0,$000
 dn ___,0,$000
 dn ___,0,$000
 dn ___,0,$000
 dn ___,0,$000
 dn ___,0,$000
 dn ___,0,$000
 dn ___,0,$000
 dn ___,0,$000
 dn ___,0,$000
 dn ___,0,$000
 dn ___,0,$000
 dn ___,0,$000
 dn ___,0,$000
 dn ___,0,$000
 dn ___,0,$000
 dn ___,0,$000
 dn ___,0,$000
 dn ___,0,$000
 dn ___,0,$000
 dn ___,0,$000
 dn ___,0,$000
 dn ___,0,$000
 dn ___,0,$000
 dn ___,0,$000

duty_instruments:
itSquareinst1:
db 8
db 0
db 240
dw 0
db 128

itSquareinst2:
db 8
db 64
db 240
dw 0
db 128

itSquareinst3:
db 8
db 128
db 240
dw 0
db 128

itSquareinst4:
db 8
db 192
db 240
dw 0
db 128

itSquareinst5:
db 8
db 0
db 243
dw 0
db 128

itSquareinst6:
db 8
db 64
db 241
dw 0
db 128

itSquareinst7:
db 8
db 128
db 241
dw 0
db 128

itSquareinst8:
db 8
db 192
db 241
dw 0
db 128

itSquareinst9:
db 8
db 128
db 240
dw 0
db 128

itSquareinst10:
db 8
db 128
db 240
dw 0
db 128

itSquareinst11:
db 8
db 128
db 240
dw 0
db 128

itSquareinst12:
db 8
db 128
db 240
dw 0
db 128

itSquareinst13:
db 8
db 128
db 240
dw 0
db 128

itSquareinst14:
db 8
db 128
db 240
dw 0
db 128

itSquareinst15:
db 72
db 192
db 241
dw 0
db 192



wave_instruments:


noise_instruments:


routines:
__hUGE_Routine_0:

__end_hUGE_Routine_0:
ret

__hUGE_Routine_1:

__end_hUGE_Routine_1:
ret

__hUGE_Routine_2:

__end_hUGE_Routine_2:
ret

__hUGE_Routine_3:

__end_hUGE_Routine_3:
ret

__hUGE_Routine_4:

__end_hUGE_Routine_4:
ret

__hUGE_Routine_5:

__end_hUGE_Routine_5:
ret

__hUGE_Routine_6:

__end_hUGE_Routine_6:
ret

__hUGE_Routine_7:

__end_hUGE_Routine_7:
ret

__hUGE_Routine_8:

__end_hUGE_Routine_8:
ret

__hUGE_Routine_9:

__end_hUGE_Routine_9:
ret

__hUGE_Routine_10:

__end_hUGE_Routine_10:
ret

__hUGE_Routine_11:

__end_hUGE_Routine_11:
ret

__hUGE_Routine_12:

__end_hUGE_Routine_12:
ret

__hUGE_Routine_13:

__end_hUGE_Routine_13:
ret

__hUGE_Routine_14:

__end_hUGE_Routine_14:
ret

__hUGE_Routine_15:

__end_hUGE_Routine_15:
ret

waves:

