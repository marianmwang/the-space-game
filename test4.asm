########## CONSTANTS ##########
	#  addresses
.eqv	DISPLAYADDRESS 	0x10008000

.eqv 	DELAY		1 # how long before next frame update

.eqv	YELLOW		0xffc107
.eqv 	BLACK 		0x000000

.text
	li $s0, 0
	li $s1, 0
	li $s2, 0
	li $s3, 0
	li $s4, 0
	jal draw_board # first game screen with instructions
play_game:
	jal point_counter_ones
	jal point_counter_tens
	jal point_counter_hundreds
	jal point_counter_thousands
	jal point_counter_ten_thousands
	
	li $a0, DELAY # wait this many ms before updating
	jal pause
	j play_game
########## PAUSE (time specified in $a0)##########
pause:
	li $v0, 32
	syscall
	jr $ra
######### DRAW BOARD ############################
draw_board:
	addi $sp, $sp, -4
	sw $ra, 0($sp) # stack push ra
	# draw points (00000)
	li $t4, YELLOW
	li $t0, DISPLAYADDRESS
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
	
	lw $ra, 0($sp) # pop off stack into ra
	addi $sp, $sp, 4
	jr $ra # go back to play_game, stackPush is in draw_countdown

# drawing letters and numbers functions
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
point_counter_ones:
	addi $sp, $sp, -4
	sw $ra, 0($sp) # stack push ra
	
	li $t0, DISPLAYADDRESS
	addi $t0, $t0, 29676
	beq $s0, 0, draw_point_zero
	beq $s0, 1, draw_point_one
	beq $s0, 2, draw_point_two
	beq $s0, 3, draw_point_three
	beq $s0, 4, draw_point_four
	beq $s0, 5, draw_point_five
	beq $s0, 6, draw_point_six
	beq $s0, 7, draw_point_seven
	beq $s0, 8, draw_point_eight
	beq $s0, 9, draw_point_nine
	beq $s0, 10, draw_point_ten
point_counter_tens:
	addi $sp, $sp, -4
	sw $ra, 0($sp) # stack push ra
	
	li $t0, DISPLAYADDRESS
	addi $t0, $t0, 29660
	subi $s0, $s0, 1
	beq $s1, 0, draw_point_zero
	beq $s1, 1, draw_point_one
	beq $s1, 2, draw_point_two
	beq $s1, 3, draw_point_three
	beq $s1, 4, draw_point_four
	beq $s1, 5, draw_point_five
	beq $s1, 6, draw_point_six
	beq $s1, 7, draw_point_seven
	beq $s1, 8, draw_point_eight
	beq $s1, 9, draw_point_nine
	beq $s1, 10, initialize_tens
point_counter_hundreds:
	addi $sp, $sp, -4
	sw $ra, 0($sp) # stack push ra
	
	li $t0, DISPLAYADDRESS
	addi $t0, $t0, 29644
	subi $s0, $s0, 1
	beq $s2, 0, draw_point_zero
	beq $s2, 1, draw_point_one
	beq $s2, 2, draw_point_two
	beq $s2, 3, draw_point_three
	beq $s2, 4, draw_point_four
	beq $s2, 5, draw_point_five
	beq $s2, 6, draw_point_six
	beq $s2, 7, draw_point_seven
	beq $s2, 8, draw_point_eight
	beq $s2, 9, draw_point_nine
	beq $s2, 10, initialize_hundreds
point_counter_thousands:
	addi $sp, $sp, -4
	sw $ra, 0($sp) # stack push ra
	
	li $t0, DISPLAYADDRESS
	addi $t0, $t0, 29628
	subi $s0, $s0, 1
	beq $s3, 0, draw_point_zero
	beq $s3, 1, draw_point_one
	beq $s3, 2, draw_point_two
	beq $s3, 3, draw_point_three
	beq $s3, 4, draw_point_four
	beq $s3, 5, draw_point_five
	beq $s3, 6, draw_point_six
	beq $s3, 7, draw_point_seven
	beq $s3, 8, draw_point_eight
	beq $s3, 9, draw_point_nine
	beq $s3, 10, initialize_thousands
point_counter_ten_thousands:
	addi $sp, $sp, -4
	sw $ra, 0($sp) # stack push ra
	
	li $t0, DISPLAYADDRESS
	addi $t0, $t0, 29612
	subi $s0, $s0, 1
	beq $s4, 0, draw_point_zero
	beq $s4, 1, draw_point_one
	beq $s4, 2, draw_point_two
	beq $s4, 3, draw_point_three
	beq $s4, 4, draw_point_four
	beq $s4, 5, draw_point_five
	beq $s4, 6, draw_point_six
	beq $s4, 7, draw_point_seven
	beq $s4, 8, draw_point_eight
	beq $s4, 9, draw_point_nine
	beq $s4, 10, initialize_ten_thousands
