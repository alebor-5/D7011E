Label_1: addi $at, $zero, 5
addi $sp, $sp, -4 
sw $at, 0($sp)
Label_2: lw $at, 0($sp) 
addi $sp, $sp, 4 
sw $at, 4($gp) 
Label_3: addi $at, $zero, 0
addi $sp, $sp, -4 
sw $at, 0($sp)
Label_4: lw $at, 0($sp) 
addi $sp, $sp, 4 
sw $at, 4($gp) 
Label_5: addi $at, $zero, 0
addi $sp, $sp, -4 
sw $at, 0($sp)
Label_6: lw $at, 0($sp) 
addi $sp, $sp, 4 
sw $at, 8($gp) 
Label_7: addi $at, $zero, 0
addi $sp, $sp, -4 
sw $at, 0($sp)
Label_8: lw $at, 0($sp) 
addi $sp, $sp, 4 
sw $at, 8($gp) 
Label_9: lw $at, 4($gp) 
addi $sp, $sp, -4 
sw $at, 0($sp)
Label_10: addi $at, $zero, 2
addi $sp, $sp, -4 
sw $at, 0($sp)
Label_11: lw $s0, 0($sp) 

  lw $s1, 4($sp) 

  addu $s0, $s0, $s1 

  addi $sp, $sp, 4

  sw $s0, 0($sp)
Label_12: lw $at, 4($gp) 
addi $sp, $sp, -4 
sw $at, 0($sp)
Label_13: addi $at, $zero, 2
addi $sp, $sp, -4 
sw $at, 0($sp)
Label_14: lw $s0, 0($sp) 

  lw $s1, 4($sp) 

  addu $s0, $s0, $s1 

  addi $sp, $sp, 4

  sw $s0, 0($sp)
Label_15: lw $s0, 0($sp) 

  lw $s1, 4($sp) 

  addu $s0, $s0, $s1 

  addi $sp, $sp, 4

  sw $s0, 0($sp)
Label_16: lw $at, 0($sp) 
addi $sp, $sp, 4 
sw $at, 12($gp) 
Label_17: j Label_17

