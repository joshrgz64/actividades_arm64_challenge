// Nombre: Joshua Nezib Rodriguez Camarena
// Número de control: 24210524
// Asignatura: Lenguajes de Interfaz
// Ejercicio: Paridad
// Fecha: 12 - Nov - 2026
// Asciinema (si existe): https://asciinema.org/a/mmQSbRbVDp9rYDZN

// Solución en alto nivel: https://raw.githubusercontent.com/joshrgz64/actividades_arm64_challenge/refs/heads/main/1_paridad.py

.section .data
.align 2
    num: .word 8 // editar este numero segun el que se quiera 
.section .rodata
    msg_impar: .asciz "1 (es impar)\n"
    msg_par: .asciz "0 (es par)\n"

.section .text
.global paridad
paridad:
    // obtenemos el numero de la seccion de datos ademas del divisor
    adrp x0, num // x0 - Numero a probar
    add x0, x0, :lo12:num
    ldrsw x1, [x0]

    // Realizamos una operacion de modulo
    and w1, w1, #1
    cbnz w1, salida_impar

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

// Reflexión personal: Fue mas facil de traducir el programa en python a ensamblador en este caso, el hecho que no esté limitado a valores de 8 bits me ayuda bastante, es lo increible de la tecnologia que ha sobrepasado sus propios limites
