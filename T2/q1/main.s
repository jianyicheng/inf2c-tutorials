.data

A:
	.word 0, 1, 2, 3, 4, 5, 6, 7, 8, 9

B:
	.word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10

	.text
	.globl main

main:

	la $s2, A              # $s2 = &A[0]
	la $s3, B              # $s3 = &B[0]

	li $s0, 2              # x = 2
	li $s1, 3              # y = 3

	jal func

	la  $a0, B      # base address of B
	li  $a1, 10     # length = 10
	jal print_array # call function

	li $v0, 10
	syscall

