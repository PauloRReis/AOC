	.data
pular_linha:
	.asciiz "\n"
	
	.text
	.globl main
	
main:
	#scan
	li $v0, 5
	syscall
	move $a0, $v0
	beq $a0, $zero, encerra
	#chama funcao
	jal soma_digito
	#print
	move $a0, $v0
	li $v0, 1
	syscall
	# pular linha
	la $a0, pular_linha 
	li $v0, 4
	syscall
	#faz o while
	j main

soma_digito:
	#salva contexto
	addi $sp, $sp, -8
	sw $ra, 4($sp)
	sw $s0, 0($sp)

	beq $a0, $zero, end_soma_digito
		
	li $t0, 10 #$t0 == 10
	div $a0, $t0 #divide $a0 por $t0
	mfhi $s0 #armazena o resto da divisao em $s0
	mflo $a0 #armazena o resto da divisao em $a0
	jal soma_digito
	#restaurar
	lw $s0, 0($sp)
	lw $ra, 4($sp)
	addi $sp, $sp, 8
	#soma
	add $v0, $v0, $s0
	jr $ra
	
end_soma_digito:
	ori $v0, $zero, 0
	jr $ra	
	
encerra:
	li $v0, 10
	syscall