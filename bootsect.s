.global _start
.code16

.section .text

_start:
	mov $0x0600, %ax
	mov $0x0007, %bx
	mov $0x0000, %cx
	mov $0x184f, %dx
	int $0x10  

	mov $0x1301, %ax
	mov $0x0003, %bx
	mov $0x0a20, %dx
	mov $len, %cx
	mov $msg, %bp
	int $0x10

	hlt

msg:
	.ascii "Hello World!"
.equ len, . - msg

.org 510
	.word 0xaa55
