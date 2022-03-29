module AS200(length = 175, radius = 5)
{
    difference()
    {
        translate([0,0,0])
        {
            rotate([90,0,90])
            {
                cylinder(h = length, r1 = radius, r2 = radius, center = true);
            }
        }
        
        for (i = [-length-radius/2:10:length/2-radius/2])
        {
            translate([i,0,0])
            {
                rotate([90,0,0])
                {
                    cylinder(h = length, r1 = radius*2/4, r2 = radius*2/4, center = true);
                }
            }
        }
    }
}


/* Testing */

AS200();