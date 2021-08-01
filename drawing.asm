.data
	displayAddress: .word 0x10008000
	
	# ship colours
	lblue: .word 0xbbdefb
	blue: .word 0x3f51b5
	red: .word 0xf44336
	yellow: .word 0xffc107
		
	# obstacle colours
	blue0: .word 0x263238
	blue1: .word 0x37474f
	blue2: .word 0x455a64
	blue3: .word 0x607d8b
	blue4: .word 0x90a4ae
	
	keystroke: .word 0xffff0000

	ship: .word 15104, 15112, 15612, 15636, 16124, 16156, 16640, 16652, 17148, 17156
	
	# screen colours
	white: .word 0xffffff
	pink: .word 0xff8b80
	grey: .word 0x607d8b
	black: .word 0x000000
	
.text
	lw $t0, displayAddress # $t0 stores the base address for display
	lw $t1, white # $t1 stores white
	lw $t2, pink # $t2 stores pink
	lw $t3, red # $t3 stores pink
	lw $t4, yellow # $t4 stores yellow
	lw $t5, grey # $t5 stores grey
	
	# delete comment symbol to check, don't delete both at the same time
	# j draw_start_screen1	# I failed to connect this part to the keyboard, hope you can make it
	# j draw_countdown # after 3, 2, 1, START!, the board is shown
	j exit
	
draw_start_screen1:
	addi $t0, $t0, 10304
	jal draw_W
	jal draw_E
	jal draw_L
	jal draw_C
	jal draw_O
	jal draw_M
	jal draw_E
	addi $t0, $t0, 4
	jal draw_T
	jal draw_O
	addi $t0, $t0, 4
	jal draw_T
	jal draw_H
	jal draw_E
	addi $t0, $t0, 4
	jal draw_S
	jal draw_P
	jal draw_A
	jal draw_C
	jal draw_E
	jal draw_exclamation
	lw $t0, displayAddress
	addi $t0, $t0, 18072
	jal draw_A
	jal draw_arrow_left
	addi $t0, $t0, 8
	jal draw_D
	jal draw_arrow_right
	addi $t0, $t0, 8
	jal draw_S
	jal draw_arrow_down
	addi $t0, $t0, 8
	jal draw_W
	jal draw_arrow_up
draw_start_screen2:
	lw $t0, displayAddress
	addi $t0, $t0, 14452
	jal draw_P
	jal draw_R
	jal draw_E
	jal draw_S
	jal draw_S
	addi $t0, $t0, 8
	jal draw_P
	addi $t0, $t0, 8
	jal draw_T
	jal draw_O
	addi $t0, $t0, 4
	jal draw_S
	jal draw_T
	jal draw_A
	jal draw_R
	jal draw_T
	lw $t1, black
	li $a0, 300
	li $v0, 32
	syscall
	j draw_start_screen3
draw_start_screen3:
	lw $t0, displayAddress
	addi $t0, $t0, 14452
	jal draw_P
	jal draw_R
	jal draw_E
	jal draw_S
	jal draw_S
	addi $t0, $t0, 8
	jal draw_P
	addi $t0, $t0, 8
	jal draw_T
	jal draw_O
	addi $t0, $t0, 4
	jal draw_S
	jal draw_T
	jal draw_A
	jal draw_R
	jal draw_T
	lw $t1, white
	li $a0, 100
	li $v0, 32
	syscall
	j draw_start_screen2
draw_W:
	sw $t1, 0($t0)
	sw $t1, 512($t0)
	sw $t1, 1024($t0)
	sw $t1, 1536($t0)
	sw $t1, 2048($t0)
	sw $t1, 1540($t0)
	sw $t1, 1032($t0)
	sw $t1, 1548($t0)
	sw $t1, 16($t0)
	sw $t1, 528($t0)
	sw $t1, 1040($t0)
	sw $t1, 1552($t0)
	sw $t1, 2064($t0)
	addi $t0, $t0, 24
	jr $ra
draw_E:
	sw $t1, 0($t0)
	sw $t1, 512($t0)
	sw $t1, 1024($t0)
	sw $t1, 1536($t0)
	sw $t1, 2048($t0)
	sw $t1, 4($t0)
	sw $t1, 8($t0)
	sw $t1, 12($t0)
	sw $t1, 1028($t0)
	sw $t1, 1032($t0)
	sw $t1, 2052($t0)
	sw $t1, 2056($t0)
	sw $t1, 2060($t0)
	addi $t0, $t0, 20
	jr $ra
