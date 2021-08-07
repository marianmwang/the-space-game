########## CONSTANTS ##########
	#  addresses
.eqv	DISPLAYADDRESS 	0x10008000
.eqv 	DELAY		500 # how long before next frame update

.eqv	RED 		0xf44336
.eqv	YELLOW		0xffc107
.eqv 	WHITE 		0xffffff
.eqv 	BLACK 		0x000000
.eqv	ORANGE		0xff9800	# new colour

.text
	li $a0, DELAY # wait this many ms before updating
	li $t0, DISPLAYADDRESS # $t0 stores the base address for display
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
	jal pause
	jal draw_explosion4
	jal pause
	jal erase_explosion	# erase explosion
	j exit
########## PAUSE (time specified in $a0)##########
pause:
	li $v0, 32
	syscall
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
draw_explosion4:
	sw $t1, 1048($t0)
	sw $t1, 1552($t0)
	sw $t1, 1556($t0)
	sw $t1, 2060($t0)
	sw $t1, 2072($t0)
	sw $t1, 2572($t0)
	sw $t1, 3088($t0)
	
	sw $t2, 2064($t0)
	
	sw $t3, 2580($t0)
	
	sw $t5, 1032($t0)
	sw $t5, 3612($t0)
	
	sw $t4, 0($t0)
	sw $t4, 8($t0)
	sw $t4, 16($t0)
	sw $t4, 20($t0)
	sw $t4, 28($t0)
	sw $t4, 516($t0)
	sw $t4, 536($t0)
	sw $t4, 1024($t0)
	sw $t4, 1052($t0)
	sw $t4, 1564($t0)
	sw $t4, 2048($t0)
	sw $t4, 2076($t0)
	sw $t4, 2560($t0)
	sw $t4, 2588($t0)
	sw $t4, 3076($t0)
	sw $t4, 3096($t0)
	sw $t4, 3584($t0)
	sw $t4, 3592($t0)
	sw $t4, 3600($t0)
	sw $t4, 3604($t0)
	sw $t4, 524($t0)
	sw $t4, 528($t0)
	sw $t4, 1040($t0)
	sw $t4, 1044($t0)
	sw $t4, 1540($t0)
	sw $t4, 1560($t0)
	sw $t4, 2052($t0)
	sw $t4, 2056($t0)
	sw $t4, 2568($t0)
	sw $t4, 3084($t0)
	sw $t4, 532($t0)
	sw $t4, 2564($t0)
	sw $t4, 3080($t0)
	jr $ra
erase_explosion:
	sw $t4, 12($t0)
	sw $t4, 520($t0)
	sw $t4, 1028($t0)
	sw $t4, 1036($t0)
	sw $t4, 1048($t0)
	sw $t4, 1552($t0)
	sw $t4, 1536($t0)
	sw $t4, 1544($t0)
	sw $t4, 1548($t0)
	sw $t4, 1556($t0)
	sw $t4, 2060($t0)
	sw $t4, 2068($t0)
	sw $t4, 2072($t0)
	sw $t4, 2572($t0)
	sw $t4, 2576($t0)
	sw $t4, 2584($t0)
	sw $t4, 3088($t0)
	sw $t4, 3092($t0)
	sw $t4, 3596($t0)
	sw $t4, 2064($t0)
	sw $t4, 2580($t0)
	sw $t4, 1032($t0)
	sw $t4, 3612($t0)
	jr $ra
exit:
	li $v0, 10 # terminate the program gracefully
	syscall