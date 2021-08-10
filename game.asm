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
# -Milestone 3
#
# Which approved features have been implemented for milestone 3?
# (See the assignment handout for the list of additional features)
# 1. Different levels
# 2. Increase in difficulty as game progresses
# 3. Scoring system
# 4. Enemy ships
#
# Link to video demonstration for final submission:
# -(insert YouTube / MyMedia / other URL here). Make sure we can view it!
#
# Are you OK with us sharing the video with people outside course staff?
# -yes, and please share this project github link as well!
#
# Any additional information that the TA needs to know:# -(write here, if any)
#
#####################################################################

########## CONSTANTS ##########
#  addresses
.eqv	DISPLAYADDRESS 	0x10008000
.eqv	RIGHTCORNER	0x1000fffc
.eqv	DISPPTOSTART	268482676
.eqv	DISPPTOSTART2	268482612

.eqv 	KEYSTROKE 	0xffff0000
.eqv 	DELAY		5 # how long before next frame update

# ship colours
.eqv	LIGHTBLUE	0xbbdefb
.eqv	BLUE		0x3f51b5
.eqv	RED 		0xf44336
.eqv	YELLOW		0xffc107
# obstacle colours
.eqv 	xRED		0xf54336
.eqv 	xYELLOW 	0xfec107
.eqv	DBROWN 		0x5d4037
.eqv 	LBROWN		0x795548
# screen colours
.eqv 	WHITE 		0xffffff
.eqv 	PINK 		0xff8b80
.eqv 	GREY 		0x607d8b
.eqv 	BLACK 		0x000000
# enemy ship colours
.eqv 	xLIGHTBLUE 	0xbcdefb
.eqv 	DARKRED 	0xb71c1c
# star colours
.eqv 	DARKPURPLE	0x35284d
.eqv 	PURPLE		0x5e35b1
.eqv	LIGHTPURPLE	0xb39ddb
# pick-up colours
.eqv 	xLIGHTGREEN 0xb2ff59
.eqv 	xGREEN		0x388e3c
.eqv 	xBLUE 		0x2196f3
.eqv 	xDARKBLUE 	0x1565c0
.eqv 	xxLIGHTBLUE 0xbddefb
.eqv 	cYELLOW 	0xffc108
.eqv 	cLIGHTYELLOW 0xfff176
.eqv 	cORANGE		0xf57f17
# exploasion colour
.eqv	ORANGE		0xff9800
# ship dimensions
.eqv 	SHIPADDRESS 0x1000ba10 # for restarting
.eqv	SHIP_1L 	0 # offset from SHIPADDRESS
.eqv 	SHIP_1R 	8 # 8
.eqv 	SHIP_2L 	508 # 500
.eqv 	SHIP_2R 	532 # 24
.eqv 	SHIP_3L		1020 # 488
.eqv 	SHIP_3R 	1052 # 32
.eqv 	SHIP_4L 	1536 # 484
.eqv 	SHIP_4R 	1548 # 12
.eqv 	SHIP_5L 	2044 # 496
.eqv 	SHIP_5R 	2052
# obstacle location
.eqv 	OBSTACLE_LOC 	0x1000800c
.eqv 	OBSTACLESPEED1 	10
.eqv 	OBSTACLESPEED2 	8
.eqv 	OBSTACLESPEED3 	7
.eqv 	OBSTACLESPEED4 	4
.eqv 	OBSTACLESPEED5 	3
.eqv 	OBSTACLESPEED6 	2
# enemy ship speed
.eqv 	ENEMYSHIPSPEED1	12
.eqv 	ENEMYSHIPSPEED2	9
.eqv 	ENEMYSHIPSPEED3	6
# stars speed
.eqv 	STARSPEED 		13
# score counter locations
.eqv 	ONES 			0x1000F3EC
.eqv 	TENS 			0x1000F3DC
.eqv 	HUNDREDS 		0x1000F3CC
.eqv 	THOUSANDS 		0x1000F3BC
.eqv 	TENTHOUSANDS 		0x1000F3AC
.eqv 	SCORESPEED		30
# heart locations
.eqv 	HEART1	0x1000F408
.eqv 	HEART2 	0x1000F420
.eqv 	HEART3  0x1000F438
.eqv 	HEART4 	0x1000F450
.eqv 	HEART5 	0x1000F468
# collisions speed
.eqv 	CHECKSPEED 100
# pick up speed
.eqv 	PICKUPAPPEAR  	4000
.eqv  	PICKUPDISAPPEAR 1500
.eqv 	INVINCIBIILITY 	1000

# game over location
.eqv 	GAME_OVER 		0x1000AAAC

.data
	shipAddress: .word 0x1000ba10 # starting address for SHIP_1L, 14864 + 0x10008000
	
	# ENEMY SHIPS
	enemyShipLocation1: .word 0x1000bba0
	enemyShipLocation2: .word 0x100088a0
	enemyShipLocation3: .word 0x1000accc
	enemyShipSpeed: .byte 0
	
	# OBSTACLES
	obstacleAddress1: .word 0x1000800c
	obstacleAddress2: .word 0x1000808c
	obstacleAddress3: .word 0x1000cf60
	
	obstacleSpeed1: .byte 0
	obstacleSpeed2: .byte 0
	
	# STARS
	# big
	starAddress1: 	.word 0x100095ec
	starAddress2: 	.word 0x100094f4
	starAddress3: 	.word 0x1000a4a0
	starAddress4: 	.word 0x10008dc4
	# small
	starAddress5: 	.word 0x10009590
	starAddress6: 	.word 0x1000AE28
	starAddress7: 	.word 0x10009894
	starAddress8: 	.word 0x1000b548
	starAddress9: 	.word 0x1000DB3C
	starAddress10: 	.word 0x1000bf58
	starAddress11:	.word 0x10008df8
	starAddress12: 	.word 0x1000b41c
	starAddress13: 	.word 0x100093e8
	starAddress14: 	.word 0x1000e3b0
	starAddress15: 	.word 0x1000cf0c
	starSpeed:  	.byte 0

	# SCORE
	# score is stored in $s4 $s3 $s2 $s1 $s5
	scoreSpeed: 		.byte 0
	
	# LIVES
	lives: 			.byte 5
	checkSpeed: 	.byte 0

	# PICKUPS
	currentPickup: 	.byte 0
	pickupSpeed: 	.half 0
	heartPickup: 	.word 0
	shieldPickup: 	.word 0
	coinPickup: 	.word 0

