use <modules/customization_functions.scad>;
use <modules/bindshaft_modules.scad>;
use <modules/cavity_modules.scad>;
use <modules/pegset_modules.scad>;
use <modules/proto_CUBX0012_elements.scad>;
use <modules/skin_modules.scad>;
use <modules/snap_modules.scad>;
use <modules/snapset_modules.scad>;
use <modules/style_modules.scad>;

module prime_CUBX0012_BXTX0064_00000200_element()
{
    difference()
    {
        union()
        {
        
            difference()
            {
                proto_CUBX0012_BXTX0064_00000200_element();
                stock_CUBX0012_BXTX0064_00000200_bindshaft();
                stock_CUBX0012_BXTX0064_00000200_cavity();
                translate([0,0,0])
                {
                    mirror([0,0,1])
                    {
                        stock_CUBX0012_BXTX0064_00000200_bindshaft();
                    }
                }

            }
            
            /* Nut Pegs */

            alpha_CUBX0012_BXTX0064_00000200_pegs();
            beta_CUBX0012_BXTX0064_00000200_pegs();
            gamma_CUBX0012_BXTX0064_00000200_pegs();
            delta_CUBX0012_BXTX0064_00000200_pegs();
            theta_CUBX0012_BXTX0064_00000200_pegs();
            
            
        }
        
        stock_CUBX0012_BXTX0064_00000200_undershave();
        stock_CUBX0012_BXTX0064_00000200_topshave();
        
    }
}

module final_CUBX0012_BXTX0064_00000200_element()
{
    
    difference()
    {
        
        union()
        {
            
            difference()
            {
                union()
                {
                    difference()
                    {
                        union()
                        {
                            /* Primordial CEB200 */

                            prime_CUBX0012_BXTX0064_00000200_element();
                            

                        }
                        
                        /* Primary Subtractive Styles & Skins */
                          
                        stock_CEB200_cavity();
                        
                        /* Female Snap Adapters. */
                        
                        alpha_CEB200_adapters();
                        beta_CEB200_adapters();
                        zeta_CEB200_adapters();
                        delta_CEB200_adapters();
                        theta_CEB200_adapters();
                        
                    }
                    
                    /* Snap Modules. */
                    
                    alpha_CEB200_snaps();
                    beta_CEB200_snaps();
                    zeta_CEB200_snaps();
                    delta_CEB200_snaps();
                    theta_CEB200_snaps();
                    
                }
                
                /* Secondary Subtractive Styles & Skins */
                
                //raptor_CCB200_style();
                //stock_CCB200_style();
                //stock_CEB200_canals();
                stock_CEB200_skin(); 
                
            }
            
            /* Top Pegs */
            
            // Top side bind pegs.
            zeta_CCB200_pegs();
            
        }
        
        // Bottomside nut driver shaft.
        stock_CCB200_drivershaft();
        stock_CCB200_cavityrim();
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

module CUBX0012_WXTX0064_00000200_element(function_code, style_code, bind_code)
{

    translate([50.005,0,0])
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
                         box=[100,200,75];
                         cube(box,true);
                    }
                }
                // Box that hides the uneeded half.
                translate([75,0,0])
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

    translate([-50.005,0,0])
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
                         box=[100,200,75];
                         cube(box,true);
                    }
                }
                // Box that hides the uneeded half.
                translate([-75,0,0])
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

module CUBX0012_SXTX0064_00000200_element(function_code, style_code, bind_code)
{
    union()
    {
        translate([50,0,0])
        {
            difference()
            {
                CUBX0012_LXTX0064_00000200_element(function_code, style_code, bind_code);

                box=[100,100,50];
                cube(box,true);

                translate([50,0,0])
                {
                     box=[100,100,50];
                     cube(box,true);
                }
            }
        }
             
        translate([-50,0,0])
        {
            difference()
            {
                CUBX0012_LXTX0064_00000200_element(function_code, style_code, bind_code);
                box=[100,100,50];
                cube(box,true);

                translate([-50,0,0])
                {
                     box=[100,100,50];
                     cube(box,true);
                }
            }
        }
    }

}

module CUBX0012_RSQX0064_00000200_element(function_code, style_code, bind_code)
{
    difference()
    {
        union()
        {
            translate([75,0,0])
            {
                difference()
                {
                    CUBX0012_BXTX0064_00000200_element(function_code, style_code, bind_code);
                    translate([25,0,0])
                    {
                         box=[200,200,50];
                         cube(box,true);
                    }

                }
            }


            translate([-75,0,0])
            {
                difference()
                {
                    CUBX0012_BXTX0064_00000200_element(function_code, style_code, bind_code);
                    translate([-25,0,0])
                    {
                         box=[200,200,50];
                         cube(box,true);
                    }
                }
            }
        } 
    }
}

module CUBX0012_TSQX0064_00000200_element(function_code, style_code, bind_code)
{
   union()
    {
        translate([0,50,0])
        {
            difference()
            {
                CUBX0012_RXTX0064_00000200_element(function_code, style_code, bind_code);

                box=[100,100,50];
                cube(box,true);

                translate([0,50,0])
                {
                     box=[100,100,50];
                     cube(box,true);
                }
            }
        }
             
        translate([0,-50,0])
        {
            difference()
            {
                CUBX0012_RXTX0064_00000200_element(function_code, style_code, bind_code);
                box=[100,100,50];
                cube(box,true);

                translate([0,-50,0])
                {
                     box=[100,100,50];
                     cube(box,true);
                }
            }
        }
    }
}

