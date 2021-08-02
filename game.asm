#####################################################################
#
# CSC258 Summer2021Assembly Final Project
# University of Toronto
#
# Student:
# Christine Chen, 1006135816, chenj591
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

########## CONSTANTS ##########
	#  addresses
.eqv	DISPLAYADDRESS 	0x10008000
.eqv	DISPPTOSTART	268482676

.eqv 	KEYSTROKE 	0xffff0000
.eqv 	DELAY		10 # how long before next frame update

	# ship colours
.eqv	LIGHTBLUE	0xbbdefb
.eqv	BLUE		0x3f51b5
.eqv	RED 		0xf44336
.eqv	YELLOW		0xffc107
	# obstacle colours
.eqv	DBROWN 		0x5d4037
.eqv 	LBROWN		0x795548
	# screen colours
.eqv 	WHITE 		0xffffff
.eqv 	PINK 		0xff8b80
.eqv 	GREY 		0x607d8b
.eqv 	BLACK 		0x000000
	# enemy ship colours
.eqv 	DARKRED 	0xb71c1c
	# ship dimensions
.eqv 	SHIPADDRESS 0x1000ba10 # for restarting
.eqv	SHIP_1L 	0 # offset from SHIPADDRESS
.eqv 	SHIP_1R 	8
.eqv 	SHIP_2L 	508
.eqv 	SHIP_2R 	532
.eqv 	SHIP_3L		1020
.eqv 	SHIP_3R 	1052
.eqv 	SHIP_4L 	1536
.eqv 	SHIP_4R 	1548
.eqv 	SHIP_5L 	2044
.eqv 	SHIP_5R 	2052
	# obstacle speeds
.eqv 	OBST1 		5 # higher number = slower, moves every X framebuffers

.data
	shipAddress: .word 0x1000ba10 # starting address for SHIP_1L, 14864 + 0x10008000
	
	test: .word 0x100080f0
	
	# ENEMY SHIPS
	enemyShipLocation: .word 0x1000accc
	
	# OBSTACLES
	obstacleCtr1: .byte 5 # counter for obstacle speed
	obstacleNumber: .byte 0 # current # of obstacles on screen
	obstacleTypes: .byte 0, 0, 0, 0, 0 # types of up to 5 obstacles
	obstacleAddresses: .word 0x10008f00, 0x10008fa0, 0x10008300, 0x10008100, 0x10008200 # addresses of up to 5 obstacles

.text
########## WELCOME ##########
	#li $t1, WHITE # $t1 stores white
	#jal draw_start_screen # first game screen with instructions
	#j draw_start_screen_loop

########## MAIN PROGRAM ##########
play_game:
	#beq, $s0, 999, game_over # still need to code this
	jal draw_ship
	jal keypress
	
	lw $a0, enemyShipLocation
	jal draw_enemy_ship

	lw $a0, obstacleAddresses
	jal draw_obst2
	sw $v0, obstacleAddresses

	lw $a0, obstacleAddresses+4
	jal draw_obst1
	sw $v0, obstacleAddresses+4

	li $a0, DELAY # wait this many ms before updating
	jal pause
	j play_game

########## PAUSE (time specified in $a0)##########
pause:
	li $v0, 32
	syscall
	jr $ra

