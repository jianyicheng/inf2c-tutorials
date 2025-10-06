.globl print_array

print_array:
	addiu $sp, $sp, -8       # make stack frame
	sw    $ra, 4($sp)
	sw    $s0, 0($sp)        # save callee-saved reg

	move $s0, $a0           # $s0 = base address
	move $t0, $zero         # i = 0

print_loop:
	bge $t0, $a1, print_done   # if i >= len, exit

	sll  $t1, $t0, 2        # t1 = i * 4
	addu $t2, $s0, $t1      # t2 = &arr[i]
	lw   $a0, 0($t2)        # load arr[i] into $a0

	li $v0, 1
	syscall

	li $v0, 11
	li $a0, 32            # ASCII ' '
	syscall

	addiu $t0, $t0, 1        # i++

	j print_loop
	nop

print_done:
	li $v0, 11
	li $a0, 10            # ASCII '\n'
	syscall

	lw    $s0, 0($sp)
	lw    $ra, 4($sp)
	addiu $sp, $sp, 8
	jr    $ra
	nop
