.data
#etiquetas
	num1: .asciiz "Ingrese el primer numero: \n"
	num2: .asciiz "Ingrese el segundo numero: \n"
	resultado: .asciiz "el mayor de los numeros es: \n"
.text

#pedir primer numero
li $v0,4
la $a0,num1
syscall
#se obtiene el numero 1
li $v0,5
syscall
#num1 se mueve a un registro
move $t0,$v0
#pedir segundo numero
li $v0,4
la $a0,num2
syscall
#se obtiene el numero 2
li $v0,5
syscall
#num1 se mueve a un registro
move $t1,$v0
#operacion de comparacion
slt $t2,$t0,$t1
bnez $t2,Else
li $v0,4
la $a0,resultado
syscall
#se muestra el resultado en pantalla
li $v0,1
move $a0,$t0
syscall
j Exit
Else:
li $v0,4
la $a0,resultado
syscall
#se muestra el resultado en pantalla
li $v0,1
move $a0,$t1
syscall
Exit:
li $v0,10
syscall