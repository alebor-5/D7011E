Label_1: addi $at, $zero, 1
addi $sp, $sp, -4 
sw $at, 0($sp)
Label_2: addi $at, $zero, 2
addi $sp, $sp, -4 
sw $at, 0($sp)
Label_3: lw $s0, 0($sp) 

  lw $s1, 4($sp) 

  add $s0, $s0, $s1 

  addi $sp, $sp, 4 

  sw $s0, 0($sp)
Label_4: addi $at, $zero, 3
addi $sp, $sp, -4 
sw $at, 0($sp)
Label_5: lw $s0, 0($sp) 

  lw $s1, 4($sp) 

  add $s0, $s0, $s1 

  addi $sp, $sp, 4 

  sw $s0, 0($sp)
Label_6: lw $at, 0($sp) 
addi $sp, $sp, 4 
sw $at, 4($gp) 
Label_7: addi $at, $zero, 1
addi $sp, $sp, -4 
sw $at, 0($sp)
Label_8: addi $at, $zero, 2
addi $sp, $sp, -4 
sw $at, 0($sp)
Label_9: lw $s0, 0($sp) 

  lw $s1, 4($sp) 

  add $s0, $s0, $s1 

  addi $sp, $sp, 4 

  sw $s0, 0($sp)
Label_10: addi $at, $zero, 3
addi $sp, $sp, -4 
sw $at, 0($sp)
Label_11: lw $s0, 0($sp) 

  lw $s1, 4($sp) 

  sub $s0, $s1, $s0 

  addi $sp, $sp, 4 

  sw $s0, 0($sp)
Label_12: lw $at, 0($sp) 
addi $sp, $sp, 4 
sw $at, 8($gp) 
Label_13: addi $at, $zero, 1
addi $sp, $sp, -4 
sw $at, 0($sp)
Label_14: addi $at, $zero, 2
addi $sp, $sp, -4 
sw $at, 0($sp)
Label_15: lw $s0, 0($sp) 

  lw $s1, 4($sp) 

  addu $s0, $s0, $s1 

  addi $sp, $sp, 4

  sw $s0, 0($sp)
Label_16: addi $at, $zero, 3
addi $sp, $sp, -4 
sw $at, 0($sp)
Label_17: lw $s0, 0($sp) 

  lw $s1, 4($sp) 

  addu $s0, $s0, $s1 

  addi $sp, $sp, 4

  sw $s0, 0($sp)
Label_18: lw $at, 0($sp) 
addi $sp, $sp, 4 
sw $at, 12($gp) 
Label_19: addi $at, $zero, 1
addi $sp, $sp, -4 
sw $at, 0($sp)
Label_20: addi $at, $zero, 2
addi $sp, $sp, -4 
sw $at, 0($sp)
Label_21: lw $s0, 0($sp) 

  lw $s1, 4($sp) 

  addu $s0, $s0, $s1 

  addi $sp, $sp, 4

  sw $s0, 0($sp)
Label_22: addi $at, $zero, 3
addi $sp, $sp, -4 
sw $at, 0($sp)
Label_23: lw $s0, 0($sp) 

  lw $s1, 4($sp) 

  subu $s0, $s1, $s0 

  addi $sp, $sp, 4 

  sw $s0, 0($sp)
Label_24: lw $at, 0($sp) 
addi $sp, $sp, 4 
sw $at, 16($gp) 
Label_25: addi $at, $zero, 3
addi $sp, $sp, -4 
sw $at, 0($sp)
Label_26: addi $at, $zero, 0
addi $sp, $sp, -4 
sw $at, 0($sp)
Label_27: lw $s0, 0($sp) 

  lw $s1, 4($sp) 

  addi $sp, $sp, 8 

  addi $s0, $s0, 1 

  slt $at, $s1, $s0 

  bgtz $at, Label_32
Label_28: j Label_32
Label_29: addi $at, $zero, 1
addi $sp, $sp, -4 
sw $at, 0($sp)
Label_30: lw $at, 0($sp) 
addi $sp, $sp, 4 
sw $at, 4($gp) 
Label_31: j Label_32
Label_32: j Label_32

