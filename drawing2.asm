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
	
	# j draw_game_over
	# j draw_explosion
	# j draw_bonus
	 j draw_shield

draw_game_over:
	lw $t0, displayAddress # $t0 stores the base address for display
	addi $t0, $t0, 10924
	jal draw_G
	jal draw_A
	jal draw_M
	jal draw_E
	addi $t0, $t0, 8
	jal draw_O
	jal draw_V
	jal draw_E
	jal draw_R
	j exit
draw_explosion:
	sw $t3, 1032($t0)	# process 1 for explosion
	sw $t3, 1036($t0)
	sw $t3, 1040($t0)
	sw $t3, 1544($t0)
	sw $t4, 1548($t0)
	sw $t3, 1552($t0)
	sw $t3, 1556($t0)
	sw $t3, 2056($t0)
	sw $t4, 2060($t0)
	sw $t4, 2064($t0)
	sw $t3, 2068($t0)
	sw $t3, 2572($t0)
	sw $t3, 2576($t0)
	sw $t3, 2580($t0)
	li $a0, 300
	li $v0, 32
	syscall		# display for several seconds
	sw $t3, 8($t0)	# process 2 for explosion
	sw $t3, 12($t0)
	sw $t3, 20($t0)
	sw $t3, 512($t0)
	sw $t3, 516($t0)
	sw $t3, 520($t0)
	sw $t3, 524($t0)
	sw $t3, 528($t0)
	sw $t3, 532($t0)
	sw $t3, 536($t0)
	sw $t3, 1028($t0)
	sw $t4, 1032($t0)
	sw $t4, 1040($t0)
	sw $t4, 1044($t0)
	sw $t3, 1048($t0)
	sw $t3, 1052($t0)
	sw $t3, 1536($t0)
	sw $t3, 1540($t0)
	sw $t4, 1556($t0)
	sw $t4, 1560($t0)
	sw $t3, 1564($t0)
	sw $t3, 1568($t0)
	sw $t3, 2052($t0)
	sw $t3, 2072($t0)
	sw $t3, 2076($t0)
	sw $t3, 2584($t0)
	sw $t3, 3080($t0)
	sw $t3, 3092($t0)
	li $a0, 500
	li $v0, 32
	syscall		# display for several seconds
	lw $t1, black	# erase explosion
	sw $t1, 1032($t0)
	sw $t1, 1036($t0)
	sw $t1, 1040($t0)
	sw $t1, 1544($t0)
	sw $t1, 1548($t0)
	sw $t1, 1552($t0)
	sw $t1, 1556($t0)
	sw $t1, 2056($t0)
	sw $t1, 2060($t0)
	sw $t1, 2064($t0)
	sw $t1, 2068($t0)
	sw $t1, 2572($t0)
	sw $t1, 2576($t0)
	sw $t1, 2580($t0)
	sw $t1, 8($t0)
	sw $t1, 12($t0)
	sw $t1, 20($t0)
	sw $t1, 512($t0)
	sw $t1, 516($t0)
	sw $t1, 520($t0)
	sw $t1, 524($t0)
	sw $t1, 528($t0)
	sw $t1, 532($t0)
	sw $t1, 536($t0)
	sw $t1, 1028($t0)
	sw $t1, 1032($t0)
	sw $t1, 1040($t0)
	sw $t1, 1044($t0)
	sw $t1, 1048($t0)
	sw $t1, 1052($t0)
	sw $t1, 1536($t0)
	sw $t1, 1540($t0)
	sw $t1, 1556($t0)
	sw $t1, 1560($t0)
	sw $t1, 1564($t0)
	sw $t1, 1568($t0)
	sw $t1, 2052($t0)
	sw $t1, 2072($t0)
	sw $t1, 2076($t0)
	sw $t1, 2584($t0)
	sw $t1, 3080($t0)
	sw $t1, 3092($t0)
	lw $t1, white
	j exit
draw_bonus:
	sw $t4, 8($t0)
	sw $t4, 520($t0)
	sw $t4, 1024($t0)
	sw $t4, 1028($t0)
	sw $t4, 1032($t0)
	sw $t4, 1036($t0)
	sw $t4, 1040($t0)
	sw $t4, 1544($t0)
	sw $t4, 2056($t0)
	j exit
draw_shield:
	sw $t5, 0($t0)
	sw $t5, 4($t0)
	sw $t5, 8($t0)
	sw $t5, 12($t0)
	sw $t5, 16($t0)
	sw $t5, 512($t0)
	sw $t5, 528($t0)
	sw $t5, 1024($t0)
	sw $t5, 1040($t0)
	sw $t5, 1536($t0)
	sw $t5, 1552($t0)
	sw $t5, 2052($t0)
	sw $t5, 2060($t0)
	sw $t5, 2568($t0)
	sw $t5, 1540($t0)
	sw $t5, 1548($t0)
	sw $t4, 2056($t0)
	sw $t5, 516($t0)
	sw $t4, 520($t0)
	sw $t5, 524($t0)
	sw $t4, 1028($t0)
	sw $t4, 1032($t0)
	sw $t4, 1036($t0)
	sw $t4, 1544($t0)
	j exit
draw_G:
	sw $t1, 4($t0)
	sw $t1, 8($t0)
	sw $t1, 512($t0)
	sw $t1, 1024($t0)
	sw $t1, 1536($t0)
	sw $t1, 2052($t0)
	sw $t1, 2056($t0)
	sw $t1, 1548($t0)
	sw $t1, 1036($t0)
	sw $t1, 1032($t0)
	addi $t0, $t0, 20
	jr $ra
draw_V:
	sw $t1, 0($t0)
	sw $t1, 512($t0)
	sw $t1, 1028($t0)
	sw $t1, 1540($t0)
	sw $t1, 2056($t0)
	sw $t1, 1036($t0)
	sw $t1, 1548($t0)
	sw $t1, 16($t0)
	sw $t1, 528($t0)
	addi $t0, $t0, 24
	jr $ra
############# don't need to copy ################
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
exit:
	li $v0, 10 # terminate the program gracefully
	syscall