draw_point_zero: # original 0
	addi $s0, $s0, 1
	j go_back
draw_point_one: # from 0 to 1
	li $t4, BLACK
	sw $t4, 0($t0)
	sw $t4, 4($t0)
	sw $t4, 512($t0)
	sw $t4, 1024($t0)
	sw $t4, 1028($t0)
	sw $t4, 1536($t0)
	sw $t4, 2048($t0)
	sw $t4, 2052($t0)
	addi $s0, $s0, 1
	j go_back
draw_point_two:	# from 1 to 2
	li $t4, BLACK
	sw $t4, 1544($t0)
	
	li $t4, YELLOW
	sw $t4, 0($t0)
	sw $t4, 4($t0)
	sw $t4, 1024($t0)
	sw $t4, 1028($t0)
	sw $t4, 1536($t0)
	sw $t4, 2048($t0)
	sw $t4, 2052($t0)
	addi $s0, $s0, 1
	j go_back
draw_point_three: # from 2 to 3
	li $t4, BLACK
	sw $t4, 1536($t0)
	
	li $t4, YELLOW
	sw $t4, 1544($t0)
	addi $s0, $s0, 1
	j go_back
draw_point_four: # from 3 to 4
	li $t4, BLACK
	sw $t4, 4($t0)
	sw $t4, 2048($t0)
	sw $t4, 2052($t0)

	li $t4, YELLOW
	sw $t4, 512($t0)
	addi $s0, $s0, 1
	j go_back
draw_point_five: # from 4 to 5
	li $t4, BLACK
	sw $t4, 520($t0)
	
	li $t4, YELLOW
	sw $t4, 4($t0)
	sw $t4, 2048($t0)
	sw $t4, 2052($t0)
	addi $s0, $s0, 1
	j go_back
draw_point_six: # from 5 to 6
	li $t4, YELLOW
	sw $t4, 1536($t0)
	addi $s0, $s0, 1
	j go_back
draw_point_seven: # from 6 to 7
	li $t4, BLACK
	sw $t4, 512($t0)
	sw $t4, 1024($t0)
	sw $t4, 1028($t0)
	sw $t4, 1536($t0)
	sw $t4, 2048($t0)
	sw $t4, 2052($t0)

	li $t4, YELLOW
	sw $t4, 520($t0)
	addi $s0, $s0, 1
	j go_back
draw_point_eight: # from 7 to 8
	li $t4, YELLOW
	sw $t4, 512($t0)
	sw $t4, 1024($t0)
	sw $t4, 1028($t0)
	sw $t4, 1536($t0)
	sw $t4, 2048($t0)
	sw $t4, 2052($t0)
	addi $s0, $s0, 1
	j go_back
draw_point_nine: # from 8 to 9
	li $t4, BLACK
	sw $t4, 1536($t0)
	sw $t4, 2048($t0)
	sw $t4, 2052($t0)
	addi $s0, $s0, 1
	j go_back
draw_point_ten: # from 9 to 0 (ones digit)
	li $t4, BLACK
	sw $t4, 1028($t0)
	
	li $t4, YELLOW
	sw $t4, 1536($t0)
	sw $t4, 2048($t0)
	sw $t4, 2052($t0)
	addi $s1, $s1, 1
	li $s0, 1
	j go_back
initialize_tens: # from 9 to 0 (tens digit)
	li $t4, BLACK
	sw $t4, 1028($t0)
	
	li $t4, YELLOW
	sw $t4, 1536($t0)
	sw $t4, 2048($t0)
	sw $t4, 2052($t0)
	addi $s0, $s0, 1
	li $s1, 0
	addi $s2, $s2, 1
	j go_back
initialize_hundreds: # from 9 to 0 (hundreds digit)
	li $t4, BLACK
	sw $t4, 1028($t0)
	
	li $t4, YELLOW
	sw $t4, 1536($t0)
	sw $t4, 2048($t0)
	sw $t4, 2052($t0)
	addi $s0, $s0, 1
	li $s2, 0
	addi $s3, $s3, 1
	j go_back
initialize_thousands:
	li $t4, BLACK
	sw $t4, 1028($t0)
	
	li $t4, YELLOW
	sw $t4, 1536($t0)
	sw $t4, 2048($t0)
	sw $t4, 2052($t0)
	addi $s0, $s0, 1
	li $s3, 0
	addi $s4, $s4, 1
	j go_back
initialize_ten_thousands:
	li $t4, BLACK
	sw $t4, 1028($t0)
	
	li $t4, YELLOW
	sw $t4, 1536($t0)
	sw $t4, 2048($t0)
	sw $t4, 2052($t0)
	addi $s0, $s0, 1
	li $s4, 0
	j go_back
go_back:
	lw $ra, 0($sp) # pop from stack
	addi $sp, $sp, 4
	jr $ra
exit:
	li $v0, 10 # terminate the program gracefully
	syscall