	.text
	.globl main
	
main:
	li $v0, 5
	syscall
	move $a0, $v0
	
	jal sum
	
	move $a0, $v0
	li $v0, 1
	syscall
	
	li $v0, 10
	syscall
	
sum:	
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $a0, 4($sp)
	
	beq $a0, $zero, return
	
	move $v0, $a0
	addi $a0, $v0, -1
	jal sum
	
	
	lw $ra, 0($sp)
	lw $a0, 4($sp)
	addi $sp, $sp, 8
	
	add $v0, $v0, $a0
	jr $ra 
	
return:
	li $v0, 0
	jr $ra