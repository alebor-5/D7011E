Label_1: addi $at, $zero, 65536
addi $sp, $sp, -4 
sw $at, 0($sp)
Label_2: lw $at, 0($sp) 
addi $sp, $sp, 4 
sw $at, 4($gp) 
Label_3: addi $at, $zero, 65536
addi $sp, $sp, -4 
sw $at, 0($sp)
Label_4: lw $at, 0($sp) 
addi $sp, $sp, 4 
sw $at, 8($gp) 
Label_5: addi $at, $zero, 65536
addi $sp, $sp, -4 
sw $at, 0($sp)
Label_6: lw $at, 0($sp) 
addi $sp, $sp, 4 
sw $at, 12($gp) 
Label_7: lw $at, 4($gp) 
addi $sp, $sp, -4 
sw $at, 0($sp)
Label_8: lw $at, 8($gp) 
addi $sp, $sp, -4 
sw $at, 0($sp)
Label_9: lw $s0, 0($sp) 

  lw $s1, 4($sp) 

  add $s0, $s0, $s1 

  addi $sp, $sp, 4 

  sw $s0, 0($sp)
Label_10: lw $at, 12($gp) 
addi $sp, $sp, -4 
sw $at, 0($sp)
Label_11: lw $s0, 0($sp) 

  lw $s1, 4($sp) 

  add $s0, $s0, $s1 

  addi $sp, $sp, 4 

  sw $s0, 0($sp)
Label_12: lw $at, 0($sp) 
addi $sp, $sp, 4 
sw $at, 4($gp) 
Label_13: j Label_13

