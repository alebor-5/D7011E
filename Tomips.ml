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

let to_mips b = function
| Iaddr (rs, rt, rd) -> "add $t" ^ of_reg rd ^ ", $t" ^ of_reg rs ^ ", $t" ^ of_reg rt
| Iaddur (rs, rt, rd) -> "addu $t" ^ of_reg rd ^ ", $t" ^ of_reg rs ^ ", $t" ^ of_reg rt
| Isubr (rs, rt, rd) -> "sub $t" ^ of_reg rd ^ ", $t" ^ of_reg rs ^ ", $t" ^ of_reg rt
| Iload (idr, id) -> "lw $t" ^ of_reg idr ^ ", " ^ string_of_int ((of_id_int id)*4) ^ "($gp) "
| Iimm (idr,n)     -> "addi $t" ^ of_reg idr ^ ", " ^ " $zero, "^ Z.to_string n 
| Istore (idr, id) -> "add $at, $zero, $t" ^ of_reg idr ^ "\nsw $at, " ^  string_of_int ((of_id_int id)*4) ^ "($gp) " 
| Ipushr idr        -> "push stack"
| Ipopr idr         -> "pop"
| Ibeqr (idr1, idr2, ofs) -> "beq $t" ^ of_reg idr1 ^ " $t" ^ of_reg idr2 ^ " " ^ Z.to_string ofs
| Ibner (idr1, idr2, ofs) -> "bner"
| Ibler (idr1, idr2, ofs) -> "bbler"
| Ibgtr (idr1, idr2, ofs) -> "bgtr"

|_                -> ""



let rec of_code b = function
  | [] -> ""
  | i :: il -> to_mips b i ^ "\n" ^ of_code b il