open Vec3

type ray = { origin: vec3; direction: vec3 }

(* Check if ray hits a sphere defined by center and radius *)
let hit_sphere center radius ray =
  let oc = ray.origin -: center in
  let a = dot ray.direction ray.direction in
  let b = 2. *. dot oc ray.direction in
  let c = dot oc oc -. (radius *. radius) in
  let discrimant = b *. b -. 4. *. a *. c in
  discrimant > 0.

(* linear blend of white and blue *)
let color r =
  if hit_sphere { x = 0.; y = 0.; z = -1. } 0.5 r
  then { x = 1.; y = 0.; z = 0. }
  else
    let unit_direction = unit_vector r.direction in
    let t = 0.5 *. (unit_direction.y +. 1.) in
    ({ x = 1.; y = 1.; z = 1. } *@ (1.0 -. t)) +:
    ({ x = 0.5; y = 0.7; z = 1. } *@ t)
