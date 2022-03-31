
/* Imports */

use <proto_CUBX0012_elements.scad>;
use <bindshaft_modules.scad>;


/* Constants */

stock_CUBX0012_BSQX0064_00000200_peg_outer_radius = 6.5;
stock_CUBX0012_BSQX0064_00000200_peg_inner_radius = 2.5;
zeta_CUBX0012_BSQX0064_00000200_peg_outer_radius = 10;
zeta_CUBX0012_BSQX0064_00000200_peg_inner_radius = 2.5;


module outer_CUBX0012_BSQX0064_00000200_pegs(outer_radius = 6.5, inner_radius = stock_CUBX0012_BSQX0064_00000200_peg_inner_radius, height = 25, cut_height = 600, alpha = 75, beta = 50, gamma=-3.65)
{
    
    

translate([0,0,0])

    difference()
    {
        union()
        {

         
            // Middle +y edge binding peg for nut.
            translate([0,alpha,0])
            {
                // Extention plate.
                rotate([-45,0,0])
                {
                    translate([0,0,gamma])
                    {
                        cylinder(h = height, r1 = outer_radius, r2 = outer_radius, center = true);
                    }
                }
            }
         
            // Peg that hold nut.
            translate([0,alpha,0])
            {
                // Extention plate.
                rotate([-45,0,0])
                {
                    translate([beta,0,gamma])
                    {
                        cylinder(h = height, r1 = outer_radius, r2 = outer_radius, center = true);
                    }
                }
            }
            
            // Peg that hold nut.
            translate([0,alpha,0])
            {
                // Extention plate.
                rotate([-45,0,0])
                {
                    translate([-beta,0,gamma])
                    {
                        cylinder(h = height, r1 = outer_radius, r2 = outer_radius, center = true);
                    }
                }
            }


            
            // Middle -y edge binding peg for nut.
            translate([0,-alpha,0])
            {
                // Extention plate.
                rotate([45,0,0])
                {
                    translate([0,0,gamma])
                    {
                        cylinder(h = height, r1 = outer_radius, r2 = outer_radius, center = true);
                    }
                }
            }
            
            
            // Peg that hold nut.
            translate([0,-alpha,0])
            {
                // Extention plate.
                rotate([45,0,0])
                {
                    translate([beta,0,gamma])
                    {
                        cylinder(h = height, r1 = outer_radius, r2 = outer_radius, center = true);
                    }
                }
            }
            
            // Peg that hold nut.
            translate([0,-alpha,0])
            {
                // Extention plate.
                rotate([45,0,0])
                {
                    translate([-beta,0,gamma])
                    {
                        cylinder(h = height, r1 = outer_radius, r2 = outer_radius, center = true);
                    }
                }
            }

            
            //Middle +x edge binding peg for nut.
            translate([alpha,0,0])
            {
                rotate([0,45,0])
                {
                    translate([0,0,gamma])
                    {
                        cylinder(h = height, r1 = outer_radius, r2 = outer_radius, center = true);
                    }
                }
            }
            

            // Peg that hold nut.
            translate([alpha,0,0])
            {
                rotate([0,45,0])
                {
                    translate([0,beta,gamma])
                    {
                        cylinder(h = height, r1 = outer_radius, r2 = outer_radius, center = true);
                    }
                }
            }

            // Peg that hold nut.
            translate([alpha,0,0])
            {
                rotate([0,45,0])
                {
                    translate([0,-beta,gamma])
                    {
                        cylinder(h = height, r1 = outer_radius, r2 = outer_radius, center = true);
                    }
                }
            }

            
            // Middle -x edge binding peg for nut.
            translate([-alpha,0,0])
            {
                rotate([0,-45,0])
                {
                    translate([0,0,gamma])
                    {
                        cylinder(h = height, r1 = outer_radius, r2 = outer_radius, center = true);
                    }
                }
            }
            
            
            // Peg that hold nut.
            translate([-alpha,0,0])
            {
                rotate([0,-45,0])
                {
                    translate([0,beta,gamma])
                    {
                        cylinder(h = height, r1 = outer_radius, r2 = outer_radius, center = true);
                    }
                }
            }
            
            // Peg that hold nut.
            translate([-alpha,0,0])
            {
                rotate([0,-45,0])
                {
                    translate([0,-beta,gamma])
                    {
                        cylinder(h = height, r1 = outer_radius, r2 = outer_radius, center = true);
                    }
                }
            }
        }

        // Thin pipe cut for bolt.
        translate([0,alpha,0])
        {
            rotate([-45,0,0])
            {
                translate([0,0,0])
                {
                    cylinder(h = cut_height, r1 = inner_radius, r2 = inner_radius, center = true);
                }
                
            }
        }
        
        // Thin pipe cut for bolt.
        translate([0,alpha,0])
        {
            rotate([-45,0,0])
            {
                translate([beta,0,0])
                {
                    cylinder(h = cut_height, r1 = inner_radius, r2 = inner_radius, center = true);
                }
                
            }
        }
        
        // Thin pipe cut for bolt.
        translate([0,alpha,0])
        {
            rotate([-45,0,0])
            {
                translate([-beta,0,0])
                {
                    cylinder(h = cut_height, r1 = inner_radius, r2 = inner_radius, center = true);
                }
                
            }
        }
        
        // Thin pipe cut for bolt.
        translate([0,-alpha,0])
        {
            rotate([45,0,0])
            {
                translate([0,0,0])
                {
                    cylinder(h = cut_height, r1 = inner_radius, r2 = inner_radius, center = true);
                }
                
            }
        }
        
        // Thin pipe cut for bolt.
        translate([0,-alpha,0])
        {
            rotate([45,0,0])
            {
                translate([beta,0,0])
                {
                    cylinder(h = cut_height, r1 = inner_radius, r2 = inner_radius, center = true);
                }
            }
        }
        
        // Thin pipe cut for bolt.
        translate([0,-alpha,0])
        {
            rotate([45,0,0])
            {
                translate([-beta,0,0])
                {
                    cylinder(h = cut_height, r1 = inner_radius, r2 = inner_radius, center = true);
                }
                
            }
        }
        
        // Thin pipe cut for bolt.
        translate([alpha,0,0])
        {
            rotate([0,45,0])
            {
                translate([0,0,0])
                {
                    cylinder(h = cut_height, r1 = inner_radius, r2 = inner_radius, center = true);
                }
                
            }
        }
        
        // Thin pipe cut for bolt.
        translate([alpha,0,0])
        {
            rotate([0,45,0])
            {
                translate([0,beta,0])
                {
                    cylinder(h = cut_height, r1 = inner_radius, r2 = inner_radius, center = true);
                }
                
            }
        }
        
        // Thin pipe cut for bolt.
        translate([alpha,0,0])
        {
            rotate([0,45,0])
            {
                translate([0,-beta,0])
                {
                    cylinder(h = cut_height, r1 = inner_radius, r2 = inner_radius, center = true);
                }
                
            }
        }
        
        // Thin pipe cut for bolt.
        translate([-alpha,0,0])
        {
            rotate([0,-45,0])
            {
                translate([0,0,0])
                {
                    cylinder(h = cut_height, r1 = inner_radius, r2 = inner_radius, center = true);
                }
                
            }
        }
        
        // Thin pipe cut for bolt.
        translate([-alpha,0,0])
        {
            rotate([0,-45,0])
            {
                translate([0,beta,0])
                {
                    cylinder(h = cut_height, r1 = inner_radius, r2 = inner_radius, center = true);
                }
            }
        }
        
        // Thin pipe cut for bolt.
        translate([-alpha,0,0])
        {
            rotate([0,-45,0])
            {
                translate([0,-beta,0])
                {
                    cylinder(h = cut_height, r1 = inner_radius, r2 = inner_radius, center = true);
                }
            }
        }
    }
}



























