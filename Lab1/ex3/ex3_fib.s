	.text
	.globl main
	
main:
	li $t0, 1 #contador
	li $t1, 1 #fib(0)
	li $t2, 1 #fib(1)
	li $t3, 0 #fibonacci
	li $v0, 5 # funcao scan
	syscall
	beq $v0, $zero, print_fib1e0
	beq $v0, 1, print_fib1e0
fibonacci:
	beq $t0, $v0, print
	add $t3, $t1, $t2 # aux = a + b
	move $t1, $t2 # a = b
	move $t2, $t3 # b = aux
	add $t0, $t0, 1
	j fibonacci
print_fib1e0:
	la $a0, 1 # printa fib
	li $v0, 1
	syscall
	j end
print:
	la $a0, 0($t3) # printa fib
	li $v0, 1
	syscall
end:
	li $v0, 10
	syscall
