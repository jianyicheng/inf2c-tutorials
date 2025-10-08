.globl func

func:

	addiu $sp, $sp, -8
	sw    $ra, 4($sp)
	sw    $zero, 0($sp)

	sll $a2, $a2, 2 # words to bytes
	add $t1, $a0, $a2 # end address

loop:
	slt $t0, $a0, $t1 # (i < end address)?
	beq $t0, $zero, done # exit if true

	lw   $t2, 0($a0) # load
	sw   $t2, 0($a1) # store
	addi $a0, $a0, 4 # i++
	addi $a1, $a1, 4 # j++
	j    loop

done:

	lw    $ra, 4($sp)
	addiu $sp, $sp, 8
	jr    $ra
	nop
