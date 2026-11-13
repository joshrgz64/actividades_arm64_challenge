// Nombre: Joshua Nezib Rodriguez Camarena
// Número de control: 24210524
// Asignatura: Lenguajes de Interfaz
// Ejercicio: Paridad
// Fecha: 12 - Nov - 2026
// Asciinema (si existe):

// Solución en alto nivel:

.text

.data
    num: 8 // editar este numero segun el que se quiera 

.global paridad
paridad:
    // obtenemos el numero de la seccion de datos ademas del divisor
    mov x0, num // x0 - Numero a probar
    mov x1, #0 // x1 - Resultado de residuo 
    mov x2, #2 // x2 - divisor

    // Realizamos una operacion de modulo
    udiv x1, x0, x2
    cmp x1, #0
    b.ne salidaPar

salidaImpar:
    .asciz "1 (es impar)"
    mov x8, #93

salidaPar:
    .asciz "0 (es par)"
    mov x8, #93



// Reflexión personal:
