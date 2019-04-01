open Printf

type vec3 = { x: float; y: float; z: float }

let file = "img.ppm"
let nx = 200
let ny = 100

let () =
  let oc = open_out file in
  fprintf oc "P3\n%d %d\n255\n" nx ny;
  for n = 1 to ny do
    let j = ny - n in
    for i = 0 to nx - 1 do
      let v = {
        x = float_of_int(i) /. float_of_int(nx);
        y = float_of_int(j) /. float_of_int(ny) ;
        z = 0.2
      } in
      let ir = int_of_float(255.99 *. v.x) in
      let ig = int_of_float(255.99 *. v.y) in
      let ib = int_of_float(255.99 *. v.z) in
      fprintf oc "%d %d %d \n" ir ig ib;
    done
  done;
  close_out oc;
