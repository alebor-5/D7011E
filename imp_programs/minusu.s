Label_1: addi $at, $zero, 1
addi $sp, $sp, -4 
sw $at, 0($sp)
Label_2: lw $at, 0($sp) 
addi $sp, $sp, 4 
sw $at, 4($gp) 
Label_3: addi $at, $zero, 2
addi $sp, $sp, -4 
sw $at, 0($sp)
Label_4: lw $at, 0($sp) 
addi $sp, $sp, 4 
sw $at, 8($gp) 
Label_5: lw $at, 4($gp) 
addi $sp, $sp, -4 
sw $at, 0($sp)
Label_6: lw $at, 8($gp) 
addi $sp, $sp, -4 
sw $at, 0($sp)
Label_7: lw $s0, 0($sp) 

  lw $s1, 4($sp) 

  subu $s0, $s1, $s0 

  addi $sp, $sp, 4 

  sw $s0, 0($sp)
Label_8: lw $at, 0($sp) 
addi $sp, $sp, 4 
sw $at, 4($gp) 
Label_9: j Label_9

