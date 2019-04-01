open Vec3

type ray = { origin: vec3; direction: vec3 }

(* linear blend of white and blue *)
let color r =
  let unit_direction = unit_vector r.direction in
  let t = 0.5 *. (unit_direction.y +. 1.) in
  ({ x = 1.; y = 1.; z = 1. } *@ (1.0 -. t)) +:
  ({ x = 0.5; y = 0.7; z = 1. } *@ t)
