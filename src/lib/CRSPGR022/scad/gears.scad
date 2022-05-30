use <gear_modules.scad>
use <girdir_modules.scad>
//rack(modul=1, length=60, height=5, width=20, pressure_angle=20, helix_angle=0);

//mountable_rack(modul=1, length=60, height=5, width=20, pressure_angle=20, helix_angle=0, profile=3, head="PH",fastners=3);

//herringbone_rack(modul=1, length=60, height=5, width=20, pressure_angle=20, helix_angle=45);

//mountable_herringbone_rack(modul=1, length=60, height=5, width=20, pressure_angle=20, helix_angle=45, profile=3, head="PH",fastners=3);

//spur_gear (modul=1, tooth_number=30, width=5, bore=4, pressure_angle=20, helix_angle=20, optimized=true);

//herringbone_gear (modul=1, tooth_number=30, width=5, bore=4, pressure_angle=20, helix_angle=30, optimized=true);

//rack_and_pinion (modul=1, rack_length=50, gear_teeth=30, rack_height=4, gear_bore=4, width=5, pressure_angle=20, helix_angle=0, together_built=true, optimized=true);

//ring_gear (modul=1, tooth_number=30, width=5, rim_width=3, pressure_angle=20, helix_angle=20);

//herringbone_ring_gear (modul=1, tooth_number=30, width=5, rim_width=3, pressure_angle=20, helix_angle=30);

//planetary_gear(modul=1, sun_teeth=16, planet_teeth=9, number_planets=5, width=5, rim_width=3, bore=4, pressure_angle=20, helix_angle=30, together_built=true, optimized=true);

//bevel_gear(modul=1, tooth_number=30,  partial_cone_angle=45, tooth_width=5, bore=4, pressure_angle=20, helix_angle=20);

//bevel_herringbone_gear(modul=1, tooth_number=30, partial_cone_angle=45, tooth_width=5, bore=4, pressure_angle=20, helix_angle=30);

//bevel_gear_pair(modul=1, gear_teeth=50, pinion_teeth=50, axis_angle=90, tooth_width=5, gear_bore=4, pinion_bore=4, pressure_angle = 20, helix_angle=0, together_built=true);

//bevel_herringbone_gear_pair(modul=1, gear_teeth=30, pinion_teeth=11, axis_angle=100, tooth_width=5, gear_bore=4, pinion_bore=4, pressure_angle = 20, helix_angle=30, together_built=true);

//worm(modul=1, thread_starts=2, length=15, bore=4, pressure_angle=20, lead_angle=10, together_built=true);

//worm_gear(modul=1, tooth_number=30, thread_starts=2, width=8, length=20, worm_bore=4, gear_bore=4, pressure_angle=20, lead_angle=10, optimized=1, together_built=1, show_spur=1, show_worm=1);


/* Testing from teeth = 10 at origin. */



module gear_10()
{
    translate([0,0,-3.75])
    {

            spur_gear (modul=1, tooth_number=10, width=7.5, bore=5, pressure_angle=20, helix_angle=0, optimized=true);

        
    }


    translate([10,0,-3.75])
    {

        rotate([0,0,18])
        {
            spur_gear (modul=1, tooth_number=10, width=7.5, bore=5, pressure_angle=20, helix_angle=0, optimized=true);
        }
        
    }
    
}
module gear_30()
{
    translate([20,0,-3.75])
    {

        rotate([0,0,18])
        {
            //spur_gear (modul=1, tooth_number=30, width=7.5, bore=5, pressure_angle=20, helix_angle=0, optimized=true);
        }
    
    }
}
    
module gear_50()
{
    translate([-30,0,-3.75])
    {
            rotate([0,0,11])
            {
                //spur_gear (modul=1, tooth_number=50, width=7.5, bore=5, pressure_angle=20, helix_angle=0, optimized=true);
            }
        
    }
}

module gear_70()
{    
    translate([-40,0,-3.75])
    {
        rotate([0,0,13])
        {
            //spur_gear (modul=1, tooth_number=70, width=7.5, bore=5, pressure_angle=20, helix_angle=0, optimized=true);
        }
    }
}
    
module gear_90()
{
    translate([-50,0,-3.75])
    {
        rotate([0,0,18])
        {
            //spur_gear (modul=1, tooth_number=90, width=7.5, bore=9, pressure_angle=20, helix_angle=0, optimized=true);
        }
    }
}

module gear_110()
{
    translate([-60,0,-3.75])
    {
        rotate([0,0,18])
        {
            //spur_gear (modul=1, tooth_number=110, width=7.5, bore=9, pressure_angle=20, helix_angle=0, optimized=true);
        }
    }
} 


module gear_130()
{
    translate([-70,0,-3.75])
    {
        rotate([0,0,18])
        {
            //spur_gear (modul=1, tooth_number=130, width=7.5, bore=9, pressure_angle=20, helix_angle=0, optimized=true);
        }
    }
}

module gear_20()
{
    /* Testing from teeth = 20 at origin. */
    
    translate([0,0,-5])
    {
        rotate([0,0,5])
        {
            spur_gear (modul=1, tooth_number=20, width=10, bore=0, pressure_angle=20, helix_angle=0, optimized=false);
        }
        
    }

}


module gear_40()
{
    translate([0,0,-5])
    {
        rotate([0,0,5])
        {
            spur_gear (modul=1, tooth_number=40, width=10, bore=0, pressure_angle=20, helix_angle=0, optimized=false);
        }
        
    }
}


module gear_60()
{
    translate([40,0,-3.75])
    {

        rotate([0,0,15])
        {
            //spur_gear (modul=1, tooth_number=60, width=7.5, bore=5, pressure_angle=20, helix_angle=0, optimized=true);
        }
        
    }
}

module gear_80()
{
    translate([0,0,-5])
    {
        rotate([0,0,5])
        {
            spur_gear (modul=1, tooth_number=80, width=10, bore=0, pressure_angle=20, helix_angle=0, optimized=false);
        }
        
    }
}

module gear_100()
{
    translate([60,0,-3.75])
    {
        rotate([0,0,15.5])
        {
            //spur_gear (modul=1, tooth_number=100, width=7.5, bore=5, pressure_angle=20, helix_angle=0, optimized=true);
        }
        
    }
}


gear_40();
        
        
difference()
{

    //gear_20();
    translate([0,0,0])
    {
        rotate([0,90,0])
        {
            scale([2.03,2.03,2.03])
            {
                prime_girdir(1,1);
            }
        }
    }
}