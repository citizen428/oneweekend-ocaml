open Core

type vec3 = { x: float; y: float; z: float }

(* Vector addition *)
let (+:) v1 v2 = { x = v1.x +. v2.x; y = v1.y +. v2.y; z = v1.z +. v2.z }

(* Multiply vector with scalar *)
let ( *@ ) v t = { x = v.x *. t ; y = v.y *. t ; z = v.z *. t }

(* Divide vector by scalar *)
let ( /@ ) v t = { x = v.x /. t ; y = v.y /. t ; z = v.z /. t }

let length v = sqrt (v.x *. v.x +. v.y *. v.y +. v.z *. v.z)

let unit_vector v = v /@ length v
