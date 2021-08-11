
########## CONSTANTS ##########
#  addresses
.eqv	DISPLAYADDRESS 	0x10008000

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
# moon colours
.eqv 	mBROWN		0x827717
.eqv 	mORANGE		0xffd64f
.eqv	mYELLOW		0xfff9c4
# moon address
.eqv	MOON_C1 	0x1000ac00
.eqv	MOON_C2 	0x1000a408
.eqv	MOON_C3 	0x10009c10
.eqv	MOON_C4 	0x10009818
.eqv	MOON_C5 	0x10009420
.eqv	MOON_C6 	0x10009028
.eqv	MOON_C7 	0x10008c30
.eqv	MOON_C8 	0x10008838
.eqv	MOON_C9 	0x10008440
.eqv	MOON_C10 	0x10008448
.eqv	MOON_C11 	0x10008450
.eqv	MOON_C12 	0x10008058
.eqv	MOON_C13 	0x10008060
.eqv	MOON_C14 	0x10008068
.eqv	MOON_C15 	0x10008070
.eqv	MOON_C16 	0x10008078
.eqv	MOON_C17	0x10008080
.eqv	MOON_C18	0x10008088
.eqv	MOON_C19	0x10008490
.eqv	MOON_C20	0x10008498
.eqv	MOON_C21	0x100084a0
.eqv	MOON_C22	0x100088a8
.eqv	MOON_C23	0x10008cb0
.eqv	MOON_C24	0x100090b8
.eqv	MOON_C25	0x100094c0
.eqv	MOON_C26	0x100098c8
.eqv	MOON_C27	0x10009cd0
.eqv	MOON_C28	0x1000a4d8
.eqv	MOON_C29	0x1000ace0
# witch address
.eqv	WITCHADDRESS 	0x10009c68
.text
draw_moon:
	li $t0, MOON_C1
	jal draw_moon_c1 # draw the column 1 of the moon
	
	li $t0, MOON_C2
	jal draw_moon_c2 # draw the column 2 of the moon
	
	li $t0, MOON_C3
	jal draw_moon_c3 # draw the column 3 of the moon
	
	li $t0, MOON_C4
	jal draw_moon_c4 # draw the column 4 of the moon
	
	li $t0, MOON_C5
	jal draw_moon_c5 # draw the column 5 of the moon	
	
	li $t0, MOON_C6
	jal draw_moon_c6 # draw the column 6 of the moon
	
	li $t0, MOON_C7
	jal draw_moon_c7 # draw the column 7 of the moon
	
	li $t0, MOON_C8
	jal draw_moon_c8 # draw the column 8 of the moon
	
	li $t0, MOON_C9
	jal draw_moon_c9 # draw the column 9 of the moon
	
	li $t0, MOON_C10
	jal draw_moon_c10 # draw the column 10 of the moon
	
	li $t0, MOON_C11
	jal draw_moon_c11 # draw the column 11 of the moon
	
	li $t0, MOON_C12
	jal draw_moon_c12 # draw the column 12 of the moon
	
	li $t0, MOON_C13
	jal draw_moon_c13 # draw the column 13 of the moon
	
	li $t0, MOON_C14
	jal draw_moon_c14 # draw the column 14 of the moon
	
	li $t0, MOON_C15
	jal draw_moon_c15 # draw the column 15 of the moon
	
	li $t0, MOON_C16
	jal draw_moon_c16 # draw the column 16 of the moon
	
	li $t0, MOON_C17
	jal draw_moon_c17 # draw the column 17 of the moon
	
	li $t0, MOON_C18
	jal draw_moon_c18 # draw the column 18 of the moon
	
	li $t0, MOON_C19
	jal draw_moon_c19 # draw the column 19 of the moon
	
	li $t0, MOON_C20
	jal draw_moon_c20 # draw the column 20 of the moon
	
	li $t0, MOON_C21
	jal draw_moon_c21 # draw the column 21 of the moon
	
	li $t0, MOON_C22
	jal draw_moon_c22 # draw the column 22 of the moon
	
	li $t0, MOON_C23
	jal draw_moon_c23 # draw the column 23 of the moon
	
	li $t0, MOON_C24
	jal draw_moon_c24 # draw the column 24 of the moon
	
	li $t0, MOON_C25
	jal draw_moon_c25 # draw the column 25 of the moon
	
	li $t0, MOON_C26
	jal draw_moon_c26 # draw the column 26 of the moon
	
	li $t0, MOON_C27
	jal draw_moon_c27 # draw the column 27 of the moon
	
	li $t0, MOON_C28
	jal draw_moon_c28 # draw the column 28 of the moon
	
	li $t0, MOON_C29
	jal draw_moon_c29 # draw the column 29 of the moon