.text
########## WELCOME ##########
welcome:
	li $t1, BLACK
	li $t0, DISPLAYADDRESS
	jal erase_screen
	li $t1, WHITE # $t1 stores white
	jal draw_start_screen # first game screen with instructions
	j draw_level_choice_loop

########## MAIN PROGRAM ##########
play_game:
	# pretty star background
	lw $a0, starAddress1
	jal move_big_star
	sw $v0, starAddress1

	lw $a0, starAddress2
	jal move_big_star
	sw $v0, starAddress2
	
	lw $a0, starAddress3
	jal move_big_star
	sw $v0, starAddress3

	lw $a0, starAddress4
	jal move_big_star
	sw $v0, starAddress4

	lw $a0, starAddress5
	jal move_small_star
	sw $v0, starAddress5

	lw $a0, starAddress6
	jal move_small_star
	sw $v0, starAddress6

	lw $a0, starAddress7
	jal move_small_star
	sw $v0, starAddress7

	lw $a0, starAddress8
	jal move_small_star
	sw $v0, starAddress8

	lw $a0, starAddress9
	jal move_small_star
	sw $v0, starAddress9

	lw $a0, starAddress10
	jal move_small_star
	sw $v0, starAddress10

	lw $a0, starAddress11
	jal move_small_star
	sw $v0, starAddress11

	lw $a0, starAddress12
	jal move_small_star
	sw $v0, starAddress12

	lw $a0, starAddress13
	jal move_small_star
	sw $v0, starAddress13

	lw $a0, starAddress14
	jal move_small_star
	sw $v0, starAddress14

	lw $a0, starAddress15
	jal move_small_star
	sw $v0, starAddress15

	# player movements
	jal draw_ship
	jal keypress
	
	# draw enemy ships 
	lw $a0, enemyShipLocation1
	jal draw_enemy_ship_loading
	sw $v0, enemyShipLocation1
	
	lw $a0, enemyShipLocation2
	jal draw_enemy_ship_loading
	sw $v0, enemyShipLocation2
	
	lw $a0, enemyShipLocation3
	jal draw_enemy_ship_loading
	sw $v0, enemyShipLocation3

	# draw obstacles
	lw $a0, obstacleAddress1
	jal draw_obst1_loading
	sw $v0, obstacleAddress1
	
	lw $a0, obstacleAddress2
	jal draw_obst2_loading
	sw $v0, obstacleAddress2
	
	lw $a0, obstacleAddress3
	jal draw_obst2_loading
	sw $v0, obstacleAddress3

	# draw pickup
	jal draw_random_pickup
	
	# check collisions
	jal check_player 

	# update score
	jal point_counter_ones
	jal point_counter_tens
	jal point_counter_hundreds
	jal point_counter_thousands
	jal point_counter_ten_thousands

	jal check_score1 # increase difficulty if needed
	
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
	beq $t7, 0x70, welcome # if they press p, go back to countdown, just exits right now

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
random_location1:
	addi $sp, $sp, -4 # push ra to stack
	sw $ra, 0($sp)
	
	jal random_obst_address

	lw $ra, 0($sp) # pop ra from stack
	addi $sp, $sp, 4
	jr $ra

delay_obstacle1:
	lb $t8, obstacleSpeed1
	addi $t8, $t8, -1
	sb $t8, obstacleSpeed1
	addi $v0, $a0, 0 # don't change obst location
	jr $ra
	
delay_obstacle2:
	lb $t8, obstacleSpeed2
	addi $t8, $t8, -1
	sb $t8, obstacleSpeed2
	addi $v0, $a0, 0 # don't change obst location
	jr $ra

random_obst_address: 
	addi $sp, $sp, -4 # push ra to stack
	sw $ra, 0($sp)
	
	li $v0, 42 # service call for random number generator
	li $a0, 0 # id 0
	li $a1, 121 # 0 <= int < 121
	syscall

	sll $a0, $a0, 2 # multiply by 4

	add $v0, $a0, OBSTACLE_LOC # return in v0
	
	lw $ra, 0($sp) # pop ra from stack
	addi $sp, $sp, 4
	jr $ra
draw_obst1_loading: # fat and slow meteor
	lb $t8, obstacleSpeed1
	bgtz $t8, delay_obstacle1 # don't update the address this time around
	beq $s0, 1, loading1
	beq $s0, 2, loading3

loading5:
	li $t8, OBSTACLESPEED5
	j draw_obst1

loading3:
	li $t8, OBSTACLESPEED3
	j draw_obst1

loading1:
	li $t8, OBSTACLESPEED1

draw_obst1:
	sb $t8, obstacleSpeed1

	addi $sp, $sp, -4 # push ra to stack
	sw $ra, 0($sp)
	# a0 is current obstacle address argument
	li $t0, xRED
	li $t1, xYELLOW
	li $t3, DBROWN
	li $t4, LBROWN
	li $t5, BLACK
	
	# erase topmost
	sw $t5, -5632($a0) # erase
	
	# skip certain rows if at the bottom
	bgt, $a0, 0x1000f800, random_obst_address # don't exit but get new meteor address
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

	lw $ra, 0($sp) # pop ra from stack
	addi $sp, $sp, 4
	jr $ra

