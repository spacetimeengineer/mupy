module alpha_CUBX0012_BSQX0064_00000200_bindshafts(radius = 5.3, height = 300, alpha = 75, beta = 50)
{
    
    // A centered large edge fastening cut pipe in the +y direction for nut driver insertion.
    translate([0,alpha,0])
    {
        rotate([-45,0,0])
        {
            translate([0,0,0])
            {
                cylinder(h = height, r1 = radius, r2 = radius, center = true);
            }
            
        }
    }
    
    
    // Large cut pipe.
    translate([0,alpha,0])
    {
        rotate([-45,0,0])
        {
            translate([beta,0,0])
            {
                cylinder(h = height, r1 = radius, r2 = radius, center = true);
            }
            
        }
    }

    // Large cut pipe.
    translate([0,alpha,0])
    {
        rotate([-45,0,0])
        {
            translate([-beta,0,0])
            {
                cylinder(h = height, r1 = radius, r2 = radius, center = true);
            }
            
        }
    }


    
    // A centered large edge fastening cut pipe in the -y direction for nut driver insertion.
    translate([0,-alpha,0])
    {
        rotate([45,0,0])
        {
            translate([0,0,0])
            {
                cylinder(h = height, r1 = radius, r2 = radius, center = true);
            }
            
        }
    }
    
    
    // Large cut pipe.
    translate([0,-alpha,0])
    {
        rotate([45,0,0])
        {
            translate([beta,0,0])
            {
                cylinder(h = height, r1 = radius, r2 = radius, center = true);
            }
            
        }
    }

    // Large cut pipe.
    translate([0,-alpha,0])
    {
        rotate([45,0,0])
        {
            translate([-beta,0,0])
            {
                cylinder(h = height, r1 = radius, r2 = radius, center = true);
            }
            
        }
    }

    
    // A centered large edge fastening cut pipe in the +x direction for nut driver insertion.
    translate([alpha,0,0])
    {
        rotate([0,45,0])
        {
            translate([0,0,0])
            {
                cylinder(h = height, r1 = radius, r2 = radius, center = true);
            }
            
        }
    }
    
    
    // Large cut pipe.
    translate([alpha,0,0])
    {
        rotate([0,45,0])
        {
            translate([0,beta,0])
            {
                cylinder(h = height, r1 = radius, r2 = radius, center = true);
            }
            
        }
    }

    // Large cut pipe.
    translate([alpha,0,0])
    {
        rotate([0,45,0])
        {
            translate([0,-beta,0])
            {
                cylinder(h = height, r1 = radius, r2 = radius, center = true);
            }
            
        }
    }


    
    // A centered large edge fastening cut pipe in the -x direction for nut driver insertion.
    translate([-alpha,0,0])
    {
        rotate([0,-45,0])
        {
            translate([0,0,0])
            {
                cylinder(h = height, r1 = radius, r2 = radius, center = true);
            }
            
        }
    }
   
    
    // Large cut pipe.
    translate([-alpha,0,0])
    {
        rotate([0,-45,0])
        {
            translate([0,beta,0])
            {
                cylinder(h = height, r1 = radius, r2 = radius, center = true);
            }
            
        }
    }

    // Large cut pipe.
    translate([-alpha,0,0])
    {
        rotate([0,-45,0])
        {
            translate([0,-beta,0])
            {
                cylinder(h = height, r1 = radius, r2 = radius, center = true);
            }
            
        }
    }
}




module zeta_CUBX0012_BSQX0064_00000200_bindshafts(radius = 6, height = 200, alpha = 50)
{
    translate([-alpha,-alpha,0])
    {
        cylinder(h = height, r1 = radius, r2 = radius, center = true);
    }

    translate([alpha,alpha,0])
    {
        cylinder(h = height, r1 = radius, r2 = radius, center = true);
    }


    translate([alpha,-alpha,0])
    {
        cylinder(h = height, r1 = radius, r2 = radius, center = true);
    }

    translate([-alpha,alpha,0])
    {
        cylinder(h = height, r1 = radius, r2 = radius, center = true);
    }
    
    
    translate([-alpha,0,0])
    {
        cylinder(h = height, r1 = radius, r2 = radius, center = true);
    }

    translate([alpha,0,0])
    {
        cylinder(h = height, r1 = radius, r2 = radius, center = true);
    }


    translate([0,-alpha,0])
    {
        cylinder(h = height, r1 = radius, r2 = radius, center = true);
    }

    translate([-0,alpha,0])
    {
        cylinder(h = height, r1 = radius, r2 = radius, center = true);
    }
    
    translate([0,0,0])
    {
        cylinder(h = height, r1 = radius, r2 = radius, center = true);
    }
    
    
    
    
    
    
    
    
    
    
    
    translate([alpha/2,alpha/2,0])
    {
        cylinder(h = height, r1 = radius*3/4, r2 = radius*3/4, center = true);
    }

    translate([alpha/2,-alpha/2,0])
    {
        cylinder(h = height, r1 = radius*3/4, r2 = radius*3/4, center = true);
    }
    
    translate([-alpha/2,alpha/2,0])
    {
        cylinder(h = height, r1 = radius*3/4, r2 = radius*3/4, center = true);
    }

    translate([-alpha/2,-alpha/2,0])
    {
        cylinder(h = height, r1 = radius*3/4, r2 = radius*3/4, center = true);
    } 
}







module stock_CUBX0012_BXTX0064_00000200_bindshaft(radius = 5.3, height = 300, alpha = 75, beta = 50)
{
    
    // A centered large edge fastening cut pipe in the +y direction for nut driver insertion.
    translate([0,alpha,0])
    {
        rotate([-45,0,0])
        {
            translate([0,0,0])
            {
                cylinder(h = height, r1 = radius, r2 = radius, center = true);
            }
            
        }
    }
    
    
    // Large cut pipe.
    translate([0,alpha,0])
    {
        rotate([-45,0,0])
        {
            translate([beta,0,0])
            {
                cylinder(h = height, r1 = radius, r2 = radius, center = true);
            }
            
        }
    }

    // Large cut pipe.
    translate([0,alpha,0])
    {
        rotate([-45,0,0])
        {
            translate([-beta,0,0])
            {
                cylinder(h = height, r1 = radius, r2 = radius, center = true);
            }
            
        }
    }


    
    // A centered large edge fastening cut pipe in the -y direction for nut driver insertion.
    translate([0,-alpha,0])
    {
        rotate([45,0,0])
        {
            translate([0,0,0])
            {
                cylinder(h = height, r1 = radius, r2 = radius, center = true);
            }
            
        }
    }
    
    
    // Large cut pipe.
    translate([0,-alpha,0])
    {
        rotate([45,0,0])
        {
            translate([beta,0,0])
            {
                cylinder(h = height, r1 = radius, r2 = radius, center = true);
            }
            
        }
    }

    // Large cut pipe.
    translate([0,-alpha,0])
    {
        rotate([45,0,0])
        {
            translate([-beta,0,0])
            {
                cylinder(h = height, r1 = radius, r2 = radius, center = true);
            }
            
        }
    }

    
    // A centered large edge fastening cut pipe in the +x direction for nut driver insertion.
    translate([alpha,0,0])
    {
        rotate([0,45,0])
        {
            translate([0,0,0])
            {
                cylinder(h = height, r1 = radius, r2 = radius, center = true);
            }
            
        }
    }
    
    
    // Large cut pipe.
    translate([alpha,0,0])
    {
        rotate([0,45,0])
        {
            translate([0,beta,0])
            {
                cylinder(h = height, r1 = radius, r2 = radius, center = true);
            }
            
        }
    }

    // Large cut pipe.
    translate([alpha,0,0])
    {
        rotate([0,45,0])
        {
            translate([0,-beta,0])
            {
                cylinder(h = height, r1 = radius, r2 = radius, center = true);
            }
            
        }
    }


    
    // A centered large edge fastening cut pipe in the -x direction for nut driver insertion.
    translate([-alpha,0,0])
    {
        rotate([0,-45,0])
        {
            translate([0,0,0])
            {
                cylinder(h = height, r1 = radius, r2 = radius, center = true);
            }
            
        }
    }
   
    
    // Large cut pipe.
    translate([-alpha,0,0])
    {
        rotate([0,-45,0])
        {
            translate([0,beta,0])
            {
                cylinder(h = height, r1 = radius, r2 = radius, center = true);
            }
            
        }
    }

    // Large cut pipe.
    translate([-alpha,0,0])
    {
        rotate([0,-45,0])
        {
            translate([0,-beta,0])
            {
                cylinder(h = height, r1 = radius, r2 = radius, center = true);
            }
            
        }
    }
}


module stock_CUBX0012_BXPX0064_00000200_bindshafts(radius = 5.3, height = 300, alpha = 75, beta = 50)
{
    
    // A centered large edge fastening cut pipe in the +y direction for nut driver insertion.
    translate([0,alpha,0])
    {
        rotate([-45,0,0])
        {
            translate([0,0,0])
            {
                cylinder(h = height, r1 = radius, r2 = radius, center = true);
            }
            
        }
    }
    
    
    // Large cut pipe.
    translate([0,alpha,0])
    {
        rotate([-45,0,0])
        {
            translate([beta,0,0])
            {
                cylinder(h = height, r1 = radius, r2 = radius, center = true);
            }
            
        }
    }

    // Large cut pipe.
    translate([0,alpha,0])
    {
        rotate([-45,0,0])
        {
            translate([-beta,0,0])
            {
                cylinder(h = height, r1 = radius, r2 = radius, center = true);
            }
            
        }
    }


    
    // A centered large edge fastening cut pipe in the -y direction for nut driver insertion.
    translate([0,-alpha,0])
    {
        rotate([45,0,0])
        {
            translate([0,0,0])
            {
                cylinder(h = height, r1 = radius, r2 = radius, center = true);
            }
            
        }
    }
    
    
    // Large cut pipe.
    translate([0,-alpha,0])
    {
        rotate([45,0,0])
        {
            translate([beta,0,0])
            {
                cylinder(h = height, r1 = radius, r2 = radius, center = true);
            }
            
        }
    }

    // Large cut pipe.
    translate([0,-alpha,0])
    {
        rotate([45,0,0])
        {
            translate([-beta,0,0])
            {
                cylinder(h = height, r1 = radius, r2 = radius, center = true);
            }
            
        }
    }

    
    // A centered large edge fastening cut pipe in the +x direction for nut driver insertion.
    translate([alpha,0,0])
    {
        rotate([0,45,0])
        {
            translate([0,0,0])
            {
                cylinder(h = height, r1 = radius, r2 = radius, center = true);
            }
            
        }
    }
    
    
    // Large cut pipe.
    translate([alpha,0,0])
    {
        rotate([0,45,0])
        {
            translate([0,beta,0])
            {
                cylinder(h = height, r1 = radius, r2 = radius, center = true);
            }
            
        }
    }

    // Large cut pipe.
    translate([alpha,0,0])
    {
        rotate([0,45,0])
        {
            translate([0,-beta,0])
            {
                cylinder(h = height, r1 = radius, r2 = radius, center = true);
            }
            
        }
    }


    
    // A centered large edge fastening cut pipe in the -x direction for nut driver insertion.
    translate([-alpha,0,0])
    {
        rotate([0,-45,0])
        {
            translate([0,0,0])
            {
                cylinder(h = height, r1 = radius, r2 = radius, center = true);
            }
            
        }
    }
   
    
    // Large cut pipe.
    translate([-alpha,0,0])
    {
        rotate([0,-45,0])
        {
            translate([0,beta,0])
            {
                cylinder(h = height, r1 = radius, r2 = radius, center = true);
            }
            
        }
    }

    // Large cut pipe.
    translate([-alpha,0,0])
    {
        rotate([0,-45,0])
        {
            translate([0,-beta,0])
            {
                cylinder(h = height, r1 = radius, r2 = radius, center = true);
            }
            
        }
    }
}












