	.text
	.globl main
	
main:
	#scan
	li $v0, 5
	syscall
	move $a0, $v0
	#vai p/ funcao
	jal base
	#print
	move $a0, $v0
	li $v0, 1
	syscall
	#encerra
	li $v0, 10
	syscall
	
base:	
	bgt $a0, 1, fib #caso base: $a0 > 1 vai p/ fib
	move $v0, $a0
	jr $ra
	
fib:	
	#salva contexto
	addi $sp, $sp, -12
	sw $ra, 0($sp)
	sw $a0, 4($sp)
	
	addi $a0, $a0, -1 # f(n-1)
	jal base
	sw $v0, 8($sp)
	
	lw $a0, 4($sp)
	addi $a0, $a0, -2 # f(n-2)
	jal base
	
	lw $t0, 8($sp)
	add $v0, $v0, $t0 # somas
	# restaurar
	lw $ra, 0($sp)
	lw $a0, 4($sp)
	lw $v0, 8($sp)
	addi $sp, $sp, 12
	jr $ra