draw_obst2_loading: # long meteor
	lb $t8, obstacleSpeed2
	bgtz $t8, delay_obstacle2 # don't update the address this time around
	beq $s0, 1, loading2
	beq $s0, 2, loading4

loading6:
	li $t8, OBSTACLESPEED6
	j draw_obst2

loading4:
	li $t8, OBSTACLESPEED4
	j draw_obst2

loading2:
	li $t8, OBSTACLESPEED2

draw_obst2:
	sb $t8, obstacleSpeed2

	addi $sp, $sp, -4 # push ra to stack
	sw $ra, 0($sp)
	# a0 is obstacle address
	li $t0, xRED
	li $t1, xYELLOW
	li $t3, DBROWN
	li $t4, LBROWN
	li $t5, BLACK
	# erase topmost pixel
	sw $t5, -8192($a0)
	# skip certain rows if at the bottom
	bgt, $a0, 0x10010200, random_obst_address
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
	
	lw $ra, 0($sp) # pop from stack
	addi $sp, $sp, 4
	jr $ra

########## ENEMY SHIP FUNCTINOS ##########
delay_enemy_ship:
	lb $t8, enemyShipSpeed
	addi $t8, $t8, -1
	sb $t8, enemyShipSpeed
	addi $v0, $a0, 0 # don't change ship location
	jr $ra

random_direction:
	addi $sp, $sp, -4 # push ra to stack
	sw $ra, 0($sp)
	
	li $v0, 42
	li $a0, 4 # id 4
	li $a1, 4 # 0 <= int < 4
	syscall
	
	addi $v0, $a0, 0
	
	j go_back
	
draw_enemy_ship_loading:
	lb $t8, enemyShipSpeed
	bgtz $t8, delay_enemy_ship # don't update the address this time around
	beq $s0, 1, ship_loading1
	beq $s0, 2, ship_loading2

ship_loading3:
	li $t8, ENEMYSHIPSPEED3
	j draw_enemy_ship

ship_loading2:
	li $t8, ENEMYSHIPSPEED2
	j draw_enemy_ship

ship_loading1:
	li $t8, ENEMYSHIPSPEED1

draw_enemy_ship:
	sb $t8, enemyShipSpeed

	addi $sp, $sp, -4 # push ra to stack
	sw $ra, 0($sp)

	li $t0, xRED
	li $t1, DARKRED
	li $t2, xLIGHTBLUE
	li $t3, BLACK
	
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
erase:
	sw $t3, 540($a0)
	sw $t3, -476($a0)
	sw $t3, 36($a0)
	sw $t3, -984($a0)

	sw $t3, -1016($a0)
	sw $t3, -1012($a0)
	sw $t3, -1008($a0)
	sw $t3, -1004($a0)
	sw $t3, -1000($a0)
	sw $t3, -476($a0)
	sw $t3, -1500($a0)
	sw $t3, -1496($a0)
	sw $t3, -1504($a0)

	sw $t3, 516($a0)
	sw $t3, 520($a0)
	sw $t3, 540($a0)
	sw $t3, 544($a0)
	sw $t3, 548($a0)
	sw $t3, 36($a0)
	sw $t3, -476($a0)
	sw $t3, -472($a0)
	sw $t3, 1040($a0)
	sw $t3, 1044($a0)
	sw $t3, 1048($a0)
	sw $t3, 1052($a0)
choose_direction:
	bgt $a0, 0x1000e000, update_enemy_shipUL # check if at the bottom
	blt $a0, 0x10008477, update_enemy_shipDL # check if at the top
	
	addi $t6, $a0, 0 # save ship location
	jal random_direction
	addi $t0, $v0, 0 # get random direction
	addi $a0, $t6, 0 # restore ship location
	
	beqz, $t0, update_enemy_shipDL # 25% chance
	beq $t0, 1, update_enemy_shipUL # 25 % chance
	j update_enemy_shipL # 50% chance

update_enemy_shipL:
	addi $v0, $a0, -4 # move to the left
	j go_back

update_enemy_shipDL:
	addi $v0, $a0, 508 # move to the down left
	j go_back
	
update_enemy_shipUL:
	addi $v0, $a0, -516 # move to the up left

go_back:
	lw $ra, 0($sp) # pop from stack
	addi $sp, $sp, 4
	jr $ra

########## PICK-UPS ##########
random_pickup:
	addi $sp, $sp, -4 # push ra to stack
	sw $ra, 0($sp)
	
	li $v0, 42
	li $a0, 7 # id 7
	li $a1, 3 # 0 <= int < 3
	syscall

	addi $s7, $a0, 0 # s7 stores current pickup type
	j go_back

draw_random_pickup:
	addi $sp, $sp, -4 # push ra to stack
	sw $ra, 0($sp)

	lh $t4, pickupSpeed # load pick up speed
	addi $t4, $t4, -1 # decrement
	sh $t4, pickupSpeed

	bgtz $t4, continue_pickup_drawing # if it's not time to choose new pickup, continue the current one
	jal random_pickup # generate new random pickup
	beq $a0, 0, draw_pickup1
	beq $a0, 1, draw_pickup2
	j draw_pickup3

continue_pickup_drawing:
	beq $s7, 1, draw_pickup2
	beqz $s7, draw_pickup1
	j draw_pickup3

delay_pickup:
	lh $t0, pickupSpeed
	addi $t0, $t0, -1
	sh $t0, pickupSpeed
	jr $ra

