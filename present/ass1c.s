Label_1: addi $at, $zero, 2
addi $sp, $sp, -4 
sw $at, 0($sp)
Label_2: addi $at, $zero, 1
addi $sp, $sp, -4 
sw $at, 0($sp)
Label_3: lw $s0, 0($sp) 

  lw $s1, 4($sp) 

  addi $sp, $sp, 8 

  addi $s0, $s0, 1 

  slt $at, $s1, $s0 

  bgtz $at, Label_9
Label_4: addi $at, $zero, 0
addi $sp, $sp, -4 
sw $at, 0($sp)
Label_5: addi $at, $zero, 1
addi $sp, $sp, -4 
sw $at, 0($sp)
Label_6: lw $s0, 0($sp) 

  lw $s1, 4($sp) 

  sub $s0, $s1, $s0 

  addi $sp, $sp, 4 

  sw $s0, 0($sp)
Label_7: lw $at, 0($sp) 
addi $sp, $sp, 4 
sw $at, 4($gp) 
Label_8: j Label_9
Label_9: addi $at, $zero, 1
addi $sp, $sp, -4 
sw $at, 0($sp)
Label_10: addi $at, $zero, 2
addi $sp, $sp, -4 
sw $at, 0($sp)
Label_11: lw $s0, 0($sp) 

  lw $s1, 4($sp) 

  addi $sp, $sp, 8 

  slt $at, $s0, $s1 

  bgtz $at, Label_15
Label_12: addi $at, $zero, 1
addi $sp, $sp, -4 
sw $at, 0($sp)
Label_13: lw $at, 0($sp) 
addi $sp, $sp, 4 
sw $at, 8($gp) 
Label_14: j Label_15
Label_15: addi $at, $zero, 1
addi $sp, $sp, -4 
sw $at, 0($sp)
Label_16: addi $at, $zero, 3
addi $sp, $sp, -4 
sw $at, 0($sp)
Label_17: lw $s0, 0($sp) 

  lw $s1, 4($sp) 

  addi $sp, $sp, 8 

  slt $at, $s0, $s1 

  bgtz $at, Label_24
Label_18: addi $at, $zero, 1
addi $sp, $sp, -4 
sw $at, 0($sp)
Label_19: addi $at, $zero, 3
addi $sp, $sp, -4 
sw $at, 0($sp)
Label_20: lw $s0, 0($sp) 

  lw $s1, 4($sp) 

  addi $sp, $sp, 8 

  beq $s1, $s0, Label_24
Label_21: addi $at, $zero, 1
addi $sp, $sp, -4 
sw $at, 0($sp)
Label_22: lw $at, 0($sp) 
addi $sp, $sp, 4 
sw $at, 12($gp) 
Label_23: j Label_24
Label_24: j Label_24