/* Primitive peg functions for CUBX0012_BXPX0064_00000200 */


module inner_CUBX0012_BXTX0064_00000200_pegs(outer_radius = 6.5, inner_radius = stock_CUBX0012_BSQX0064_00000200_peg_inner_radius, height = 2.35, cut_height = 600, alpha = 75, beta = 50, gamma=-10)
{

translate([0,0,0])

    difference()
    {
        union()
        {

         
            // Middle +y edge binding peg for nut.
            translate([0,alpha,0])
            {
                // Extention plate.
                rotate([-45,0,0])
                {
                    translate([0,0,gamma])
                    {
                        cylinder(h = height, r1 = outer_radius, r2 = outer_radius, center = true);
                    }
                }
            }
         
            // Peg that hold nut.
            translate([0,alpha,0])
            {
                // Extention plate.
                rotate([-45,0,0])
                {
                    translate([beta,0,gamma])
                    {
                        cylinder(h = height, r1 = outer_radius, r2 = outer_radius, center = true);
                    }
                }
            }
            
            // Peg that hold nut.
            translate([0,alpha,0])
            {
                // Extention plate.
                rotate([-45,0,0])
                {
                    translate([-beta,0,gamma])
                    {
                        cylinder(h = height, r1 = outer_radius, r2 = outer_radius, center = true);
                    }
                }
            }


            
            // Middle -y edge binding peg for nut.
            translate([0,-alpha,0])
            {
                // Extention plate.
                rotate([45,0,0])
                {
                    translate([0,0,gamma])
                    {
                        cylinder(h = height, r1 = outer_radius, r2 = outer_radius, center = true);
                    }
                }
            }
            
            
            // Peg that hold nut.
            translate([0,-alpha,0])
            {
                // Extention plate.
                rotate([45,0,0])
                {
                    translate([beta,0,gamma])
                    {
                        cylinder(h = height, r1 = outer_radius, r2 = outer_radius, center = true);
                    }
                }
            }
            
            // Peg that hold nut.
            translate([0,-alpha,0])
            {
                // Extention plate.
                rotate([45,0,0])
                {
                    translate([-beta,0,gamma])
                    {
                        cylinder(h = height, r1 = outer_radius, r2 = outer_radius, center = true);
                    }
                }
            }

            
        }

        // Thin pipe cut for bolt.
        translate([0,alpha,0])
        {
            rotate([-45,0,0])
            {
                translate([0,0,0])
                {
                    cylinder(h = cut_height, r1 = inner_radius, r2 = inner_radius, center = true);
                }
                
            }
        }
        
        // Thin pipe cut for bolt.
        translate([0,alpha,0])
        {
            rotate([-45,0,0])
            {
                translate([beta,0,0])
                {
                    cylinder(h = cut_height, r1 = inner_radius, r2 = inner_radius, center = true);
                }
                
            }
        }
        
        // Thin pipe cut for bolt.
        translate([0,alpha,0])
        {
            rotate([-45,0,0])
            {
                translate([-beta,0,0])
                {
                    cylinder(h = cut_height, r1 = inner_radius, r2 = inner_radius, center = true);
                }
                
            }
        }
        
        // Thin pipe cut for bolt.
        translate([0,-alpha,0])
        {
            rotate([45,0,0])
            {
                translate([0,0,0])
                {
                    cylinder(h = cut_height, r1 = inner_radius, r2 = inner_radius, center = true);
                }
                
            }
        }
        
        // Thin pipe cut for bolt.
        translate([0,-alpha,0])
        {
            rotate([45,0,0])
            {
                translate([beta,0,0])
                {
                    cylinder(h = cut_height, r1 = inner_radius, r2 = inner_radius, center = true);
                }
            }
        }
        
        // Thin pipe cut for bolt.
        translate([0,-alpha,0])
        {
            rotate([45,0,0])
            {
                translate([-beta,0,0])
                {
                    cylinder(h = cut_height, r1 = inner_radius, r2 = inner_radius, center = true);
                }
                
            }
        }
        
    }
}


















module outer_CUBX0012_BXTX0064_00000200_pegs(outer_radius = 6.5, inner_radius = stock_CUBX0012_BSQX0064_00000200_peg_inner_radius, height = 25, cut_height = 600, alpha = 75, beta = 50, gamma=-3.65)
{
    difference()
    {
        union()
        {

            
            //Middle +x edge binding peg for nut.
            translate([alpha,0,0])
            {
                rotate([0,45,0])
                {
                    translate([0,0,gamma])
                    {
                        cylinder(h = height, r1 = outer_radius, r2 = outer_radius, center = true);
                    }
                }
            }
            

            // Peg that hold nut.
            translate([alpha,0,0])
            {
                rotate([0,45,0])
                {
                    translate([0,beta,gamma])
                    {
                        cylinder(h = height, r1 = outer_radius, r2 = outer_radius, center = true);
                    }
                }
            }

            // Peg that hold nut.
            translate([alpha,0,0])
            {
                rotate([0,45,0])
                {
                    translate([0,-beta,gamma])
                    {
                        cylinder(h = height, r1 = outer_radius, r2 = outer_radius, center = true);
                    }
                }
            }

            
            // Middle -x edge binding peg for nut.
            translate([-alpha,0,0])
            {
                rotate([0,-45,0])
                {
                    translate([0,0,gamma])
                    {
                        cylinder(h = height, r1 = outer_radius, r2 = outer_radius, center = true);
                    }
                }
            }
            
            
            // Peg that hold nut.
            translate([-alpha,0,0])
            {
                rotate([0,-45,0])
                {
                    translate([0,beta,gamma])
                    {
                        cylinder(h = height, r1 = outer_radius, r2 = outer_radius, center = true);
                    }
                }
            }
            
            // Peg that hold nut.
            translate([-alpha,0,0])
            {
                rotate([0,-45,0])
                {
                    translate([0,-beta,gamma])
                    {
                        cylinder(h = height, r1 = outer_radius, r2 = outer_radius, center = true);
                    }
                }
            }
        }
        
        
        
        
        
        


        

        


        // Thin pipe cut for bolt.
        translate([alpha,0,0])
        {
            rotate([0,45,0])
            {
                translate([0,0,0])
                {
                    cylinder(h = cut_height, r1 = inner_radius, r2 = inner_radius, center = true);
                }
                
            }
        }
        
        // Thin pipe cut for bolt.
        translate([alpha,0,0])
        {
            rotate([0,45,0])
            {
                translate([0,beta,0])
                {
                    cylinder(h = cut_height, r1 = inner_radius, r2 = inner_radius, center = true);
                }
                
            }
        }
        
        // Thin pipe cut for bolt.
        translate([alpha,0,0])
        {
            rotate([0,45,0])
            {
                translate([0,-beta,0])
                {
                    cylinder(h = cut_height, r1 = inner_radius, r2 = inner_radius, center = true);
                }
                
            }
        }
        
        // Thin pipe cut for bolt.
        translate([-alpha,0,0])
        {
            rotate([0,-45,0])
            {
                translate([0,0,0])
                {
                    cylinder(h = cut_height, r1 = inner_radius, r2 = inner_radius, center = true);
                }
                
            }
        }
        
        // Thin pipe cut for bolt.
        translate([-alpha,0,0])
        {
            rotate([0,-45,0])
            {
                translate([0,beta,0])
                {
                    cylinder(h = cut_height, r1 = inner_radius, r2 = inner_radius, center = true);
                }
            }
        }
        
        // Thin pipe cut for bolt.
        translate([-alpha,0,0])
        {
            rotate([0,-45,0])
            {
                translate([0,-beta,0])
                {
                    cylinder(h = cut_height, r1 = inner_radius, r2 = inner_radius, center = true);
                }
            }
        }
    }
}






















/* Primitive peg functions for CUBX0012_BXTX0064_00000200 */
module inner_CUBX0012_BXPX0064_00000200_pegs(outer_radius = 6.5, inner_radius = stock_CUBX0012_BSQX0064_00000200_peg_inner_radius, height = 4.3, cut_height = 600, alpha = 75, beta = 50, gamma=-10.987)
{

translate([0,0,0])

    difference()
    {
        union()
        {

         
            // Middle +y edge binding peg for nut.
            translate([0,alpha,0])
            {
                // Extention plate.
                rotate([-45,0,0])
                {
                    translate([0,0,gamma])
                    {
                        cylinder(h = height, r1 = outer_radius, r2 = outer_radius, center = true);
                    }
                }
            }
         
            // Peg that hold nut.
            translate([0,alpha,0])
            {
                // Extention plate.
                rotate([-45,0,0])
                {
                    translate([beta,0,gamma])
                    {
                        cylinder(h = height, r1 = outer_radius, r2 = outer_radius, center = true);
                    }
                }
            }
            
            // Peg that hold nut.
            translate([0,alpha,0])
            {
                // Extention plate.
                rotate([-45,0,0])
                {
                    translate([-beta,0,gamma])
                    {
                        cylinder(h = height, r1 = outer_radius, r2 = outer_radius, center = true);
                    }
                }
            }


            
            // Middle -y edge binding peg for nut.
            translate([0,-alpha,0])
            {
                // Extention plate.
                rotate([45,0,0])
                {
                    translate([0,0,gamma])
                    {
                        cylinder(h = height, r1 = outer_radius, r2 = outer_radius, center = true);
                    }
                }
            }
            
            
            // Peg that hold nut.
            translate([0,-alpha,0])
            {
                // Extention plate.
                rotate([45,0,0])
                {
                    translate([beta,0,gamma])
                    {
                        cylinder(h = height, r1 = outer_radius, r2 = outer_radius, center = true);
                    }
                }
            }
            
            // Peg that hold nut.
            translate([0,-alpha,0])
            {
                // Extention plate.
                rotate([45,0,0])
                {
                    translate([-beta,0,gamma])
                    {
                        cylinder(h = height, r1 = outer_radius, r2 = outer_radius, center = true);
                    }
                }
            }

            
            //Middle +x edge binding peg for nut.
            translate([alpha,0,0])
            {
                rotate([0,45,0])
                {
                    translate([0,0,gamma])
                    {
                        cylinder(h = height, r1 = outer_radius, r2 = outer_radius, center = true);
                    }
                }
            }
            

            // Peg that hold nut.
            translate([alpha,0,0])
            {
                rotate([0,45,0])
                {
                    translate([0,beta,gamma])
                    {
                        cylinder(h = height, r1 = outer_radius, r2 = outer_radius, center = true);
                    }
                }
            }

            // Peg that hold nut.
            translate([alpha,0,0])
            {
                rotate([0,45,0])
                {
                    translate([0,-beta,gamma])
                    {
                        cylinder(h = height, r1 = outer_radius, r2 = outer_radius, center = true);
                    }
                }
            }

            
            // Middle -x edge binding peg for nut.
            translate([-alpha,0,0])
            {
                rotate([0,-45,0])
                {
                    translate([0,0,gamma])
                    {
                        cylinder(h = height, r1 = outer_radius, r2 = outer_radius, center = true);
                    }
                }
            }
            
            
            // Peg that hold nut.
            translate([-alpha,0,0])
            {
                rotate([0,-45,0])
                {
                    translate([0,beta,gamma])
                    {
                        cylinder(h = height, r1 = outer_radius, r2 = outer_radius, center = true);
                    }
                }
            }
            
            // Peg that hold nut.
            translate([-alpha,0,0])
            {
                rotate([0,-45,0])
                {
                    translate([0,-beta,gamma])
                    {
                        cylinder(h = height, r1 = outer_radius, r2 = outer_radius, center = true);
                    }
                }
            }
        }

        // Thin pipe cut for bolt.
        translate([0,alpha,0])
        {
            rotate([-45,0,0])
            {
                translate([0,0,0])
                {
                    cylinder(h = cut_height, r1 = inner_radius, r2 = inner_radius, center = true);
                }
                
            }
        }
        
        // Thin pipe cut for bolt.
        translate([0,alpha,0])
        {
            rotate([-45,0,0])
            {
                translate([beta,0,0])
                {
                    cylinder(h = cut_height, r1 = inner_radius, r2 = inner_radius, center = true);
                }
                
            }
        }
        
        // Thin pipe cut for bolt.
        translate([0,alpha,0])
        {
            rotate([-45,0,0])
            {
                translate([-beta,0,0])
                {
                    cylinder(h = cut_height, r1 = inner_radius, r2 = inner_radius, center = true);
                }
                
            }
        }
        
        // Thin pipe cut for bolt.
        translate([0,-alpha,0])
        {
            rotate([45,0,0])
            {
                translate([0,0,0])
                {
                    cylinder(h = cut_height, r1 = inner_radius, r2 = inner_radius, center = true);
                }
                
            }
        }
        
        // Thin pipe cut for bolt.
        translate([0,-alpha,0])
        {
            rotate([45,0,0])
            {
                translate([beta,0,0])
                {
                    cylinder(h = cut_height, r1 = inner_radius, r2 = inner_radius, center = true);
                }
            }
        }
        
        // Thin pipe cut for bolt.
        translate([0,-alpha,0])
        {
            rotate([45,0,0])
            {
                translate([-beta,0,0])
                {
                    cylinder(h = cut_height, r1 = inner_radius, r2 = inner_radius, center = true);
                }
                
            }
        }
        
        // Thin pipe cut for bolt.
        translate([alpha,0,0])
        {
            rotate([0,45,0])
            {
                translate([0,0,0])
                {
                    cylinder(h = cut_height, r1 = inner_radius, r2 = inner_radius, center = true);
                }
                
            }
        }
        
        // Thin pipe cut for bolt.
        translate([alpha,0,0])
        {
            rotate([0,45,0])
            {
                translate([0,beta,0])
                {
                    cylinder(h = cut_height, r1 = inner_radius, r2 = inner_radius, center = true);
                }
                
            }
        }
        
        // Thin pipe cut for bolt.
        translate([alpha,0,0])
        {
            rotate([0,45,0])
            {
                translate([0,-beta,0])
                {
                    cylinder(h = cut_height, r1 = inner_radius, r2 = inner_radius, center = true);
                }
                
            }
        }
        
        // Thin pipe cut for bolt.
        translate([-alpha,0,0])
        {
            rotate([0,-45,0])
            {
                translate([0,0,0])
                {
                    cylinder(h = cut_height, r1 = inner_radius, r2 = inner_radius, center = true);
                }
                
            }
        }
        
        // Thin pipe cut for bolt.
        translate([-alpha,0,0])
        {
            rotate([0,-45,0])
            {
                translate([0,beta,0])
                {
                    cylinder(h = cut_height, r1 = inner_radius, r2 = inner_radius, center = true);
                }
            }
        }
        
        // Thin pipe cut for bolt.
        translate([-alpha,0,0])
        {
            rotate([0,-45,0])
            {
                translate([0,-beta,0])
                {
                    cylinder(h = cut_height, r1 = inner_radius, r2 = inner_radius, center = true);
                }
            }
        }
    }
}





























module alpha_CUBX0012_BSQX0064_00000200_pegs()
{
    mirror([0,0,1])
    {
        outer_CUBX0012_BSQX0064_00000200_pegs(height = 3.60, gamma=7.039);
    }
}


module beta_CUBX0012_BSQX0064_00000200_pegs()
{
    outer_CUBX0012_BSQX0064_00000200_pegs(height = 3.60, gamma=7.039);
}


module gamma_CUBX0012_BSQX0064_00000200_pegs()
{
    outer_CUBX0012_BSQX0064_00000200_pegs(height = 8.5, gamma=-9.5);
}
module zeta_CUBX0012_BSQX0064_00000200_pegs(radius = 8.5, inner_radius= stock_CUBX0012_BSQX0064_00000200_peg_inner_radius, height = 12.5, alpha = 50, zeta = -6.25)
{
    difference()
    {
        union()
        {
            translate([-alpha,-alpha,zeta])
            {
                cylinder(h = height, r1 = radius, r2 = radius, center = true);
            }

            translate([alpha,alpha,zeta])
            {
                cylinder(h = height, r1 = radius, r2 = radius, center = true);
            }


            translate([alpha,-alpha,zeta])
            {
                cylinder(h = height, r1 = radius, r2 = radius, center = true);
            }

            translate([-alpha,alpha,zeta])
            {
                cylinder(h = height, r1 = radius, r2 = radius, center = true);
            }
            
            
            translate([-alpha,0,zeta])
            {
                cylinder(h = height, r1 = radius, r2 = radius, center = true);
            }

            translate([alpha,0,zeta])
            {
                cylinder(h = height, r1 = radius, r2 = radius, center = true);
            }

            translate([0,-alpha,zeta])
            {
                cylinder(h = height, r1 = radius, r2 = radius, center = true);
            }

            translate([-0,alpha,zeta])
            {
                cylinder(h = height, r1 = radius, r2 = radius, center = true);
            }
            
            translate([0,0,zeta])
            {
                cylinder(h = height, r1 = radius, r2 = radius, center = true);
            }
            
            
            
            /* Dual Pegs */
            
            
            /*
            translate([alpha/2,alpha/2,zeta])
            {
                cylinder(h = height, r1 = radius*3/4, r2 = radius*3/4, center = true);
            }

            translate([alpha/2,-alpha/2,zeta])
            {
                cylinder(h = height, r1 = radius*3/4, r2 = radius*3/4, center = true);
            }
            
            translate([-alpha/2,alpha/2,zeta])
            {
                cylinder(h = height, r1 = radius*3/4, r2 = radius*3/4, center = true);
            }

            translate([-alpha/2,-alpha/2,zeta])
            {
                cylinder(h = height, r1 = radius*3/4, r2 = radius*3/4, center = true);
            }
            
            */
        }
        
        union()
        {
            translate([-alpha,-alpha,zeta])
            {
                cylinder(h = 1.01*height, r1 = inner_radius, r2 = inner_radius, center = true);
            }

            translate([alpha,alpha,zeta])
            {
                cylinder(h = 1.01*height, r1 = inner_radius, r2 = inner_radius, center = true);
            }


            translate([alpha,-alpha,zeta])
            {
                cylinder(h = 1.01*height, r1 = inner_radius, r2 = inner_radius, center = true);
            }

            translate([-alpha,alpha,zeta])
            {
                cylinder(h = 1.01*height, r1 = inner_radius, r2 = inner_radius, center = true);
            }
            
            
            translate([-alpha,0,zeta])
            {
                cylinder(h = 1.01*height, r1 = inner_radius, r2 = inner_radius, center = true);
            }

            translate([alpha,0,zeta])
            {
                cylinder(h = 1.01*height, r1 = inner_radius, r2 = inner_radius, center = true);
            }

            translate([0,-alpha,zeta])
            {
                cylinder(h = 1.01*height, r1 = inner_radius, r2 = inner_radius, center = true);
            }

            translate([-0,alpha,zeta])
            {
                cylinder(h = 1.01*height, r1 = inner_radius, r2 = inner_radius, center = true);
            }
            
            translate([0,0,zeta])
            {
                cylinder(h = 1.01*height, r1 = inner_radius, r2 = inner_radius, center = true);
            }
            
            
            
            /* Dual Pegs */
            
            /*
            
            translate([alpha/2,alpha/2,0])
            {
                cylinder(h = 1.01*height, r1 = inner_radius*3/4, r2 = inner_radius*3/4, center = true);
            }

            translate([alpha/2,-alpha/2,0])
            {
                cylinder(h = 1.01*height, r1 = inner_radius*3/4, r2 = inner_radius*3/4, center = true);
            }
            
            translate([-alpha/2,alpha/2,0])
            {
                cylinder(h = 1.01*height, r1 = inner_radius*3/4, r2 = inner_radius*3/4, center = true);
            }

            translate([-alpha/2,-alpha/2,0])
            {
                cylinder(h = 1.01*height, r1 = inner_radius*3/4, r2 = inner_radius*3/4, center = true);
            }
            
            */
        }        
    }
}




