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


let to_mips b = function
| Iaddr (rs, rt, rd) -> let lab = printlbl 1 in lab ^ "add $t" ^ of_reg rd ^ ", $t" ^ of_reg rs ^ ", $t" ^ of_reg rt
| Iaddur (rs, rt, rd) -> let lab = printlbl 1 in lab ^"addu $t" ^ of_reg rd ^ ", $t" ^ of_reg rs ^ ", $t" ^ of_reg rt
| Isubr (rs, rt, rd) -> let lab = printlbl 1 in lab ^"sub $t" ^ of_reg rd ^ ", $t" ^ of_reg rs ^ ", $t" ^ of_reg rt
| Iload (idr, id) -> let lab = printlbl 1 in lab ^"lw $t" ^ of_reg idr ^ ", " ^ string_of_int ((of_id_int id)*4) ^ "($gp) "
| Iimm (idr,n)     -> let lab = printlbl 1 in lab ^ "addi $t" ^ of_reg idr ^ ", " ^ " $zero, "^ Z.to_string n 
| Istore (idr, id) -> let lab = printlbl 1 in lab ^"add $at, $zero, $t" ^ of_reg idr ^ "\nsw $at, " ^  string_of_int ((of_id_int id)*4) ^ "($gp) " 
| Ipushr idr        -> let lab = printlbl 1 in lab ^"push stack"
| Ipopr idr         -> let lab = printlbl 1 in lab ^"pop"
| Ibeqr (idr1, idr2, ofs) -> let lab = printlbl 1 in lab ^"beq $t" ^ of_reg idr1 ^ ", $t" ^ of_reg idr2 ^ ", Label_" ^ string_of_int (!(labelnumber)+Z.to_int ofs)
| Ibner (idr1, idr2, ofs) -> let lab = printlbl 1 in lab ^ "bne $t" ^ of_reg idr1 ^ ", $t" ^ of_reg idr2 ^  ", Label_" ^ string_of_int (!(labelnumber)+Z.to_int ofs)
| Ibler (idr1, idr2, ofs) -> let lab = printlbl 1 in lab ^  "blez $t" ^ of_reg idr1 ^ ", $t" ^ of_reg idr2 ^  ", Label_" ^ string_of_int (!(labelnumber)+Z.to_int ofs)
| Ibgtr (idr1, idr2, ofs) -> "bgtr"

|_                -> ""



let rec of_code b = function
  | [] -> ""
  | i :: il -> let temp = to_mips b i in
   temp ^ "\n" ^ of_code b il 