.data 
	array: .space 40
	string: .asciiz" "
.text
.globl main
main:
	la $s0, array
	move $s1, $zero
L1:	sll $t0, $s1, 2
	add $t0, $t0, $s0
	li $v0, 5
	syscall
	sw $v0, 0($t0)
	addi $s1, $s1, 1
	ble $s1, 9, L1
	
	move $s2, $zero
L4:	addi $s3, $s2, 1
	sll $t0, $s2, 2
	add $t0, $t0, $s0
L3:	sll $t1, $s3, 2
	add $t1, $t1, $s0
	lw $t2, 0($t0)
	lw $t3, 0($t1)
	bge $t2, $t3, L2
	sw $t3, 0($t0)
	sw $t2, 0($t1)
L2: addi $s3, $s3, 1
	ble $s3, 9, L3
	addi $s2, $s2, 1
	ble $s2, 8, L4
	
	move $s1, $zero
L5: sll $t0, $s1, 2
	add $t0, $t0, $s0
	lw $a0, 0($t0)
	li $v0, 1
	syscall
	li $v0, 4
	la $a0, string
	syscall
	addi $s1, $s1, 1
	ble $s1, 9, L5
	