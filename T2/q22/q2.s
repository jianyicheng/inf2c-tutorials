.globl func

func:

	addiu $sp, $sp, -8
	sw    $ra, 4($sp)
	sw    $zero, 0($sp)

	sll $a2, $a2, 2 # words to bytes

	slt $t0, $a0, $a1 # check src and dst order
	beq $t0, $zero, src_high # (src < dst)?

	add  $t1, $a0, $a2 # backward operations
	addi $t1, $t1, -4 # -1 offset for all addresses
	add  $t2, $a1, $a2
	addi $t2, $t2, -4
	addi $t3, $a0, -4
	li   $t4, -4 # counter = -4
	j    loop

src_high:
	add $t1, $a0, $zero # normal forward operations
	add $t2, $a1, $zero
	add $t3, $a0, $a2
	li  $t4, 4

loop:
	beq $t3, $t1, end
	lw  $t5, 0($t1)
	sw  $t5, 0($t2)
	add $t1, $t1, $t4
	add $t2, $t2, $t4
	j   loop

end:
	lw    $ra, 4($sp)
	addiu $sp, $sp, 8
	jr    $ra
	nop
