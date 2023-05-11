	.text
	.globl main
	
main:
	#scan
	li $v0, 5
	syscall
	move $a0, $v0
	#vai p/ funcao
	jal fib
	#print
	move $a0, $v0
	li $v0, 1
	syscall
	#encerra
	li $v0, 10
	syscall
	
fib:	
	#salva contexto
	addi $sp, $sp, -12
	sw $ra, 0($sp)
	sw $a0, 4($sp)
	
	beq $a0, $zero, caso_0
	beq $a0, 1, caso_1
	
	addi $a0, $a0, -1 # f(n-1)
	jal fib
	sw $v0, 8($sp)
	move $v0, $a0
	
	lw $a0, 4($sp)
	addi $a0, $a0, -2 # f(n-2)
	jal fib
	
	lw $t0, 8($sp)
	add $v0, $v0, $t0 # somas
	# restaurar
	lw $ra, 0($sp)
	lw $a0, 4($sp)
	lw $v0, 8($sp)
	addi $sp, $sp, 12
	jr $ra

caso_0:
	li $a0, 1
	jr $ra
	
caso_1:
	li $a0, 1
	jr $ra
