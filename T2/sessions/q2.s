.globl func

func:

	addiu $sp, $sp, -8
	sw    $ra, 4($sp)
	sw    $zero, 0($sp)

	nop # Write function body here...

	lw    $ra, 4($sp)
	addiu $sp, $sp, 8
	jr    $ra
	nop