########## SHIP FUNCTIONS ##########
draw_ship:
	# load colours and current location
	lw $t0, shipAddress # t0 = current location of SHIP_1L
	li $t1, BLUE # t1 stores blue
	li $t2, LIGHTBLUE # t2 stores light blue
	li $t3, RED # t3 stores red
	li $t4, YELLOW # t4 stores yellow
	# start drawing
	li $t6, SHIP_1L # t6 = ship[0]
	add $t6, $t6, $t0 # t6 = ship[0] + SHIPADDRESS
	sw $t3, 0($t6) # first row of ship
	sw $t3, 4($t6)
	sw $t3, 8($t6)
	li $t6, SHIP_2L # t6 = ship[2]
	add $t6, $t6, $t0 # t6 = ship[2] + SHIPADDRESS
	sw $t4, 0($t6) # second row of ship
	sw $t1, 4($t6)
	sw $t1, 8($t6)
	sw $t2, 12($t6)
	sw $t2, 16($t6)
	sw $t2, 20($t6)
	sw $t2, 24($t6)
	li $t6, SHIP_3L # t6 = ship[4]
	add $t6, $t6, $t0 # t6 = ship[4] + SHIPADDRESS
	sw $t4, 0($t6) # third row of ship
	sw $t1, 4($t6)
	sw $t3, 8($t6)
	sw $t4, 12($t6)
	sw $t4, 16($t6)
	sw $t3, 20($t6)
	sw $t1, 24($t6)
	sw $t1, 28($t6)
	sw $t1, 32($t6)
	li $t6, SHIP_4L # t6 = ship[6]
	add $t6, $t6, $t0 # t6 = ship[6] + SHIPADDRESS
	sw $t1, 0($t6) # fourth row of ship
	sw $t1, 4($t6)
	sw $t1, 8($t6)
	sw $t1, 12($t6)
	li $t6, SHIP_5L # t6 = ship[8]
	add $t6, $t6, $t0 # t6 = ship[8] + SHIPADDRESS
	sw $t1, 0($t6) # fifth row of ship
	sw $t1, 4($t6)
	sw $t1, 8($t6)
	jr $ra

keypress:
	li $t9, KEYSTROKE # t9 = 1 if keypress
	lw $t8, 0($t9) 
	beq $t8, 1, keypress_happened
	jr $ra

keypress_happened:
	lw $t7, 4($t9) # t7 = keypress ascii code
	beq $t7, 0x61, keypress_a
	beq $t7, 0x64, keypress_d
	beq $t7, 0x73, keypress_s
	beq $t7, 0x77, keypress_w
	beq $t7, 0x70, restart # if they press p, go back to countdown, just exits right now

no_response: 
	jr $ra

keypress_a:
	# check if ship is at left edge
	li $t6, SHIP_2L # t6 = ship[2]
	add $t6, $t6, $t0 # t6 = current SHIP_2L location
	subi $t6, $t6, DISPLAYADDRESS # t6 = t6 - original displayAddress
	li $t7, 512 # t7 = 512 (left edge)
	div $t6, $t7 # hi = t6 % t7 (if divisible by 512, we are at the left edge)
	mfhi $t7 # t7 = hi
	beq $t7, $0, no_response # go back if no keypress
	# erase right of ship
	li $t6, SHIP_1R # t6 = ship[1]
	add $t6, $t6, $t0 # t6 = ship[1] + SHIPADDRESS
	sw $0, 0($t6) # erase rightmost bit of row 1
	li $t6, SHIP_2R # t6 = ship[3]
	add $t6, $t6, $t0 # t6 = ship[3] + SHIPADDRESS
	sw $0, 0($t6)
	li $t6, SHIP_3R # t6 = ship[5]
	add $t6, $t6, $t0 # t6 = ship[5] + displayAddress
	sw $0, 0($t6)
	li $t6, SHIP_4R # t6 = ship[7]
	add $t6, $t6, $t0 # t6 = ship[7] + displayAddress
	sw $0, 0($t6) 
	li $t6, SHIP_5R # t6 = ship[9]
	add $t6, $t6, $t0 # t6 = ship[9] + displayAddress
	sw $0, 0($t6)
	subi, $t0, $t0, 4 # current shipAddress - 4 (shift everything to the left)
	sw $t0, shipAddress # update shipaddress
	jr $ra

