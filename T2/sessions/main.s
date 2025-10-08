.data

A:
	.word 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19

	.text
	.globl main

main:

	la  $a0, A
	li  $a1, 20
	jal print_array

	la   $a3, A        # $a0 = A
	addi $a0, $a3, 0   # $a0 = src
	addi $a1, $a3, 40  # $a1 = dst
	li   $a2, 5        # $a2 = size (5)

	jal func

	la  $a0, A
	li  $a1, 20
	jal print_array

	li $v0, 10
	syscall

