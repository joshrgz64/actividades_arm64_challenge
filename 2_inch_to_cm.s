# Nombre: Joshua Nezib Rodriguez Camarena
# Número de control: 24210524
# Asignatura: Lenguajes de Interfaz
# Ejercicio: Pulgadas a centimetros
# Fecha: 12 - Nov - 2026
// Asciinema (si existe):

// Solución en alto nivel:
.section .data
.align 3
    inch: .xword 32 // editar este numero (valor en pulgadas)
.section .rodata
    factorCm: .xword 254 // factor en centecimas para convertir a centimetros
    msg_res: .asciz "Centimetros: "

.section .bss
.align 3
buffer:
    .skip 64

.section .text
.global pulgadas
pulgadas:
    // hay que obtener el numero en pulgadas primero
    adrp x0, inch
    add x0, x0, :lo12:inch
    ldr x0, [x0]

    // ahora se carga el factor por el que se multiplica a centimetros
    adrp x1, factorCm
    add x1, x1, :lo12:factorCm
    ldr x1, [x1]
    // se multiplican x0 (valor en pulgadas) y x1 (el factor de cm) y se guarda el resultado en x20
    mul x20,x0,x1

    // se imprime el resultado
    adrp x1, msg_inch
    add x1, x1, :lo12:msg_res
    mov x2, #10
    bl escribir

    // y se imprime el resultado convertido
    mov x0, x20
    mov x1, #100
    bl escribir_num

    mov x0, #0
    mov x8, #93
    svc #0

escribir:
    mov x0, #1  // stdout
    mov x8, #64 // syscall - write
    svc #0
    ret

escribir_num:
    mov x9, x0
    adrp x1, buffer
    add x1, x1, :lo12:buffer
    add x1, x1, #64
    mov x2, #0
    mov x3, #10
    
    b escribir


// Reflexión personal:
