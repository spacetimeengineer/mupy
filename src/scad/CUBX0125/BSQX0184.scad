use <modules/customization_functions.scad>;
use <modules/bindshaft_modules.scad>;
use <modules/cavity_modules.scad>;
use <modules/pegset_modules.scad>;
use <modules/proto_CUBX0012_elements.scad>;
use <modules/skin_modules.scad>;
use <modules/style_modules.scad>;

module angled_box_cut()
{
    difference()
    {
        translate([0,0,0])
        {
            rotate([0,0,0])
            {
                 box=[25,25,25];
                 cube(box,true);
            }
        }
        
        translate([0,0,0])
        {
            rotate([0,0,0])
            {
                 box=[12.5,20,20];
                 cube(box,true);
            }
        }
        
        translate([0,17.65,0])
        {
            rotate([0,45,90])
            {
                 box=[75,50,25];
                 cube(box,true);
            }
        }
        
        translate([28,0,0])
        {
            rotate([45,45,90])
            {
                 box=[100,25,25];
                 //cube(box,true);
            }
        }
        
        translate([-28,0,0])
        {
            rotate([45,45,90])
            {
                 box=[100,25,25];
                 //cube(box,true);
            }
        }
        
        translate([-25,0,-15])
        {
            rotate([45,0,90])
            {
                 box=[100,25,25];
                 cube(box,true);
            }
        }
        
        translate([25,0,-15])
        {
            rotate([45,0,90])
            {
                 box=[100,25,25];
                 cube(box,true);
            }
        }
        
    }
}

//angled_box_cut();

module proto_CUBX0125_BSQX0184_00000200_layer_1()
{
    translate([0,0,0])
    {
        rotate([0,0,0])
        {
             box=[150,150,25];
             cube(box,true);
        }
    }
    
    translate([75+25/2,75-25/2,0])
    {
        rotate([0,0,270])
        {
             angled_box_cut();
        }
    }
    
    /* Corner box */
    
    translate([75+25/2,75+25/2,0])
    {
        rotate([0,0,270])
        {
             box=[25.1,25,25];
             cube(box,true);
        }
    }
    
    translate([75+25/2,75-25/2-50,0])
    {
        rotate([0,0,270])
        {
            angled_box_cut();
            
        }
    }
    
    translate([75+25/2,75-25/2-100,0])
    {
        rotate([0,0,270])
        {
             angled_box_cut();
        }
    }
    
    translate([75-25/2-25,75+25/2,0])
    {
        rotate([0,0,0])
        {
             angled_box_cut();
        }
    }
    
    translate([75-25/2-75, 75+25/2,0])
    {
        rotate([0,0,0])
        {
             angled_box_cut();
        }
    }
    
    translate([75-25/2-125, 75+25/2,0])
    {
        rotate([0,0,0])
        {
             angled_box_cut();
        }
    }
    
    /* Corner box */
    
    translate([75-25*3/2-125, 75+25/2,0])
    {
        rotate([0,0,0])
        {
             box=[25.1,25,25];
             cube(box,true);
        }
    }
    
    translate([-75-25/2,75-25/2-25,0])
    {
        rotate([0,0,90])
        {
             angled_box_cut();
        }
    }
    
    translate([-75-25/2,75-25/2-75,0])
    {
        rotate([0,0,90])
        {
             angled_box_cut();
        }
    }
    
    translate([-75-25/2,75-25/2-125,0])
    {
        rotate([0,0,90])
        {
              angled_box_cut();
        }
    }
    
    translate([-75-25/2,75-25*3/2-125,0])
    {
        rotate([0,0,90])
        {
             box=[25.1,25,25];
             cube(box,true);
        }
    }
    
    translate([75+25/2,-75-25/2,0])
    {
        rotate([0,0,180])
        {
             box=[25.1,25,25];
             cube(box,true);
        }
    }
    
    translate([75-25/2,-75-25/2,0])
    {
        rotate([0,0,180])
        {
             angled_box_cut();
        }
    }
    
    translate([75-25/2-50, -75-25/2,0])
    {
        rotate([0,0,180])
        {
             angled_box_cut();
        }
    }
    
    translate([75-25/2-100, -75-25/2,0])
    {
        rotate([0,0,180])
        {
             angled_box_cut();
        }
    }
}










module proto_CUBX0125_BSQX0184_00000200_layer_2()
{
        
    difference()
    {
        union()
        {

            
    translate([75+25/2,75-25/2,0])
    {
        rotate([0,0,270])
        {
             angled_box_cut();
        }
    }
    
    
    translate([75+25/2,75-25/2-50,0])
    {
        rotate([0,0,270])
        {
            angled_box_cut();
            
        }
    }
    
    translate([75+25/2,75-25/2-100,0])
    {
        rotate([0,0,270])
        {
             angled_box_cut();
        }
    }
    
    translate([75-25/2-25,75+25/2,0])
    {
        rotate([0,0,0])
        {
             angled_box_cut();
        }
    }
    
    translate([75-25/2-75, 75+25/2,0])
    {
        rotate([0,0,0])
        {
             angled_box_cut();
        }
    }
    
    translate([75-25/2-125, 75+25/2,0])
    {
        rotate([0,0,0])
        {
             angled_box_cut();
        }
    }
    
    
    translate([-75-25/2,75-25/2-25,0])
    {
        rotate([0,0,90])
        {
             angled_box_cut();
        }
    }
    
    translate([-75-25/2,75-25/2-75,0])
    {
        rotate([0,0,90])
        {
             angled_box_cut();
        }
    }
    
    translate([-75-25/2,75-25/2-125,0])
    {
        rotate([0,0,90])
        {
              angled_box_cut();
        }
    }
    
    translate([75-25/2,-75-25/2,0])
    {
        rotate([0,0,180])
        {
             angled_box_cut();
        }
    }
    
    translate([75-25/2-50, -75-25/2,0])
    {
        rotate([0,0,180])
        {
             angled_box_cut();
        }
    }
    
    translate([75-25/2-100, -75-25/2,0])
    {
        rotate([0,0,180])
        {
             angled_box_cut();
        }
    }
        }

        translate([0,-105.175,0])
        {
            rotate([45,0,0])
            {   
                box=[150.002,150,25];
                cube(box,true);
            }
        }

        translate([0,105.175,0])
        {
            rotate([-45,0,0])
            {   
                box=[150.002,150,25];
                cube(box,true);
            }
        }
        
        translate([105.175,0,0])
        {
            rotate([0,45,0])
            {   
                box=[150,150.002,25];
                cube(box,true);
            }
        }
        
        translate([-105.175,0,0])
        {
            rotate([0,-45,0])
            {   
                box=[150,150.002,25];
                cube(box,true);
            }
        }

    }
    
}







module proto_CUBX0125_BSQX0184_00000200_layer_3()
{
    
    /* +x side.  */

    translate([75+25/2,25*3/2,0])
    {
        rotate([0,0,90])
        {
             box=[26,25,25];
             cube(box,true);
        }
    }
    
    translate([75+25/2,-25/2,0])
    {
        rotate([0,0,90])
        {
             box=[26,25,25];
             cube(box,true);
        }
    }
    
    translate([75+25/2,-5/2*25,0])
    {
        rotate([0,0,90])
        {
             box=[26,25,25];
             cube(box,true);
        }
    }
    
    /* +y side. */
    
    translate([75-25/2,7/2*25,0])
    {
        rotate([0,0,90])
        {
             box=[25,26,25];
             cube(box,true);
        }
    }
    
    translate([75-25*5/2, 75+25/2,0])
    {
        rotate([0,0,90])
        {
             box=[25,25,25];
             cube(box,true);
        }
    }
    
