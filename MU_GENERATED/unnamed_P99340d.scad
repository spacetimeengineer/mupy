
/* Parametric System Instructions : Generated hardware .scad file. */

module unnamed_P99340d()
{
    /* Initialize initial and final position and orientation. These values may be modified for assembly purposes. */

    /* Time */
    t_position_initial = 0;    // Initial time ( from 0 = initial to 1 = final and globally ).
    t_position_final = 0;      // Final time ( from 0 = initial to 1 = final and globally ).

    /* Position */
    x_position_initial = 0;    // Initial 'x' position ( in mm ).
    x_position_final = 0;      // Final 'x' position ( in mm ).
    y_position_initial = 0;    // Initial 'y' position ( in mm ).
    y_position_final = 0;      // Final 'y' position ( in mm ).
    z_position_initial = 0;    // Initial 'z' position ( in mm ).
    z_position_final = 0;      // Final 'z' position ( in mm ).

    /* Orientation */
    x_axis_angle_initial = 0;  // Initial angle along the 'x' axis. ( in degrees ).
    x_axis_angle_final = 0;    // Final angle along the 'x' axis. ( in degrees ).
    y_axis_angle_initial = 0;  // Initial angle along the 'y' axis. ( in degrees ).
    y_axis_angle_final = 0;    // Final angle along the the 'z' axis. ( in degrees ).
    z_axis_angle_final = 0;    // Final angle along the 'z' axis. ( in degrees ).

    /* Animation */
  if ($t >= 0 && $t <= 1)
  {
    translate([0+$t*(0-0) , 0+$t*(0-0), 0+$t*(0-0) ] ) { rotate([0+$t*(0-0), 0+$t*(0-0), 0+$t*(0-0)]) { import("stl_files/CUBX0177-BPAN-B15SR3-X20Y20PP2-RT-SX25Y25-X4Y4-XO0YO0-X4Y4Z10-S.stl"); } }
  }
}
/* Run */
unnamed_P99340d();