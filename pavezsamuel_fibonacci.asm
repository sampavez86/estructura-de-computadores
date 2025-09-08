
.data
msg1:   .asciiz "¿cuántos numeros de la serie fibonacci quieres?: "
msg2:   .asciiz "\nSerie Fibonacci:\n"

.text
.globl main
main:

    # Pedir cantidad 
    li $v0, 4          # imprimir mensaje
    la $a0, msg1
    syscall

    li $v0, 5          # leer entero
    syscall
    move $t0, $v0      # $t0 = cantidad (n)

    # Imprimir encabezado 
    li $v0, 4
    la $a0, msg2
    syscall

    # Inicializar primeros valores
    li $t1, 0          # primer número (F0)
    li $t2, 1          # segundo número (F1)

    move $t3, $zero    # contador = 0

loop:
    # ¿contador >= n? -> salir
    bge $t3, $t0, end

    # Imprimir número actual (Fibonacci)
    move $a0, $t1
    li $v0, 1
    syscall

    # Imprimir espacio
    li $v0, 11
    li $a0, 32         # ASCII espacio
    syscall

    # Calcular siguiente número
    add $t4, $t1, $t2  # t4 = t1 + t2
    move $t1, $t2      # avanzar: t1 = t2
    move $t2, $t4      # avanzar: t2 = t4

    addi $t3, $t3, 1   # contador++
    j loop

end:
    li $v0, 10         # salir
    syscall
