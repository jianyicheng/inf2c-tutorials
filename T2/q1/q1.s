.globl func

func:

	addiu $sp, $sp, -8
	sw    $ra, 4($sp)
	sw    $zero, 0($sp)

	sll  $t0, $s0, 2
	add  $t0, $s2, $t0
	sll  $t1, $s1, 2
	add  $t1, $s3, $t1
	lw   $s0, 0($t0)
	addi $t2, $t0, 4
	lw   $t0, 0($t2)
	add  $t0, $t0, $s0
	sw   $t0, 0($t1)

	lw    $ra, 4($sp)
	addiu $sp, $sp, 8
	jr    $ra
	nop
