module panel_e_P1fbe0f()
{
  if ($t >= 0 && $t <= 1)
  {
    translate([0+$t*(0-0) , -300.0+$t*(-100.0--300.0), 0+$t*(0-0) ] ) { rotate([0+$t*(90-0), 0+$t*(0-0), 1000+$t*(0-1000)]) { import("stl_files/CUBX0177-BPAN-B25SR2P5-X8Y8P18-RT-SX25Y25-X8Y8-X20Y20Z5.stl"); } }
  }
}
panel_e_P1fbe0f();