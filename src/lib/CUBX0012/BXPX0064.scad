/* Imports */
use <proto_CAA200.scad>;
use <snapset_modules.scad>;
use <pegset_modules.scad>;
use <bindshaft_modules.scad>;
use <cavity_modules.scad>;
use <style_modules.scad>;
use <skin_modules.scad>;

module prime_CXB200()
{
    
    
    difference()
    {
    
        union()
        {
        
            difference()
            {
                // Proto CXB200.
                proto_CXB200();
                stock_CXB200_cavity();
                stock_CXB200_bindshafts();

                mirror([0,0,1])
                {
                    stock_CXB200_bindshafts();
                }
            }
            
            delta_CXB200_pegs();
            theta_CXB200_pegs();
        
        }
        
        stock_CXB200_undershave();
        stock_CXB200_topshave();
    
    }
    
}

module final_CXB200()
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

                        /* Primordial CXB200 */
                            
                        prime_CXB200();


                        /* Female Snap Adapters. */
                        
                        delta_CXB200_adapters();
                        theta_CXB200_adapters();
                        zeta_CXB200_adapters();

                    }
                    
                    /* Snap modules. */
                    
                    delta_CXB200_snaps();
                    theta_CXB200_snaps();
                    zeta_CXB200_snaps();
            
                }
                
                /* Subtractive Styles & Skins */
                
                //raptor_CCB200_style();
                //stock_CXB200_style();
                stock_CXB200_skin();
                stock_CXB200_undershave();
                
            }

            zeta_CXB200_pegs();
        }
        
        // Bottomside nut driver shaft.
        stock_CCB200_drivershaft();
        stock_CCB200_cavityrim();
        
    }
}

module final_CXL200()
{
    union()
    {
        translate([0,50,0])
        {
            difference()
            {
                
                final_CXB200();

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
                
                final_CXB200();

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

module final_CXS200()
{
    union()
    {
        translate([50,0,0])
        {
            difference()
            {
                final_CXL200();

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
                final_CXL200();
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


module final_CXR200()
{
    difference()
    {
        union()
        {
            translate([0,62.5,0])
            {
                difference()
                {
                    final_CXB200();
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
                    final_CXB200();
                    translate([0,-25,0])
                    {
                         box=[200,175,50];
                         cube(box,true);
                    }
                }
            }
        }
        
        
        
        translate([0,0,-25])
        {
             box=[200,200,50];
             cube(box,true);
        }
        
        
    }
    
}

module final_CXT200()
{
   union()
    {
        translate([50,0,0])
        {
            difference()
            {
                final_CXR200();

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
                final_CXR200();
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





/* Testing */





scale(0.5625)
{
    //proto_CXB200();
    //prime_CXB200();
    //final_CXB200();

    //final_CXL200();
    //final_CXS200();
    final_CXR200();
    //final_CXT200();
}