keypress_d:
	# check if ship is at right edge
	li $t6, SHIP_3R # t6 = ship[5]
	add $t6, $t6, $t0 # t6 = ship[5] + current ship address
	subi $t6, $t6, 0x10007ffc # t6 = t6 - (original displayAddress - 4)
	li $t7, 512 # t7 = 512
	div $t6, $t7 # hi = t6 % t7
	mfhi $t7 # t7 = hi
	beq $t7, $0, no_response	
	# erase left of ship
	li $t6, SHIP_1L # t6 = ship[0]
	add $t6, $t6, $t0 # t6 = ship[0] + current ship address
	sw $0, 0($t6) # erase leftmost bit of row 1
	li $t6, SHIP_2L # t6 = ship[2]
	add $t6, $t6, $t0 # t6 = ship[2] + current ship address
	sw $0, 0($t6)
	li $t6, SHIP_3L # t6 = ship[4]
	add $t6, $t6, $t0 # t6 = ship[4] + current ship address
	sw $0, 0($t6)
	li $t6, SHIP_4L # t6 = ship[6]
	add $t6, $t6, $t0 # t6 = ship[6] + current ship address
	sw $0, 0($t6) 
	li $t6, SHIP_5L # t6 = ship[8]
	add $t6, $t6, $t0 # t6 = ship[8] + current ship address
	sw $0, 0($t6)
	addi, $t0, $t0, 4 # t0 = t0 + 4 (shift everything to the right)
	sw $t0, shipAddress # update shipAddress
	jr $ra

keypress_s:
	# check if ship is at bottom
	li $t6, SHIP_5L # t6 = ship[8]
	add $t6, $t6, $t0 # t6 = ship[8] + current ship address
	subi $t6, $t6, DISPLAYADDRESS # t6 = t6 - original displayAddress
	li $t7, 25088 # t7 = 32256
	bge $t6, $t7, no_response # if t6 >= t7, go back to playing
	# erase top of ship
	li $t6, SHIP_1L # t6 = ship[0]
	add $t6, $t6, $t0 # t6 = ship[0] + current ship address
	sw $0, 0($t6) # erase leftmost bit of row 1
	sw $0, 4($t6)
	sw $0, 8($t6)
	li $t6, SHIP_2L # t6 = ship[2]
	add $t6, $t6, $t0 # t6 = ship[2] + current ship address
	sw $0, 0($t6)
	sw $0, 16($t6)
	sw $0, 20($t6)
	sw $0, 24($t6)
	li $t6, SHIP_3R # t6 = ship[5]
	add $t6, $t6, $t0 # t6 = ship[5] + current ship address
	sw $0, 0($t6)
	sw $0, -4($t6)
	li $t6, SHIP_5L # t6 = ship[8]
	add $t6, $t6, $t0 # t6 = ship[8] + current ship address
	sw $0, 0($t6) # erase leftmost bit of row 5
	addi, $t0, $t0, 512  # t0 = current ship address + 512 (shift everything down)
	sw $t0, shipAddress # store new ship address
	jr $ra

keypress_w:
	# check if ship is at top
	li $t6, SHIP_1L # t6 = ship[0]
	add $t6, $t6, $t0 # t6 = ship[0] + current ship address
	subi $t6, $t6, DISPLAYADDRESS # t6 = t6 - original displayAddress
	li $t7, 512 # t7 = 512
	ble $t6, $t7, no_response # if t6 >= t7, branch
	# erase bottom of ship
	li $t6, SHIP_5L # t6 = ship[8]
	add $t6, $t6, $t0 # t6 = ship[8] + current ship address
	sw $0, 0($t6) # erase leftmost bit of row 5
	sw $0, 4($t6)
	sw $0, 8($t6)
	li $t6, SHIP_4R # t6 = ship[7]
	add $t6, $t6, $t0 # t6 = ship[7] + current ship address
	sw $0, 0($t6)
	sw $0, -4($t6)
	li $t6, SHIP_3R # t6 = ship[5]
	add $t6, $t6, $t0 # t6 = ship[5] + current ship address
	sw $0, 0($t6)
	sw $0, -4($t6)
	sw $0, -8($t6)
	sw $0, -12($t6)
	sw $0, -32($t6)
	subi, $t0, $t0, 512  # t0 = t0 -512 (shift everything up)
	sw $t0, shipAddress # store new ship address
	jr $ra

########## OBSTACLE FUNCTIONS ##########
delay_obstacle:
	li $s3, 1
	addi $v0, $a0, 0
	jr $ra

random_obst_address: 
	addi $sp, $sp, -4 # push ra to stack
	sw $ra, 0($sp)
	
	li $v0, 42 # service call for random number generator
	li $a0, 0 # id 0
	li $a1, 497 # 0 <= int < 497
	addi $a1, $a1, 9 # so that meteors don't spawn on the very left side or right

	syscall
	addi $t0, $a0, DISPLAYADDRESS # t0 = first random horizontal
	sw $t0, obstacleAddresses
	syscall
	addi $t1, $a0, DISPLAYADDRESS # t0 = second random horizontal
	sw $t1, obstacleAddresses+4
	syscall
	addi $t2, $a0, DISPLAYADDRESS # t0 = third random horizontal
	sw $t2, obstacleAddresses+8
	syscall
	addi $t3, $a0, DISPLAYADDRESS # t0 = fourth random horizontal
	sw $t3, obstacleAddresses+12
	syscall
	addi $t4, $a0, DISPLAYADDRESS # t0 = fifth random horizontal
	sw $t4, obstacleAddresses+16
	
	lw $ra, 0($sp) # pop ra from stack
	addi $sp, $sp, 4
	jr $ra

random_obst_number:
	addi $sp, $sp, -4 # push ra to stack
	sw $ra, 0($sp)
	
	li $v0, 42
	li $a0, 1 # id 1
	li $a1, 6 # 0 <= int < 6
	syscall
	sw $a0, obstacleNumber # return random number of obstacles in obstacleNumber
	
	lw $ra, 0($sp) # pop ra from stack
	addi $sp, $sp, 4
	jr $ra

random_obst_type:
	addi $sp, $sp, -4 # push ra to stack
	sw $ra, 0($sp)
	
	li $v0, 42
	li $a0, 2 # id 2
	li $a1, 2 # 0 <= int < 2
	syscall
	sw $t0, obstacleTypes # first random type
	syscall
	sw $t1, obstacleTypes+4 # second random type
	syscall
	sw $t2, obstacleTypes+8 # third random type
	syscall
	sw $t3, obstacleTypes+12 # fourth random type
	syscall
	sw $t4, obstacleTypes+16 # fifth random type
	
	lw $ra, 0($sp) # pop ra from stack
	addi $sp, $sp, 4
	jr $ra

draw_obst1: # fat and slow meteor
	beqz $s3, delay_obstacle
	li $s3, 0
	# a0 is current obstacle address argument
	li $t0, RED
	li $t1, YELLOW
	li $t3, DBROWN
	li $t4, LBROWN
	li $t5, BLACK
	
	# erase topmost
	sw $t5, -5632($a0) # erase
	
	# skip certain rows if at the bottom
	bgt, $a0, 0x1000f800, exit # don't exit but update a counter for how many meteors are on screen
	bgt, $a0, 0x1000f600, draw_obst1_11
	bgt, $a0, 0x1000f400, draw_obst1_10
	bgt, $a0, 0x1000f200, draw_obst1_9
	bgt, $a0, 0x1000f000, draw_obst1_8
	bgt, $a0, 0x1000ee00, draw_obst1_7
	bgt, $a0, 0x1000ec00, draw_obst1_6
	bgt, $a0, 0x1000ea00, draw_obst1_5
	bgt, $a0, 0x1000e800, draw_obst1_4
	bgt, $a0, 0x1000e600, draw_obst1_3
	bgt, $a0, 0x1000e400, draw_obst1_2
	# draw bottom row first then up
draw_obst1_1:
	sw $t0, 0($a0)
	sw $t0, 4($a0)
draw_obst1_2:
	sw $t0, -504($a0) # 2
	sw $t1, -508($a0)
	sw $t1, -512($a0)
	sw $t0, -516($a0)
	sw $t0, -520($a0)
draw_obst1_3:
	sw $t0, -1012($a0) # 3
	sw $t0, -1016($a0)
	sw $t3, -1020($a0)
	sw $t3, -1024($a0)
	sw $t3, -1028($a0)
	sw $t0, -1032($a0)
