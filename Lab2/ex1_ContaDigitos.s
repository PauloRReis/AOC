	.text
	.globl main
	
main:
	#Scan $v0 = n
	li $v0, 5
	syscall	
	beq $v0, $zero, end #se $v0 = 0 vai para encerra
	move $a0, $v0 #move o valor de $v0 para $a0
	#Scan $v1 = k
	li $v0, 5
	syscall
	move $a1, $v0 #move o valor de $v0 para $a1
	jal count_digit #vai para a funcao contador
	#Print
	li $v0, 1             # carrega o código da syscall para imprimir um inteiro
    	syscall
	
	j main

count_digit:
    addi $sp, $sp, -8      # faz espaço na pilha para armazenar os endereços de retorno
    sw $ra, 0($sp)         # armazena o endereço de retorno da chamada atual na pilha
    sw $s0, 4($sp)         # armazena o valor atual da contagem na pilha
    
    beq $a0, $zero, end    # se o número é zero, retorna 0 imediatamente
    
    div $a0, $a1           # divide o número pelo dígito k para obter o resto
    mfhi $t0               # armazena o resto da divisão em $t0
    
    beq $t0, $zero, zero   # se o resto é zero, pula para a soma de contagens
    
    addi $s0, $s0, 1       # incrementa a contagem atual
    j zero                 # pula para a soma de contagens
    
zero:
    sra $t1, $a0, 1        # desloca o número 1 bit para a direita, mantendo o bit de sinal
    sll $t1, $t1, 1        # desloca o número 1 bit para a esquerda, mantendo o bit de sinal
    sub $t1, $a0, $t1      # subtrai o dígito menos significativo do número
    jal count_digit        # chama a função recursivamente com o número menor
    lw $s1, 4($sp)         # carrega a contagem da chamada recursiva anterior em $s1
    add $s0, $s0, $s1      # soma a contagem atual com a contagem da chamada recursiva anterior
    
    lw $ra, 0($sp)         # restaura o endereço de retorno da chamada atual da pilha
    lw $s0, 4($sp)         # restaura o valor atual da contagem da pilha
    addi $sp, $sp, 8       # libera o espaço da pilha
    
    jr $ra                 # retorna ao chamador
    
end:
    li $v0, 0              # retorna 0 se o número é zero
    jr $ra                 # retorna ao chamador
