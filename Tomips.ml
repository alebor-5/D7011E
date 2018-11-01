(* Write to mips *)
open Imp__Imp
open State__State
open Vm__Vm
open Env
open Common

let of_int_reg = function
  | r -> Z.to_int
let of_reg = function
    | r ->  Z.to_string r

let of_id = function
  | Id i -> Z.to_string i

let of_id_int = function
  | Id i -> Z.to_int i


let labelnumber = ref 0;;


let xd off = 
  labelnumber := !labelnumber + off;
  match off with
  |_ -> labelnumber

let printlbl = function
  |_ -> "Label_" ^ string_of_int !(xd 1) ^ ": "

(* $sp indicates stack head *)
(* Using constants as offset: 16bit, that is each n*2($sp) *)
let to_mips b = function


(*new instructions, register based*)
| Iload (idr, id) -> let lab = printlbl 1 in lab ^"lw $t" ^ of_reg idr ^ ", " ^ string_of_int ((of_id_int id)*4) ^ "($gp) "
| Iimm (idr,n)     -> let lab = printlbl 1 in lab ^ "li $t" ^ of_reg idr ^ ", " ^ Z.to_string n 
| Istore (idr, id) -> let lab = printlbl 1 in lab ^"add $at, $zero, $t" ^ of_reg idr ^ "\nsw $at, " ^  string_of_int ((of_id_int id)*4) ^ "($gp) " 
| Ipushr idr        -> let lab = printlbl 1 in lab ^"addi $sp, $sp, -4 \n sw $t" ^ of_reg idr ^ ", 0($sp)"
| Ipopr idr         -> let lab = printlbl 1 in lab ^"lw $t" ^ of_reg idr ^ ", 0($sp) \n addi $sp, $sp, 4"
| Iaddr (rs, rt, rd) -> let lab = printlbl 1 in lab ^ "add $t" ^ of_reg rd ^ ", $t" ^ of_reg rs ^ ", $t" ^ of_reg rt
| Iaddur (rs, rt, rd) -> let lab = printlbl 1 in lab ^"addu $t" ^ of_reg rd ^ ", $t" ^ of_reg rs ^ ", $t" ^ of_reg rt
| Isubr (rs, rt, rd) -> let lab = printlbl 1 in lab ^"sub $t" ^ of_reg rd ^ ", $t" ^ of_reg rs ^ ", $t" ^ of_reg rt
| Isubur (rs, rt, rd) -> let lab = printlbl 1 in lab ^"subu $t" ^ of_reg rd ^ ", $t" ^ of_reg rs ^ ", $t" ^ of_reg rt
| Ibeqr (idr1, idr2, ofs) -> let lab = printlbl 1 in lab ^"beq $t" ^ of_reg idr1 ^ ", $t" ^ of_reg idr2 ^ ", Label_" ^ string_of_int (!(labelnumber)+Z.to_int ofs + 1)
| Ibner (idr1, idr2, ofs) -> let lab = printlbl 1 in lab ^ "bne $t" ^ of_reg idr1 ^ ", $t" ^ of_reg idr2 ^  ", Label_" ^ string_of_int (!(labelnumber)+Z.to_int ofs + 1)
| Ibler (idr1, idr2, ofs) -> let lab = printlbl 1 in lab ^  "addi $t" ^ of_reg idr2 ^ ", $t" ^ of_reg idr2 ^ ", 1 \n" ^ (*Because a <= b and not a < b *)
   "slt $at, $t"  ^ of_reg idr1 ^ ", $t" ^ of_reg idr2 ^ "\n" ^ (*$at is one if idr1 <= idr2*)
   "bgtz $at, Label_" ^ string_of_int (!(labelnumber)+Z.to_int ofs + 1)    (*bgtz: branch if rs >0*)
| Ibgtr (idr1, idr2, ofs) -> let lab = printlbl 1 in lab ^  "slt $at, $t" ^ of_reg idr2 ^ ", $t" ^ of_reg idr1 ^ "\n" ^ (*$at is one if idr2 < idr1*)
    "bgtz $at, Label_" ^ string_of_int (!(labelnumber)+Z.to_int ofs + 1)    (*bgtz: branch if rs >0*)


