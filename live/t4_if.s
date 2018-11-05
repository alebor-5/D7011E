Label_1: li $t0, 2
Label_2: li $t1, 3
Label_3: add $t0, $t1, $t0
Label_4: sw $t0,4($gp)
Label_5: lw $t0, 4($gp) 
Label_6: li $t1, 7
Label_7: slt $at, $t1, $t0
bgtz $at, Label_11
Label_8: li $t0, 20
Label_9: sw $t0,8($gp)
Label_10: j Label_17
Label_11: li $t0, 10
Label_12: li $t1, 0
Label_13: sub $t0, $t1, $t0
Label_14: lw $t1, 8($gp) 
Label_15: sub $t0, $t1, $t0
Label_16: sw $t0,8($gp)
Label_17: li $t0, 7
Label_18: lw $t1, 8($gp) 
Label_19: slt $at, $t1, $t0
bgtz $at, Label_29
Label_20: lw $t0, 4($gp) 
Label_21: li $t1, 1
Label_22: add $t0, $t1, $t0
Label_23: sw $t0,4($gp)
Label_24: li $t0, 1
Label_25: lw $t1, 8($gp) 
Label_26: sub $t0, $t1, $t0
Label_27: sw $t0,8($gp)
Label_28: j Label_17
Label_29: j Label_29

