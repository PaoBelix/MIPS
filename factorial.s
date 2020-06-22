.data   
	numero:     .asciiz "Introduzca un número: \n"   
	resultado: .asciiz "El factorial es: \n"
.globl main # Main como Goblal
.text
main:	
	#leo el numero
	li $v0, 4    
	la $a0, numero 
	syscall   
	    
	#leo el numero desde el teclado
 	li $v0, 5     
 	syscall
 	move $a0, $v0
	#se llama a la funcion factorial
 	jal factorial 
 	move $t0, $v0
	#mostrar el resultado
 	li $v0, 4    
 	la $a0, resultado 
 	syscall     
	# Llamada al sistema para mostrar el resultado
 	move $a0, $t0  
 	li $v0, 1 
 	syscall
	#finalizar la ejecución
 	li $v0, 10   
 	syscall
factorial:
	beqz $a0, SiEsCero
 	addi $sp, $sp, -4 
 	sw $ra, ($sp) 
 	addi $sp, $sp, -4 
 	sw $a0, ($sp)
	# $a0 = n-1
 	addi $a0, $a0, -1 
 	jal factorial
    	# factorial n-1
 	lw $a0, ($sp)
 	addi $sp, $sp, 4
 	lw $ra, ($sp)
 	addi $sp, $sp, 4
	# n*(n-1)!
 	mult $a0, $v0  
 	mflo $v0 
 	jr $ra
 SiEsCero:
 	li $v0, 1 
 	jr $ra
