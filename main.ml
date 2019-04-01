open Printf
open Vec3
open Ray

let file = "img.ppm"
let nx = 200
let ny = 100

let () =
  let oc = open_out file in
  fprintf oc "P3\n%d %d\n255\n" nx ny;
  let lower_left_corner = { x = -2.; y = -1.; z = -1. } in
  let horizontal = { x = 4.; y = 0.; z = 0. } in
  let vertical = { x = 0.; y = 2.; z = 0. } in
  let origin ={ x = 0.; y = 0.; z = 0. } in
  for n = 1 to ny do
    let j = ny - n in
    for i = 0 to nx - 1 do
      let u = float_of_int(i) /. float_of_int(nx) in
      let v = float_of_int(j) /. float_of_int(ny) in
      let dir = lower_left_corner +: (horizontal *@ u) +: (vertical *@ v) in
      let r = { origin = origin; direction = dir } in
      let col = color(r) in
      let ir = int_of_float(255.99 *. col.x) in
      let ig = int_of_float(255.99 *. col.y) in
      let ib = int_of_float(255.99 *. col.z) in
      fprintf oc "%d %d %d \n" ir ig ib;
    done
  done;
  close_out oc;