draw_pickup1:
	blez $t4, new_heart_location # if pickupSpeed <= 0, reset
	blt $t4, PICKUPDISAPPEAR, go_back # if 0 < pickupSpeed < PICKUPDISAPPEAR, do nothing
	beq $t4, PICKUPDISAPPEAR, erase_heart_pickup # if pickupSpeed = PICKUPDISAPPEAR, make it disappear

	# else, continue to draw the pickup

	lw $t0, heartPickup
	li $t3, xGREEN # get colours
	li $t2, xLIGHTGREEN
	
	jal draw_heart
	j go_back # pop ra from stack

erase_heart_pickup:
	li $t3, BLACK
	li $t2, BLACK
	lw $t0, heartPickup
	jal draw_heart # erase the pickup
	j go_back

erase_shield_pickup:
	li $t3, BLACK
	li $t2, BLACK
	li $t1, BLACK
	lw $t0, shieldPickup
	jal draw_shield # erase the pickup
	j go_back

erase_coin_pickup:
	li $t1, BLACK
	li $t2, BLACK
	li $t3, BLACK
	lw $t0, coinPickup
	jal draw_coin # erase the pickup
	j go_back

new_heart_location: 
	li $t4, PICKUPAPPEAR # reset pickupSpeed to PICKUPAPPEAR (bigger than PICKUPDISAPPEAR)
	sh $t4, pickupSpeed

	jal random_location_anywhere
	sw $v0, heartPickup # store new heart location

	lw $t0, heartPickup
	li $t3, xGREEN
	li $t2, xLIGHTGREEN
	jal draw_heart
	j go_back # go back to main play_game

new_shield_location:
	li $t4, PICKUPAPPEAR # reset pickupSpeed to PICKUPAPPEAR (bigger than PICKUPDISAPPEAR)
	sh $t4, pickupSpeed

	jal random_location_anywhere
	sw $v0, shieldPickup # store new heart location

	lw $t0, shieldPickup
	li $t1, xLIGHTBLUE # get colours
	li $t2, xBLUE
	li $t3, xDARKBLUE
	jal draw_shield
	j go_back # go back to main play_game

new_coin_location:
	li $t4, PICKUPAPPEAR # reset pickupSpeed to PICKUPAPPEAR (bigger than PICKUPDISAPPEAR)
	sh $t4, pickupSpeed

	jal random_location_anywhere
	sw $v0, coinPickup # store new coin location

	addi $t0, $v0, 0
	li $t1, cLIGHTYELLOW # get colours
	li $t2, cYELLOW
	li $t3, cORANGE
	jal draw_coin
	j go_back # go back to main play_game

draw_pickup2:
	blez $t4, new_shield_location # if pickupSpeed <= 0, reset
	blt $t4, PICKUPDISAPPEAR, go_back # if 0 < pickupSpeed < PICKUPDISAPPEAR, do nothing
	beq $t4, PICKUPDISAPPEAR, erase_shield_pickup # if pickupSpeed = PICKUPDISAPPEAR, make it disappear

	# else, continue to draw the pickup

	lw $t0, shieldPickup
	li $t1, xxLIGHTBLUE # get colours
	li $t2, xBLUE
	li $t3, xDARKBLUE
	
	jal draw_shield
	j go_back # pop ra from stack

random_location_anywhere:
	addi $sp, $sp, -4 # push ra to stack
	sw $ra, 0($sp)

	li $v0, 42
	li $a0, 5
	li $a1, 5877 # 0 <= random number < 24036
	syscall # random num in a0
	sll $a0, $a0, 2 # multiply by 4
	addi $a0, $a0, 516 # add 516 so we don't draw on first row
	
	li $t2, 512 # for division
	div $a0, $t2 # a0 / t2 = random location / 512
	mfhi $t3 # move remainder to t3

	blt $t3, 4, random_location_anywhere # can't be < 4
	bgt $t3, 488, random_location_anywhere # can't be > 488

	addi $a0, $a0, DISPLAYADDRESS # add display address
	addi $v0, $a0, 0 # store result in v0
	j go_back

delay_invincible:
	addi $s6, $s6, -1

	li $t2, PINK # redraw hearts red
	li $t3, RED 

	beqz $s6, redraw_hearts
	jr $ra

draw_pickup3:
	blez $t4, new_coin_location # if pickupSpeed <= 0, reset
	blt $t4, PICKUPDISAPPEAR, go_back # if 0 < pickupSpeed < PICKUPDISAPPEAR, do nothing
	beq $t4, PICKUPDISAPPEAR, erase_coin_pickup # if pickupSpeed = PICKUPDISAPPEAR, make it disappear

	# else, continue to draw the pickup

	lw $t0, coinPickup
	li $t1, cLIGHTYELLOW # get colours
	li $t2, cYELLOW
	li $t3, cORANGE
	
	jal draw_coin
	j go_back # pop ra from stack

########## COLLISIONS ##########
delay_check_player:
	lb $t0, checkSpeed
	addi $t0, $t0, -1
	sb $t0, checkSpeed
	jr $ra

check_player:
	bgtz $s6, delay_invincible # s6 != 0 means we are invincible

	lb $t0, checkSpeed
	bgtz $t0, delay_check_player

	addi $sp, $sp, -4 # push ra to stack
	sw $ra, 0($sp)

	lw $t0, shipAddress # get current ship address
	jal check_overlaps
	addi $t0, $t0, 4
	jal check_overlaps
	addi $t0, $t0, 4
	jal check_overlaps
	addi $t0, $t0, 500
	jal check_overlaps
	addi $t0, $t0, 16
	jal check_overlaps
	addi $t0, $t0, 4
	jal check_overlaps
	addi $t0, $t0, 4
	jal check_overlaps
	addi $t0, $t0, 484
	jal check_overlaps
	addi $t0, $t0, 20
	jal check_overlaps
	addi $t0, $t0, 4
	jal check_overlaps
	addi $t0, $t0, 4
	jal check_overlaps
	addi $t0, $t0, 4
	jal check_overlaps
	addi $t0, $t0, 484
	jal check_overlaps
	addi $t0, $t0, 8
	jal check_overlaps
	addi $t0, $t0, 4
	jal check_overlaps
	addi $t0, $t0, 496
	jal check_overlaps
	addi $t0, $t0, 4
	jal check_overlaps
	addi $t0, $t0, 4
	jal check_overlaps # check all the outside edges of ship

	j go_back # if no overlaps, go back

check_overlaps:
	lw $t1, 0($t0)
	beq $t1, xLIGHTBLUE, lose_life
	beq $t1, xRED, lose_life
	beq $t1, xYELLOW, lose_life
	beq $t1, DARKRED, lose_life
	beq $t1, LBROWN, lose_life
	beq $t1, DBROWN, lose_life
	beq $t1, xGREEN, gain_life
	beq $t1, xLIGHTGREEN, gain_life
	beq $t1, xxLIGHTBLUE, go_invincible
	beq $t1, xBLUE, go_invincible
	beq $t1, xDARKBLUE, go_invincible
	beq $t1, cYELLOW, add_points
	beq $t1, cLIGHTYELLOW, add_points
	beq $t1, cORANGE, add_points

	jr $ra

add_points:
	lw $t0, coinPickup # erase coin
	li $t1, BLACK
	li $t2, BLACK
	li $t3, BLACK
	jal draw_coin

	li $t4, PICKUPDISAPPEAR # reset pickupSpeed to PICKUPDISAPPEAR
	sh $t4, pickupSpeed

	# jal add_100_points # christine please help me

	j go_back

go_invincible:
	li $s6, INVINCIBIILITY # loads INVINCIBILITY

	lw $t0, shieldPickup
	li $t2, BLACK
	li $t3, BLACK
	li $t1, BLACK
	jal draw_shield # erase the pickup shield

	li $t4, PICKUPDISAPPEAR # reset pickupSpeed to PICKUPDISAPPEAR
	sh $t4, pickupSpeed

	li $t2, xxLIGHTBLUE # redraw the hearts in blue
	li $t3, xBLUE

redraw_hearts:
	lb $t4, lives

	beq $t4, 4, blue_heart4
	beq $t4, 3, blue_heart3
	beq $t4, 2, blue_heart2
	beq $t4, 1, blue_heart1

blue_heart5:
	li $t0, HEART5
	jal draw_heart

blue_heart4:
	li $t0, HEART4
	jal draw_heart

blue_heart3:
	li $t0, HEART3
	jal draw_heart

blue_heart2:
	li $t0, HEART2
	jal draw_heart

blue_heart1:
	li $t0, HEART1
	jal draw_heart
	j go_back

gain_life:
	lw $t0, heartPickup
	li $t2, BLACK
	li $t3, BLACK
	jal draw_heart # erase the pickup heart

	li $t4, PICKUPDISAPPEAR # reset pickupSpeed to PICKUPDISAPPEAR
	sh $t4, pickupSpeed

	lb $t4, lives
	beq $t4, 5, go_back # don't give them more live

	addi $t4, $t4, 1
	sb $t4, lives # update lives

	li $t2, PINK
	li $t3, RED

	beq $t4, 5, heart4 # draw new heart
	beq $t4, 4, heart3
	beq $t4, 3, heart2
	beq $t4, 2, heart1

lose_life:
	li $t9, CHECKSPEED # after you lose a life, then reset the check speed
	sb $t9, checkSpeed

	lb $t4, lives
	addi $t4, $t4, -1
	sb $t4, lives # update current lives

	li $t2, BLACK
	li $t3, BLACK
	
	beq $t4, 4, heart4
	beq $t4, 3, heart3
	beq $t4, 2, heart2
	beq $t4, 1, heart1
	beqz $t4, heart0

heart4:
	li $t0, HEART5
	jal draw_heart
	j go_back

heart3:
	li $t0, HEART4
	jal draw_heart
	j go_back

heart2:
	li $t0, HEART3
	jal draw_heart
	j go_back

heart1:
	li $t0, HEART2
	jal draw_heart
	j go_back

heart0:
	li $t0, HEART1
	jal draw_heart
	j draw_game_over

########## STAR BACKGROUND ##########
random_star_address1:
	addi $sp, $sp, -4 # push ra to stack
	sw $ra, 0($sp)
	
	li $v0, 42
	li $a0, 5 # id 5
	li $a1, 45 # 0 <= int < 45
	syscall
	
	sll $a0, $a0, 9 # a0 * 512
	addi $a0, $a0, 2536
	addi $a0, $a0, DISPLAYADDRESS
	addi $v0, $a0, 0 # return in v0
	
	j go_back

delay_star:
	lb $t0, starSpeed
	addi $t0, $t0, -1
	sb $t0, starSpeed
	addi $v0, $a0, 0 # don't change star location
	jr $ra
	
move_big_star:
	lb $t0, starSpeed
	bgtz, $t0, delay_star # don't update location yet
	li $t0, STARSPEED # reset star speed
	sb $t0, starSpeed
	
	addi $sp, $sp, -4 # push ra to stack
	sw $ra, 0($sp)
	
	li $t0, DARKPURPLE
	li $t1, PURPLE
	li $t2, LIGHTPURPLE
	li $t3, BLACK
	sw $t3, 20($a0) # erase rightmost

	addi $t4, $a0, 0 # store star address
	
	li $t5, 512
	subi $a0, $a0, DISPLAYADDRESS
	div $a0, $t5
	mfhi $t5
	beq $t5, 508, move_big_star2
	beq $t5, 504, move_big_star3
	beq $t5, 500, move_big_star4
	beq $t5, 496, move_big_star5
	beq $t5, 492, random_star_address1
	
