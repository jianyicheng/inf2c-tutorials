.globl func

func:

	addiu $sp, $sp, -8
	sw    $ra, 4($sp)
	sw    $zero, 0($sp)

	sll $a2, $a2, 2
	add $t1, $a0, $a2

loop:
	slt $t0, $a0, $t1
	beq $t0, $zero, done

	lw   $t2, 0($a0)
	sw   $t2, 0($a1)
	addi $a0, $a0, 4
	addi $a1, $a1, 4
	j    loop

done:

	lw    $ra, 4($sp)
	addiu $sp, $sp, 8
	jr    $ra
	nop
