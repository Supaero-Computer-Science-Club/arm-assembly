.global _start
.section .text

_start:
	mov r0, #4

	mov r7, #0x4
	mov r0, #1
	ldr r1, =message
	mov r2, #12
	swi 0

	mov r7, #0x1
	mov r0, #0x0
	
	swi 0

.section .data
	message: .ascii "Hello World\n"
