

use <BXTX0064.scad>;

module CUBX0012_LXTX0064_element(rank_code, function_code, style_code, bind_code)
{
    // echo("/CUBX0012/LXTX0064.scad --> Module : CUBX0012_LXTX0064_element() ");
    
    if (rank_code == "00266D66")
    {
        CUBX0012_LXTX0064_00266D66_element(function_code, style_code, bind_code);
    }
    if (rank_code == "00000200")
    {
        /* This function is the true parent superfunction. */
        
        CUBX0012_LXTX0064_00000200_element(function_code, style_code, bind_code);
    }
    if (rank_code == "00000150")
    {
        CUBX0012_LXTX0064_00000150_element(function_code, style_code, bind_code);
    }
    if (rank_code == "000112D5")
    {
        CUBX0012_LXTX0064_000112D5_element(function_code, style_code, bind_code);
    }
    if (rank_code == "0084D375")
    {
        CUBX0012_LXTX0064_0084D375_element(function_code, style_code, bind_code);
    }
    if (rank_code == "63D28125")
    {
        CUBX0012_LXTX0064_63D28125_element(function_code, style_code, bind_code);
    } 
}

module CUBX0012_LXTX0064_00266D66_element(function_code, style_code, bind_code)
{
    scale(4/3) 
    {
        CUBX0012_LXTX0064_00000200_element(function_code, style_code, bind_code);
    }
}

module CUBX0012_LXTX0064_00000200_element(function_code, style_code, bind_code)
{

    translate([0,50.005,0])
    {
        // The -y side is visible.
        difference()
        {
            CUBX0012_BXTX0064_00000200_element(function_code, style_code, bind_code);
            union()
            {
                // Middle cut box.
                translate([0,0,0])
                {
                    rotate([0,0,0])
                    {
                         box=[200,100,75];
                         cube(box,true);
                    }
                }
                // Box that hides the uneeded half.
                translate([0,100,0])
                {
                    rotate([0,0,0])
                    {
                         box=[200,200,75];
                         cube(box,true);
                    }
                }
            }
        }
    }

    translate([0,-50.005,0])
    {
        // The +y side is visible.
        difference()
        {

             CUBX0012_BXTX0064_00000200_element(function_code, style_code, bind_code);

            union()
            {
                // Middle cut box.
                translate([0,0,0])
                {
                    rotate([0,0,0])
                    {
                         box=[200,100,75];
                         cube(box,true);
                    }
                }
                // Box that hides the uneeded half.
                translate([0,-100,0])
                {
                    rotate([0,0,0])
                    {
                         box=[200,200,75];
                         cube(box,true);
                    }
                }
            }

        }
    }
}

module CUBX0012_LXTX0064_00000150_element(function_code, style_code, bind_code)
{
    scale(3/4) 
    {
        CUBX0012_LXTX0064_00000200_element(function_code, style_code, bind_code);
    }
}

module CUBX0012_LXTX0064_000112D5_element(function_code, style_code, bind_code)
{
    scale(3/4*3/4) 
    {
        CUBX0012_LXTX0064_00000200_element(function_code, style_code, bind_code);
    }
}

module CUBX0012_LXTX0064_0084D375_element(function_code, style_code, bind_code)
{
    scale(3/4*3/4*3/4) 
    {
        CUBX0012_LXTX0064_00000200_element(function_code, style_code, bind_code);
    }
}

module CUBX0012_LXTX0064_63D28125_element(function_code, style_code, bind_code)
{
    scale(3/4*3/4*3/4*3/4) 
    {
        CUBX0012_LXTX0064_00000200_element(function_code, style_code, bind_code);
    }
}














