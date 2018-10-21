Label_1: addi $at, $zero, 1
addi $sp, $sp, -4 
sw $at, 0($sp)
Label_2: lw $at, 0($sp) 
addi $sp, $sp, 4 
sw $at, 4($gp) 
Label_3: addi $at, $zero, 10
addi $sp, $sp, -4 
sw $at, 0($sp)
Label_4: lw $at, 0($sp) 
addi $sp, $sp, 4 
sw $at, 8($gp) 
Label_5: addi $at, $zero, 5
addi $sp, $sp, -4 
sw $at, 0($sp)
Label_6: lw $at, 0($sp) 
addi $sp, $sp, 4 
sw $at, 20($gp) 
Label_7: addi $at, $zero, 2
addi $sp, $sp, -4 
sw $at, 0($sp)
Label_8: lw $at, 0($sp) 
addi $sp, $sp, 4 
sw $at, 12($gp) 
Label_9: addi $at, $zero, 3
addi $sp, $sp, -4 
sw $at, 0($sp)
Label_10: lw $at, 0($sp) 
addi $sp, $sp, 4 
sw $at, 12($gp) 
Label_11: lw $at, 20($gp) 
addi $sp, $sp, -4 
sw $at, 0($sp)
Label_12: addi $at, $zero, 10
addi $sp, $sp, -4 
sw $at, 0($sp)
Label_13: lw $s0, 0($sp) 

  lw $s1, 4($sp) 

  addi $sp, $sp, 8 

  slt $at, $s0, $s1 

  bgtz $at, Label_17
Label_14: addi $at, $zero, 5
addi $sp, $sp, -4 
sw $at, 0($sp)
Label_15: lw $at, 0($sp) 
addi $sp, $sp, 4 
sw $at, 12($gp) 
Label_16: j Label_17
Label_17: j Label_17

