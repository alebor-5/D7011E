Label_1: addi $at, $zero, 6
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
sw $at, 8($gp) 
Label_5: addi $at, $zero, 0
addi $sp, $sp, -4 
sw $at, 0($sp)
Label_6: lw $at, 0($sp) 
addi $sp, $sp, 4 
sw $at, 12($gp) 
Label_7: addi $at, $zero, 1
addi $sp, $sp, -4 
sw $at, 0($sp)
Label_8: lw $at, 0($sp) 
addi $sp, $sp, 4 
sw $at, 20($gp) 
Label_9: lw $at, 12($gp) 
addi $sp, $sp, -4 
sw $at, 0($sp)
Label_10: lw $at, 8($gp) 
addi $sp, $sp, -4 
sw $at, 0($sp)
Label_11: lw $s0, 0($sp) 

  lw $s1, 4($sp) 

  addi $sp, $sp, 8 

  bne $s1, $s0, Label_15
Label_12: addi $at, $zero, 1
addi $sp, $sp, -4 
sw $at, 0($sp)
Label_13: lw $at, 0($sp) 
addi $sp, $sp, 4 
sw $at, 20($gp) 
Label_14: j Label_15
Label_15: lw $at, 4($gp) 
addi $sp, $sp, -4 
sw $at, 0($sp)
Label_16: lw $at, 8($gp) 
addi $sp, $sp, -4 
sw $at, 0($sp)
Label_17: lw $s0, 0($sp) 

  lw $s1, 4($sp) 

  addi $sp, $sp, 8 

  bne $s1, $s0, Label_24
Label_18: lw $at, 12($gp) 
addi $sp, $sp, -4 
sw $at, 0($sp)
Label_19: lw $at, 8($gp) 
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
sw $at, 20($gp) 
Label_23: j Label_24
Label_24: addi $at, $zero, 1
addi $sp, $sp, -4 
sw $at, 0($sp)
Label_25: lw $at, 0($sp) 
addi $sp, $sp, 4 
sw $at, 20($gp) 
Label_26: addi $at, $zero, 0
addi $sp, $sp, -4 
sw $at, 0($sp)
Label_27: lw $at, 0($sp) 
addi $sp, $sp, 4 
sw $at, 24($gp) 
Label_28: j Label_28