draw_L:
	sw $t1, 0($t0)
	sw $t1, 512($t0)
	sw $t1, 1024($t0)
	sw $t1, 1536($t0)
	sw $t1, 2048($t0)
	sw $t1, 2052($t0)
	sw $t1, 2056($t0)
	sw $t1, 2060($t0)
	addi $t0, $t0, 20
	jr $ra
draw_C:
	sw $t1, 512($t0)
	sw $t1, 1024($t0)
	sw $t1, 1536($t0)
	sw $t1, 4($t0)
	sw $t1, 8($t0)
	sw $t1, 2052($t0)
	sw $t1, 2056($t0)
	sw $t1, 524($t0)
	sw $t1, 1548($t0)
	addi $t0, $t0, 20
	jr $ra
draw_O:
	sw $t1, 512($t0)
	sw $t1, 1024($t0)
	sw $t1, 1536($t0)
	sw $t1, 4($t0)
	sw $t1, 8($t0)
	sw $t1, 2052($t0)
	sw $t1, 2056($t0)
	sw $t1, 524($t0)
	sw $t1, 1036($t0)
	sw $t1, 1548($t0)
	addi $t0, $t0, 20
	jr $ra
draw_M:
	sw $t1, 0($t0)
	sw $t1, 512($t0)
	sw $t1, 1024($t0)
	sw $t1, 1536($t0)
	sw $t1, 2048($t0)
	sw $t1, 516($t0)
	sw $t1, 1032($t0)
	sw $t1, 524($t0)
	sw $t1, 16($t0)
	sw $t1, 528($t0)
	sw $t1, 1040($t0)
	sw $t1, 1552($t0)
	sw $t1, 2064($t0)
	addi $t0, $t0, 24
	jr $ra
draw_T:
	sw $t1, 0($t0)
	sw $t1, 4($t0)
	sw $t1, 8($t0)
	sw $t1, 12($t0)
	sw $t1, 16($t0)
	sw $t1, 520($t0)
	sw $t1, 1032($t0)
	sw $t1, 1544($t0)
	sw $t1, 2056($t0)
	addi $t0, $t0, 24
	jr $ra
draw_H:
	sw $t1, 0($t0)
	sw $t1, 512($t0)
	sw $t1, 1024($t0)
	sw $t1, 1536($t0)
	sw $t1, 2048($t0)
	sw $t1, 1028($t0)
	sw $t1, 1032($t0)
	sw $t1, 12($t0)
	sw $t1, 524($t0)
	sw $t1, 1036($t0)
	sw $t1, 1548($t0)
	sw $t1, 2060($t0)
	addi $t0, $t0, 20
	jr $ra
draw_S:
	sw $t1, 512($t0)
	sw $t1, 2048($t0)
	sw $t1, 4($t0)
	sw $t1, 1028($t0)
	sw $t1, 2052($t0)
	sw $t1, 8($t0)
	sw $t1, 1032($t0)
	sw $t1, 2056($t0)
	sw $t1, 12($t0)
	sw $t1, 1548($t0)
	addi $t0, $t0, 20
	jr $ra
draw_P:
	sw $t1, 0($t0)
	sw $t1, 512($t0)
	sw $t1, 1024($t0)
	sw $t1, 1536($t0)
	sw $t1, 2048($t0)
	sw $t1, 4($t0)
	sw $t1, 8($t0)
	sw $t1, 1028($t0)
	sw $t1, 1032($t0)
	sw $t1, 524($t0)
	addi $t0, $t0, 20
	jr $ra
draw_A:
	sw $t1, 4($t0)
	sw $t1, 8($t0)
	sw $t1, 512($t0)
	sw $t1, 1024($t0)
	sw $t1, 1536($t0)
	sw $t1, 2048($t0)
	sw $t1, 1028($t0)
	sw $t1, 1032($t0)
	sw $t1, 524($t0)
	sw $t1, 1036($t0)
	sw $t1, 1548($t0)
	sw $t1, 2060($t0)
	addi $t0, $t0, 20
	jr $ra
draw_exclamation:
	sw $t1, 0($t0)
	sw $t1, 512($t0)
	sw $t1, 1024($t0)
	sw $t1, 2048($t0)
	addi $t0, $t0, 4
	jr $ra
