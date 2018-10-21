type aexpr =
  | Anum of (Z.t)
  | Avar of State__State.id
  | Aadd of aexpr * aexpr
  | Asub of aexpr * aexpr
  | Aaddu of aexpr * aexpr
  | Asubu of aexpr * aexpr

type bexpr =
  | Btrue
  | Bfalse
  | Bnot of bexpr
  | Beq of aexpr * aexpr
  | Ble of aexpr * aexpr
  | Band of bexpr * bexpr

type com =
  | Cskip
  | Cassign of State__State.id * aexpr
  | Cseq of com * com
  | Cif of bexpr * com * com
  | Cwhile of bexpr * com

let rec eq (a: aexpr) (b: aexpr) : bool =
  begin match (a, b) with
  | (Anum i1, Anum i2) -> Z.equal i1 i2
  | (Avar State__State.Id id1, Avar State__State.Id id2) -> Z.equal id1 id2
  | (Aadd (a1, a2), Aadd (b1, b2)) -> (eq a1 b1) && (eq a2 b2)
  | (Asub (a1, a2), Asub (b1, b2)) -> (eq a1 b1) && (eq a2 b2)
  | (Aaddu (a1, a2), Aaddu (b1, b2)) -> (eq a1 b1) && (eq a2 b2)
  | (Asubu (a1, a2), Asubu (b1, b2)) -> (eq a1 b1) && (eq a2 b2)
  | _ -> false
  end

let rec eq_b (a: bexpr) (b: bexpr) : bool =
  begin match (a, b) with
  | (Btrue, Btrue) -> true
  | (Bfalse, Bfalse) -> true
  | (Bnot bqt, Bnot b1qt) -> eq_b bqt b1qt
  | (Beq (a1, a2), Beq (b1, b2)) -> (eq a1 b1) && (eq a2 b2)
  | (Ble (a1, a2), Ble (b1, b2)) -> (eq a1 b1) && (eq a2 b2)
  | (Band (a1, a2), Band (b1, b2)) -> (eq_b a1 b1) && (eq_b a2 b2)
  | _ -> false
  end