move_big_star1:
	addi $a0, $t4, 0 # restore star address
	sw $t0, 0($a0)
move_big_star2:
	addi $a0, $t4, 0 # restore star address
	sw $t1, 4($a0)
move_big_star3:
	addi $a0, $t4, 0 # restore star address
	sw $t2, 8($a0)
	sw $t1, 520($a0)
	sw $t0, 1032($a0)
	sw $t1, -504($a0)
	sw $t1, -1016($a0)
move_big_star4:
	addi $a0, $t4, 0 # restore star address
	sw $t1, 12($a0)
move_big_star5:
	addi $a0, $t4, 0 # restore star address
	sw $t0, 16($a0)
erase_big_star:
	sw $t3, -500($a0)
	sw $t3, -1012($a0)
	sw $t3, 524($a0)
	sw $t3, 1036($a0)
	
	addi $v0, $a0, -4 # update address
	
	j go_back

random_star_address2:
	addi $sp, $sp, -4 # push ra to stack
	sw $ra, 0($sp)
	
	li $v0, 42
	li $a0, 5 # id 5
	li $a1, 50 # 0 <= int < 50
	syscall
	
	sll $a0, $a0, 9 # a0 * 512
	addi $a0, $a0, -8 # so that it appears on 2nd pixel from the left
	addi $a0, $a0, DISPLAYADDRESS
	addi $v0, $a0, 0 # return in v0
	
	j go_back

erase_stupid_star:
	sw $t1, 0($a0)
	j random_star_address2

move_small_star:
	lb $t0, starSpeed
	bgtz, $t0, delay_star
	li $t0, STARSPEED
	sb $t0, starSpeed

	addi $sp, $sp, -4 # push ra to stack
	sw $ra, 0($sp)

	li $t0, DARKPURPLE
	li $t1, BLACK
	sw $t0, 0($a0)
	sw $t1, 4($a0)
	
	addi $v0, $a0, -4 # update address
	li $t0, 512 # if it will go across the screen, get random location
	div $v0, $t0
	mfhi, $t4
	beq $t4, 508, erase_stupid_star # if it would appear on right side again

	j go_back

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

draw_level_choice_loop:
	li $t1, WHITE # draw p to start in white
	jal draw_level
	li $a0, 300 # delay
	li $v0, 32
	syscall
	li $t1, BLACK # draw p to start in black
	jal draw_level
	li $a0, 100 # delay
	li $v0, 32
	syscall
	# check kb input
	li $t9, 0xffff0000 # t9 = 1 if keypress
	lw $t8, 0($t9) 
	beq $t8, 1, level_choice_e # if key was pressed, check which level they choose
	j draw_level_choice_loop

level_choice_e:
	lw $t7, 4($t9) # t7 = keypress ascii code
	bne $t7, 0x65, level_choice_n # if they don't press e, jump to check if they press n
	li $s0, 1
	j draw_start_screen_loop
	
level_choice_n:
	lw $t7, 4($t9) # t7 = keypress ascii code
	bne $t7, 0x6e, level_choice_h # if they don't press e, jump to check if they press h
	li $s0, 2
	j draw_start_screen_loop

level_choice_h:
	lw $t7, 4($t9) # t7 = keypress ascii code
	bne $t7, 0x68, draw_level_choice_loop # if they don't press h, jump back to level_choice_loop
	li $s0, 3
	j draw_start_screen_loop

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
	li $t0, DISPLAYADDRESS
	jal erase_screen # reset the whole screen

	li $t0, SHIPADDRESS # reset ship location
	sw $t0, shipAddress

	li $t0, 5 # reset lives
	sb $t0, lives

	li $s7, 0 # random pickup type = 0
	li $s6, 0 # no invinciblity

	li $s5, 0 # reset score
	li $s1, 0
	li $s2, 0
	li $s3, 0
	li $s4, 0

	jal draw_countdown # countdown
	j play_game # get random location for obstacle

erase_screen:
	addi $sp, $sp, -4 # push to stack
	sw $ra, 0($sp)

	sw $t1, 0($t0)
	addi $t0, $t0, 4
	ble $t0, RIGHTCORNER, erase_screen
	
	lw $ra, 0($sp) # pop from stack
	addi $sp, $sp, 4
	jr $ra

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

draw_level: # draw "press e - easy, n - normal, h - hard "
	addi $sp, $sp, -4 # push to stack
	sw $ra, 0($sp)

	li $t0, DISPPTOSTART2
	jal draw_E
	jal draw_dash
	jal draw_E
	jal draw_A
	jal draw_S
	jal draw_Y
	addi $t0, $t0, 8
	jal draw_N
	jal draw_dash
	jal draw_N
	jal draw_O
	jal draw_R
	jal draw_M
	jal draw_A
	jal draw_L
	addi $t0, $t0, 8
	jal draw_H
	jal draw_dash
	jal draw_H
	jal draw_A
	jal draw_R
	jal draw_D
	
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
	li $t0, HEART1
	jal draw_heart
	li $t0, HEART2
	jal draw_heart
	li $t0, HEART3
	jal draw_heart
	li $t0, HEART4
	jal draw_heart
	li $t0, HEART5
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

########## SCORE COUNTER FUNCTIONS ##########
check_score1:
	lb $t0, scoreSpeed
	bgtz $t0, no_update # don't check if score hasn't been updated
	beq $s2, 5, check_score2
	beq $s2, 2, check_score2
	jr $ra

check_score2:
	beq $s1, 0, check_score3
	jr $ra

check_score3:
	beq $s5, 10, increase_difficulty
	jr $ra

increase_difficulty:
	beq $s0, 3, no_response
	addi $s0, $s0, 1 # add 1 to difficulty
	jr $ra

no_update:
	lb $t0, scoreSpeed
	addi $t0, $t0, -1
	sb $t0, scoreSpeed
	jr $ra

