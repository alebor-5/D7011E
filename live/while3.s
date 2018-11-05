Label_1: li $t0, 0
Label_2: sw $t0,4($gp)
Label_3: li $t0, 0
Label_4: sw $t0,8($gp)
Label_5: lw $t0, 4($gp) 
Label_6: li $t1, 30
Label_7: slt $at, $t1, $t0
bgtz $at, Label_22
Label_8: lw $t0, 8($gp) 
Label_9: li $t1, 1
Label_10: beq $t0, $t1, Label_22
Label_11: lw $t0, 4($gp) 
Label_12: li $t1, 1
Label_13: add $t0, $t1, $t0
Label_14: sw $t0,4($gp)
Label_15: lw $t0, 4($gp) 
Label_16: li $t1, 20
Label_17: bne $t0, $t1, Label_21
Label_18: li $t0, 1
Label_19: sw $t0,8($gp)
Label_20: j Label_21
Label_21: j Label_5
Label_22: j Label_22

