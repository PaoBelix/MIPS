.data

texto: .asciiz "Ingrese sumando: "
nd: .asciiz "\n No desborda "
d: .asciiz "\n Desborda"
NewLine: .asciiz " "


.globl main
.text

main:

	li   $v0, 4                 
	la   $a0, texto             #Inputs string
	syscall                     #Execution of string
	
	li   $v0, 5                 #Input number from user
	syscall
	move $t1, $v0 
 
	li   $v0, 4                 
	la   $a0, texto             #Inputs string
	syscall                     #Execution of string
	li   $v0, 5                 #Input number from user
	syscall
	move $t2, $v0              
                       
	addu	$t0, $t1,   $t2				# $t0 = suma, pero sin detectar 
	move 	$a0, $t0  
 	li 	$v0, 1 
 	syscall
	xor 	$t3, $t1,   $t2				# comprueba si los signos son distintos
	slt 	$t3, $t3,   $zero			# $t3 = 1 si los signos difierentes 
							# t3=0 iguales
	bne 	$t3, $zero, Desbordamiento	        # los signos de $t1 y $t2 ?, no hay desbordamiento
	li   	$v0, 4                 
	la   	$a0, d             			#Inputs string
	syscall 
	li   	$v0, 10                 	        #Terminates running of program, boom we are done.

	syscall 
     	
 	
Desbordamiento:
li   $v0, 4                 
la   $a0, nd             #Inputs string
syscall 
li   $v0, 10                 #Terminates running of program, boom we are done.
syscall 

