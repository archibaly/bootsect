.global _start
.code16

.section .text

_start:
	mov $0xb800, %ax
	mov %ax, %es

	mov $len, %cx
	xor %si, %si
	xor %di, %di
print:
	movb msg(%si), %al
	movb $0x1f, %ah
	mov %ax, %es:(%di)
	inc %si
	add $2, %di
	loop print

1:
	jmp 1b

msg:
	.ascii "Hello World!"
.equ len, . - msg

.org 510
	.word 0xaa55