module delta_CUBX0012_BXPX0064_00000200_pegs()
{
    inner_CUBX0012_BXPX0064_00000200_pegs();
}
module theta_CUBX0012_BXPX0064_00000200_pegs()
{
    
}
module gamma_CUBX0012_BXPX0064_00000200_pegs()
{
    
}

module zeta_CUBX0012_BXPX0064_00000200_pegs()
{
    zeta_CUBX0012_BSQX0064_00000200_pegs();
}




module alpha_CUBX0012_BXTX0064_00000200_pegs()
{
    
    mirror([0,0,1])
    {
         outer_CUBX0012_BXTX0064_00000200_pegs(outer_radius = 6.5, inner_radius = stock_CUBX0012_BSQX0064_00000200_peg_inner_radius, height = 3.60, cut_height = 600, alpha = 75, beta = 50, gamma=7.039);
    }
}

module beta_CUBX0012_BXTX0064_00000200_pegs()
{
    outer_CUBX0012_BXTX0064_00000200_pegs(outer_radius = 6.5, inner_radius = stock_CUBX0012_BSQX0064_00000200_peg_inner_radius, height = 3.60, cut_height = 600, alpha = 75, beta = 50, gamma=7.039);
    
}


module gamma_CUBX0012_BXTX0064_00000200_pegs()
{
        outer_CUBX0012_BXTX0064_00000200_pegs(height = 8.5, gamma=-9.5);
}

