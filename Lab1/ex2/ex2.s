	.data
pular_linha:
	.asciiz "\n"
mensagem_erro:
	.asciiz "ERRO"
		
	.text
	.globl main
	
main:
	li $t0, -1 # quesito de parada
	li $t1, 0 # somador
	li $t2, 0 # contagem numeros
while:
	li $v0, 5 #funcao para scan
	syscall
	beq $v0, $t0, media # se $v0 == -1 entao vai p/ print
	add $t2, $t2, 1 #$t2 = $t2 + 1
	add $t1, $t1, $v0 # $t1 = $t1 + $v0
	j while
media:
	beq $t2, $zero, erro # se $t2 == 0 entao vai p/ erro
	div $t3, $t1, $t2
print:
	la $a0, 0($t1) # printa somador
	li $v0, 1
	syscall
	la $a0, pular_linha # pular linha
	li $v0, 4
	syscall
	la $a0, 0($t3) # printa media
	li $v0, 1
	syscall
	j end
erro:
	la $a0, 0($t1) # printa somador
	li $v0, 1
	syscall
	la $a0, pular_linha # pular linha
	li $v0, 4
	syscall
	la $a0, mensagem_erro # pular linha
	li $v0, 4
	syscall
end:
	li $v0, 10
	syscall
