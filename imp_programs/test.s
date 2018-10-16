Label_1: addi $t0,  $zero, 1
Label_2: add $at, $zero, $t0
sw $at, 4($gp) 
Label_3: addi $t0,  $zero, 2
Label_4: add $at, $zero, $t0
sw $at, 8($gp) 
Label_5: lw $t0, 4($gp) 
Label_6: addi $t1,  $zero, 19
Label_7: slt $at, $t1, $t0
bgtz $at, Label_14
Label_8: lw $t0, 4($gp) 
Label_9: addi $t1,  $zero, 19
Label_10: beq $t0, $t1, Label_14
Label_11: addi $t0,  $zero, 1
Label_12: add $at, $zero, $t0
sw $at, 8($gp) 
Label_13: j Label_16
Label_14: addi $t0,  $zero, 3
Label_15: add $at, $zero, $t0
sw $at, 8($gp) 
Label_16: addi $t0,  $zero, 2
Label_17: addi $t1,  $zero, 3
Label_18: add $t0, $t1, $t0
Label_19: add $at, $zero, $t0
sw $at, 8($gp) 
Label_20: addi $t0,  $zero, 1
Label_21: addi $t1,  $zero, 1
Label_22: add $t0, $t1, $t0
Label_23: add $at, $zero, $t0
sw $at, 8($gp) 
Label_24: j Label_24