module delta_CUBX0012_BXTX0064_00000200_pegs()
{    
    
    
    
    mirror([0,0,1])
    {
         inner_CUBX0012_BXTX0064_00000200_pegs(height = 4.9, gamma=-11.28);
    }
    
    
}

module theta_CUBX0012_BXTX0064_00000200_pegs()
{
       inner_CUBX0012_BXTX0064_00000200_pegs(height = 4.9, gamma=-11.28);
}


module zeta_CUBX0012_BXTX0064_00000200_pegs()
{
    zeta_CUBX0012_BSQX0064_00000200_pegs();
}




module stock_CUBX0012_BXPX0064_00000200_outer_pegs(outer_radius = 6.5, inner_radius = stock_CUBX0012_BSQX0064_00000200_peg_inner_radius, height = 2.35, cut_height = 600, alpha = 75, beta = 50, gamma=-10)
{

translate([0,0,0])

    difference()
    {
        union()
        {

         
            // Middle +y edge binding peg for nut.
            translate([0,alpha,0])
            {
                // Extention plate.
                rotate([-45,0,0])
                {
                    translate([0,0,gamma])
                    {
                        cylinder(h = height, r1 = outer_radius, r2 = outer_radius, center = true);
                    }
                }
            }
         
            // Peg that hold nut.
            translate([0,alpha,0])
            {
                // Extention plate.
                rotate([-45,0,0])
                {
                    translate([beta,0,gamma])
                    {
                        cylinder(h = height, r1 = outer_radius, r2 = outer_radius, center = true);
                    }
                }
            }
            
            // Peg that hold nut.
            translate([0,alpha,0])
            {
                // Extention plate.
                rotate([-45,0,0])
                {
                    translate([-beta,0,gamma])
                    {
                        cylinder(h = height, r1 = outer_radius, r2 = outer_radius, center = true);
                    }
                }
            }


            
            // Middle -y edge binding peg for nut.
            translate([0,-alpha,0])
            {
                // Extention plate.
                rotate([45,0,0])
                {
                    translate([0,0,gamma])
                    {
                        cylinder(h = height, r1 = outer_radius, r2 = outer_radius, center = true);
                    }
                }
            }
            
            
            // Peg that hold nut.
            translate([0,-alpha,0])
            {
                // Extention plate.
                rotate([45,0,0])
                {
                    translate([beta,0,gamma])
                    {
                        cylinder(h = height, r1 = outer_radius, r2 = outer_radius, center = true);
                    }
                }
            }
            
            // Peg that hold nut.
            translate([0,-alpha,0])
            {
                // Extention plate.
                rotate([45,0,0])
                {
                    translate([-beta,0,gamma])
                    {
                        cylinder(h = height, r1 = outer_radius, r2 = outer_radius, center = true);
                    }
                }
            }

            
            //Middle +x edge binding peg for nut.
            translate([alpha,0,0])
            {
                rotate([0,45,0])
                {
                    translate([0,0,gamma])
                    {
                        cylinder(h = height, r1 = outer_radius, r2 = outer_radius, center = true);
                    }
                }
            }
            

            // Peg that hold nut.
            translate([alpha,0,0])
            {
                rotate([0,45,0])
                {
                    translate([0,beta,gamma])
                    {
                        cylinder(h = height, r1 = outer_radius, r2 = outer_radius, center = true);
                    }
                }
            }

            // Peg that hold nut.
            translate([alpha,0,0])
            {
                rotate([0,45,0])
                {
                    translate([0,-beta,gamma])
                    {
                        cylinder(h = height, r1 = outer_radius, r2 = outer_radius, center = true);
                    }
                }
            }

            
            // Middle -x edge binding peg for nut.
            translate([-alpha,0,0])
            {
                rotate([0,-45,0])
                {
                    translate([0,0,gamma])
                    {
                        cylinder(h = height, r1 = outer_radius, r2 = outer_radius, center = true);
                    }
                }
            }
            
            
            // Peg that hold nut.
            translate([-alpha,0,0])
            {
                rotate([0,-45,0])
                {
                    translate([0,beta,gamma])
                    {
                        cylinder(h = height, r1 = outer_radius, r2 = outer_radius, center = true);
                    }
                }
            }
            
            // Peg that hold nut.
            translate([-alpha,0,0])
            {
                rotate([0,-45,0])
                {
                    translate([0,-beta,gamma])
                    {
                        cylinder(h = height, r1 = outer_radius, r2 = outer_radius, center = true);
                    }
                }
            }
        }

        // Thin pipe cut for bolt.
        translate([0,alpha,0])
        {
            rotate([-45,0,0])
            {
                translate([0,0,0])
                {
                    cylinder(h = cut_height, r1 = inner_radius, r2 = inner_radius, center = true);
                }
                
            }
        }
        
        // Thin pipe cut for bolt.
        translate([0,alpha,0])
        {
            rotate([-45,0,0])
            {
                translate([beta,0,0])
                {
                    cylinder(h = cut_height, r1 = inner_radius, r2 = inner_radius, center = true);
                }
                
            }
        }
        
        // Thin pipe cut for bolt.
        translate([0,alpha,0])
        {
            rotate([-45,0,0])
            {
                translate([-beta,0,0])
                {
                    cylinder(h = cut_height, r1 = inner_radius, r2 = inner_radius, center = true);
                }
                
            }
        }
        
        // Thin pipe cut for bolt.
        translate([0,-alpha,0])
        {
            rotate([45,0,0])
            {
                translate([0,0,0])
                {
                    cylinder(h = cut_height, r1 = inner_radius, r2 = inner_radius, center = true);
                }
                
            }
        }
        
        // Thin pipe cut for bolt.
        translate([0,-alpha,0])
        {
            rotate([45,0,0])
            {
                translate([beta,0,0])
                {
                    cylinder(h = cut_height, r1 = inner_radius, r2 = inner_radius, center = true);
                }
            }
        }
        
        // Thin pipe cut for bolt.
        translate([0,-alpha,0])
        {
            rotate([45,0,0])
            {
                translate([-beta,0,0])
                {
                    cylinder(h = cut_height, r1 = inner_radius, r2 = inner_radius, center = true);
                }
                
            }
        }
        
        // Thin pipe cut for bolt.
        translate([alpha,0,0])
        {
            rotate([0,45,0])
            {
                translate([0,0,0])
                {
                    cylinder(h = cut_height, r1 = inner_radius, r2 = inner_radius, center = true);
                }
                
            }
        }
        
        // Thin pipe cut for bolt.
        translate([alpha,0,0])
        {
            rotate([0,45,0])
            {
                translate([0,beta,0])
                {
                    cylinder(h = cut_height, r1 = inner_radius, r2 = inner_radius, center = true);
                }
                
            }
        }
        
        // Thin pipe cut for bolt.
        translate([alpha,0,0])
        {
            rotate([0,45,0])
            {
                translate([0,-beta,0])
                {
                    cylinder(h = cut_height, r1 = inner_radius, r2 = inner_radius, center = true);
                }
                
            }
        }
        
        // Thin pipe cut for bolt.
        translate([-alpha,0,0])
        {
            rotate([0,-45,0])
            {
                translate([0,0,0])
                {
                    cylinder(h = cut_height, r1 = inner_radius, r2 = inner_radius, center = true);
                }
                
            }
        }
        
        // Thin pipe cut for bolt.
        translate([-alpha,0,0])
        {
            rotate([0,-45,0])
            {
                translate([0,beta,0])
                {
                    cylinder(h = cut_height, r1 = inner_radius, r2 = inner_radius, center = true);
                }
            }
        }
        
        // Thin pipe cut for bolt.
        translate([-alpha,0,0])
        {
            rotate([0,-45,0])
            {
                translate([0,-beta,0])
                {
                    cylinder(h = cut_height, r1 = inner_radius, r2 = inner_radius, center = true);
                }
            }
        }
    }
}






module delta_CUBX0012_BXPX0064_00000200_pegs()
{
    inner_CUBX0012_BXPX0064_00000200_pegs();
}
module theta_CUBX0012_BXPX0064_00000200_pegs()
{
    mirror([0,0,1])
    {
        inner_CUBX0012_BXPX0064_00000200_pegs();
    }
}
module gamma_CUBX0012_BXPX0064_00000200_pegs()
{
    
}

module zeta_CUBX0012_BXPX0064_00000200_pegs()
{
    zeta_CUBX0012_BSQX0064_00000200_pegs();
}









/* Subtractive Pegs */


module stock_CUBX0012_BSQX0064_00000200_drivershaft()
{
    translate([0,0,-6.25])
    zeta_CUBX0012_BSQX0064_00000200_pegs(radius = 6, inner_radius= 0);
    
}