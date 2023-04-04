	.data
pular_linha:
	.asciiz "\n"
	
	.text
	.globl main
	
main:
	li $s0, 0 # contador
	#scan
	li $v0, 5 
	syscall
	move $a0, $v0 #a0 == n
	#condicao de parada do usuario digitar 0
	beq $a0, $zero, encerra
	#scan
	li $v0, 5
	syscall
	move $a1, $v0 #a1 == k
	#chama a funcao
	jal conta_digito
	#print
	move $a0, $s0
	li $v0, 1
	syscall
	#pular linha
	la $a0, pular_linha
	li $v0, 4
	syscall
	#continua o loop
	j main

conta_digito:
	beq $a0, $zero, restaurar

	#salvar contexto
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $a0, 4($sp)
	
	li $t0, 10
	div $a0, $t0
	mflo $a0
	mfhi $t1
	beq $t1, $a1, contador
	
	jal conta_digito

restaurar:
	lw $ra, 0($sp)
	lw $a0, 4($sp)
	addi $sp, $sp, 8
	
	jr $ra
	
contador:
	add $s0, $s0, 1
	
	j conta_digito
	
encerra:
	li $v0, 10
	syscall
	