draw_R:
	sw $t1, 0($t0)
	sw $t1, 512($t0)
	sw $t1, 1024($t0)
	sw $t1, 1536($t0)
	sw $t1, 2048($t0)
	sw $t1, 4($t0)
	sw $t1, 8($t0)
	sw $t1, 1028($t0)
	sw $t1, 1032($t0)
	sw $t1, 524($t0)
	sw $t1, 1544($t0)
	sw $t1, 1032($t0)
	sw $t1, 2060($t0)
	addi $t0, $t0, 20
	jr $ra
draw_D:
	sw $t1, 0($t0)
	sw $t1, 512($t0)
	sw $t1, 1024($t0)
	sw $t1, 1536($t0)
	sw $t1, 2048($t0)
	sw $t1, 4($t0)
	sw $t1, 8($t0)
	sw $t1, 2052($t0)
	sw $t1, 2056($t0)
	sw $t1, 524($t0)
	sw $t1, 1036($t0)
	sw $t1, 1548($t0)
	addi $t0, $t0, 20
	jr $ra
draw_arrow_left:
	sw $t1, 8($t0)
	sw $t1, 516($t0)
	sw $t1, 520($t0)
	sw $t1, 1024($t0)
	sw $t1, 1028($t0)
	sw $t1, 1032($t0)
	sw $t1, 1036($t0)
	sw $t1, 1040($t0)
	sw $t1, 1540($t0)
	sw $t1, 1544($t0)
	sw $t1, 2056($t0)
	addi $t0, $t0, 24
	jr $ra
draw_arrow_right:
	sw $t1, 8($t0)
	sw $t1, 520($t0)
	sw $t1, 524($t0)
	sw $t1, 1024($t0)
	sw $t1, 1028($t0)
	sw $t1, 1032($t0)
	sw $t1, 1036($t0)
	sw $t1, 1040($t0)
	sw $t1, 1544($t0)
	sw $t1, 1548($t0)
	sw $t1, 2056($t0)
	addi $t0, $t0, 24
	jr $ra
draw_arrow_down:
	sw $t1, 8($t0)
	sw $t1, 520($t0)
	sw $t1, 1024($t0)
	sw $t1, 1028($t0)
	sw $t1, 1032($t0)
	sw $t1, 1036($t0)
	sw $t1, 1040($t0)
	sw $t1, 1540($t0)
	sw $t1, 1544($t0)
	sw $t1, 1548($t0)
	sw $t1, 2056($t0)
	addi $t0, $t0, 24
	jr $ra
draw_arrow_up:
	sw $t1, 8($t0)
	sw $t1, 516($t0)
	sw $t1, 520($t0)
	sw $t1, 524($t0)
	sw $t1, 1024($t0)
	sw $t1, 1028($t0)
	sw $t1, 1032($t0)
	sw $t1, 1036($t0)
	sw $t1, 1040($t0)
	sw $t1, 1544($t0)
	sw $t1, 2056($t0)
	addi $t0, $t0, 24
	jr $ra
