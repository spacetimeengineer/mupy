
/* Generic pipe / washer family used for simulating a cylinder with a inner cylindrical cavity. */
module CYLX0006_PIP(length, outer_radius, inner_radius)
{
    difference()
    {
        cylinder(h = length, r1 = outer_radius, r2 = outer_radius, center = true);
        cylinder(h = length+0.01, r1 = inner_radius, r2 = inner_radius, center = true);
    }
}


module CYLX0006_COUP(inner_shaft_radius_a, outer_shaft_radius_a, inner_shaft_depth_a, inner_shaft_radius_b, outer_shaft_radius_b, inner_shaft_depth_b, intershaft_separation_length)
{
    translate([0,0,inner_shaft_depth_a/2])
    {
        // Shaft A
        difference()
        {
            cylinder(h = inner_shaft_depth_a, r1 = outer_shaft_radius_a, r2 = outer_shaft_radius_a, center = true);
            cylinder(h = inner_shaft_depth_a+0.01, r1 = inner_shaft_radius_a, r2 = inner_shaft_radius_a, center = true);
        }
    }
    
    translate([0,0,inner_shaft_depth_a+intershaft_separation_length/2])
    {
        // Intershaft Separation Cone
        difference()
        {
            cylinder(h = intershaft_separation_length, r1 = outer_shaft_radius_a, r2 = outer_shaft_radius_b, center = true);
            cylinder(h = intershaft_separation_length+0.01, r1 = inner_shaft_radius_a - (outer_shaft_radius_a-inner_shaft_radius_a)/3, r2 = inner_shaft_radius_b - (outer_shaft_radius_b-inner_shaft_radius_b)/3, center = true);
        }
    }
    
    
    // Shaft B
    translate([0,0,inner_shaft_depth_a+intershaft_separation_length+inner_shaft_depth_b/2])
    {
        difference()
        {
            cylinder(h = inner_shaft_depth_b, r1 = outer_shaft_radius_b, r2 = outer_shaft_radius_b, center = true);
            cylinder(h = inner_shaft_depth_b+0.01, r1 = inner_shaft_radius_b, r2 = inner_shaft_radius_b, center = true);
        }
    }
    // Intershaft Cone
    
    
}

    

//CYLX0006_COUP(inner_shaft_radius_a=10.0, outer_shaft_radius_a=12.5, inner_shaft_depth_a=50, inner_shaft_radius_b=30, outer_shaft_radius_b=50, inner_shaft_depth_b=50, intershaft_separation_length=100);