point_counter_ones:
	lb $t0, scoreSpeed
	bgtz $t0, no_update
	li $t0, SCORESPEED
	sb $t0, scoreSpeed
	
	addi $sp, $sp, -4
	sw $ra, 0($sp) # stack push ra
	
	li $t0, ONES
	beq $s5, 0, draw_point_zero
	beq $s5, 1, draw_point_one
	beq $s5, 2, draw_point_two
	beq $s5, 3, draw_point_three
	beq $s5, 4, draw_point_four
	beq $s5, 5, draw_point_five
	beq $s5, 6, draw_point_six
	beq $s5, 7, draw_point_seven
	beq $s5, 8, draw_point_eight
	beq $s5, 9, draw_point_nine
	beq $s5, 10, draw_point_ten
point_counter_tens:
	addi $sp, $sp, -4
	sw $ra, 0($sp) # stack push ra
	
	li $t0, TENS
	subi $s5, $s5, 1
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
	
	li $t0, HUNDREDS
	subi $s5, $s5, 1
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
	
	li $t0, THOUSANDS
	subi $s5, $s5, 1
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
	
	li $t0, TENTHOUSANDS
	subi $s5, $s5, 1
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
	addi $s5, $s5, 1
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
	addi $s5, $s5, 1
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
	addi $s5, $s5, 1
	j go_back
draw_point_three: # from 2 to 3
	li $t4, BLACK
	sw $t4, 1536($t0)
	
	li $t4, YELLOW
	sw $t4, 1544($t0)
	addi $s5, $s5, 1
	j go_back
draw_point_four: # from 3 to 4
	li $t4, BLACK
	sw $t4, 4($t0)
	sw $t4, 2048($t0)
	sw $t4, 2052($t0)

	li $t4, YELLOW
	sw $t4, 512($t0)
	addi $s5, $s5, 1
	j go_back
draw_point_five: # from 4 to 5
	li $t4, BLACK
	sw $t4, 520($t0)
	
	li $t4, YELLOW
	sw $t4, 4($t0)
	sw $t4, 2048($t0)
	sw $t4, 2052($t0)
	addi $s5, $s5, 1
	j go_back
draw_point_six: # from 5 to 6
	li $t4, YELLOW
	sw $t4, 1536($t0)
	addi $s5, $s5, 1
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
	addi $s5, $s5, 1
	j go_back
draw_point_eight: # from 7 to 8
	li $t4, YELLOW
	sw $t4, 512($t0)
	sw $t4, 1024($t0)
	sw $t4, 1028($t0)
	sw $t4, 1536($t0)
	sw $t4, 2048($t0)
	sw $t4, 2052($t0)
	addi $s5, $s5, 1
	j go_back
draw_point_nine: # from 8 to 9
	li $t4, BLACK
	sw $t4, 1536($t0)
	sw $t4, 2048($t0)
	sw $t4, 2052($t0)
	addi $s5, $s5, 1
	j go_back
draw_point_ten: # from 9 to 0 (ones digit)
	li $t4, BLACK
	sw $t4, 1028($t0)
	
	li $t4, YELLOW
	sw $t4, 1536($t0)
	sw $t4, 2048($t0)
	sw $t4, 2052($t0)
	addi $s1, $s1, 1
	li $s5, 1
	j go_back
initialize_tens: # from 9 to 0 (tens digit)
	li $t4, BLACK
	sw $t4, 1028($t0)
	
	li $t4, YELLOW
	sw $t4, 1536($t0)
	sw $t4, 2048($t0)
	sw $t4, 2052($t0)
	addi $s5, $s5, 1
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
	addi $s5, $s5, 1
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
	addi $s5, $s5, 1
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
	addi $s5, $s5, 1
	li $s4, 0
	j go_back

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

draw_Y:
	sw $t1, 0($t0)
	sw $t1, 16($t0)
	sw $t1, 516($t0)
	sw $t1, 524($t0)
	sw $t1, 1032($t0)
	sw $t1, 1544($t0)
	sw $t1, 2056($t0)
	addi $t0, $t0, 20
	jr $ra

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

draw_dash:
	sw $t1, 1024($t0)
	sw $t1, 1028($t0)
	sw $t1, 1032($t0)
	addi $t0, $t0, 16
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

draw_N:
	sw $t1, 0($t0)
	sw $t1, 512($t0)
	sw $t1, 1024($t0)
	sw $t1, 1536($t0)
	sw $t1, 2048($t0)
	sw $t1, 12($t0)
	sw $t1, 524($t0)
	sw $t1, 1036($t0)
	sw $t1, 1548($t0)
	sw $t1, 2060($t0)
	sw $t1, 516($t0)
	sw $t1, 1032($t0)
	sw $t1, 1544($t0)
	addi $t0, $t0, 20
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

draw_shield: # erase shield by setting t1, t2, t3 to black (t1 = lightest, t3 = darkest)
	sw $t2, 0($t0)
	sw $t2, 4($t0)
	sw $t3, 8($t0)
	sw $t1, 12($t0)
	sw $t1, 16($t0)
	sw $t2, 512($t0)
	sw $t2, 516($t0)
	sw $t3, 520($t0)
	sw $t1, 524($t0)
	sw $t1, 528($t0)
	sw $t3, 1024($t0)
	sw $t3, 1028($t0)
	sw $t3, 1032($t0)
	sw $t3, 1036($t0)
	sw $t3, 1040($t0)
	sw $t1, 1536($t0)
	sw $t1, 1540($t0)
	sw $t3, 1544($t0)
	sw $t2, 1548($t0)
	sw $t2, 1552($t0)
	sw $t1, 2052($t0)
	sw $t3, 2060($t0)
	sw $t3, 2568($t0)
	sw $t2, 2056($t0)
	jr $ra