draw_obst1_4:
	sw $t0, -1524($a0) # 4
	sw $t1, -1528($a0)
	sw $t3, -1532($a0)
	sw $t4, -1536($a0)
	sw $t3, -1540($a0)
	sw $t1, -1544($a0)
	sw $t0, -1548($a0)
draw_obst1_5:
	sw $t0, -2036($a0) # 5
	sw $t1, -2040($a0)
	sw $t3, -2044($a0)
	sw $t3, -2048($a0)
	sw $t3, -2052($a0)
	sw $t1, -2056($a0)
	sw $t0, -2060($a0)
draw_obst1_6: 
	sw $t5, -2548($a0) # erase
	sw $t0, -2552($a0) # 6
	sw $t1, -2556($a0)
	sw $t1, -2560($a0)
	sw $t1, -2564($a0)
	sw $t0, -2568($a0)
	sw $t5, -2572($a0) # erase
draw_obst1_7: 
	sw $t0, -3064($a0) # 7
	sw $t1, -3068($a0)
	sw $t1, -3072($a0)
	sw $t0, -3076($a0)
	sw $t5, -3080($a0) # erase
draw_obst1_8: 
	sw $t5, -3576($a0) # erase
	sw $t0, -3580($a0) # 8
	sw $t1, -3584($a0)
	sw $t0, -3588($a0)
draw_obst1_9: 
	sw $t0, -4092($a0) # 9
	sw $t0, -4096($a0)
	sw $t5, -4100($a0) # erase
draw_obst1_10: 
	sw $t5, -4604($a0) # erase
	sw $t0, -4608($a0) # 10
draw_obst1_11:
	sw $t0, -5120($a0) # 11
update_obst1:
	# increment obstacle address
	addi $a0, $a0, 512 # a0 = current obst address + 512 (next row)
	addi $v0, $a0, 0 # return next obstacle address in v0
	jr $ra

draw_obst2: # long meteor
	# a0 is obstacle address
	li $t0, RED
	li $t1, YELLOW
	li $t3, DBROWN
	li $t4, LBROWN
	li $t5, BLACK
	# erase topmost pixel
	sw $t5, -8192($a0)
	# skip certain rows if at the bottom
	bgt, $a0, 0x10010200, exit
	bgt, $a0, 0x10010000, draw_obst2_16
	bgt, $a0, 0x1000fe00, draw_obst2_15
	bgt, $a0, 0x1000fc00, draw_obst2_14
	bgt, $a0, 0x1000fa00, draw_obst2_13
	bgt, $a0, 0x1000f800, draw_obst2_12
	bgt, $a0, 0x1000f600, draw_obst2_11
	bgt, $a0, 0x1000f400, draw_obst2_10
	bgt, $a0, 0x1000f200, draw_obst2_9
	bgt, $a0, 0x1000f000, draw_obst2_8
	bgt, $a0, 0x1000ee00, draw_obst2_7
	bgt, $a0, 0x1000ec00, draw_obst2_6
	bgt, $a0, 0x1000ea00, draw_obst2_5
	bgt, $a0, 0x1000e800, draw_obst2_4
	bgt, $a0, 0x1000e600, draw_obst2_3
	bgt, $a0, 0x1000e400, draw_obst2_2
	# draw bottom row first then up
draw_obst2_1:
	sw $t0, 0($a0) # 1
draw_obst2_2:
	sw $t0, -508($a0) # 2
	sw $t1, -512($a0)
draw_obst2_3:
	sw $t4, -1020($a0) # 3
	sw $t4, -1024($a0)
	sw $t0, -1028($a0)
draw_obst2_4:
	sw $t0, -1528($a0) # 4
	sw $t4, -1532($a0)
	sw $t4, -1536($a0)
	sw $t1, -1540($a0)
draw_obst2_5:
	sw $t1, -2040($a0) # 5
	sw $t4, -2044($a0)
	sw $t3, -2048($a0)
	sw $t1, -2052($a0)
