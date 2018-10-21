type idr = Z.t

type regs = (Z.t) -> (Z.t)

let read (f: (Z.t) -> (Z.t)) (x: Z.t) : Z.t = f x

let write (f: (Z.t) -> (Z.t)) (x: Z.t) (v: Z.t) : (Z.t) -> (Z.t) =
  fun (y: Z.t) -> if Z.equal x y then begin v end else begin f y end

let const (v: Z.t) : (Z.t) -> (Z.t) = fun (_: Z.t) -> v

