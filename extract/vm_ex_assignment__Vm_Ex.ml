exception Err

exception Halt of Vm__Vm.machine_state

let rec split_at (p: Z.t) (c: Vm__Vm.instr list) :
  (Vm__Vm.instr list) * (Vm__Vm.instr list) =
  begin match (c, Z.equal p Z.zero) with
  | ([], _) -> raise Err
  | (_, true) -> ([], c)
  | (e :: cqt, _) ->
    let (hd, tl) = split_at (Z.sub p Z.one) cqt in (e :: hd, tl)
  end

let pop (s: (Z.t) list) : (Z.t) * ((Z.t) list) =
  begin match s with
  | [] -> raise Err
  | rv :: rs -> (rv, rs)
  end

let instr_ex (c: Vm__Vm.instr list) (ms: Vm__Vm.machine_state) : Vm__Vm.machine_state
  =
  let Vm__Vm.VMS (p, r, s, m) = ms in
  begin
    if Z.lt p Z.zero then begin raise Err end;
    begin try
      begin match split_at p c with
      | (_, instr :: _) ->
        begin match instr with
        | Vm__Vm.Iconst n ->
          Vm__Vm.VMS ((Z.add p Z.one), r, (Vm__Vm.push n s), m)
        | Vm__Vm.Ihalt -> raise (Halt ms)
        | Vm__Vm.Ivar id ->
          Vm__Vm.VMS ((Z.add p Z.one), r,
            (Vm__Vm.push (State__State.mixfix_lbrb m id) s), m)
        | Vm__Vm.Isetvar id ->
          let (rv, rs) = pop s in
          Vm__Vm.VMS ((Z.add p Z.one), r, rs,
            (State__State.mixfix_lblsmnrb m id rv))
        | Vm__Vm.Ibranch ofs ->
          Vm__Vm.VMS ((Z.add (Z.add p Z.one) ofs), r, s, m)
        | Vm__Vm.Iadd ->
          let (rv1, rs1) = pop s in let (rv2, rs2) = pop rs1 in
          Vm__Vm.VMS ((Z.add p Z.one), r, (Vm__Vm.push (Z.add rv1 rv2) rs2),
            m)
        | Vm__Vm.Iaddu ->
          let (rv11, rs11) = pop s in let (rv21, rs21) = pop rs11 in
          Vm__Vm.VMS ((Z.add p Z.one), r,
            (Vm__Vm.push (Bv_op__BV_OP.bv_add rv11 rv21) rs21), m)
        | Vm__Vm.Isub ->
          let (rv12, rs12) = pop s in let (rv22, rs22) = pop rs12 in
          Vm__Vm.VMS ((Z.add p Z.one), r,
            (Vm__Vm.push (Z.sub rv22 rv12) rs22), m)
        | Vm__Vm.Isubu ->
          let (rv13, rs13) = pop s in let (rv23, rs23) = pop rs13 in
          Vm__Vm.VMS ((Z.add p Z.one), r,
            (Vm__Vm.push (Bv_op__BV_OP.bv_sub rv23 rv13) rs23), m)
        | Vm__Vm.Ibeq ofs ->
          let (n2, rs24) = pop s in let (n1, rs14) = pop rs24 in
          begin match Z.equal n1 n2 with
          | true -> Vm__Vm.VMS ((Z.add (Z.add p Z.one) ofs), r, rs14, m)
          | false -> Vm__Vm.VMS ((Z.add p Z.one), r, rs14, m)
          end
        | Vm__Vm.Ibne ofs ->
          let (n21, rs25) = pop s in let (n11, rs15) = pop rs25 in
          begin match not (Z.equal n21 n11) with
          | true -> Vm__Vm.VMS ((Z.add (Z.add p Z.one) ofs), r, rs15, m)
          | false -> Vm__Vm.VMS ((Z.add p Z.one), r, rs15, m)
          end
        | Vm__Vm.Ible ofs ->
          let (n22, rs26) = pop s in let (n12, rs16) = pop rs26 in
          begin match Z.leq n12 n22 with
          | true -> Vm__Vm.VMS ((Z.add (Z.add p Z.one) ofs), r, rs16, m)
          | false -> Vm__Vm.VMS ((Z.add p Z.one), r, rs16, m)
          end
        | Vm__Vm.Ibgt ofs ->
          let (n23, rs27) = pop s in let (n13, rs17) = pop rs27 in
          begin match Z.gt n13 n23 with
          | true -> Vm__Vm.VMS ((Z.add (Z.add p Z.one) ofs), r, rs17, m)
          | false -> Vm__Vm.VMS ((Z.add p Z.one), r, rs17, m)
          end
        | Vm__Vm.Iload (idr, id) ->
          Vm__Vm.VMS ((Z.add p Z.one),
            (State__Reg.write r idr (State__State.mixfix_lbrb m id)), s, m)
        | Vm__Vm.Iimm (idr, n) ->
          Vm__Vm.VMS ((Z.add p Z.one), (State__Reg.write r idr n), s, m)
        | Vm__Vm.Istore (idr, id) ->
          Vm__Vm.VMS ((Z.add p Z.one), r, s,
            (State__State.mixfix_lblsmnrb m id (State__Reg.read r idr)))
        | Vm__Vm.Ipushr idr ->
          Vm__Vm.VMS ((Z.add p Z.one), r,
            (Vm__Vm.push (State__Reg.read r idr) s), m)
        | Vm__Vm.Ipopr idr ->
          let (rv3, rs3) = pop s in
          Vm__Vm.VMS ((Z.add p Z.one), (State__Reg.write r idr rv3), rs3, m)
        | Vm__Vm.Iaddr (idr1, idr2, idr3) ->
          Vm__Vm.VMS ((Z.add p Z.one),
            (State__Reg.write r idr3
               (Z.add (State__Reg.read r idr1) (State__Reg.read r idr2))), s,
            m)
        | Vm__Vm.Iaddur (idr1, idr2, idr3) ->
          Vm__Vm.VMS ((Z.add p Z.one),
            (State__Reg.write r idr3
               (Bv_op__BV_OP.bv_add (State__Reg.read r idr1)
                  (State__Reg.read r idr2))), s, m)
        | Vm__Vm.Isubr (idr1, idr2, idr3) ->
          Vm__Vm.VMS ((Z.add p Z.one),
            (State__Reg.write r idr3
               (Z.sub (State__Reg.read r idr1) (State__Reg.read r idr2))), s,
            m)
        | Vm__Vm.Isubur (idr1, idr2, idr3) ->
          Vm__Vm.VMS ((Z.add p Z.one),
            (State__Reg.write r idr3
               (Bv_op__BV_OP.bv_sub (State__Reg.read r idr1)
                  (State__Reg.read r idr2))), s, m)
        | Vm__Vm.Ibeqr (idr1, idr2, ofs) ->
          begin match Z.equal (State__Reg.read r idr1) (State__Reg.read r
                                                          idr2) with
          | true -> Vm__Vm.VMS ((Z.add (Z.add p Z.one) ofs), r, s, m)
          | false -> Vm__Vm.VMS ((Z.add p Z.one), r, s, m)
          end
        | Vm__Vm.Ibner (idr1, idr2, ofs) ->
          begin match not (Z.equal (State__Reg.read r idr1) (State__Reg.read r
                                                               idr2)) with
          | true -> Vm__Vm.VMS ((Z.add (Z.add p Z.one) ofs), r, s, m)
          | false -> Vm__Vm.VMS ((Z.add p Z.one), r, s, m)
          end
        | Vm__Vm.Ibler (idr1, idr2, ofs) ->
          begin match Z.leq (State__Reg.read r idr1) (State__Reg.read r idr2) with
          | true -> Vm__Vm.VMS ((Z.add (Z.add p Z.one) ofs), r, s, m)
          | false -> Vm__Vm.VMS ((Z.add p Z.one), r, s, m)
          end
        | Vm__Vm.Ibgtr (idr1, idr2, ofs) ->
          begin match Z.gt (State__Reg.read r idr1) (State__Reg.read r idr2) with
          | true -> Vm__Vm.VMS ((Z.add (Z.add p Z.one) ofs), r, s, m)
          | false -> Vm__Vm.VMS ((Z.add p Z.one), r, s, m)
          end
        | _ -> raise Err
        end
      | _ -> assert false (* absurd *)
      end with
    | Err -> raise Err
    end
  end

let rec instr_iter_ex (c: Vm__Vm.instr list) (ms: Vm__Vm.machine_state) :
  Vm__Vm.machine_state = let o = instr_ex c ms in instr_iter_ex c o