draw_witch:
	li $t1, BLACK
	li $t0, WITCHADDRESS
	sw $t1, 36($t0)
	
	sw $t1, 544($t0)
	sw $t1, 548($t0)
	
	sw $t1, 1052($t0)
	sw $t1, 1056($t0)
	sw $t1, 1060($t0)
	
	sw $t1, 1552($t0)
	sw $t1, 1556($t0)
	sw $t1, 1560($t0)
	sw $t1, 1564($t0)
	sw $t1, 1568($t0)
	sw $t1, 1572($t0)
	
	sw $t1, 2068($t0)
	sw $t1, 2072($t0)
	sw $t1, 2076($t0)
	sw $t1, 2080($t0)
	sw $t1, 2084($t0)
	sw $t1, 2088($t0)
	sw $t1, 2092($t0)
	
	sw $t1, 2580($t0)
	sw $t1, 2584($t0)
	sw $t1, 2588($t0)
	sw $t1, 2592($t0)
	sw $t1, 2596($t0)
	sw $t1, 2600($t0)
	
	sw $t1, 3092($t0)
	sw $t1, 3096($t0)
	sw $t1, 3100($t0)
	sw $t1, 3104($t0)
	sw $t1, 3108($t0)
	sw $t1, 3112($t0)
	sw $t1, 3116($t0)
	sw $t1, 3120($t0)
	sw $t1, 3124($t0)
	sw $t1, 3128($t0)
	sw $t1, 3132($t0)
	
	sw $t1, 3612($t0)
	sw $t1, 3616($t0)
	sw $t1, 3620($t0)
	sw $t1, 3624($t0)
	sw $t1, 3628($t0)
	sw $t1, 3632($t0)
	sw $t1, 3636($t0)
	sw $t1, 3640($t0)
	sw $t1, 3644($t0)
	sw $t1, 3648($t0)
	
	sw $t1, 4108($t0)
	sw $t1, 4112($t0)
	sw $t1, 4116($t0)
	sw $t1, 4120($t0)
	sw $t1, 4124($t0)
	sw $t1, 4128($t0)
	sw $t1, 4132($t0)
	sw $t1, 4136($t0)
	sw $t1, 4140($t0)
	sw $t1, 4144($t0)
	sw $t1, 4148($t0)
	sw $t1, 4152($t0)
	sw $t1, 4156($t0)
	sw $t1, 4160($t0)
	sw $t1, 4164($t0)
	
	sw $t1, 4612($t0)
	sw $t1, 4616($t0)
	sw $t1, 4620($t0)
	sw $t1, 4624($t0)
	sw $t1, 4628($t0)
	sw $t1, 4632($t0)
	sw $t1, 4636($t0)
	sw $t1, 4640($t0)
	sw $t1, 4644($t0)
	sw $t1, 4648($t0)
	sw $t1, 4652($t0)
	sw $t1, 4660($t0)
	sw $t1, 4664($t0)
	sw $t1, 4668($t0)
	sw $t1, 4672($t0)
	sw $t1, 4676($t0)
	
	sw $t1, 5136($t0)
	sw $t1, 5140($t0)
	sw $t1, 5144($t0)
	sw $t1, 5152($t0)
	sw $t1, 5156($t0)
	sw $t1, 5160($t0)
	sw $t1, 5164($t0)
	sw $t1, 5168($t0)
	sw $t1, 5176($t0)
	sw $t1, 5180($t0)
	sw $t1, 5184($t0)
	sw $t1, 5188($t0)
	
	sw $t1, 5652($t0)
	sw $t1, 5660($t0)
	sw $t1, 5664($t0)
	sw $t1, 5668($t0)
	sw $t1, 5672($t0)
	sw $t1, 5676($t0)
	sw $t1, 5680($t0)
	sw $t1, 5688($t0)
	sw $t1, 5692($t0)
	sw $t1, 5696($t0)
	
	sw $t1, 6168($t0)
	sw $t1, 6172($t0)
	sw $t1, 6176($t0)
	sw $t1, 6180($t0)
	sw $t1, 6184($t0)
	sw $t1, 6188($t0)
	
	sw $t1, 6680($t0)
	sw $t1, 6684($t0)
	sw $t1, 6688($t0)
	sw $t1, 6692($t0)
	sw $t1, 6696($t0)
	sw $t1, 6700($t0)
	sw $t1, 6704($t0)
	sw $t1, 6708($t0)
	
	sw $t1, 7196($t0)
	sw $t1, 7200($t0)
	sw $t1, 7204($t0)
	sw $t1, 7208($t0)
	sw $t1, 7212($t0)
	sw $t1, 7216($t0)
	sw $t1, 7220($t0)
	sw $t1, 7224($t0)
	sw $t1, 7228($t0)
	sw $t1, 7232($t0)
	sw $t1, 7236($t0)
	sw $t1, 7240($t0)
	
	sw $t1, 7712($t0)
	sw $t1, 7716($t0)
	sw $t1, 7720($t0)
	sw $t1, 7724($t0)
	sw $t1, 7728($t0)
	sw $t1, 7732($t0)
	sw $t1, 7740($t0)
	sw $t1, 7744($t0)
	sw $t1, 7748($t0)
	sw $t1, 7752($t0)
	sw $t1, 7756($t0)
	
	sw $t1, 8228($t0)
	sw $t1, 8232($t0)
	sw $t1, 8236($t0)
	sw $t1, 8240($t0)
	sw $t1, 8256($t0)
	sw $t1, 8260($t0)
	
	sw $t1, 8748($t0)
	sw $t1, 8772($t0)
	sw $t1, 8776($t0)
	
	sw $t1, 9256($t0)
	sw $t1, 9260($t0)
	j exit