module CUBX0012_RXTX0064_00000200_element(function_code, style_code, bind_code)
{
    difference()
    {
        union()
        {
            translate([0,62.5,0])
            {
                difference()
                {
                    final_CEB200();
                    translate([0,25,0])
                    {
                         box=[200,175,50];
                         cube(box,true);
                    }

                }
            }


            translate([0,-62.5,0])
            {
                difference()
                {
                    final_CEB200();
                    translate([0,-25,0])
                    {
                         box=[200,175,50];
                         cube(box,true);
                    }
                }
            }
        } 
    }
}

module CUBX0012_TXTX0064_00000200_element(function_code, style_code, bind_code)
{
   union()
    {
        translate([50,0,0])
        {
            difference()
            {
                CUBX0012_RXTX0064_00000200_element(function_code, style_code, bind_code);

                box=[100,100,50];
                cube(box,true);

                translate([50,0,0])
                {
                     box=[100,100,50];
                     cube(box,true);
                }
            }
        }
             
        translate([-50,0,0])
        {
            difference()
            {
                CUBX0012_RXTX0064_00000200_element(function_code, style_code, bind_code);
                box=[100,100,50];
                cube(box,true);

                translate([-50,0,0])
                {
                     box=[100,100,50];
                     cube(box,true);
                }
            }
        }
    }
}






module CUBX0012_BXTX0064_element(rank_code, function_code, style_code, bind_code)
{
    // echo("/CUBX0012/BXTX0064.scad --> Module : CUBX0012_BXTX0064_element() ");
    
    if (rank_code == "00266D66")
    {
        CUBX0012_BXTX0064_00266D66_element(function_code, style_code, bind_code);
    }
    if (rank_code == "00000200")
    {
        /* This function is the true parent superfunction. */
        
        CUBX0012_BXTX0064_00000200_element(function_code, style_code, bind_code);
    }
    if (rank_code == "00000150")
    {
        CUBX0012_BXTX0064_00000150_element(function_code, style_code, bind_code);
    }
    if (rank_code == "000112D5")
    {
        CUBX0012_BXTX0064_000112D5_element(function_code, style_code, bind_code);
    }
    if (rank_code == "0084D375")
    {
        CUBX0012_BXTX0064_0084D375_element(function_code, style_code, bind_code);
    }
    if (rank_code == "63D28125")
    {
        CUBX0012_BXTX0064_63D28125_element(function_code, style_code, bind_code);
    } 
}

module CUBX0012_BXTX0064_00266D66_element(function_code, style_code, bind_code)
{
    scale(4/3) 
    {
        CUBX0012_BXTX0064_00000200_element(function_code, style_code, bind_code);
    }
}

module CUBX0012_BXTX0064_00000200_element(function_code, style_code, bind_code)
{

    difference()
    {
        
        union()
        {
            
            difference()
            {
                union()
                {
                    difference()
                    {
                        union()
                        {
                            /* Primordial CEB200 */

                            prime_CUBX0012_BXTX0064_00000200_element();
                            

                        }
                        
                        /* Primary Subtractive Styles & Skins */
                          
                        stock_CUBX0012_BXTX0064_00000200_cavity();
                        
                        /* Female Snap Adapters. */
                        
                        alpha_CUBX0012_BXTX0064_00000200_adapters();
                        beta_CUBX0012_BXTX0064_00000200_adapters();
                        zeta_CUBX0012_BXTX0064_00000200_adapters();
                        delta_CUBX0012_BXTX0064_00000200_adapters();
                        theta_CUBX0012_BXTX0064_00000200_adapters();
                        
                    }
                    
                    /* Snap Modules. */
                    
                    alpha_CUBX0012_BXTX0064_00000200_snaps();
                    beta_CUBX0012_BXTX0064_00000200_snaps();
                    zeta_CUBX0012_BXTX0064_00000200_snaps();
                    delta_CUBX0012_BXTX0064_00000200_snaps();
                    theta_CUBX0012_BXTX0064_00000200_snaps();
                    
                }
                
                /* Secondary Subtractive Styles & Skins */
                
                //raptor_CUBX0012_BSQX0064_00000200_style();
                //stock_CUBX0012_BSQX0064_00000200_style();
                //stock_CUBX0012_BSQX0064_00000200_canals();
                stock_CUBX0012_BXTX0064_00000200_skin(); 
                
            }
            
            /* Top Pegs */
            
            // Top side bind pegs.
            zeta_CUBX0012_BSQX0064_00000200_pegs();
            
        }
        
        // Bottomside nut driver shaft.
        stock_CUBX0012_BSQX0064_00000200_drivershaft();
        stock_CUBX0012_BSQX0064_00000200_cavityrim();
    }
}

module CUBX0012_BXTX0064_00000150_element(function_code, style_code, bind_code)
{
    scale(3/4) 
    {
        CUBX0012_BXTX0064_00000200_element(function_code, style_code, bind_code);
    }
}

module CUBX0012_BXTX0064_000112D5_element(function_code, style_code, bind_code)
{
    scale(3/4*3/4) 
    {
        CUBX0012_BXTX0064_00000200_element(function_code, style_code, bind_code);
    }
}

module CUBX0012_BXTX0064_0084D375_element(function_code, style_code, bind_code)
{
    scale(3/4*3/4*3/4) 
    {
        CUBX0012_BXTX0064_00000200_element(function_code, style_code, bind_code);
    }
}

module CUBX0012_BXTX0064_63D28125_element(function_code, style_code, bind_code)
{
    scale(3/4*3/4*3/4*3/4) 
    {
        CUBX0012_BXTX0064_00000200_element(function_code, style_code, bind_code);
    }
}
