.data
_Prompt: .asciiz "Enter an integer:  "
_ret: .asciiz "\n"
.globl main
.text
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
  lw $t1, 0($sp)
  move $t3, $t1
  sw $t3, 12($sp)
  lw $t1, 8($sp)
  move $t3, $t1
  sw $t3, 0($sp)
  lw $t1, 8($sp)
  lw $t2, 12($sp)
  add $t3,$t1,$t2
  sw $t3, 16($sp)
  lw $t1, 16($sp)
  move $t3, $t1
  sw $t3, 8($sp)
  lw $v0,8($sp)
  jr $ra
label1:

main:
  addi $sp, $sp, -32
  li $t3, 1
  sw $t3, 24($sp)
  lw $t1, 24($sp)
  move $t3, $t1
  sw $t3, 0($sp)
  li $t3, 1
  sw $t3, 24($sp)
  lw $t1, 24($sp)
  move $t3, $t1
  sw $t3, 8($sp)
  addi $sp, $sp, -4
  sw $ra,0($sp)
  jal read
  lw $ra,0($sp)
  addi $sp, $sp, 4
  sw $v0, 24($sp)
  lw $t1, 24($sp)
  move $t3, $t1
  sw $t3, 12($sp)
  li $t3, 0
  sw $t3, 24($sp)
  lw $t1, 24($sp)
  move $t3, $t1
  sw $t3, 16($sp)
label12:
  lw $t1, 16($sp)
  lw $t2, 12($sp)
  blt $t1,$t2,label11
  j label10
label11:
  li $t3, 2
  sw $t3, 24($sp)
  lw $t1, 16($sp)
  lw $t2, 24($sp)
  blt $t1,$t2,label14
  j label15
label14:
  li $t3, 1
  sw $t3, 24($sp)
  lw $a0, 24($sp)
  addi $sp, $sp, -4
  sw $ra,0($sp)
  jal write
  lw $ra,0($sp)
  addi $sp, $sp, 4
  j label13
label15:
  move $t0,$sp
  addi $sp, $sp, -20
  sw $ra,0($sp)
  jal f
  lw $ra,0($sp)
  addi $sp,$sp,20
  sw $v0,24($sp)
  lw $t1, 24($sp)
  move $t3, $t1
  sw $t3, 20($sp)
  lw $a0, 20($sp)
  addi $sp, $sp, -4
  sw $ra,0($sp)
  jal write
  lw $ra,0($sp)
  addi $sp, $sp, 4
label13:
  li $t3, 1
  sw $t3, 24($sp)
  lw $t1, 16($sp)
  lw $t2, 24($sp)
  add $t3,$t1,$t2
  sw $t3, 28($sp)
  lw $t1, 28($sp)
  move $t3, $t1
  sw $t3, 16($sp)
  j label12
label10:
  li $t3, 0
  sw $t3, 24($sp)
  lw $v0,24($sp)
  jr $ra
label5:
