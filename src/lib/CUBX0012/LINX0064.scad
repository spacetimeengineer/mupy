use <proto_CAA200.scad>
use <snapset_modules.scad>;
use <pegset_modules.scad>;
use <bindshaft_modules.scad>;
use <cavity_modules.scad>;
use <style_modules.scad>;
use <skin_modules.scad>;

module prime_CCB200()
{
    difference()
    {
        union()
        {
            difference()
            {
                proto_CCB200();
                stock_CCB200_cavity();
                //total_CCB200_cavity();
                alpha_CCB200_bindshafts();
                
                mirror([0,0,1])
                {
                    alpha_CCB200_bindshafts();
                }
            }
                            
            alpha_CCB200_pegs();
            beta_CCB200_pegs();
            gamma_CCB200_pegs();
            
        }
        
        /* Testing */
        //stock_CCB200_cavityrim();
        stock_CCB200_undershave();
        
    }
}



module final_CCB200()
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

                        /* Primordial CCB200 */
                        
                        prime_CCB200();
                        
                        /* Subtractive Female Snap Adapters. */
                        
                        alpha_CCB200_adapters();
                        beta_CCB200_adapters();
                        zeta_CCB200_adapters();
                   
                    }
                    
                    /* Addative Snap Modules. */
                    
                    alpha_CCB200_snaps();
                    beta_CCB200_snaps();
                    zeta_CCB200_snaps();
                
                }
                
                /* Subtractive Styles & Skins */
                
                //stock_CCB200_style();
                stock_CCB200_skin(); 
                //raptor_CCB200_style();
                
            }
            
            // Top side bind pegs.
            zeta_CCB200_pegs();
            
        }
        
        // Bottomside nut driver shaft.
        stock_CCB200_drivershaft();
        stock_CCB200_cavityrim();
        
        
    }

}

module final_CCL200()
{
    union()
    {
        translate([0,50,0])
        {
            difference()
            {
                
                final_CCB200();
                //import("CCB200-ZP-BND21-STND-HHH.stl", convexity = 10);

                box=[200,100,50];
                cube(box,true);

                translate([0,50,0])
                {
                     box=[200,100,50];
                     cube(box,true);
                }
            }
        }
        
        translate([0,-50,0])
        {
            difference()
            {
                
                final_CCB200();
                //import("CCB200-ZP-BND21-STND-HHH.stl", convexity = 10);

                box=[200,100,50];
                cube(box,true);

                translate([0,-50,0])
                {
                     box=[200,100,50];
                     cube(box,true);
                }
            }
        }
    }
}

module final_CCS200()
{
    union()
    {
        translate([50,0,0])
        {
            difference()
            {
                final_CCL200();

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
                final_CCL200();
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

module final_CCR200()
{
    translate([0,75,0])
    {
        difference()
        {
            //import("CCB200-ZP-BND21-STND-HHH.stl");
            final_CCB200();
            translate([0,25,0])
            {
                 box=[200,200,50];
                 cube(box,true);
            }
        }
    }

    translate([0,-75,0])
    {
        difference()
        {
            //import("CCB200-ZP-BND21-STND-HHH.stl");
            final_CCB200();
            translate([0,-25,0])
            {
                 box=[200,200,50];
                 cube(box,true);
            }
        }
    }
}


module final_CCT200()
{
   union()
    {
        translate([50,0,0])
        {
            difference()
            {
                final_CCR200();

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
                final_CCR200();
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


module cubic_module(alpha = -93)
{
    translate([0,0,-alpha])
    {
        rotate([0,0,0])
        {
            color("red",0.35)
            {
                proto_CCB200();
            }
        }
    }
    
    translate([0,alpha,0])
    {
        rotate([90,0,0])
        {
            color("blue",0.35)
            {
                proto_CCB200();
            }
        }
    }

    translate([-alpha,0,0])
    {
        rotate([0,90,0])
        {
            color("green",0.35)
            {
                proto_CCB200();
            }
        }
    }
    
    translate([0,0, alpha])
    {
        rotate([0,180,0])
        {
            color("orange",0.35)
            {
                proto_CCB200();
            }
        }
    }

    translate([0,-alpha,0])
    {
        rotate([270,0,0])
        {
            color("violet", 0.35)
            {
                proto_CCB200();
            }
        }
    }
    
    translate([alpha,0,0])
    {
        rotate([270,0,90])
        {
            
            color("cyan", 0.35)
            {
                proto_CCB200();
            }
        }
    }
}







//cubic_module(alpha = -87.5 );
//translate([200,0,0])
//{
//    cubic_module(alpha = -87.5 );
//}
//translate([200,0,200])
//{
//    cubic_module(alpha = -87.5 );
//}

//proto_CCB200();
prime_CCB200();


//import("arduino_uno.stl");
//import("raspberry_pi_4B.stl");
//import("RPI4__B.stl");