draw_board:
	# draw the frame
	lw $t0, displayAddress
	addi $t0, $t0, 27648
	jal draw_vertical_line
	addi $t0, $t0, 128
	jal draw_vertical_line
	addi $t0, $t0, 284
	jal draw_vertical_line
	addi $t0, $t0, 96
	jal draw_vertical_line
	lw $t0, displayAddress
	addi $t0, $t0, 27648
	li $t6, 0
	jal draw_horizontal_line
	lw $t0, displayAddress
	addi $t0, $t0, 32252
	li $t6, 0
	jal draw_horizontal_line
	# draw hearts
	lw $t0, displayAddress
	addi $t0, $t0, 29704
	jal draw_heart
	addi $t0, $t0, 24
	jal draw_heart
	addi $t0, $t0, 24
	jal draw_heart
	addi $t0, $t0, 24
	jal draw_heart
	addi $t0, $t0, 24
	jal draw_heart
	# draw points (00000)
	lw $t0, displayAddress
	addi $t0, $t0, 29676
	jal draw_zero
	subi $t0, $t0, 16
	jal draw_zero
	subi $t0, $t0, 16
	jal draw_zero
	subi $t0, $t0, 16
	jal draw_zero
	subi $t0, $t0, 16
	jal draw_zero
	# draw letters
	lw $t0, displayAddress
	sw $t1, 26632($t0)	# draw "H" in "HP"
	sw $t1, 27144($t0)
	sw $t1, 27656($t0)
	sw $t1, 28168($t0)
	sw $t1, 27148($t0)
	sw $t1, 26640($t0)
	sw $t1, 27152($t0)
	sw $t1, 27664($t0)
	sw $t1, 28176($t0)
	addi $t0, $t0, 26648	# draw "P" in "HP"
	jal draw_small_P
	
	lw $t0, displayAddress	# draw "P" in "POINTS"
	addi $t0, $t0, 27044
	jal draw_small_P
	jal draw_small_O	# draw "O" in "POINTS"
	sw $t1, 0($t0)		# draw "I" in "POINTS"
	sw $t1, 512($t0)
	sw $t1, 1024($t0)
	sw $t1, 1536($t0)
	addi $t0, $t0, 8
	sw $t1, 0($t0)		# draw "N" in "POINTS"
	sw $t1, 512($t0)
	sw $t1, 1024($t0)
	sw $t1, 1536($t0)
	sw $t1, 4($t0)
	sw $t1, 8($t0)
	sw $t1, 520($t0)
	sw $t1, 1032($t0)
	sw $t1, 1544($t0)
	addi $t0, $t0, 16
	jal draw_small_T	# draw "T" in "POINTS"
	jal draw_small_S	# draw "S" in "POINTS"
	
	lw $t0, displayAddress
	addi $t0, $t0, 29324
	jal draw_small_P	# draw "P" in the sentence
	jal draw_small_R	# draw "R" in the sentence
	jal draw_small_E	# draw "E" in the sentence
	jal draw_small_S	# draw "S" in the sentence
	jal draw_small_S	# draw "S" in the sentence
	addi $t0, $t0, 8
	jal draw_small_P	# draw "P" in the sentence
	addi $t0, $t0, 8
	jal draw_small_T	# draw "T" in the sentence
	jal draw_small_O	# draw "O" in the sentence
	addi $t0, $t0, 8
	jal draw_small_R	# draw "R" in the sentence
	jal draw_small_E	# draw "E" in the sentence
	jal draw_small_S	# draw "S" in the sentence
	jal draw_small_T	# draw "T" in the sentence
	sw $t1, 0($t0)		# draw "A" in the sentence
	sw $t1, 512($t0)
	sw $t1, 1024($t0)
	sw $t1, 1536($t0)
	sw $t1, 4($t0)
	sw $t1, 8($t0)
	sw $t1, 520($t0)
	sw $t1, 1028($t0)
	sw $t1, 1032($t0)
	sw $t1, 1544($t0)
	addi $t0, $t0, 16
	jal draw_small_R	# draw "R" in the sentence
	jal draw_small_T	# draw "T" in the sentence
	subi $t0, $t0, 4
	sw $t1, 1536($t0)
	j exit
draw_vertical_line:
	sw $t5, 0($t0)
	sw $t5, 512($t0)
	sw $t5, 1024($t0)
	sw $t5, 1536($t0)
	sw $t5, 2048($t0)
	sw $t5, 2560($t0)
	sw $t5, 3072($t0)
	sw $t5, 3584($t0)
	sw $t5, 4096($t0)
	sw $t5, 4608($t0)
	jr $ra
draw_horizontal_line:
	sw $t5, 0($t0)
	addi $t0, $t0, 4
	addi $t6, $t6, 1
	ble $t6, 128, draw_horizontal_line
	jr $ra
draw_heart: # can be used to erase heart too by setting $t2 and $t3 to black
	sw $t3, 4($t0)
	sw $t3, 12($t0)
	sw $t3, 512($t0)
	sw $t2, 516($t0)
	sw $t3, 520($t0)
	sw $t2, 524($t0)
	sw $t3, 528($t0)
	sw $t3, 1028($t0)
	sw $t2, 1032($t0)
	sw $t3, 1036($t0)
	sw $t3, 1544($t0)
	jr $ra
draw_zero:
	sw $t4, 0($t0)
	sw $t4, 4($t0)
	sw $t4, 8($t0)
	sw $t4, 512($t0)
	sw $t4, 1024($t0)
	sw $t4, 1536($t0)
	sw $t4, 2048($t0)
	sw $t4, 520($t0)
	sw $t4, 1032($t0)
	sw $t4, 1544($t0)
	sw $t4, 2052($t0)
	sw $t4, 2056($t0)
	jr $ra
draw_small_P:
	sw $t1, 0($t0)
	sw $t1, 512($t0)
	sw $t1, 1024($t0)
	sw $t1, 1536($t0)
	sw $t1, 4($t0)
	sw $t1, 8($t0)
	sw $t1, 520($t0)
	sw $t1, 1028($t0)
	sw $t1, 1032($t0)
	addi $t0, $t0, 16
	jr $ra