draw_obst2_6:
	sw $t0, -2552($a0) # 6
	sw $t3, -2556($a0)
	sw $t3, -2560($a0)
	sw $t0, -2564($a0)
draw_obst2_7:
	sw $t1, -3068($a0) # 7
	sw $t3, -3072($a0)
	sw $t0, -3076($a0)
draw_obst2_8:
	sw $t5, -3576($a0) # erase
	sw $t0, -3580($a0) # 8
	sw $t1, -3584($a0)
	sw $t0, -3588($a0)
draw_obst2_9:
	sw $t0, -4092($a0) # 9
	sw $t1, -4096($a0)
	sw $t0, -4100($a0)
draw_obst2_10:
	sw $t0, -4604($a0) # 10
	sw $t1, -4608($a0)
draw_obst2_11:
	sw $t0, -5116($a0) # 11
	sw $t1, -5120($a0)
draw_obst2_12:
	sw $t0, -5628($a0) # 12
	sw $t0, -5632($a0)
	sw $t5, -5636($a0) # erase
draw_obst2_13:
	sw $t0, -6144($a0) # 13
draw_obst2_14:
	sw $t0, -6656($a0) # 14
draw_obst2_15:
	sw $t5, -7164($a0) # erase
	sw $t0, -7168($a0) # 15
draw_obst2_16:
	sw $t0, -7680($a0) # 16
update_obst2:
	# increment obstacle address
	addi $a0, $a0, 512 # a0 = current obst address + 512 (next row)
	addi $v0, $a0, 0 # returns next obstacle address in v0
	jr $ra

########## ENEMY SHIP FUNCTINOS ##########
draw_enemy_ship:
	addi $sp, $sp, -4 # push ra to stack
	sw $ra, 0($sp)

	li $t0, RED
	li $t1, DARKRED
	li $t2, LIGHTBLUE
	
	# left to right column, top to bottom
draw_enemy_ship1:
	sw $t0, 0($a0)
draw_enemy_ship2:
	sw $t2, -508($a0)
	sw $t0, 4($a0)
draw_enemy_ship3:
	sw $t2, -504($a0)
	sw $t0, 8($a0)
draw_enemy_ship4:
	sw $t2, -500($a0)
	sw $t0, 12($a0)
	sw $t1, 524($a0)
draw_enemy_ship5:
	sw $t0, -496($a0)
	sw $t0, 16($a0)
	sw $t1, 528($a0)
draw_enemy_ship6:
	sw $t0, -492($a0)
	sw $t1, 20($a0)
	sw $t1, 532($a0)
draw_enemy_ship7:
	sw $t0, -488($a0)
	sw $t1, 24($a0)
	sw $t1, 536($a0)
draw_enemy_ship8:
	sw $t0, -996($a0)
	sw $t1, -484($a0)
	sw $t0, 28($a0)
draw_enemy_ship9:
	sw $t0, -992($a0)
	sw $t0, -480($a0)
	sw $t0, 32($a0)
draw_enemy_ship10:
	sw $t0, -988($a0)
update_enemy_ship:
	lw $ra, 0($sp) # pop from stack
	addi $sp, $sp, 4
	jr $ra

########## SCREEN FUNCTIONS ##########
draw_start_screen:
	addi $sp, $sp, -4 # push ra to stack
	sw $ra, 0($sp)
	
	li $t0, DISPLAYADDRESS # $t0 stores the base address for display

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
	li $t0, DISPLAYADDRESS
	addi $t0, $t0, 18072
	jal draw_W
	jal draw_arrow_up
	addi $t0, $t0, 8
	jal draw_A
	jal draw_arrow_left
	addi $t0, $t0, 8
	jal draw_S
	jal draw_arrow_down
	addi $t0, $t0, 8
	jal draw_D
	jal draw_arrow_right
	
	lw $ra, 0($sp) # pop from stack
	addi $sp, $sp, 4
	jr $ra