draw_moon_c1:
	addi $sp, $sp, -4 # push ra to stack
	sw $ra, 0($sp)
	
	li $t1, mBROWN
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	
	j go_back
draw_moon_c2:
	addi $sp, $sp, -4 # push ra to stack
	sw $ra, 0($sp)
	
	li $t1, mBROWN
	jal draw_square
	jal draw_square
	li $t1, mORANGE
	jal draw_square
	jal draw_square
	li $t1, mYELLOW
	jal draw_square
	jal draw_square
	jal draw_square
	li $t1, mORANGE
	jal draw_square
	li $t1, mBROWN
	jal draw_square
	jal draw_square
	
	j go_back
draw_moon_c3:
	addi $sp, $sp, -4 # push ra to stack
	sw $ra, 0($sp)
	
	li $t1, mBROWN
	jal draw_square
	jal draw_square
	li $t1, mORANGE
	jal draw_square
	jal draw_square
	jal draw_square
	li $t1, mYELLOW
	jal draw_square
	jal draw_square
	li $t1, mORANGE
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	li $t1, mYELLOW
	jal draw_square
	li $t1, mBROWN
	jal draw_square
	jal draw_square
	
	j go_back
draw_moon_c4:
	addi $sp, $sp, -4 # push ra to stack
	sw $ra, 0($sp)
	
	li $t1, mBROWN
	jal draw_square
	li $t1, mORANGE
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	li $t1, mYELLOW
	jal draw_square
	jal draw_square
	li $t1, mORANGE
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	li $t1, mYELLOW
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	li $t1, mBROWN
	jal draw_square
	
	j go_back
draw_moon_c5:
	addi $sp, $sp, -4 # push ra to stack
	sw $ra, 0($sp)
	
	li $t1, mBROWN
	jal draw_square
	li $t1, mORANGE
	jal draw_square
	jal draw_square
	li $t1, mYELLOW
	jal draw_square
	li $t1, mORANGE
	jal draw_square
	li $t1, mYELLOW
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	li $t1, mORANGE
	jal draw_square
	jal draw_square
	li $t1, mYELLOW
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	li $t1, mORANGE
	jal draw_square
	li $t1, mBROWN
	jal draw_square
	
	j go_back
draw_moon_c6:
	addi $sp, $sp, -4 # push ra to stack
	sw $ra, 0($sp)
	
	li $t1, mBROWN
	jal draw_square
	li $t1, mORANGE
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	li $t1, mYELLOW
	jal draw_square
	jal draw_square
	li $t1, mORANGE
	jal draw_square
	li $t1, mYELLOW
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	li $t1, mORANGE
	jal draw_square
	jal draw_square
	jal draw_square
	li $t1, mBROWN
	jal draw_square
	
	j go_back
