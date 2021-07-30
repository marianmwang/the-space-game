#####################################################################
#
# CSC258 Summer2021Assembly Final Project
# University of Toronto
#
# Student:
# Christine Chen, ###, ###
# Marian Wang, 1006146582, wangmar8
#
# Bitmap Display Configuration:
# -Unit width in pixels: 4 (update this as needed)
# -Unit height in pixels: 4 (update this as needed)
# -Display width in pixels: 512 (update this as needed)
# -Display height in pixels: 256 (update this as needed)
# -Base Address for Display: 0x10008000 ($gp)
#
# Which milestones have beenreached in this submission?
# (See the assignment handout for descriptions of the milestones)
# -Milestone 1/2/3 (choose the one that applies)
#
# Which approved features have been implemented for milestone 3?
# (See the assignment handout for the list of additional features)
# 1. (fill in the feature, if any)
# 2. (fill in the feature, if any)
# 3. (fill in the feature, if any)
# ... (add more if necessary)
#
# Link to video demonstration for final submission:
# -(insert YouTube / MyMedia / other URL here). Make sure we can view it!
#
# Are you OK with us sharing the video with people outside course staff?
# -yes / no/ yes, and please share this project github link as well!
#
# Any additional information that the TA needs to know:# -(write here, if any)
#
#####################################################################

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
	
.text

# make a start screen, pressing p should jump here

	lw $t0, displayAddress # $t0 stores the base address for display
	lw $t1, blue # t1 stores blue
	lw $t2, lblue # t2 stores light blue
	lw $t3, red # t3 stores red
	lw $t4, yellow # t4 stores yellow
	la $t5, ship # t5 = ship array
	
draw_ship:
	lw $t6, 0($t5) # t6 = ship[0]
	add $t6, $t6, $t0 # t6 = ship[0] + displayAddress
	sw $t3, 0($t6) # first row of ship
	sw $t3, 4($t6)
	sw $t3, 8($t6)

	lw $t6, 8($t5) # t6 = ship[2]
	add $t6, $t6, $t0 # t6 = ship[2] + displayAddress
	sw $t4, 0($t6) # second row of ship
	sw $t1, 4($t6)
	sw $t1, 8($t6)
	sw $t2, 12($t6)
	sw $t2, 16($t6)
	sw $t2, 20($t6)
	sw $t2, 24($t6)

	lw $t6, 16($t5) # t6 = ship[4]
	add $t6, $t6, $t0 # t6 = ship[4] + displayAddress
	sw $t4, 0($t6) # third row of ship
	sw $t1, 4($t6)
	sw $t3, 8($t6)
	sw $t4, 12($t6)
	sw $t4, 16($t6)
	sw $t3, 20($t6)
	sw $t1, 24($t6)
	sw $t1, 28($t6)
	sw $t1, 32($t6)

	lw $t6, 24($t5) # t6 = ship[6]
	add $t6, $t6, $t0 # t6 = ship[6] + displayAddress
	sw $t1, 0($t6) # fourth row of ship
	sw $t1, 4($t6)
	sw $t1, 8($t6)
	sw $t1, 12($t6)

	lw $t6, 32($t5) # t6 = ship[8]
	add $t6, $t6, $t0 # t6 = ship[8] + displayAddress
	sw $t1, 0($t6) # fifth row of ship
	sw $t1, 4($t6)
	sw $t1, 8($t6)

keypress:
	la $t9, 0xffff0000 # t9 = 1 if keypress
	lw $t8, 0($t9) 
	beq $t8, 1, keypress_happened

keypress_happened:
	lw $t7, 4($t9) # t7 = keypress ascii code
	beq $t7, 0x61, keypress_a
	beq $t7, 0x64, keypress_d
	beq $t7, 0x73, keypress_s
	beq $t7, 0x77, keypress_w
	beq $t7, 0x70, exit # if they press p, end program (should be restart instead)

keypress_a:
	# check if ship is at left edge
	lw $t6, 8($t5) # t6 = ship[2]
	add $t6, $t6, $t0 # t6 = ship[2] + displayAddress
	subi $t6, $t6, 0x10008000 # t6 = t6 - original displayAddress
	li $t7, 512 # t7 = 512
	div $t6, $t7 # hi = t6 % t7
	mfhi $t7 # t7 = hi
	beq $t7, $0, keypress
	
	# erase right of ship
	lw $t6, 4($t5) # t6 = ship[1]
	add $t6, $t6, $t0 # t6 = ship[1] + displayAddress
	sw $0, 0($t6) # erase rightmost bit of row 1
	lw $t6, 12($t5) # t6 = ship[3]
	add $t6, $t6, $t0 # t6 = ship[3] + displayAddress
	sw $0, 0($t6)
	lw $t6, 20($t5) # t6 = ship[5]
	add $t6, $t6, $t0 # t6 = ship[5] + displayAddress
	sw $0, 0($t6)
	lw $t6, 28($t5) # t6 = ship[7]
	add $t6, $t6, $t0 # t6 = ship[7] + displayAddress
	sw $0, 0($t6) 
	lw $t6, 36($t5) # t6 = ship[9]
	add $t6, $t6, $t0 # t6 = ship[9] + displayAddress
	sw $0, 0($t6)
	subi, $t0, $t0, 4 # t0 = t0 - 4 (shift everything to the left)
	j draw_ship

