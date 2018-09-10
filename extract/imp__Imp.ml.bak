type aexpr =
  | Anum of (Z.t)
  | Avar of State__State.id
  | Aadd of aexpr * aexpr
  | Aaddu of aexpr * aexpr
  | Asub of aexpr * aexpr

type bexpr =
  | Btrue
  | Bfalse
  | Band of bexpr * bexpr
  | Bnot of bexpr
  | Beq of aexpr * aexpr
  | Ble of aexpr * aexpr

type com =
  | Cskip
  | Cassign of State__State.id * aexpr
  | Cseq of com * com
  | Cif of bexpr * com * com
  | Cwhile of bexpr * com

