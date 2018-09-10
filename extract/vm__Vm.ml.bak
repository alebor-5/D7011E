type pos = Z.t

type stack = (Z.t) list

type machine_state =
  | VMS of (Z.t) * ((Z.t) list) * (State__State.id -> (Z.t))

type ofs = Z.t

type instr =
  | Iconst of (Z.t)
  | Ivar of State__State.id
  | Isetvar of State__State.id
  | Ibranch of (Z.t)
  | Iadd
  | Iaddu
  | Isub
  | Ibeq of (Z.t)
  | Ibne of (Z.t)
  | Ible of (Z.t)
  | Ibgt of (Z.t)
  | Ihalt

type code = instr list

let push (n: Z.t) (s: (Z.t) list) : (Z.t) list = n :: s

let iconst (n: Z.t) : instr list = (Iconst n) :: []

let ivar (x: State__State.id) : instr list = (Ivar x) :: []

let isetvar (x: State__State.id) : instr list = (Isetvar x) :: []

let iadd  : instr list = Iadd :: []

let iaddu  : instr list = Iaddu :: []

let isub  : instr list = Isub :: []

let ibeq (ofs: Z.t) : instr list = (Ibeq ofs) :: []

let ible (ofs: Z.t) : instr list = (Ible ofs) :: []

let ibne (ofs: Z.t) : instr list = (Ibne ofs) :: []

let ibgt (ofs: Z.t) : instr list = (Ibgt ofs) :: []

let ibranch (ofs: Z.t) : instr list = (Ibranch ofs) :: []

let ihalt  : instr list = Ihalt :: []

