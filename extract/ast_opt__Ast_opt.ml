let rec aeval_opt (e: Imp__Imp.aexpr) : Imp__Imp.aexpr =
  begin match e with
  | Imp__Imp.Anum n -> Imp__Imp.Anum n
  | Imp__Imp.Avar x -> Imp__Imp.Avar x
  | Imp__Imp.Aadd (e1, e2) -> Imp__Imp.Aadd ((aeval_opt e1), (aeval_opt e2))
  | Imp__Imp.Aaddu (e1, e2) ->
    begin match (aeval_opt e1, aeval_opt e2) with
    | (Imp__Imp.Anum oe1, Imp__Imp.Anum oe2) ->
      Imp__Imp.Anum (Bv_op__BV_OP.bv_add oe1 oe2)
    | (oe1, oe2) -> Imp__Imp.Aaddu (oe1, oe2)
    end
  | Imp__Imp.Asub (e1, e2) -> Imp__Imp.Asub ((aeval_opt e1), (aeval_opt e2))
  | Imp__Imp.Asubu (e1, e2) ->
    begin match (aeval_opt e1, aeval_opt e2) with
    | (Imp__Imp.Anum oe1, Imp__Imp.Anum oe2) ->
      begin match Z.equal oe1 oe2 with
      | true -> Imp__Imp.Anum Z.zero
      | false -> Imp__Imp.Anum (Bv_op__BV_OP.bv_sub oe1 oe2)
      end
    | (Imp__Imp.Avar _, Imp__Imp.Avar _) ->
      begin match Imp__Imp.eq e1 e2 with
      | true -> Imp__Imp.Anum Z.zero
      | false -> Imp__Imp.Asubu ((aeval_opt e1), (aeval_opt e2))
      end
    | (oe1, oe2) -> Imp__Imp.Asubu (oe1, oe2)
    end
  end

let rec beval_opt (b: Imp__Imp.bexpr) : Imp__Imp.bexpr =
  begin match b with
  | Imp__Imp.Btrue -> Imp__Imp.Btrue
  | Imp__Imp.Bfalse -> Imp__Imp.Bfalse
  | Imp__Imp.Beq (a1, a2) -> Imp__Imp.Beq ((aeval_opt a1), (aeval_opt a2))
  | Imp__Imp.Ble (a1, a2) -> Imp__Imp.Ble ((aeval_opt a1), (aeval_opt a2))
  | Imp__Imp.Bnot bqt -> Imp__Imp.Bnot (beval_opt bqt)
  | Imp__Imp.Band (b1, b2) ->
    begin match Imp__Imp.eq_b b1 b2 with
    | true -> beval_opt b1
    | false ->
      begin match (beval_opt b1, beval_opt b2) with
      | (Imp__Imp.Btrue, Imp__Imp.Btrue) -> Imp__Imp.Btrue
      | (Imp__Imp.Bfalse, Imp__Imp.Bfalse) -> Imp__Imp.Bfalse
      | (ob1, Imp__Imp.Btrue) -> ob1
      | (_, Imp__Imp.Bfalse) -> Imp__Imp.Bfalse
      | (Imp__Imp.Btrue, ob2) -> ob2
      | (Imp__Imp.Bfalse, _) -> Imp__Imp.Bfalse
      | (ob1, ob2) -> Imp__Imp.Band (ob1, ob2)
      end
    end
  end

let rec ceval_opt (c: Imp__Imp.com) : Imp__Imp.com =
  begin match c with
  | Imp__Imp.Cskip -> Imp__Imp.Cskip
  | Imp__Imp.Cassign (id, aexpr) -> Imp__Imp.Cassign (id, (aeval_opt aexpr))
  | Imp__Imp.Cseq (c1, c2) ->
    let o = ceval_opt c2 in let o1 = ceval_opt c1 in Imp__Imp.Cseq (o1, o)
  | Imp__Imp.Cif (bexpr, c1, c2) ->
    begin match beval_opt bexpr with
    | Imp__Imp.Btrue -> ceval_opt c1
    | Imp__Imp.Bfalse -> ceval_opt c2
    | _ ->
      let o = ceval_opt c2 in
      let o1 = ceval_opt c1 in Imp__Imp.Cif ((beval_opt bexpr), o1, o)
    end
  | Imp__Imp.Cwhile (bexpr, com1) ->
    begin match beval_opt bexpr with
    | Imp__Imp.Bfalse -> Imp__Imp.Cskip
    | _ -> let o = ceval_opt com1 in Imp__Imp.Cwhile ((beval_opt bexpr), o)
    end
  end

