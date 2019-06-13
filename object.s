.data
_Prompt: .asciiz "Enter an integer:  "
_ret: .asciiz "\n"
.globl main
.text
addi $sp,$zero,0x00002ffc
add $t1, $zero, 0x0003310
j main
read:
  li $v0,4
  la $a0,_Prompt
  syscall
  li $v0,5
  syscall
  jr $ra
write:
  li $v0,1
  syscall
  li $v0,4
  la $a0,_ret
  syscall
  move $v0,$0
  jr $ra

f:
  lw $t1, 1($sp)
  move $t3, $t1
  sw $t3, 16($sp)
  lw $t1, 0($sp)
  move $t3, $t1
  sw $t3, 0($sp)
  lw $t1, 20($sp)
  move $t3, $t1
  sw $t3, 12($sp)
  li $t3,1
  sw $t3, 28($sp)
  lw $t1, 28($sp)
  move $t3, $t1
  sw $t3, 0($sp)
  li $t3,1
  sw $t3, 28($sp)
  lw $t1, 28($sp)
  move $t3, $t1
  sw $t3, 8($sp)
label8:
  j 
  j 
label7:
  lw $t1, 6($sp)
  move $t3, $t1
  sw $t3, 28($sp)
  lw $t1, 32($sp)
  move $t3, $t1
  sw $t3, 12($sp)
  lw $t1, 28($sp)
  move $t3, $t1
  sw $t3, 12($sp)
  li $t3,1
  sw $t3, 28($sp)
  li $t3,2
  sw $t3, 32($sp)
  li $t3,3
  sw $t3, 36($sp)
  move $t0,$sp
  addi $sp, $sp, -44
  sw $ra,0($sp)
  jal f
  lw $ra,0($sp)
  addi $sp,$sp,44
  sw $v0,40($sp)
label1:

fx:
  li $t3,-1
  sw $t3, 36($sp)
  lw $t1, 32735($sp)
  move $t3, $t1
  sw $t3, 32766($sp)
  lw $t1, 8($sp)
  move $t3, $t1
  sw $t3, 40($sp)
  li $t3,0
  sw $t3, 44($sp)
  lw $t1, 40($sp)
  lw $t2, 44($sp)
  div $t1, $t2
  mflo $t3
  sw $t3, 48($sp)
  lw $t1, 48($sp)
  move $t3, $t1
  sw $t3, 24($sp)
  lw $t1, 4($sp)
  move $t3, $t1
  sw $t3, 32($sp)
label13:
