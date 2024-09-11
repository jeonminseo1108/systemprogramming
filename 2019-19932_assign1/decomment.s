	.file	"decomment.c"
	.text
	.section	.rodata
.LC0:
	.string	"decomment.c"
.LC1:
	.string	"0"
	.align 8
.LC2:
	.string	"Error: line %d: unterminated comment\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	$0, -16(%rbp)
	movl	$1, -24(%rbp)
	movl	$-1, -20(%rbp)
	movb	$0, -26(%rbp)
.L12:
	call	getchar@PLT
	movl	%eax, -12(%rbp)
	cmpl	$-1, -12(%rbp)
	je	.L19
	movl	-12(%rbp), %eax
	movb	%al, -25(%rbp)
	movl	-16(%rbp), %eax
	cmpl	$4, %eax
	ja	.L4
	movl	%eax, %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L6(%rip), %rax
	movl	(%rdx,%rax), %eax
	cltq
	leaq	.L6(%rip), %rdx
	addq	%rdx, %rax
	notrack jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L6:
	.long	.L10-.L6
	.long	.L9-.L6
	.long	.L8-.L6
	.long	.L7-.L6
	.long	.L5-.L6
	.text
.L10:
	movsbl	-25(%rbp), %eax
	leaq	-20(%rbp), %rdi
	leaq	-24(%rbp), %rcx
	leaq	-16(%rbp), %rdx
	leaq	-26(%rbp), %rsi
	movq	%rdi, %r8
	movl	%eax, %edi
	call	handle_normal
	jmp	.L11
.L8:
	movsbl	-25(%rbp), %eax
	leaq	-24(%rbp), %rcx
	leaq	-16(%rbp), %rdx
	leaq	-26(%rbp), %rsi
	movl	%eax, %edi
	call	handle_block_comment
	jmp	.L11
.L9:
	movsbl	-25(%rbp), %eax
	leaq	-24(%rbp), %rdx
	leaq	-16(%rbp), %rcx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	handle_line_comment
	jmp	.L11
.L7:
	movsbl	-25(%rbp), %eax
	leaq	-16(%rbp), %rdx
	movq	%rdx, %rsi
	movl	%eax, %edi
	call	handle_string
	jmp	.L11
.L5:
	movsbl	-25(%rbp), %eax
	leaq	-16(%rbp), %rdx
	movq	%rdx, %rsi
	movl	%eax, %edi
	call	handle_char_literal
	jmp	.L11