keypress_d:
	# check if ship is at right edge
	lw $t6, 20($t5) # t6 = ship[5]
	add $t6, $t6, $t0 # t6 = ship[5] + displayAddress
	subi $t6, $t6, 0x10007ffc # t6 = t6 - (original displayAddress - 4)
	li $t7, 512 # t7 = 512
	div $t6, $t7 # hi = t6 % t7
	mfhi $t7 # t7 = hi
	beq $t7, $0, keypress
	
	# erase left of ship
	lw $t6, 0($t5) # t6 = ship[0]
	add $t6, $t6, $t0 # t6 = ship[0] + displayAddress
	sw $0, 0($t6) # erase leftmost bit of row 1
	lw $t6, 8($t5) # t6 = ship[2]
	add $t6, $t6, $t0 # t6 = ship[2] + displayAddress
	sw $0, 0($t6)
	lw $t6, 16($t5) # t6 = ship[4]
	add $t6, $t6, $t0 # t6 = ship[4] + displayAddress
	sw $0, 0($t6)
	lw $t6, 24($t5) # t6 = ship[6]
	add $t6, $t6, $t0 # t6 = ship[6] + displayAddress
	sw $0, 0($t6) 
	lw $t6, 32($t5) # t6 = ship[8]
	add $t6, $t6, $t0 # t6 = ship[8] + displayAddress
	sw $0, 0($t6)
	addi, $t0, $t0, 4 # t0 = t0 + 4 (shift everything to the right)
	j draw_ship

keypress_s:
	# check if ship is at bottom
	lw $t6, 32($t5) # t6 = ship[8]
	add $t6, $t6, $t0 # t6 = ship[8] + displayAddress
	subi $t6, $t6, 0x10008000 # t6 = t6 - original displayAddress
	li $t7, 32256 # t7 = 32256
	bge $t6, $t7, keypress # if t6 >= t7, branch
	
	# erase top of ship
	lw $t6, 0($t5) # t6 = ship[0]
	add $t6, $t6, $t0 # t6 = ship[0] + displayAddress
	sw $0, 0($t6) # erase leftmost bit of row 1
	sw $0, 4($t6)
	sw $0, 8($t6)
	lw $t6, 8($t5) # t6 = ship[2]
	add $t6, $t6, $t0 # t6 = ship[2] + displayAddress
	sw $0, 0($t6)
	sw $0, 16($t6)
	sw $0, 20($t6)
	sw $0, 24($t6)
	lw $t6, 20($t5) # t6 = ship[5]
	add $t6, $t6, $t0 # t6 = ship[5] + displayAddress
	sw $0, 0($t6)
	sw $0, -4($t6)
	lw $t6, 32($t5) # t6 = ship[8]
	add $t6, $t6, $t0 # t6 = ship[8] + displayAddress
	sw $0, 0($t6) # erase leftmost bit of row 5
	addi, $t0, $t0, 512  # t0 = t0 + 512 (shift everything down)
	j draw_ship

keypress_w:
	# check if ship is at top
	lw $t6, 0($t5) # t6 = ship[0]
	add $t6, $t6, $t0 # t6 = ship[0] + displayAddress
	subi $t6, $t6, 0x10008000 # t6 = t6 - original displayAddress
	li $t7, 512 # t7 = 512
	ble $t6, $t7, keypress # if t6 >= t7, branch

	# erase bottom of ship
	lw $t6, 32($t5) # t6 = ship[8]
	add $t6, $t6, $t0 # t6 = ship[8] + displayAddress
	sw $0, 0($t6) # erase leftmost bit of row 5
	sw $0, 4($t6)
	sw $0, 8($t6)
	lw $t6, 28($t5) # t6 = ship[7]
	add $t6, $t6, $t0 # t6 = ship[7] + displayAddress
	sw $0, 0($t6)
	sw $0, -4($t6)
	lw $t6, 20($t5) # t6 = ship[5]
	add $t6, $t6, $t0 # t6 = ship[5] + displayAddress
	sw $0, 0($t6)
	sw $0, -4($t6)
	sw $0, -8($t6)
	sw $0, -12($t6)
	sw $0, -32($t6)
	subi, $t0, $t0, 512  # t0 = t0 -512 (shift everything up)
	j draw_ship	

draw_obst: 
	# generate random int
	li $v0, 42
	li $a0, 0
	li $a1, 10000
	syscall # a0 = random int < 3000
	
	# check if int is less than 2998
	li $t6, 9998 # t6 = 2998
	ble $a0, $t6, keypress # if a0 < t5, go back to keypress

	# generate random int
	li $v0, 42
	li $a0, 0
	li $a1, 57
	syscall # a0 = random int < 55
	
	# obstacle colour
	lw $s0, blue0
	lw $s1, blue1
	lw $s2, blue2
	lw $s3, blue3
	lw $s4, blue4

	lw $t9, displayAddress # t9 = base display
	add $t8, $a0, $0 # t8 = random number
	sll $t8, $t8, 9 # t8 = t8 * 16
	subi $t8, $t8, 0x2c # t8 = t8 - 11*4
	add $t9, $t9, $t8 # t9 = base display + random number
	
	# leftmost vertical strip
	sw $s0, 508($t9)
	sw $s0, 1020($t9)
	sw $s0, 1532($t9)
	sw $s0, 2044($t9)
	sw $s0, 2556($t9)
	sw $s0, 3068($t9)
	# second
	sw $s0, 0($t9)
	sw $s0, 512($t9)
	sw $s4, 1024($t9)
	sw $s3, 1536($t9)
	sw $s3, 2048($t9)
	sw $s3, 2560($t9)
	sw $s0, 3072($t9)
	sw $s0, 3584($t9)
	# third
	sw $s0, 4($t9)
	sw $s4, 516($t9)
	sw $s3, 1028($t9)
	sw $s3, 1540($t9)
	sw $s3, 2052($t9)
	sw $s2, 2564($t9)
	sw $s2, 3076($t9)
	sw $s0, 3588($t9)
	# fourth
	sw $s0, 8($t9)
	sw $s3, 520($t9)
	sw $s0, 1032($t9)
	sw $s0, 1544($t9)
	sw $s2, 2056($t9)
	sw $s2, 2568($t9)
	sw $s0, 3080($t9)
	sw $s0, 3592($t9)
	# fifth
	sw $s0, 12($t9)
	sw $s3, 524($t9)
	sw $s0, 1036($t9)
	sw $s1, 1548($t9)
	sw $s4, 2060($t9)
	sw $s2, 2572($t9)
	sw $s0, 3084($t9)
	sw $s0, 3596($t9)
	# fifth
	sw $s0, 16($t9)
	sw $s3, 528($t9)
	sw $s1, 1040($t9)
	sw $s1, 1552($t9)
	sw $s4, 2064($t9)
	sw $s0, 2576($t9)
	sw $s1, 3088($t9)
	sw $s0, 3600($t9)
	sw $s0, 4112($t9)
	# sixth
	sw $s0, 20($t9)
	sw $s3, 532($t9)
	sw $s3, 1044($t9)
	sw $s4, 1556($t9)
	sw $s2, 2068($t9)
	sw $s0, 2580($t9)
	sw $s1, 3092($t9)
	sw $s1, 3604($t9)
	sw $s0, 4116($t9)
	# seventh
	sw $s0, 24($t9)
	sw $s0, 536($t9)
	sw $s2, 1048($t9)
	sw $s2, 1560($t9)
	sw $s1, 2072($t9)
	sw $s1, 2584($t9)
	sw $s1, 3096($t9)
	sw $s1, 3608($t9)
	sw $s0, 4120($t9)
	# eighth
	sw $s0, 540($t9)
	sw $s0, 1052($t9)
	sw $s1, 1564($t9)
	sw $s0, 2076($t9)
	sw $s1, 2588($t9)
	sw $s1, 3100($t9)
	sw $s0, 3612($t9)
	sw $s0, 4124($t9)
	# ninth
	sw $s0, 1056($t9)
	sw $s0, 1568($t9)
	sw $s1, 2080($t9)
	sw $s1, 2592($t9)
	sw $s0, 3104($t9)
	sw $s0, 3616($t9)
	# tenth
	sw $s0, 1060($t9)
	sw $s0, 1572($t9)
	sw $s0, 2084($t9)
	sw $s0, 2596($t9)
	sw $s0, 3108($t9)
	
	j keypress

exit:
	li $v0, 10 # terminate the program gracefully
	syscall
 