draw_moon_c7:
	addi $sp, $sp, -4 # push ra to stack
	sw $ra, 0($sp)
	
	li $t1, mBROWN
	jal draw_square
	li $t1, mORANGE
	jal draw_square
	jal draw_square
	li $t1, mYELLOW
	jal draw_square
	li $t1, mORANGE
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	li $t1, mYELLOW
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	li $t1, mORANGE
	jal draw_square
	jal draw_square
	li $t1, mYELLOW
	li $t1, mORANGE
	jal draw_square
	jal draw_square
	jal draw_square
	li $t1, mBROWN
	jal draw_square
	
	j go_back
draw_moon_c8:
	addi $sp, $sp, -4 # push ra to stack
	sw $ra, 0($sp)
	
	li $t1, mBROWN
	jal draw_square
	li $t1, mYELLOW
	jal draw_square
	jal draw_square
	jal draw_square
	li $t1, mORANGE
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	li $t1, mYELLOW
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	li $t1, mORANGE
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	li $t1, mBROWN
	jal draw_square
	
	j go_back
draw_moon_c9:
	addi $sp, $sp, -4 # push ra to stack
	sw $ra, 0($sp)
	
	li $t1, mBROWN
	jal draw_square
	li $t1, mYELLOW
	jal draw_square
	jal draw_square
	li $t1, mORANGE
	jal draw_square
	jal draw_square
	li $t1, mYELLOW
	jal draw_square
	jal draw_square
	li $t1, mORANGE
	jal draw_square
	jal draw_square
	li $t1, mYELLOW
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	li $t1, mORANGE
	jal draw_square
	li $t1, mYELLOW
	jal draw_square
	li $t1, mORANGE
	jal draw_square
	jal draw_square
	jal draw_square
	li $t1, mYELLOW
	jal draw_square
	jal draw_square
	
	j go_back
draw_moon_c10:
	addi $sp, $sp, -4 # push ra to stack
	sw $ra, 0($sp)
	
	li $t1, mBROWN
	jal draw_square
	li $t1, mORANGE
	jal draw_square
	jal draw_square
	li $t1, mYELLOW
	jal draw_square
	li $t1, mORANGE
	jal draw_square
	li $t1, mYELLOW
	jal draw_square
	li $t1, mORANGE
	jal draw_square
	li $t1, mYELLOW
	jal draw_square
	li $t1, mORANGE
	jal draw_square
	jal draw_square
	li $t1, mYELLOW
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	li $t1, mORANGE
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	
	j go_back
draw_moon_c11:
	addi $sp, $sp, -4 # push ra to stack
	sw $ra, 0($sp)
	
	li $t1, mBROWN
	jal draw_square
	li $t1, mORANGE
	jal draw_square
	jal draw_square
	jal draw_square
	li $t1, mYELLOW
	jal draw_square
	li $t1, mORANGE
	jal draw_square
	jal draw_square
	li $t1, mYELLOW
	jal draw_square
	li $t1, mORANGE
	jal draw_square
	li $t1, mYELLOW
	jal draw_square
	li $t1, mORANGE
	jal draw_square
	jal draw_square
	li $t1, mYELLOW
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	li $t1, mORANGE
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	li $t1, mYELLOW
	jal draw_square
	
	j go_back
draw_moon_c12:
	addi $sp, $sp, -4 # push ra to stack
	sw $ra, 0($sp)
	
	li $t1, mBROWN
	jal draw_square
	li $t1, mORANGE
	jal draw_square
	li $t1, mYELLOW
	jal draw_square
	li $t1, mORANGE
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	li $t1, mYELLOW
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	li $t1, mORANGE
	jal draw_square
	jal draw_square
	li $t1, mYELLOW
	jal draw_square
	jal draw_square
	jal draw_square
	
	j go_back
draw_moon_c13:
	addi $sp, $sp, -4 # push ra to stack
	sw $ra, 0($sp)
	
	li $t1, mBROWN
	jal draw_square
	li $t1, mYELLOW
	jal draw_square
	li $t1, mORANGE
	jal draw_square
	jal draw_square
	jal draw_square
	li $t1, mYELLOW
	jal draw_square
	jal draw_square
	li $t1, mORANGE
	jal draw_square
	li $t1, mYELLOW
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	li $t1, mORANGE
	jal draw_square
	jal draw_square
	li $t1, mYELLOW
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	
	j go_back
draw_moon_c14:
	addi $sp, $sp, -4 # push ra to stack
	sw $ra, 0($sp)
	
	li $t1, mBROWN
	jal draw_square
	li $t1, mORANGE
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	li $t1, mYELLOW
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	li $t1, mORANGE
	jal draw_square
	jal draw_square
	li $t1, mYELLOW
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	
	j go_back
draw_moon_c15:
	addi $sp, $sp, -4 # push ra to stack
	sw $ra, 0($sp)
	
	li $t1, mBROWN
	jal draw_square
	li $t1, mORANGE
	jal draw_square
	li $t1, mYELLOW
	jal draw_square
	jal draw_square
	li $t1, mORANGE
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	li $t1, mYELLOW
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	li $t1, mORANGE
	jal draw_square
	jal draw_square
	jal draw_square
	li $t1, mYELLOW
	jal draw_square
	li $t1, mORANGE
	jal draw_square
	li $t1, mYELLOW
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	
	j go_back
draw_moon_c16:
	addi $sp, $sp, -4 # push ra to stack
	sw $ra, 0($sp)
	
	li $t1, mBROWN
	jal draw_square
	li $t1, mORANGE
	jal draw_square
	li $t1, mYELLOW
	jal draw_square
	jal draw_square
	jal draw_square
	li $t1, mORANGE
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	li $t1, mYELLOW
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	li $t1, mORANGE
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	li $t1, mYELLOW
	jal draw_square
	li $t1, mORANGE
	jal draw_square
	li $t1, mYELLOW
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	
	j go_back
draw_moon_c17:
	addi $sp, $sp, -4 # push ra to stack
	sw $ra, 0($sp)
	
	li $t1, mBROWN
	jal draw_square
	li $t1, mYELLOW
	jal draw_square
	jal draw_square
	jal draw_square
	li $t1, mORANGE
	jal draw_square
	jal draw_square
	li $t1, mYELLOW
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	li $t1, mORANGE
	jal draw_square
	jal draw_square
	li $t1, mYELLOW
	jal draw_square
	li $t1, mORANGE
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	li $t1, mYELLOW
	jal draw_square
	jal draw_square
	li $t1, mORANGE
	jal draw_square
	li $t1, mYELLOW
	jal draw_square
	jal draw_square
	jal draw_square
	
	j go_back
draw_moon_c18:
	addi $sp, $sp, -4 # push ra to stack
	sw $ra, 0($sp)
	
	li $t1, mBROWN
	jal draw_square
	li $t1, mYELLOW
	jal draw_square
	li $t1, mORANGE
	jal draw_square
	li $t1, mYELLOW
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	li $t1, mORANGE
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	li $t1, mYELLOW
	jal draw_square
	li $t1, mORANGE
	jal draw_square
	jal draw_square
	li $t1, mYELLOW
	jal draw_square
	jal draw_square
	jal draw_square
	
	j go_back
draw_moon_c19:
	addi $sp, $sp, -4 # push ra to stack
	sw $ra, 0($sp)
	
	li $t1, mBROWN
	jal draw_square
	li $t1, mORANGE
	jal draw_square
	li $t1, mYELLOW
	jal draw_square
	li $t1, mORANGE
	jal draw_square
	li $t1, mYELLOW
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	li $t1, mORANGE
	jal draw_square
	li $t1, mYELLOW
	jal draw_square
	li $t1, mORANGE
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	li $t1, mYELLOW
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	
	j go_back
draw_moon_c20:
	addi $sp, $sp, -4 # push ra to stack
	sw $ra, 0($sp)
	
	li $t1, mBROWN
	jal draw_square
	li $t1, mYELLOW
	jal draw_square
	jal draw_square
	jal draw_square
	li $t1, mORANGE
	jal draw_square
	jal draw_square
	li $t1, mYELLOW
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	li $t1, mORANGE
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	li $t1, mYELLOW
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	
	j go_back
draw_moon_c21:
	addi $sp, $sp, -4 # push ra to stack
	sw $ra, 0($sp)
	
	li $t1, mBROWN
	jal draw_square
	li $t1, mYELLOW
	jal draw_square
	jal draw_square
	li $t1, mORANGE
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	li $t1, mYELLOW
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	li $t1, mORANGE
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	li $t1, mYELLOW
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	li $t1, mBROWN
	jal draw_square
	
	j go_back
draw_moon_c22:
	addi $sp, $sp, -4 # push ra to stack
	sw $ra, 0($sp)
	
	li $t1, mBROWN
	jal draw_square
	li $t1, mYELLOW
	jal draw_square
	li $t1, mORANGE
	jal draw_square
	li $t1, mYELLOW
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	li $t1, mORANGE
	jal draw_square
	jal draw_square
	jal draw_square
	li $t1, mYELLOW
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	li $t1, mBROWN
	jal draw_square
	
	j go_back
draw_moon_c23:
	addi $sp, $sp, -4 # push ra to stack
	sw $ra, 0($sp)
	
	li $t1, mBROWN
	jal draw_square
	li $t1, mYELLOW
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	li $t1, mORANGE
	jal draw_square
	jal draw_square
	jal draw_square
	li $t1, mYELLOW
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	li $t1, mORANGE
	jal draw_square
	li $t1, mBROWN
	jal draw_square
	
	j go_back
draw_moon_c24:
	addi $sp, $sp, -4 # push ra to stack
	sw $ra, 0($sp)
	
	li $t1, mBROWN
	jal draw_square
	li $t1, mORANGE
	jal draw_square
	jal draw_square
	li $t1, mYELLOW
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	li $t1, mORANGE
	jal draw_square
	li $t1, mYELLOW
	jal draw_square
	li $t1, mORANGE
	jal draw_square
	li $t1, mYELLOW
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	li $t1, mORANGE
	jal draw_square
	jal draw_square
	li $t1, mBROWN
	jal draw_square
	
	j go_back
draw_moon_c25:
	addi $sp, $sp, -4 # push ra to stack
	sw $ra, 0($sp)
	
	li $t1, mBROWN
	jal draw_square
	li $t1, mYELLOW
	jal draw_square
	jal draw_square
	li $t1, mORANGE
	jal draw_square
	li $t1, mYELLOW
	jal draw_square
	jal draw_square
	li $t1, mORANGE
	jal draw_square
	jal draw_square
	li $t1, mYELLOW
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	li $t1, mORANGE
	jal draw_square
	jal draw_square
	jal draw_square
	li $t1, mBROWN
	jal draw_square
	
	j go_back
draw_moon_c26:
	addi $sp, $sp, -4 # push ra to stack
	sw $ra, 0($sp)
	
	li $t1, mBROWN
	jal draw_square
	li $t1, mYELLOW
	jal draw_square
	li $t1, mORANGE
	jal draw_square
	li $t1, mYELLOW
	jal draw_square
	jal draw_square
	li $t1, mORANGE
	jal draw_square
	li $t1, mYELLOW
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	li $t1, mORANGE
	jal draw_square
	li $t1, mBROWN
	jal draw_square
	
	j go_back
draw_moon_c27:
	addi $sp, $sp, -4 # push ra to stack
	sw $ra, 0($sp)
	
	li $t1, mBROWN
	jal draw_square
	jal draw_square
	li $t1, mORANGE
	jal draw_square
	jal draw_square
	li $t1, mYELLOW
	jal draw_square
	jal draw_square
	li $t1, mORANGE
	jal draw_square
	li $t1, mYELLOW
	jal draw_square
	li $t1, mORANGE
	jal draw_square
	jal draw_square
	li $t1, mYELLOW
	jal draw_square
	li $t1, mBROWN
	jal draw_square
	jal draw_square
	
	j go_back
draw_moon_c28:
	addi $sp, $sp, -4 # push ra to stack
	sw $ra, 0($sp)
	
	li $t1, mBROWN
	jal draw_square
	jal draw_square
	li $t1, mYELLOW
	jal draw_square
	jal draw_square
	jal draw_square
	li $t1, mORANGE
	jal draw_square
	jal draw_square
	li $t1, mBROWN
	jal draw_square
	jal draw_square
	
	j go_back
draw_moon_c29:
	addi $sp, $sp, -4 # push ra to stack
	sw $ra, 0($sp)
	
	li $t1, mBROWN
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	jal draw_square
	
	j go_back
draw_square:	# draw 2x2 square
	sw $t1, 0($t0)
	sw $t1, 4($t0)
	sw $t1, 512($t0)
	sw $t1, 516($t0)
	addi $t0, $t0, 1024
	jr $ra
go_back:
	lw $ra, 0($sp) # pop from stack
	addi $sp, $sp, 4
	jr $ra
exit:
	li $v0, 10 # terminate the program gracefully
	syscall
