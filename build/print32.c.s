	.file	"print32.c"
	.intel_syntax noprefix
	.text
	.p2align 4
	.globl	memset32
	.type	memset32, @function
memset32:
.LFB0:
	.cfi_startproc
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	push	edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	push	esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	push	ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	sub	esp, 8
	.cfi_def_cfa_offset 28
	mov	esi, DWORD PTR 36[esp]
	mov	eax, DWORD PTR 28[esp]
	test	esi, esi
	je	.L18
	movzx	ecx, BYTE PTR 32[esp]
	mov	ebp, eax
	mov	edi, 5
	lea	edx, -1[esi]
	neg	ebp
	mov	BYTE PTR 7[esp], cl
	mov	ecx, ebp
	and	ecx, 3
	lea	ebx, 3[ecx]
	mov	DWORD PTR [esp], ecx
	cmp	ebx, edi
	cmovb	ebx, edi
	cmp	edx, ebx
	jb	.L3
	mov	edi, eax
	test	ecx, ecx
	je	.L4
	movzx	edx, BYTE PTR 32[esp]
	and	ebp, 2
	mov	BYTE PTR [eax], dl
	je	.L40
	cmp	DWORD PTR [esp], 3
	mov	BYTE PTR 1[eax], dl
	jne	.L41
	mov	BYTE PTR 2[eax], dl
	lea	edi, 3[eax]
	lea	edx, -4[esi]
.L4:
	mov	ebx, DWORD PTR [esp]
	sub	esi, ebx
	movzx	ebx, BYTE PTR 7[esp]
	mov	bh, BYTE PTR 32[esp]
	mov	ebp, esi
	movzx	esi, BYTE PTR 32[esp]
	movzx	ebx, bx
	mov	ecx, esi
	sal	esi, 24
	sal	ecx, 16
	or	ebx, ecx
	mov	ecx, ebp
	or	ebx, esi
	mov	esi, DWORD PTR [esp]
	and	ecx, -4
	add	eax, esi
	lea	esi, [eax+ecx]
	test	cl, 4
	je	.L8
	mov	DWORD PTR [eax], ebx
	add	eax, 4
	cmp	eax, esi
	je	.L36
	.p2align 4,,10
	.p2align 3
.L8:
	mov	DWORD PTR [eax], ebx
	add	eax, 8
	mov	DWORD PTR -4[eax], ebx
	cmp	eax, esi
	jne	.L8
.L36:
	cmp	ebp, ecx
	je	.L18
	lea	eax, [edi+ecx]
	sub	edx, ecx
.L3:
	movzx	ecx, BYTE PTR 32[esp]
	mov	BYTE PTR [eax], cl
	test	edx, edx
	je	.L18
	mov	BYTE PTR 1[eax], cl
	cmp	edx, 1
	je	.L18
	mov	BYTE PTR 2[eax], cl
	cmp	edx, 2
	je	.L18
	mov	BYTE PTR 3[eax], cl
	cmp	edx, 3
	je	.L18
	mov	BYTE PTR 4[eax], cl
	cmp	edx, 4
	je	.L18
	mov	BYTE PTR 5[eax], cl
.L18:
	add	esp, 8
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	xor	eax, eax
	pop	ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	pop	esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	pop	edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	pop	ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,10
	.p2align 3
.L40:
	.cfi_restore_state
	lea	edi, 1[eax]
	lea	edx, -2[esi]
	jmp	.L4
	.p2align 4,,10
	.p2align 3
.L41:
	lea	edi, 2[eax]
	lea	edx, -3[esi]
	jmp	.L4
	.cfi_endproc
.LFE0:
	.size	memset32, .-memset32
	.p2align 4
	.globl	println32
	.type	println32, @function
println32:
.LFB1:
	.cfi_startproc
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	call	__x86.get_pc_thunk.bp
	add	ebp, OFFSET FLAT:_GLOBAL_OFFSET_TABLE_
	push	edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	push	esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	push	ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	sub	esp, 12
	.cfi_def_cfa_offset 32
	mov	eax, DWORD PTR buffer@GOTOFF[ebp]
	mov	ecx, eax
	neg	ecx
	mov	edx, ecx
	and	edx, 3
	je	.L55
	and	ecx, 2
	mov	BYTE PTR [eax], 32
	lea	ecx, 1[eax]
	mov	esi, 3999
	je	.L43
	mov	BYTE PTR 1[eax], 32
	lea	ecx, 2[eax]
	mov	esi, 3998
	cmp	edx, 3
	jne	.L43
	mov	BYTE PTR 2[eax], 32
	lea	ecx, 3[eax]
	mov	esi, 3997
.L43:
	mov	ebx, 4000
	add	eax, edx
	sub	ebx, edx
	mov	edx, ebx
	and	edx, -4
	lea	edi, [eax+edx]
	test	dl, 4
	je	.L47
	mov	DWORD PTR [eax], 538976288
	add	eax, 4
	cmp	eax, edi
	je	.L69
	.p2align 4,,10
	.p2align 3
.L47:
	mov	DWORD PTR [eax], 538976288
	add	eax, 8
	mov	DWORD PTR -4[eax], 538976288
	cmp	eax, edi
	jne	.L47
.L69:
	add	ecx, edx
	sub	esi, edx
	cmp	edx, ebx
	je	.L48
	mov	BYTE PTR [ecx], 32
	cmp	esi, 1
	je	.L48
	mov	BYTE PTR 1[ecx], 32
	cmp	esi, 2
	je	.L48
	mov	BYTE PTR 2[ecx], 32
.L48:
	mov	eax, DWORD PTR buffer@GOTOFF[ebp]
	mov	ecx, DWORD PTR 36[esp]
	mov	esi, DWORD PTR row@GOTOFF[ebp]
	mov	edx, DWORD PTR column@GOTOFF[ebp]
	mov	DWORD PTR 4[esp], eax
	test	ecx, ecx
	je	.L49
	mov	ecx, DWORD PTR 32[esp]
	mov	eax, DWORD PTR 36[esp]
	mov	DWORD PTR [esp], esi
	add	eax, ecx
	mov	DWORD PTR 8[esp], eax
	jmp	.L53
	.p2align 4,,10
	.p2align 3
.L50:
	mov	DWORD PTR column@GOTOFF[ebp], edx
	add	eax, edx
	add	eax, eax
.L52:
	add	ecx, 1
	cmp	DWORD PTR 8[esp], ecx
	je	.L54
.L53:
	mov	eax, DWORD PTR [esp]
	movsx	bx, BYTE PTR [ecx]
	mov	esi, DWORD PTR 4[esp]
	lea	eax, [eax+eax*4]
	or	bh, 15
	sal	eax, 4
	lea	edi, [eax+edx]
	add	edx, 1
	mov	WORD PTR [esi+edi*2], bx
	cmp	edx, 80
	jne	.L50
	add	DWORD PTR [esp], 1
	mov	eax, DWORD PTR [esp]
	mov	DWORD PTR column@GOTOFF[ebp], 0
	cmp	eax, 25
	je	.L72
	mov	DWORD PTR row@GOTOFF[ebp], eax
	lea	eax, [eax+eax*4]
	xor	edx, edx
	add	ecx, 1
	sal	eax, 5
	cmp	DWORD PTR 8[esp], ecx
	jne	.L53
.L54:
	mov	esi, DWORD PTR 4[esp]
	mov	edx, 3850
	mov	WORD PTR [esi+eax], dx
	add	esp, 12
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	pop	ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	pop	esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	pop	edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	pop	ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,10
	.p2align 3
.L72:
	.cfi_restore_state
	mov	DWORD PTR row@GOTOFF[ebp], 0
	xor	eax, eax
	xor	edx, edx
	mov	DWORD PTR [esp], 0
	jmp	.L52
	.p2align 4,,10
	.p2align 3
.L55:
	mov	ecx, eax
	mov	esi, 4000
	jmp	.L43
	.p2align 4,,10
	.p2align 3
.L49:
	lea	eax, [esi+esi*4]
	sal	eax, 4
	add	eax, edx
	add	eax, eax
	jmp	.L54
	.cfi_endproc
.LFE1:
	.size	println32, .-println32
	.globl	buffer
	.data
	.align 4
	.type	buffer, @object
	.size	buffer, 4
buffer:
	.long	753664
	.globl	column
	.bss
	.align 4
	.type	column, @object
	.size	column, 4
column:
	.zero	4
	.globl	row
	.align 4
	.type	row, @object
	.size	row, 4
row:
	.zero	4
	.section	.text.__x86.get_pc_thunk.bp,"axG",@progbits,__x86.get_pc_thunk.bp,comdat
	.globl	__x86.get_pc_thunk.bp
	.hidden	__x86.get_pc_thunk.bp
	.type	__x86.get_pc_thunk.bp, @function
__x86.get_pc_thunk.bp:
.LFB2:
	.cfi_startproc
	mov	ebp, DWORD PTR [esp]
	ret
	.cfi_endproc
.LFE2:
	.ident	"GCC: (Ubuntu 13.2.0-23ubuntu4) 13.2.0"
	.section	.note.GNU-stack,"",@progbits