draw_small_O:
	sw $t1, 0($t0)
	sw $t1, 512($t0)
	sw $t1, 1024($t0)
	sw $t1, 1536($t0)
	sw $t1, 4($t0)
	sw $t1, 8($t0)
	sw $t1, 520($t0)
	sw $t1, 1032($t0)
	sw $t1, 1540($t0)
	sw $t1, 1544($t0)
	addi $t0, $t0, 16
	jr $ra
draw_small_T:
	sw $t1, 0($t0)	
	sw $t1, 4($t0)
	sw $t1, 8($t0)
	sw $t1, 516($t0)
	sw $t1, 1028($t0)
	sw $t1, 1540($t0)
	addi $t0, $t0, 16
	jr $ra
draw_small_S:
	sw $t1, 0($t0)
	sw $t1, 512($t0)
	sw $t1, 1536($t0)
	sw $t1, 4($t0)
	sw $t1, 8($t0)
	sw $t1, 1028($t0)
	sw $t1, 1032($t0)
	sw $t1, 1540($t0)
	sw $t1, 1544($t0)
	addi $t0, $t0, 16
	jr $ra
draw_small_R:
	sw $t1, 0($t0)
	sw $t1, 512($t0)
	sw $t1, 1024($t0)
	sw $t1, 1536($t0)
	sw $t1, 4($t0)
	sw $t1, 8($t0)
	sw $t1, 520($t0)
	sw $t1, 1028($t0)
	sw $t1, 1544($t0)
	addi $t0, $t0, 16
	jr $ra
draw_small_E:
	sw $t1, 0($t0)
	sw $t1, 512($t0)
	sw $t1, 1024($t0)
	sw $t1, 1536($t0)
	sw $t1, 4($t0)
	sw $t1, 8($t0)
	sw $t1, 520($t0)
	sw $t1, 1028($t0)
	sw $t1, 1540($t0)
	sw $t1, 1544($t0)
	addi $t0, $t0, 16
	jr $ra
draw_countdown:
	lw $t0, displayAddress
	addi $t0, $t0, 9432
	jal draw_three	# draw "3"
	li $a0, 1000
	li $v0, 32
	syscall		# display for several seconds
	lw $t1, black
	jal draw_three	# erase "3"
	
	lw $t1, white
	jal draw_two	# draw "2"
	li $a0, 1000
	li $v0, 32
	syscall		# display for several seconds
	lw $t1, black
	jal draw_two	# erase "2"
	
	lw $t1, white
	jal draw_one	# draw "1"
	li $a0, 1000
	li $v0, 32
	syscall		# display for several seconds
	lw $t1, black
	jal draw_one	# erase "1"
	
	lw $t0, displayAddress
	addi $t0, $t0, 10948
	lw $t1, white
	jal draw_S	# draw "START!"
	jal draw_T
	jal draw_A
	jal draw_R
	jal draw_T
	jal draw_exclamation
	li $a0, 500
	li $v0, 32
	syscall		# display for several seconds
	lw $t0, displayAddress
	addi $t0, $t0, 10948
	lw $t1, black
	jal draw_S	# erase "START!"
	jal draw_T
	jal draw_A
	jal draw_R
	jal draw_T
	jal draw_exclamation
	
	lw $t1, white
	j draw_board
