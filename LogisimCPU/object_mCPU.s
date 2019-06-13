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
  addi $v0,$0,34
  syscall
  move $v0,$0
  jr $ra

fibonacci:
  addi $t3,$0,1
  sw $t3, 16($sp)
  lw $t1, 12($sp)
  lw $t2, 16($sp)
  beq $t1,$t2,label2
  j label4
label4:
  addi $t3,$0,2
  sw $t3, 16($sp)
  lw $t1, 12($sp)
  lw $t2, 16($sp)
  beq $t1,$t2,label2
  j label3
label2:
  addi $t3,$0,1
  sw $t3, 16($sp)
  lw $v0,16($sp)
  jr $ra
  j label1
label3:
  addi $t3,$0,1
  sw $t3, 16($sp)
  lw $t1, 12($sp)
  lw $t2, 16($sp)
  sub $t3,$t1,$t2
  sw $t3, 20($sp)
  move $t0,$sp
  addi $sp, $sp, -44
  sw $ra,0($sp)
  lw $t1, 20($t0)
  move $t3,$t1
  sw $t3,12($sp)
  jal fibonacci
  lw $ra,0($sp)
  addi $sp,$sp,44
  sw $v0,24($sp)
  addi $t3,$0,2
  sw $t3, 28($sp)
  lw $t1, 12($sp)
  lw $t2, 28($sp)
  sub $t3,$t1,$t2
  sw $t3, 32($sp)
  move $t0,$sp
  addi $sp, $sp, -44
  sw $ra,0($sp)
  lw $t1, 32($t0)
  move $t3,$t1
  sw $t3,12($sp)
  jal fibonacci
  lw $ra,0($sp)
  addi $sp,$sp,44
  sw $v0,36($sp)
  lw $t1, 24($sp)
  lw $t2, 36($sp)
  add $t3,$t1,$t2
  sw $t3, 40($sp)
  lw $v0,40($sp)
  jr $ra
label1:

main:
  addi $sp, $sp, -28
  addi $t3,$0,10
  sw $t3, 24($sp)
  lw $t1, 24($sp)
  move $t3, $t1
  sw $t3, 12($sp)
  addi $t3,$0,1
  sw $t3, 24($sp)
  lw $t1, 24($sp)
  move $t3, $t1
  sw $t3, 16($sp)
label9:
  lw $t1, 16($sp)
  lw $t2, 12($sp)
  ble $t1,$t2,label8
  j label7
label8:
  move $t0,$sp
  addi $sp, $sp, -44
  sw $ra,0($sp)
  lw $t1, 16($t0)
  move $t3,$t1
  sw $t3,12($sp)
  jal fibonacci
  lw $ra,0($sp)
  addi $sp,$sp,44
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
label10:
  addi $t3,$0,1
  sw $t3, 0($sp)
  lw $t1, 16($sp)
  lw $t2, 0($sp)
  add $t3,$t1,$t2
  sw $t3, 4($sp)
  lw $t1, 4($sp)
  move $t3, $t1
  sw $t3, 16($sp)
  j label9
label7:
  addi $t3,$0,0
  sw $t3, 24($sp)
  lw $v0,24($sp)
  jr $ra
label5:
