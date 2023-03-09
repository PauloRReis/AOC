	.text
	.globl main
main:
	li $s0, 1
	li $v0, 5
	syscall 
while:
	mul $s0, $s0, $v0 # $s0 = $s0 * $s1
	subi $v0, $v0, 1 # $s1 = $s1 - 1
	bnez $v0, while # se $s1 != 0 entao v� p/ while
print:
	la $a0, 0($s0) # $s0 colocado em $a0 para printar
	li $v0, 1 # fun��o para print
	syscall
end:
	li $v0, 10
	syscall