draw_coin:
	# outside
	sw $t2, 8($t0)
	sw $t2, 12($t0)
	sw $t2, 16($t0)
	sw $t2, 516($t0)
	sw $t2, 532($t0)
	sw $t2, 1024($t0)
	sw $t2, 1048($t0)
	sw $t2, 1536($t0)
	sw $t2, 1560($t0)
	sw $t2, 2048($t0)
	sw $t2, 2072($t0)
	sw $t2, 2564($t0)
	sw $t2, 2580($t0)
	sw $t2, 3080($t0)
	sw $t2, 3084($t0)
	sw $t2, 3088($t0)
	# inside
	sw $t1, 520($t0)
	sw $t1, 524($t0)
	sw $t1, 528($t0)
	sw $t1, 1028($t0)
	sw $t1, 1044($t0)
	sw $t1, 1540($t0)
	sw $t1, 1548($t0)
	sw $t1, 1552($t0)
	sw $t1, 1556($t0)
	sw $t1, 2052($t0)
	sw $t1, 2068($t0)
	sw $t1, 2568($t0)
	sw $t1, 2572($t0)
	sw $t1, 2576($t0)
	# c
	sw $t3, 1032($t0)
	sw $t3, 1036($t0)
	sw $t3, 1040($t0)
	sw $t3, 1544($t0)
	sw $t3, 2056($t0)
	sw $t3, 2060($t0)
	sw $t3, 2064($t0)
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

########## DRAW EXPLOSION ##########
draw_explosion1:
	sw $t1, 1032($t0)
	sw $t1, 1040($t0)
	sw $t1, 1540($t0)
	sw $t1, 2056($t0)
	sw $t1, 2064($t0)
	sw $t1, 2572($t0)
	
	sw $t2, 1544($t0)
	
	sw $t3, 1548($t0)
	
	sw $t5, 2060($t0)
	jr $ra
draw_explosion2:
	sw $t1, 12($t0)
	sw $t1, 524($t0)
	sw $t1, 1536($t0)
	sw $t1, 1556($t0)
	sw $t1, 1560($t0)
	sw $t1, 3084($t0)
	
	sw $t2, 1036($t0)
	sw $t2, 1552($t0)
	sw $t2, 2060($t0)
	
	sw $t3, 1032($t0)
	sw $t3, 1040($t0)
	sw $t3, 2056($t0)
	sw $t3, 2064($t0)
	
	sw $t5, 520($t0)
	sw $t5, 528($t0)
	sw $t5, 1028($t0)
	sw $t5, 1044($t0)
	sw $t5, 2052($t0)
	sw $t5, 2068($t0)
	sw $t5, 2568($t0)
	sw $t5, 2576($t0)
	jr $ra
draw_explosion3:
	sw $t1, 0($t0)
	sw $t1, 8($t0)
	sw $t1, 16($t0)
	sw $t1, 20($t0)
	sw $t1, 28($t0)
	sw $t1, 516($t0)
	sw $t1, 536($t0)
	sw $t1, 1024($t0)
	sw $t1, 1052($t0)
	sw $t1, 1564($t0)
	sw $t1, 2048($t0)
	sw $t1, 2076($t0)
	sw $t1, 2560($t0)
	sw $t1, 2588($t0)
	sw $t1, 3076($t0)
	sw $t1, 3096($t0)
	sw $t1, 3584($t0)
	sw $t1, 3592($t0)
	sw $t1, 3596($t0)
	sw $t1, 3600($t0)
	sw $t1, 3604($t0)
	sw $t1, 3612($t0)
	
	sw $t2, 524($t0)
	sw $t2, 528($t0)
	sw $t2, 1032($t0)
	sw $t2, 1040($t0)
	sw $t2, 1044($t0)
	sw $t2, 1540($t0)
	sw $t2, 1556($t0)
	sw $t2, 1560($t0)
	sw $t2, 2052($t0)
	sw $t2, 2056($t0)
	sw $t2, 2068($t0)
	sw $t2, 2072($t0)
	sw $t2, 2568($t0)
	sw $t2, 2572($t0)
	sw $t2, 2576($t0)
	sw $t2, 2580($t0)
	sw $t2, 3084($t0)
	sw $t2, 3088($t0)
	
	sw $t3, 1552($t0)
	sw $t3, 2060($t0)
	
	sw $t5, 532($t0)
	sw $t5, 1048($t0)
	sw $t5, 2564($t0)
	sw $t5, 2584($t0)
	sw $t5, 3080($t0)
	sw $t5, 3092($t0)
	jr $ra

draw_game_over:
	lw $t0, shipAddress
	li $a0, 500
	li $t1, RED # $t1 stores red
	li $t2, YELLOW # $t2 stores yellow
	li $t3, WHITE # $t3 stores white
	li $t4, BLACK # $t4 stores black
	li $t5, ORANGE # $t5 stores orange
	jal draw_explosion1
	jal pause
	jal draw_explosion2
	jal pause
	jal draw_explosion3
	li $t0, GAME_OVER
	li $t1, WHITE
	jal draw_G
	jal draw_A
	jal draw_M
	jal draw_E
	addi $t0, $t0, 8
	jal draw_O
	jal draw_V
	jal draw_E
	jal draw_R

game_over_check:
	# check kb input
	li $t9, 0xffff0000 # t9 = 1 if keypress
	lw $t8, 0($t9) 
	beq $t8, 1, game_over_check2 # if key was pressed, check to go back to welcome
	j game_over_check

game_over_check2:
	lw $t7, 4($t9) # t7 = keypress ascii code
	bne $t7, 0x70, game_over_check # if they don't press p, keep flickering
	j welcome

exit:
	li $v0, 10 # terminate the program gracefully
	syscall
