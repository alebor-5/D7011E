Label_1: addi $at, $zero, 3
addi $sp, $sp, -4 
sw $at, 0($sp)
Label_2: lw $at, 0($sp) 
addi $sp, $sp, 4 
sw $at, 4($gp) 
Label_3: addi $at, $zero, 0
addi $sp, $sp, -4 
sw $at, 0($sp)
Label_4: lw $at, 4($gp) 
addi $sp, $sp, -4 
sw $at, 0($sp)
Label_5: lw $s0, 0($sp) 

  lw $s1, 4($sp) 

  addi $sp, $sp, 8 

  slt $at, $s0, $s1 

  bgtz $at, Label_12
Label_6: lw $at, 4($gp) 
addi $sp, $sp, -4 
sw $at, 0($sp)
Label_7: addi $at, $zero, 7
addi $sp, $sp, -4 
sw $at, 0($sp)
Label_8: lw $s0, 0($sp) 

  lw $s1, 4($sp) 

  addi $sp, $sp, 8 

  slt $at, $s0, $s1 

  bgtz $at, Label_12
Label_9: addi $at, $zero, 10
addi $sp, $sp, -4 
sw $at, 0($sp)
Label_10: lw $at, 0($sp) 
addi $sp, $sp, 4 
sw $at, 4($gp) 
Label_11: j Label_12
Label_12: j Label_12

