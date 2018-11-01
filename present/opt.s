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
Label_9: addi $at, $zero, 1
addi $sp, $sp, -4 
sw $at, 0($sp)
Label_10: lw $at, 0($sp) 
addi $sp, $sp, 4 
sw $at, 4($gp) 
Label_11: addi $at, $zero, 0
addi $sp, $sp, -4 
sw $at, 0($sp)
Label_12: lw $at, 0($sp) 
addi $sp, $sp, 4 
sw $at, 4($gp) 
Label_13: addi $at, $zero, 1
addi $sp, $sp, -4 
sw $at, 0($sp)
Label_14: lw $at, 0($sp) 
addi $sp, $sp, 4 
sw $at, 4($gp) 
Label_15: lw $at, 4($gp) 
addi $sp, $sp, -4 
sw $at, 0($sp)
Label_16: addi $at, $zero, 12
addi $sp, $sp, -4 
sw $at, 0($sp)
Label_17: lw $s0, 0($sp) 

  lw $s1, 4($sp) 

  addi $sp, $sp, 8 

  bne $s1, $s0, Label_21
Label_18: addi $at, $zero, 0
addi $sp, $sp, -4 
sw $at, 0($sp)
Label_19: lw $at, 0($sp) 
addi $sp, $sp, 4 
sw $at, 4($gp) 
Label_20: j Label_23
Label_21: addi $at, $zero, 1
addi $sp, $sp, -4 
sw $at, 0($sp)
Label_22: lw $at, 0($sp) 
addi $sp, $sp, 4 
sw $at, 4($gp) 
Label_23: lw $at, 4($gp) 
addi $sp, $sp, -4 
sw $at, 0($sp)
Label_24: addi $at, $zero, 12
addi $sp, $sp, -4 
sw $at, 0($sp)
Label_25: lw $s0, 0($sp) 

  lw $s1, 4($sp) 

  addi $sp, $sp, 8 

  bne $s1, $s0, Label_29
Label_26: addi $at, $zero, 0
addi $sp, $sp, -4 
sw $at, 0($sp)
Label_27: lw $at, 0($sp) 
addi $sp, $sp, 4 
sw $at, 4($gp) 
Label_28: j Label_31
Label_29: addi $at, $zero, 1
addi $sp, $sp, -4 
sw $at, 0($sp)
Label_30: lw $at, 0($sp) 
addi $sp, $sp, 4 
sw $at, 4($gp) 
Label_31: addi $at, $zero, 1
addi $sp, $sp, -4 
sw $at, 0($sp)
Label_32: lw $at, 0($sp) 
addi $sp, $sp, 4 
sw $at, 4($gp) 
Label_33: j Label_31
Label_34: j Label_34

