.data
msg1:.asciiz "Ingresa el primer numero :"   
msg2: .asciiz "Ingresa el segundo numero :" 
msg3: .asciiz "Ingresa el Tercer numero :" 
msgfinal:  .asciiz "El numero Mayor es :" 

.text
.globl main
main:

# muesto el mensaje 
li $v0,4
la $a0,msg1
syscall

#capturar el dato 
li $v0,5
syscall
#mover el numero 
move $t0,$v0
# segundo mensaje 
li $v0,4
la $a0,msg2
syscall
#capturar el dato 
li $v0,5
syscall
#mover el numero 
move $t1,$v0

# tercer mensaje 
li $v0,4
la $a0,msg3
syscall

#capturar el dato 
li $v0,5
syscall
#mover el numero 
move $t2,$v0

# Comparar $t0 y $t1, guardar mayor en $t4 ---
    slt  $t3, $t0, $t1     # $t3 = 1 si $t0 < $t1, sino 0
    bne  $t3, $zero, t1_mayor
    move $t4, $t0          # si $t0 >= $t1 -> mayor = $t0
    j    comp_t2

t1_mayor:
    move $t4, $t1          # si $t0 < $t1 -> mayor = $t1

comp_t2:
    #  Comparar (mayor hasta ahora) $t4 con $t2 ---
    slt  $t3, $t4, $t2     # $t3 = 1 si $t4 < $t2
    bne  $t3, $zero, t2_mayor
    j    imprimir
t2_mayor:
    move $t4, $t2          # si $t4 < $t2 -> mayor = $t2

imprimir:
    # Imprimir mensaje final
    li   $v0, 4
    la   $a0, msgfinal
    syscall

    # Imprimir el numero mayor (contenido de $t4)
    move $a0, $t4
    li   $v0, 1
    syscall 
# Exit
    li   $v0, 10
    syscall


