.data 
	opcion1: .asciiz "\t(1) Impares \n"
	opcion2: .asciiz "\t(2) Pares \n"
	nLine: .asciiz "\t"
	menu: .asciiz "Ingrese opcion: "
	n: .asciiz "Ingrese n: "
.text
.globl main
main:
	la $v0, 4
	la $a0, opcion1
	syscall
	la $v0, 4
	la $a0, opcion2
	syscall
	la $v0, 4
	la $a0, menu
	syscall

	la $v0, 5			#Recibo de teclado
	syscall
	move $t1, $v0			#t1 opcion 1Impar-2Par
	
	la $v0, 4
	la $a0, n
	syscall

	la $v0, 5
	syscall
	move $t2, $v0			#t2 n maximo
	
	li $t3, 1			#inicializo 1 para impares
	li $t4, 2			#inicializo 2 para pares
	
	beq $t1, 1, impar
	beq $t1, 2, par 
	
fin:
	la $v0, 10
	syscall

impar:
	la $v0, 1
	move $a0,$t3
	syscall
	
	la $v0, 4
	la $a0, nLine
	syscall
	
	add $t3, $t3, 2
	ble $t3, $t2, impar
	j fin
	
par: 
	la $v0, 1
	move $a0, $t4
	syscall	
	la $v0, 4
	la $a0, nLine
	syscall
	add $t4, $t4, 2
	ble $t4, $t2, par
	j fin

