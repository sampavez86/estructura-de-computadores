
.data
msg1:      .asciiz "Ingresa el primer numero :"   
msg2:      .asciiz "Ingresa el segundo numero :" 
msg3:      .asciiz "Ingresa el tercer numero :" 
msgfinal:  .asciiz "El numero Menor es :" 

.text
.globl main
main:

# --- Primer número ---
li $v0, 4
la $a0, msg1
syscall

li $v0, 5
syscall
move $t0, $v0       # guardar en $t0

# --- Segundo número ---
li $v0, 4
la $a0, msg2
syscall

li $v0, 5
syscall
move $t1, $v0       # guardar en $t1

# --- Tercer número ---
li $v0, 4
la $a0, msg3
syscall

li $v0, 5
syscall
move $t2, $v0       # guardar en $t2

# --- Comparar $t0 y $t1, guardar menor en $t4 ---
ble $t0, $t1, t0_menor
move $t4, $t1       # si $t0 > $t1 -> menor = $t1
j comp_t2

t0_menor:
move $t4, $t0       # si $t0 <= $t1 -> menor = $t0

# --- Comparar (menor hasta ahora) $t4 con $t2 ---
comp_t2:
ble $t4, $t2, imprimir
move $t4, $t2       # si $t2 < $t4 -> menor = $t2

# --- Imprimir resultado ---
imprimir:
li $v0, 4
la $a0, msgfinal
syscall

move $a0, $t4
li $v0, 1
syscall 

# --- Salir ---
li $v0, 10
syscall
