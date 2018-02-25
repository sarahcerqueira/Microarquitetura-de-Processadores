.data
.global _start
.equ display_0, 0x3010
.equ display_1, 0x3020
.equ botao, 0x3030
.equ dips, 0x3000
.text

_start:
	addi r13, r0,0b00111111
	addi r14, r0,0b00000110
	addi r15, r0,0b01011011
	addi r16, r0,0b01001111
	addi r17, r0,0b01100110
	addi r18, r0,0b01101101	
	addi r19, r0,0b01111101
	addi r20, r0,0b00000111
	addi r21, r0,0b01111111
	addi r22, r0,0b01101111

	addi r8,r0, 2
	addi r3,r0, 100
	add r4,r0, r8	
	add r5,r0, r8 				
	div r7,r4, r8

	addi r2,r0, dips
	#addi r3,r0, display_0
	#addi r9,r0,display_1
	addi r12,r0, botao

loop:
	ldwio r11, 0(r12)
	beq r11, r0, loop
	ldwio r11, 0(r2)
	bne r11, r0, count
	br verifica_se_primo

count:
	addi r11, r0, 25
	br verifica_se_primo

verifica_se_primo:
	beq r4, r8, impressao
	div r6,r4,r5		#Pega o quociente da divisao
	mul r6,r6,r5			#Multiplica o quociente da divisão pelo r5
	sub r6,r4,r6		#Subtrai o r4 pela multiplicação do quociente pelo r5, para pega o valor do r6
	bne r6,r0, atualiza_divisor		#Se o r6 for diferente de 0 atualiza o r5
	br atualizar_dividendo			#O número não é primo, atualiza do r4
	
atualiza_divisor:
	addi r5, r5, 1				#Aumenta dividor
	bgt r7, r5, verifica_se_primo		#Verifica se o r5 é menor ou igual a metade do r4
	br impressao

atualizar_dividendo:
	stwio r20, 0(r9)
	addi r4,r4, 1				#Diminui o r4
	add r5,r0, r8					#Reseta o r5
	div r7, r4,r8			#Atualiza a metade do r4
	bge r4, r3, end
	br verifica_se_primo
	
impressao:
	addi r2, r0, 10
	div r1, r4, r2
	addi r9, r0, display_1
	call selecao

	mul r1,r1,r2
	sub r1, r4, r1
	addi r9, r0, display_0	
	call selecao

	addi r10, r0, 0xfa
	slli r10, r10, 16
	br fornada

selecao:
	beq r1,r0, zero
	addi r23, r0, 1
	beq r1, r23, um
	addi r23, r0, 2
	beq r1, r23, dois
	addi r23, r0, 3
	beq r1, r23, tres
	addi r23, r0, 4
	beq r1, r23, quatro
	addi r23, r0, 5
	beq r1, r23, cinco
	addi r23, r0, 6
	beq r1, r23, seis
	addi r23, r0, 7
	beq r1, r23, sete
	addi r23, r0, 8
	beq r1, r23, oito
	addi r23, r0, 9
	beq r1, r23, nove

	
fornada:
	subi r10, r10, 1
	bne r0, r10, fornada
	br atualizar_dividendo

zero:
	stwio r13, 0(r9)
	ret

um:
	stwio r14, 0(r9)
	ret

dois:
	stwio r15, 0(r9)
	ret

tres:
	stwio r16, 0(r9)
	ret

quatro:
	stwio r17, 0(r9)
	ret

cinco:
	stwio r18, 0(r9)
	ret

seis:
	stwio r19, 0(r9)
	ret

sete:
	stwio r20, 0(r9)
	ret

oito:
	stwio r21, 0(r9)
	ret

nove:
	stwio r22, 0(r9)
	ret

end:
.end