    translate([75-25/2-75-25, 75+25/2,0])
    {
        rotate([0,0,90])
        {
             box=[25,25,25];
             cube(box,true);
        }
    }
    
    
    /* */
    translate([-75-25/2,75-25/2,0])
    {
        rotate([0,0,90])
        {
             box=[25,25,25];
             cube(box,true);
        }
    }
    
    translate([-75-25/2,75-25/2-50,0])
    {
        rotate([0,0,90])
        {
             box=[25,25,25];
             cube(box,true);
        }
    }
    
    translate([-75-25/2,75-25/2-100,0])
    {
        rotate([0,0,90])
        {
             box=[25,25,25];
             cube(box,true);
        }
    }
    
    translate([25*3/2,-75-25/2,0])
    {
        rotate([0,0,90])
        {
             box=[25,25,25];
             cube(box,true);
        }
    }
    
    translate([-25/2, -75-25/2,0])
    {
        rotate([0,0,90])
        {
             box=[25,25,25];
             cube(box,true);
        }
    }
    
    translate([-25*5/2, -75-25/2,0])
    {
        rotate([0,0,90])
        {
             box=[25,25,25];
             cube(box,true);
        }
    }
}



module proto_CUBX0125_BSQX0184_00000200_element()
{

    intersection()
    {
        proto_CUBX0125_BSQX0184_00000200_layer_1();
        import("proto_CUBX0012_BSQX0064_00000200.stl");
    }
    
    proto_CUBX0125_BSQX0184_00000200_layer_2();
        
}







module prime_CUBX0125_BSQX0184_00000200_element()
{
    difference()
    {
        union()
        {
            difference()
            {
                proto_CUBX0125_BSQX0184_00000200_element();
                
                stock_CUBX0012_BSQX0064_00000200_cavity();
                alpha_CUBX0012_BSQX0064_00000200_bindshafts();
                
                mirror([0,0,1])
                {
                    alpha_CUBX0012_BSQX0064_00000200_bindshafts();
                }
            }
                            
            alpha_CUBX0012_BSQX0064_00000200_pegs();
            beta_CUBX0012_BSQX0064_00000200_pegs();
            gamma_CUBX0012_BSQX0064_00000200_pegs();
            
        }
        
        /* Testing */
        
        //stock_CUBX0012_BSQX0064_00000200_cavityrim();
        stock_CUBX0012_BSQX0064_00000200_undershave();
        proto_CUBX0125_BSQX0184_00000200_layer_3();
        
    }
}












module CUBX0125_BSQX0184_element(rank_code, function_code, style_code, bind_code)
{
    // echo("/CUBX0012/BSQX0184.scad --> Module : CUBX0125_BSQX0184_element() ");
    
    if (rank_code == "00266D66")
    {
        CUBX0125_BSQX0184_00266D66_element(function_code, style_code, bind_code);
    }
    if (rank_code == "00000200")
    {
        /* This function is the true parent superfunction. */
        
        CUBX0125_BSQX0184_00000200_element(function_code, style_code, bind_code);
    }
    if (rank_code == "00000150")
    {
        CUBX0125_BSQX0184_00000150_element(function_code, style_code, bind_code);
    }
    if (rank_code == "000112D5")
    {
        CUBX0125_BSQX0184_000112D5_element(function_code, style_code, bind_code);
    }
    if (rank_code == "0084D375")
    {
        CUBX0125_BSQX0184_0084D375_element(function_code, style_code, bind_code);
    }
    if (rank_code == "63D28125")
    {
        CUBX0125_BSQX0184_63D28125_element(function_code, style_code, bind_code);
    } 
}

module CUBX0125_BSQX0184_00266D66_element(function_code, style_code, bind_code)
{
    scale(4/3) 
    {
        CUBX0125_BSQX0184_00000200_element(function_code, style_code, bind_code);
    }
}

