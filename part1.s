### Program to start a shell in 64 bit assembly.
.section .data		# data section

name: .string "/bin/sh"

.section .text		# text section.

.globl _start		

_start:

pushq $0		# Pushing parm in reverse.
pushq name		# Pushing 1st Parm(string)	

movq $59, %rax		# Prepraing to do system call for execv to invoke shell.
movq %rsp, %rdi	

movq $0, %rsi		# populating null.
movq $0, %rdx

syscall			# Actual System call.

movq $60, %rax		# Preparing to do exit system call.
movq $0, %rdi

syscall			# actual system call


