	.text
	.globl main
main:
	li $s1, 9 # atribuição: $s1 = 9 e $s0 = 1
	li $s0, 1 
while:
	mul $s0, $s0, $s1 # $s0 = $s0 * $s1
	subi $s1, $s1, 1 # $s1 = $s1 - 1
	bnez $s1, while # se $s1 != 0 entao vá p/ while
end:
	la $a0, 0($s0) # $s0 colocado em $a0 para printar
	li $v0, 1 # função para print
	syscall
	li $v0, 10
	syscall