module CUBX0125_BSQX0184_00000200_element(function_code, style_code, bind_code)
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

                        /* Primordial CUBX0012-BSQX0184-00000200 */
                        
                        prime_CUBX0125_BSQX0184_00000200_element();
                        
                   
                    }
                    
                    /* Addative Snap Modules. */
                    
                    //generate_binds(bind_code);
                    

                
                }
                
                /* Subtractive Styles. */
                raptor_CUBX0012_BSQX0064_00000200_style(alpha = 49.2, gamma = 18, beta = 65.3, zeta = 15.5);
                stock_CUBX0012_BSQX0064_00000200_style();
                stock_CUBX0012_BSQX0064_00000200_skin(zeta=-9);
                      
            }
            
            /* Addative Functions. */
            
            //generate_functions(function_code);
            
            /* Top side bind pegs. */

            zeta_CUBX0012_BSQX0064_00000200_pegs();
            
        }
        
        /* Bottomside nut driver shaft. */
        
        stock_CUBX0012_BSQX0064_00000200_drivershaft();
        stock_CUBX0012_BSQX0064_00000200_cavityrim();
        
        
    }
}

module CUBX0125_BSQX0184_00000150_element(function_code, style_code, bind_code)
{
    scale(3/4) 
    {
        CUBX0125_BSQX0184_00000200_element(function_code, style_code, bind_code);
    }
}

module CUBX0125_BSQX0184_000112D5_element(function_code, style_code, bind_code)
{
    scale(3/4*3/4) 
    {
        CUBX0125_BSQX0184_00000200_element(function_code, style_code, bind_code);
    }
}

module CUBX0125_BSQX0184_0084D375_element(function_code, style_code, bind_code)
{
    scale(3/4*3/4*3/4) 
    {
        CUBX0125_BSQX0184_00000200_element(function_code, style_code, bind_code);
    }
}

module CUBX0125_BSQX0184_63D28125_element(function_code, style_code, bind_code)
{
    scale(3/4*3/4*3/4*3/4) 
    {
        CUBX0125_BSQX0184_00000200_element(function_code, style_code, bind_code);
    }
}


module cubic_module(alpha = -93)
{
    translate([0,0,-alpha])
    {
        rotate([0,0,0])
        {
            color("red",0.65)
            {
                CUBX0125_BSQX0184_00000200_element(function_code, style_code, bind_code);
            }
        }
    }
    
    translate([0,alpha,0])
    {
        rotate([90,0,0])
        {
            color("blue",0.65)
            {
                CUBX0125_BSQX0184_00000200_element(function_code, style_code, bind_code);
            }
        }
    }

    translate([-alpha,0,0])
    {
        rotate([0,90,0])
        {
            color("green",0.65)
            {
                CUBX0125_BSQX0184_00000200_element(function_code, style_code, bind_code);
            }
        }
    }
    
    translate([0,0, alpha])
    {
        rotate([0,180,0])
        {
            color("orange",0.65)
            {
                CUBX0125_BSQX0184_00000200_element(function_code, style_code, bind_code);
            }
        }
    }

    translate([0,-alpha,0])
    {
        rotate([270,0,0])
        {
            color("violet", 0.65)
            {
                CUBX0125_BSQX0184_00000200_element(function_code, style_code, bind_code);
            }
        }
    }
    
    translate([alpha,0,0])
    {
        rotate([270,0,90])
        {
            
            color("cyan", 0.65)
            {
                CUBX0125_BSQX0184_00000200_element(function_code, style_code, bind_code);
            }
        }
    }
}




/* Testing */

//prime_CUBX0125_BSQX0184_00000200_element();
scale(3/4*3/4*3/4)
{
    CUBX0125_BSQX0184_00000200_element(function_code, style_code, bind_code);
}
//proto_CUBX0125_BSQX0184_00000200_layer_1();
//proto_CUBX0125_BSQX0184_00000200_layer_2();
//proto_CUBX0125_BSQX0184_00000200_layer_3();
//cubic_module(alpha = -125);
//proto_CUBX0125_BSQX0184_00000200_element();
//angled_box_cut();