draw_three:
	sw $t1, 16($t0)
	sw $t1, 20($t0)
	sw $t1, 24($t0)
	sw $t1, 28($t0)
	sw $t1, 32($t0)
	sw $t1, 36($t0)
	sw $t1, 40($t0)
	sw $t1, 528($t0)
	sw $t1, 532($t0)
	sw $t1, 536($t0)
	sw $t1, 540($t0)
	sw $t1, 544($t0)
	sw $t1, 548($t0)
	sw $t1, 552($t0)
	sw $t1, 1040($t0)
	sw $t1, 1044($t0)
	sw $t1, 1048($t0)
	sw $t1, 1052($t0)
	sw $t1, 1056($t0)
	sw $t1, 1060($t0)
	sw $t1, 1064($t0)
	sw $t1, 1536($t0)
	sw $t1, 1540($t0)
	sw $t1, 1544($t0)
	sw $t1, 1548($t0)
	sw $t1, 1580($t0)
	sw $t1, 1584($t0)
	sw $t1, 1588($t0)
	sw $t1, 1592($t0)
	sw $t1, 2048($t0)
	sw $t1, 2052($t0)
	sw $t1, 2056($t0)
	sw $t1, 2060($t0)
	sw $t1, 2092($t0)
	sw $t1, 2096($t0)
	sw $t1, 2100($t0)
	sw $t1, 2104($t0)
	sw $t1, 2560($t0)
	sw $t1, 2564($t0)
	sw $t1, 2568($t0)
	sw $t1, 2572($t0)
	sw $t1, 2604($t0)
	sw $t1, 2608($t0)
	sw $t1, 2612($t0)
	sw $t1, 2616($t0)
	sw $t1, 3072($t0)
	sw $t1, 3076($t0)
	sw $t1, 3080($t0)
	sw $t1, 3084($t0)
	sw $t1, 3116($t0)
	sw $t1, 3120($t0)
	sw $t1, 3124($t0)
	sw $t1, 3128($t0)
	sw $t1, 3616($t0)
	sw $t1, 3620($t0)
	sw $t1, 3624($t0)
	sw $t1, 4128($t0)
	sw $t1, 4132($t0)
	sw $t1, 4136($t0)
	sw $t1, 4640($t0)
	sw $t1, 4644($t0)
	sw $t1, 4648($t0)
	sw $t1, 5152($t0)
	sw $t1, 5156($t0)
	sw $t1, 5160($t0)
	sw $t1, 5664($t0)
	sw $t1, 5668($t0)
	sw $t1, 5672($t0)
	sw $t1, 6188($t0)
	sw $t1, 6192($t0)
	sw $t1, 6196($t0)
	sw $t1, 6200($t0)
	sw $t1, 6656($t0)
	sw $t1, 6660($t0)
	sw $t1, 6664($t0)
	sw $t1, 6668($t0)
	sw $t1, 7168($t0)
	sw $t1, 7172($t0)
	sw $t1, 7176($t0)
	sw $t1, 7180($t0)
	sw $t1, 7680($t0)
	sw $t1, 7684($t0)
	sw $t1, 7688($t0)
	sw $t1, 7692($t0)
	sw $t1, 8192($t0)
	sw $t1, 8196($t0)
	sw $t1, 8200($t0)
	sw $t1, 8204($t0)
	sw $t1, 6700($t0)
	sw $t1, 6704($t0)
	sw $t1, 6708($t0)
	sw $t1, 6712($t0)
	sw $t1, 7212($t0)
	sw $t1, 7216($t0)
	sw $t1, 7220($t0)
	sw $t1, 7224($t0)
	sw $t1, 7724($t0)
	sw $t1, 7728($t0)
	sw $t1, 7732($t0)
	sw $t1, 7736($t0)
	sw $t1, 8236($t0)
	sw $t1, 8240($t0)
	sw $t1, 8244($t0)
	sw $t1, 8248($t0)
	sw $t1, 8720($t0)
	sw $t1, 8724($t0)
	sw $t1, 8728($t0)
	sw $t1, 8732($t0)
	sw $t1, 8736($t0)
	sw $t1, 8740($t0)
	sw $t1, 8744($t0)
	sw $t1, 9232($t0)
	sw $t1, 9236($t0)
	sw $t1, 9240($t0)
	sw $t1, 9244($t0)
	sw $t1, 9248($t0)
	sw $t1, 9252($t0)
	sw $t1, 9256($t0)
	sw $t1, 9744($t0)
	sw $t1, 9748($t0)
	sw $t1, 9752($t0)
	sw $t1, 9756($t0)
	sw $t1, 9760($t0)
	sw $t1, 9764($t0)
	sw $t1, 9768($t0)
	jr $ra
