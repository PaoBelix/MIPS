

.data
#etiquetas
	num1: .asciiz "Ingrese un numero: \n"
	sum: .asciiz "\n Suma de Factores \t"
	resultado: .asciiz "Numeros Amigos \n"
	tab: .asciiz "\t"
	V: .space 20
	suma: .space 4
	
.text
#pedir primer numero
	li $v0,4
	la $a0,num1
	syscall

	li $v0,5
	syscall
	move $t0,$v0				#num1 en t0
	
	li $v0,4
	la $a0,num1
	syscall

	li $v0,5
	syscall
	move $t1,$v0				#num2 en t1

	la $t3,0
	li $t4,0				#Suma
	li $t5,0				#Suma2
	b  es_divisor


es_divisor:
	add	$t3,$t3,1					#incremento el numero para dividir
	rem 	$t1, $t0, $t3					#resto en t1
	beqz 	$t1, imprimir					#t1=0 entonces es un divisor
	bne	$t0,$t3,es_divisor	

imprimir:
	beq	$t0,$t3,sDivisor					#si el numero es igual al divisor se termina
	la 	$v0, 1						#imprimo el factor
	move 	$a0,$t3
	syscall	
	
	#Suma de factores
	add	$t4,$t4,$t3					#sumo los factores
	
	li 	$v0,4						
	la 	$a0,tab
	syscall	
		
	#parte del imprimir
	beq	$t0,$t3,sDivisor 					#si el numero es igual al divisor se termina sino es_divisor vontinua
	bne	$t0,$t3,es_divisor

sDivisor:
	li 	$t3,0
	add	$t3,$t3,1					#incremento el numero para dividir
	rem 	$t1, $t1, $t3					#resto en t1
	beqz 	$t1, imprimir1					#t1=0 entonces es un divisor
	bne	$t1,$t3,sDivisor	

imprimir1:
	beq	$t1,$t3,fin					#si el numero es igual al divisor se termina
	la 	$v0, 1						#imprimo el factor
	move 	$a0,$t3
	syscall	
	
	#Suma de factores
	add	$t5,$t5,$t3					#sumo los factores
	
	li 	$v0,4						
	la 	$a0,tab
	syscall	
		
	#parte del imprimir
	beq	$t1,$t3,fin 					#si el numero es igual al divisor se termina sino es_divisor vontinua
	bne	$t1,$t3,sDivisor
		
fin:
	li $v0,4
	la $a0,sum
	syscall
	
	la 	$v0, 1
	move 	$a0,$t4						#imprime la suma de los primeros
	syscall	
	
	la $v0, 10
	syscall