(*original/old instructions for stack machine *)
| Iconst n -> let lab = printlbl 1 in lab ^  "addi $at, $zero, " ^ Z.to_string n ^ "\n" ^ (*Use $at to hold value n *)
  "addi $sp, $sp, -4 \n" ^    (*Push $at to stack *)
  "sw $at, 0($sp)"        (*Update the new stack head*)
| Ivar id -> let lab = printlbl 1 in lab ^  "lw $at, " ^ string_of_int ((of_id_int id)*4) ^ "($gp) \n" ^  (*get the value of variable and store it in $at*)
   "addi $sp, $sp, -4 \n" ^   (*push $at to stack*)
   "sw $at, 0($sp)"        (*Update the new stack head*)
| Isetvar id -> let lab = printlbl 1 in lab ^  "lw $at, 0($sp) \n" ^ (*get the value from stack head*)
  "addi $sp, $sp, 4 \n" ^      (*update new stack head*)
  "sw $at, " ^  string_of_int ((of_id_int id)*4) ^ "($gp) " (*Store variable*)
| Ibranch ofs -> let lab = printlbl 1 in lab ^ "j Label_" ^ string_of_int (!(labelnumber)+Z.to_int ofs + 1)
| Iadd -> let lab = printlbl 1 in lab ^ "lw $s0, 0($sp) \n
  lw $s1, 4($sp) \n
  add $s0, $s0, $s1 \n
  addi $sp, $sp, 4 \n
  sw $s0, 0($sp)"
  
| Iaddu -> let lab = printlbl 1 in lab ^ "lw $s0, 0($sp) \n
  lw $s1, 4($sp) \n
  addu $s0, $s0, $s1 \n
  addi $sp, $sp, 4\n
  sw $s0, 0($sp)"
| Isub -> let lab = printlbl 1 in lab ^ "lw $s0, 0($sp) \n
  lw $s1, 4($sp) \n
  sub $s0, $s1, $s0 \n
  addi $sp, $sp, 4 \n
  sw $s0, 0($sp)"
| Isubu -> let lab = printlbl 1 in lab ^ "lw $s0, 0($sp) \n
  lw $s1, 4($sp) \n
  subu $s0, $s1, $s0 \n
  addi $sp, $sp, 4 \n
  sw $s0, 0($sp)"
| Ibeq ofs -> let lab = printlbl 1 in lab ^ "lw $s0, 0($sp) \n
  lw $s1, 4($sp) \n
  addi $sp, $sp, 8 \n
  beq $s1, $s0, Label_" ^ string_of_int (!(labelnumber)+Z.to_int ofs +1)
| Ibne ofs -> let lab = printlbl 1 in lab ^ "lw $s0, 0($sp) \n
  lw $s1, 4($sp) \n
  addi $sp, $sp, 8 \n
  bne $s1, $s0, Label_" ^ string_of_int (!(labelnumber)+Z.to_int ofs +1)
| Ible ofs -> let lab = printlbl 1 in lab ^ "lw $s0, 0($sp) \n
  lw $s1, 4($sp) \n
  addi $sp, $sp, 8 \n
  addi $s0, $s0, 1 \n
  slt $at, $s1, $s0 \n
  bgtz $at, Label_" ^ string_of_int (!(labelnumber)+Z.to_int ofs +1)
| Ibgt ofs -> let lab = printlbl 1 in lab ^ "lw $s0, 0($sp) \n
  lw $s1, 4($sp) \n
  addi $sp, $sp, 8 \n
  slt $at, $s0, $s1 \n
  bgtz $at, Label_" ^ string_of_int (!(labelnumber)+Z.to_int ofs +1)
| Ihalt -> let lab = printlbl 1 in lab ^  "j Label_"^ string_of_int (!(labelnumber))




let rec of_code b = function
  | [] -> ""
  | i :: il -> let temp = to_mips b i in
   temp ^ "\n" ^ of_code b il 