draw_two:
	sw $t1, 16($t0)
	sw $t1, 20($t0)
	sw $t1, 24($t0)
	sw $t1, 28($t0)
	sw $t1, 32($t0)
	sw $t1, 36($t0)
	sw $t1, 40($t0)
	sw $t1, 528($t0)
	sw $t1, 532($t0)
	sw $t1, 536($t0)
	sw $t1, 540($t0)
	sw $t1, 544($t0)
	sw $t1, 548($t0)
	sw $t1, 552($t0)
	sw $t1, 1040($t0)
	sw $t1, 1044($t0)
	sw $t1, 1048($t0)
	sw $t1, 1052($t0)
	sw $t1, 1056($t0)
	sw $t1, 1060($t0)
	sw $t1, 1064($t0)
	sw $t1, 1536($t0)
	sw $t1, 1540($t0)
	sw $t1, 1544($t0)
	sw $t1, 1548($t0)
	sw $t1, 1580($t0)
	sw $t1, 1584($t0)
	sw $t1, 1588($t0)
	sw $t1, 1592($t0)
	sw $t1, 2048($t0)
	sw $t1, 2052($t0)
	sw $t1, 2056($t0)
	sw $t1, 2060($t0)
	sw $t1, 2092($t0)
	sw $t1, 2096($t0)
	sw $t1, 2100($t0)
	sw $t1, 2104($t0)
	sw $t1, 2560($t0)
	sw $t1, 2564($t0)
	sw $t1, 2568($t0)
	sw $t1, 2572($t0)
	sw $t1, 2604($t0)
	sw $t1, 2608($t0)
	sw $t1, 2612($t0)
	sw $t1, 2616($t0)
	sw $t1, 3072($t0)
	sw $t1, 3076($t0)
	sw $t1, 3080($t0)
	sw $t1, 3084($t0)
	sw $t1, 3116($t0)
	sw $t1, 3120($t0)
	sw $t1, 3124($t0)
	sw $t1, 3128($t0)
	sw $t1, 3616($t0)
	sw $t1, 3620($t0)
	sw $t1, 3624($t0)
	sw $t1, 4128($t0)
	sw $t1, 4132($t0)
	sw $t1, 4136($t0)
	sw $t1, 4640($t0)
	sw $t1, 4644($t0)
	sw $t1, 4648($t0)
	sw $t1, 5136($t0)
	sw $t1, 5140($t0)
	sw $t1, 5144($t0)
	sw $t1, 5148($t0)
	sw $t1, 5648($t0)
	sw $t1, 5652($t0)
	sw $t1, 5656($t0)
	sw $t1, 5660($t0)
	sw $t1, 6160($t0)
	sw $t1, 6164($t0)
	sw $t1, 6168($t0)
	sw $t1, 6172($t0)
	sw $t1, 6660($t0)
	sw $t1, 6664($t0)
	sw $t1, 6668($t0)
	sw $t1, 7172($t0)
	sw $t1, 7176($t0)
	sw $t1, 7180($t0)
	sw $t1, 7684($t0)
	sw $t1, 7688($t0)
	sw $t1, 7692($t0)
	sw $t1, 8188($t0)
	sw $t1, 8192($t0)
	sw $t1, 8196($t0)
	sw $t1, 8200($t0)
	sw $t1, 8204($t0)
	sw $t1, 8208($t0)
	sw $t1, 8212($t0)
	sw $t1, 8216($t0)
	sw $t1, 8220($t0)
	sw $t1, 8224($t0)
	sw $t1, 8228($t0)
	sw $t1, 8232($t0)
	sw $t1, 8236($t0)
	sw $t1, 8240($t0)
	sw $t1, 8244($t0)
	sw $t1, 8248($t0)
	sw $t1, 8700($t0)
	sw $t1, 8704($t0)
	sw $t1, 8708($t0)
	sw $t1, 8712($t0)
	sw $t1, 8716($t0)
	sw $t1, 8720($t0)
	sw $t1, 8724($t0)
	sw $t1, 8728($t0)
	sw $t1, 8732($t0)
	sw $t1, 8736($t0)
	sw $t1, 8740($t0)
	sw $t1, 8744($t0)
	sw $t1, 8748($t0)
	sw $t1, 8752($t0)
	sw $t1, 8756($t0)
	sw $t1, 8760($t0)
	sw $t1, 9212($t0)
	sw $t1, 9216($t0)
	sw $t1, 9220($t0)
	sw $t1, 9224($t0)
	sw $t1, 9228($t0)
	sw $t1, 9232($t0)
	sw $t1, 9236($t0)
	sw $t1, 9240($t0)
	sw $t1, 9244($t0)
	sw $t1, 9248($t0)
	sw $t1, 9252($t0)
	sw $t1, 9256($t0)
	sw $t1, 9260($t0)
	sw $t1, 9264($t0)
	sw $t1, 9268($t0)
	sw $t1, 9272($t0)
	jr $ra
