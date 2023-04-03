	.text
	.globl main
	
main:
	#scan
	li, $v0, 5
	syscall
	move $a0, $v0
	
	jal base
	
	#print
	move $a0, $v0
	li $v0, 1
	syscall
	#encerra
	li $v0, 10
	syscall
	
base:
	bgt $a0, 1, fibonacci #se $a0 > 1 vai para fibonacci
	move $v0, $a0
	jr $ra

fibonacci:
	#salvar contexto
	addi $sp, $sp, -12
	sw $ra, 0($sp)
	
	sw $a0, 4($sp)
	add $a0, $a0, -1 #chamada recursiva de f(n-1)
	jal fibonacci
	lw $a0, 4($sp)
	sw $v0, 8($sp)
	
	add $a0, $a0, -2 #chamada recursiva de f(n-2)
	jal fibonacci
	
	lw $t0, 8($sp)
	add $v0, $t0, $v0 #soma tudo
	#restaurar 
	lw $ra, 0($sp)
	add $sp, $sp, 12
	jr $ra
	
	

