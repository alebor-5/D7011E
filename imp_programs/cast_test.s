Label_1: addi $at, $zero, 6
addi $sp, $sp, -4 
sw $at, 0($sp)
Label_2: lw $at, 0($sp) 
addi $sp, $sp, 4 
sw $at, 8($gp) 
Label_3: addi $at, $zero, 2
addi $sp, $sp, -4 
sw $at, 0($sp)
Label_4: lw $at, 8($gp) 
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
Label_7: j Label_7