draw_one:
	sw $t1, 2048($t0)
	sw $t1, 2052($t0)
	sw $t1, 2056($t0)
	sw $t1, 2060($t0)
	sw $t1, 2560($t0)
	sw $t1, 2564($t0)
	sw $t1, 2568($t0)
	sw $t1, 2572($t0)
	sw $t1, 3072($t0)
	sw $t1, 3076($t0)
	sw $t1, 3080($t0)
	sw $t1, 3084($t0)
	sw $t1, 528($t0)
	sw $t1, 1036($t0)
	sw $t1, 1040($t0)
	sw $t1, 1544($t0)
	sw $t1, 1548($t0)
	sw $t1, 1552($t0)
	sw $t1, 2064($t0)
	sw $t1, 2576($t0)
	sw $t1, 3088($t0)
	sw $t1, 20($t0)
	sw $t1, 24($t0)
	sw $t1, 28($t0)
	sw $t1, 32($t0)
	sw $t1, 532($t0)
	sw $t1, 536($t0)
	sw $t1, 540($t0)
	sw $t1, 544($t0)
	sw $t1, 1044($t0)
	sw $t1, 1048($t0)
	sw $t1, 1052($t0)
	sw $t1, 1056($t0)
	sw $t1, 1556($t0)
	sw $t1, 1560($t0)
	sw $t1, 1564($t0)
	sw $t1, 1568($t0)
	sw $t1, 2068($t0)
	sw $t1, 2072($t0)
	sw $t1, 2076($t0)
	sw $t1, 2080($t0)
	sw $t1, 2580($t0)
	sw $t1, 2584($t0)
	sw $t1, 2588($t0)
	sw $t1, 2592($t0)
	sw $t1, 3092($t0)
	sw $t1, 3096($t0)
	sw $t1, 3100($t0)
	sw $t1, 3104($t0)
	sw $t1, 3604($t0)
	sw $t1, 3608($t0)
	sw $t1, 3612($t0)
	sw $t1, 3616($t0)
	sw $t1, 4116($t0)
	sw $t1, 4120($t0)
	sw $t1, 4124($t0)
	sw $t1, 4128($t0)
	sw $t1, 4628($t0)
	sw $t1, 4632($t0)
	sw $t1, 4636($t0)
	sw $t1, 4640($t0)
	sw $t1, 5140($t0)
	sw $t1, 5144($t0)
	sw $t1, 5148($t0)
	sw $t1, 5152($t0)
	sw $t1, 5652($t0)
	sw $t1, 5656($t0)
	sw $t1, 5660($t0)
	sw $t1, 5664($t0)
	sw $t1, 6164($t0)
	sw $t1, 6168($t0)
	sw $t1, 6172($t0)
	sw $t1, 6176($t0)
	sw $t1, 6676($t0)
	sw $t1, 6680($t0)
	sw $t1, 6684($t0)
	sw $t1, 6688($t0)
	sw $t1, 7188($t0)
	sw $t1, 7192($t0)
	sw $t1, 7196($t0)
	sw $t1, 7200($t0)
	sw $t1, 7700($t0)
	sw $t1, 7704($t0)
	sw $t1, 7708($t0)
	sw $t1, 7712($t0)
	sw $t1, 8212($t0)
	sw $t1, 8216($t0)
	sw $t1, 8220($t0)
	sw $t1, 8224($t0)
	sw $t1, 8192($t0)
	sw $t1, 8196($t0)
	sw $t1, 8200($t0)
	sw $t1, 8204($t0)
	sw $t1, 8208($t0)
	sw $t1, 8212($t0)
	sw $t1, 8216($t0)
	sw $t1, 8220($t0)
	sw $t1, 8224($t0)
	sw $t1, 8228($t0)
	sw $t1, 8232($t0)
	sw $t1, 8236($t0)
	sw $t1, 8240($t0)
	sw $t1, 8244($t0)
	sw $t1, 8704($t0)
	sw $t1, 8708($t0)
	sw $t1, 8712($t0)
	sw $t1, 8716($t0)
	sw $t1, 8720($t0)
	sw $t1, 8724($t0)
	sw $t1, 8728($t0)
	sw $t1, 8732($t0)
	sw $t1, 8736($t0)
	sw $t1, 8740($t0)
	sw $t1, 8744($t0)
	sw $t1, 8748($t0)
	sw $t1, 8752($t0)
	sw $t1, 8756($t0)
	sw $t1, 9216($t0)
	sw $t1, 9220($t0)
	sw $t1, 9224($t0)
	sw $t1, 9228($t0)
	sw $t1, 9232($t0)
	sw $t1, 9236($t0)
	sw $t1, 9240($t0)
	sw $t1, 9244($t0)
	sw $t1, 9248($t0)
	sw $t1, 9252($t0)
	sw $t1, 9256($t0)
	sw $t1, 9260($t0)
	sw $t1, 9264($t0)
	sw $t1, 9268($t0)
	jr $ra
exit:
	li $v0, 10 # terminate the program gracefully
	syscall
