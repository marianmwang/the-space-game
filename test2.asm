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
	li $s3, 0
play_game:
	lw $a0, obstacleAddresses
	jal draw_obst1
	sw $v0, obstacleAddresses

	lw $a0, obstacleAddresses+4
	jal draw_obst2
	sw $v0, obstacleAddresses+4

	li $a0, DELAY # wait this many ms before updating
	jal pause
	j play_game

########## PAUSE (time specified in $a0)##########
pause:
	li $v0, 32
	syscall
	jr $ra
########## OBSTACLE FUNCTIONS ##########

draw_obst1: # fat and slow meteor
	li $t0, OBST1 # reset counter
	sb $t0, obstacleCtr1
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
	beqz $s3, repeat_drawing
	j update_obst1
repeat_drawing:
	li $s3, 1
	addi $v0, $a0, 0
	jr $ra
update_obst1:
	# increment obstacle address
	li $s3, 0
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
update_obst2_address:
	# increment obstacle address
	addi $a0, $a0, 512 # a0 = current obst address + 512 (next row)
	addi $v0, $a0, 0 # returns next obstacle address in v0
	jr $ra
exit:
	li $v0, 10 # terminate the program gracefully
	syscall