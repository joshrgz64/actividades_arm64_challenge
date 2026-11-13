// Nombre: Joshua Nezib Rodriguez Camarena
// Número de control: 24210524
// Asignatura: Lenguajes de Interfaz
// Ejercicio: Paridad
// Fecha: 12 - Nov - 2026
// Asciinema (si existe):

// Solución en alto nivel:


.section .data
.align 2
    num: .word 8 // editar este numero segun el que se quiera 
.section .rodata
    msg_impar: .asciz "1 (es impar)\n"
    msg_par: .asciz "0 (es par)\n"

.section .text
.global _start
_start:
    // obtenemos el numero de la seccion de datos ademas del divisor
    adrp x0, num // x0 - Numero a probar
    add x0, x0, :lo12:num
    ldrsw x1, [x0]

    // Realizamos una operacion de modulo
    and x1, x0, #1
    cbnz w1, salida_par

salida_par:
    mov x0, #1
    adrp x1, msg_par
    add x1, x1, :lo12:msg_par
    mov x2, #11
    mov x8, #64
    svc #0
    b fin

salida_impar:
    mov x0, #1
    adrp x1, msg_impar
    add x1, x1, :lo12:msg_impar
    mov x2, #13
    mov x8, #64
    svc #0

fin:
    mov x0, #0
    mov x8, #93
    svc #0

// Reflexión personal:
