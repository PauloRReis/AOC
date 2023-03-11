	.text
	.globl main
main:
	li $s0, 1
	li $v0, 5 #funcao para scan
	syscall 
while:
	mul $s0, $s0, $v0 # $s0 = $s0 * $v0
	sub $v0, $v0, 1 # $v0 = $v0 - 1 
	bne $v0, $zero, while # se $v0 != 0 entao vai p/ while
print:
	la $a0, 0($s0) # $s0 colocado em $a0 para printar
	li $v0, 1 # funcao para print
	syscall
end:
	li $v0, 10
	syscall
