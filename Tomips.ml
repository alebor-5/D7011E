(* Write to mips *)
open Imp__Imp
open State__State
open Vm__Vm
open Env
open Common

let of_reg = function
    | r ->  Z.to_string r

let of_id = function
  | Id i -> Z.to_string i

let to_mips b = function
| Iaddr (rs, rt, rd) -> "ADD $s" ^ of_reg rd ^ " $s" ^ of_reg rs ^ " $s" ^ of_reg rt
| Iaddur (rs, rt, rd) -> "ADDU $s" ^ of_reg rd ^ " $s" ^ of_reg rs ^ " $s" ^ of_reg rt
| Isubr (rs, rt, rd) -> "SUB $s" ^ of_reg rd ^ " $s" ^ of_reg rs ^ " $s" ^ of_reg rt
| Iload (idr, id) -> "LW " ^ of_reg idr ^ " " ^ of_id id (*detta är troligen inte rätt*)
| Iimm (idr,n)     -> "ADDI $s" ^ of_reg idr ^ " " ^ " $zero "^ Z.to_string n 
| Istore (idr, id) -> "SW $s" ^ of_reg idr ^ " " ^ of_id id
| Ipushr idr        -> "push stack"
| Ipopr idr         -> "pop"
| Ibeqr (idr1, idr2, ofs) -> "beqr"
| Ibner (idr1, idr2, ofs) -> "bner"
| Ibler (idr1, idr2, ofs) -> "bbler"
| Ibgtr (idr1, idr2, ofs) -> "bgtr"

|_                -> ""



let rec of_code b = function
  | [] -> ""
  | i :: il -> to_mips b i ^ ";\n" ^ of_code b il