.L4:
	leaq	__PRETTY_FUNCTION__.0(%rip), %rax
	movq	%rax, %rcx
	movl	$80, %edx
	leaq	.LC0(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	call	__assert_fail@PLT
.L11:
	jmp	.L12
.L19:
	nop
	movl	-16(%rbp), %eax
	cmpl	$2, %eax
	jne	.L13
	movl	-20(%rbp), %edx
	movq	stderr(%rip), %rax
	leaq	.LC2(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movl	$1, %eax
	jmp	.L16
.L13:
	movzbl	-26(%rbp), %eax
	cmpb	$47, %al
	jne	.L15
	movq	stdout(%rip), %rax
	movq	%rax, %rsi
	movl	$32, %edi
	call	fputc@PLT
.L15:
	movl	$0, %eax
.L16:
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L17
	call	__stack_chk_fail@PLT
.L17:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.globl	handle_normal
	.type	handle_normal, @function
handle_normal:
.LFB1:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movl	%edi, %eax
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	movq	%rcx, -32(%rbp)
	movq	%r8, -40(%rbp)
	movb	%al, -4(%rbp)
	cmpb	$47, -4(%rbp)
	jne	.L21
	movq	-16(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$47, %al
	jne	.L22
	movq	-24(%rbp), %rax
	movl	$1, (%rax)
	movq	-16(%rbp), %rax
	movb	$0, (%rax)
	movq	stdout(%rip), %rax
	movq	%rax, %rsi
	movl	$32, %edi
	call	fputc@PLT
	jmp	.L23
.L22:
	movq	-16(%rbp), %rax
	movzbl	-4(%rbp), %edx
	movb	%dl, (%rax)
	jmp	.L23
.L21:
	cmpb	$42, -4(%rbp)
	jne	.L24
	movq	-16(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$47, %al
	jne	.L25
	movq	-24(%rbp), %rax
	movl	$2, (%rax)
	movq	-16(%rbp), %rax
	movb	$0, (%rax)
	movq	-32(%rbp), %rax
	movl	(%rax), %edx
	movq	-40(%rbp), %rax
	movl	%edx, (%rax)
	movq	stdout(%rip), %rax
	movq	%rax, %rsi
	movl	$32, %edi
	call	fputc@PLT
	jmp	.L23
.L25:
	movsbl	-4(%rbp), %eax
	movq	stdout(%rip), %rdx
	movq	%rdx, %rsi
	movl	%eax, %edi
	call	fputc@PLT
	jmp	.L23
.L24:
	cmpb	$34, -4(%rbp)
	jne	.L26
	movq	-24(%rbp), %rax
	movl	$3, (%rax)
	movsbl	-4(%rbp), %eax
	movq	stdout(%rip), %rdx
	movq	%rdx, %rsi
	movl	%eax, %edi
	call	fputc@PLT
	jmp	.L23
.L26:
	cmpb	$39, -4(%rbp)
	jne	.L27
	movq	-24(%rbp), %rax
	movl	$4, (%rax)
	movsbl	-4(%rbp), %eax
	movq	stdout(%rip), %rdx
	movq	%rdx, %rsi
	movl	%eax, %edi
	call	fputc@PLT
	jmp	.L23
.L27:
	movq	-16(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$47, %al
	jne	.L28
	movq	stdout(%rip), %rax
	movq	%rax, %rsi
	movl	$47, %edi
	call	fputc@PLT
.L28:
	movsbl	-4(%rbp), %eax
	movq	stdout(%rip), %rdx
	movq	%rdx, %rsi
	movl	%eax, %edi
	call	fputc@PLT
	movq	-16(%rbp), %rax
	movb	$0, (%rax)
.L23:
	cmpb	$10, -4(%rbp)
	jne	.L31
	movq	-32(%rbp), %rax
	movl	(%rax), %eax
	leal	1(%rax), %edx
	movq	-32(%rbp), %rax
	movl	%edx, (%rax)
	nop
.L31:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	handle_normal, .-handle_normal
	.globl	handle_block_comment
	.type	handle_block_comment, @function
handle_block_comment:
.LFB2:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	%edi, %eax
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	movq	%rcx, -32(%rbp)
	movb	%al, -4(%rbp)
	movq	-16(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$42, %al
	jne	.L33
	cmpb	$47, -4(%rbp)
	jne	.L33
	movq	-24(%rbp), %rax
	movl	$0, (%rax)
	movq	-16(%rbp), %rax
	movb	$0, (%rax)
	jmp	.L34
.L33:
	cmpb	$42, -4(%rbp)
	jne	.L35
	movq	-16(%rbp), %rax
	movb	$42, (%rax)
	jmp	.L32
.L35:
	cmpb	$10, -4(%rbp)
	jne	.L36
	movq	-32(%rbp), %rax
	movl	(%rax), %eax
	leal	1(%rax), %edx
	movq	-32(%rbp), %rax
	movl	%edx, (%rax)
	movq	stdout(%rip), %rax
	movq	%rax, %rsi
	movl	$10, %edi
	call	fputc@PLT
.L36:
	movq	-16(%rbp), %rax
	movb	$0, (%rax)
.L34:
	nop
.L32:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	handle_block_comment, .-handle_block_comment
	.globl	handle_line_comment
	.type	handle_line_comment, @function
handle_line_comment:
.LFB3:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	%edi, %eax
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	movb	%al, -4(%rbp)
	cmpb	$9, -4(%rbp)
	jne	.L39
	movq	stdout(%rip), %rax
	movq	%rax, %rsi
	movl	$9, %edi
	call	fputc@PLT
.L39:
	cmpb	$10, -4(%rbp)
	jne	.L42
	movq	-16(%rbp), %rax
	movl	$0, (%rax)
	movq	-24(%rbp), %rax
	movl	(%rax), %eax
	leal	1(%rax), %edx
	movq	-24(%rbp), %rax
	movl	%edx, (%rax)
	movq	stdout(%rip), %rax
	movq	%rax, %rsi
	movl	$10, %edi
	call	fputc@PLT
	nop
.L42:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	handle_line_comment, .-handle_line_comment
	.globl	handle_string
	.type	handle_string, @function
handle_string:
.LFB4:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	%edi, %eax
	movq	%rsi, -16(%rbp)
	movb	%al, -4(%rbp)
	movsbl	-4(%rbp), %eax
	movl	%eax, %edi
	call	putchar@PLT
	cmpb	$34, -4(%rbp)
	jne	.L46
	movq	-16(%rbp), %rax
	movl	$0, (%rax)
	nop
.L46:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	handle_string, .-handle_string
	.globl	handle_char_literal
	.type	handle_char_literal, @function
handle_char_literal:
.LFB5:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	%edi, %eax
	movq	%rsi, -16(%rbp)
	movb	%al, -4(%rbp)
	movsbl	-4(%rbp), %eax
	movl	%eax, %edi
	call	putchar@PLT
	cmpb	$39, -4(%rbp)
	jne	.L50
	movq	-16(%rbp), %rax
	movl	$0, (%rax)
	nop
.L50:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	handle_char_literal, .-handle_char_literal
	.section	.rodata
	.type	__PRETTY_FUNCTION__.0, @object
	.size	__PRETTY_FUNCTION__.0, 5
__PRETTY_FUNCTION__.0:
	.string	"main"
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
