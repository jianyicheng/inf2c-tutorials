.data

A:
	.word 0, 1, 2, 3, 4, 5, 6, 7, 8, 9

B:
	.word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10

	.text
	.globl main

main:

	la $a0, A        # $a0 = &A[0]
	la $a1, B        # $a1 = &B[0]
	li $a2, 5        # $a2 = size = 5

	jal func

	la  $a0, B      # base address of B
	li  $a1, 10     # length = 10
	jal print_array # call function

	li $v0, 10
	syscall