draw_start_screen_loop:
	li $t1, WHITE # draw p to start in white
	jal draw_p2start
	li $a0, 300 # delay
	li $v0, 32
	syscall
	li $t1, BLACK # draw p to start in black
	jal draw_p2start
	li $a0, 100 # delay
	li $v0, 32
	syscall
	# check kb input
	li $t9, 0xffff0000 # t9 = 1 if keypress
	lw $t8, 0($t9) 
	beq $t8, 1, restart # if key was pressed, check to restart
	j draw_start_screen_loop

restart:
	lw $t7, 4($t9) # t7 = keypress ascii code
	bne $t7, 0x70, draw_start_screen_loop # if they don't press p, keep flickering
	li $t1, BLACK
	jal draw_start_screen # erase "welcome to... WASD"
	jal draw_p2start # erase "press p to start"
	li $t0, SHIPADDRESS # reset ship location
	sw $t0, shipAddress
	jal draw_countdown # countdown
	j play_game # start the game

draw_p2start: # draw "press p to start"
	addi $sp, $sp, -4 # push to stack
	sw $ra, 0($sp)

	li $t0, DISPPTOSTART
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
	addi $t0, $t0, 8
	jal draw_S
	jal draw_T
	jal draw_A
	jal draw_R
	jal draw_T
	
	lw $ra, 0($sp) # pop from stack
	addi $sp, $sp, 4
	jr $ra 

draw_countdown:
	addi $sp, $sp, -4
	sw $ra, 0($sp) # stack push ra
	
	li $t0, DISPLAYADDRESS
	addi $t0, $t0, 9432
	li $t1, WHITE
	jal draw_three	# draw "3"
	li $a0, 1000
	li $v0, 32
	syscall		# display for a0 seconds
	li $t1, BLACK
	jal draw_three	# erase "3"
	
	li $t1, WHITE
	jal draw_two	# draw "2"
	li $a0, 1000
	li $v0, 32
	syscall		# display for a0 seconds
	li $t1, BLACK
	jal draw_two	# erase "2"
	
	li $t1, WHITE
	jal draw_one	# draw "1"
	li $a0, 1000
	li $v0, 32
	syscall		# display for a0 seconds
	li $t1, BLACK
	jal draw_one	# erase "1"
	
	li $t0, DISPLAYADDRESS
	addi $t0, $t0, 10948
	li $t1, WHITE
	jal draw_S	# draw "START!"
	jal draw_T
	jal draw_A
	jal draw_R
	jal draw_T
	jal draw_exclamation
	li $a0, 500
	li $v0, 32
	syscall		# display for several seconds
	li $t0, DISPLAYADDRESS
	addi $t0, $t0, 10948
	li $t1, BLACK
	jal draw_S	# erase "START!"
	jal draw_T
	jal draw_A
	jal draw_R
	jal draw_T
	jal draw_exclamation
	
	li $t1, WHITE

draw_board:
	# draw the frame
	li $t0, DISPLAYADDRESS
	addi $t0, $t0, 27648
	jal draw_vertical_line
	addi $t0, $t0, 128
	jal draw_vertical_line
	addi $t0, $t0, 284
	jal draw_vertical_line
	addi $t0, $t0, 96
	jal draw_vertical_line
	li $t0, DISPLAYADDRESS
	addi $t0, $t0, 27648
	li $t6, 0
	jal draw_horizontal_line
	li $t0, DISPLAYADDRESS
	addi $t0, $t0, 32252
	li $t6, 0
	jal draw_horizontal_line
	# draw hearts
	li $t2, PINK
	li $t3, RED
	li $t0, DISPLAYADDRESS
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
	# draw letters
	li $t0, DISPLAYADDRESS
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
	li $t0, DISPLAYADDRESS	# draw "P" in "POINTS"
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
	li $t0, DISPLAYADDRESS
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
	
	lw $ra, 0($sp) # pop off stack into ra
	addi $sp, $sp, 4
	jr $ra # go back to play_game, stackPush is in draw_countdown

	# drawing letters and numbers functions


########## DRAWING LETTERS AND SYMBOLS ##########
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

draw_vertical_line:
	li $t5, GREY
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
