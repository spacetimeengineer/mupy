use <proto_CUBX0012_elements.scad>;

module stock_CUBX0012_BSQX0064_00000200_cavityrim()
{
    translate([0,0,18.75])
    {
        scale(3/4)
        {
            raw_CUBX0012_BSQX0064_00000200_element();
        }
    }
}
   
module raw_CUBX0012_BSQX0064_00000200(plate_thickness = 12.5, plate_length = 175)
{
    translate([0,0,-6.25])
    {
        
        mirror([0,0,1])
        {
            
            difference()
            {
                union()
                {
                    difference()
                    {

                        // Primordial box dimensions without difference operations.
                        square_plate = [plate_length,plate_length,plate_thickness];
                        // Creation of box.
                        cube(square_plate, true);
                        translate([0,-0.5*plate_length,0])
                        {
                            rotate([45,0,0])
                            {
                                trapezoidal_edge_difference_box=[plate_length,plate_length,plate_thickness/sqrt(2)];
                                cube(trapezoidal_edge_difference_box,true);
                            }
                        }

                        translate([0.5*plate_length,0,0])
                        {
                            rotate([0,45,0])
                            {
                                trapezoidal_edge_difference_box=[plate_length,plate_length,plate_thickness/sqrt(2)];
                                cube(trapezoidal_edge_difference_box,true);
                            }
                        }

                        translate([-0.5*plate_length,0,0])
                        {
                            rotate([0,135,0])
                            {
                                trapezoidal_edge_difference_box=[plate_length,plate_length,plate_thickness/sqrt(2)];
                                cube(trapezoidal_edge_difference_box,true);
                            }
                        }

                        translate([0,0.5*plate_length,0])
                        {
                            rotate([135,0,0])
                            {
                                trapezoidal_edge_difference_box=[plate_length,plate_length,plate_thickness/sqrt(2)];
                                cube(trapezoidal_edge_difference_box,true);
                            }
                        }
                    }
                
                    
                    translate([0,0,-plate_thickness])
                    {
                        rotate([0,180,0])
                        {
                            difference()
                            {
                                // Primordial box dimensions without difference operations.
                                square_plate=[plate_length,plate_length,plate_thickness];
                                // Creation of box.
                                cube(square_plate,true);


                                translate([0,-0.5*plate_length,0])
                                {
                                    rotate([45,0,0])
                                    {
                                        trapezoidal_edge_difference_box=[plate_length,plate_length,plate_thickness/sqrt(2)];
                                        cube(trapezoidal_edge_difference_box,true);
                                    }
                                }

                                translate([0.5*plate_length,0,0])
                                {
                                    rotate([0,45,0])
                                    {
                                        trapezoidal_edge_difference_box=[plate_length,plate_length,plate_thickness/sqrt(2)];
                                        cube(trapezoidal_edge_difference_box,true);
                                    }
                                }

                                translate([-0.5*plate_length,0,0])
                                {
                                    rotate([0,135,0])
                                    {
                                        trapezoidal_edge_difference_box=[plate_length,plate_length,plate_thickness/sqrt(2)];
                                        cube(trapezoidal_edge_difference_box,true);
                                    }
                                }

                                translate([0,0.5*plate_length,0])
                                {
                                    rotate([135,0,0])
                                    {
                                        trapezoidal_edge_difference_box=[plate_length,plate_length,plate_thickness/sqrt(2)];
                                        cube(trapezoidal_edge_difference_box,true);
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}


module stock_CUBX0012_BSQX0064_00000200_style()
{ 
    
    
    translate([0,0,-6.25])
    {
        mirror([0,0,1])
        {

            /* Rotated arm cross cut which gives the 45 degree lip on each of the four corner masses with the bolt holes. */

            translate([0,12.5,-21.8])
            {
                rotate([45,0,0])
                {
                     box=[200,22,22];
                     cube(box,true);
                }
            }
            
            translate([0,-12.5,-21.8])
            {
                rotate([45,0,0])
                {
                     box=[200,22,22];
                     cube(box,true);
                }
            }
            
            translate([12.5,0,-21.8])
            {
                rotate([45,0,90])
                {
                     box=[200,22,22];
                     cube(box,true);
                }
            }
            
            translate([-12.5
            ,0,-21.8])
            {
                rotate([45,0,90])
                {
                     box=[200,22,22];
                     cube(box,true);
                }
            }
            
                
            /* Top edge mass trimmer */
            
            translate([0,0,-29.25])
            {
                rotate([0,0,0])
                {
                     box=[180,25,46];
                     cube(box,true);
                }
            }
            translate([0,-0,-29.25])
            {
                rotate([0,0,90])
                {
                     box=[180,25,46];
                     cube(box,true);
                }
            }
            

            
        }
    }
}

module raptor_CUBX0012_BSQX0064_00000200_style(alpha = 49.2, gamma = 18, beta = 65.3, zeta = 15.5)
{

    box=[alpha,gamma,25];
    translate([25,-beta,zeta])
    {
        rotate([90,45,90])
        {
             cube(box,true);
        }
    }

    translate([25,beta,zeta])
    {
        rotate([90,-45,90])
        {
             cube(box,true);
        }
    }

    translate([0,-beta,zeta])
    {
        rotate([90,45,90])
        {
             cube(box,true);
        }
    }

    translate([-25,-beta,zeta])
    {
        rotate([90,45,90])
        {
             cube(box,true);
        }
    }

    translate([-25,beta,zeta])
    {
        rotate([90,-45,90])
        {
             cube(box,true);
        }
    }

    translate([0,beta,zeta])
    {
        rotate([90,-45,90])
        {
             cube(box,true);
        }
    }

    translate([-beta,25,zeta])
    {
        rotate([90,45,0])
        {
             cube(box,true);
        }
    }

    translate([-beta,-25,zeta])
    {
        rotate([90,45,0])
        {
             cube(box,true);
        }
    }
    
    translate([-beta,0,zeta])
    {
        rotate([90,45,0])
        {
             cube(box,true);
        }
    }

    translate([beta,25,zeta])
    {
        rotate([90,-45,0])
        {
             cube(box,true);
        }
    }

    translate([beta,-25,zeta])
    {
        rotate([90,-45,0])
        {
             cube(box,true);
        }
    }
    
    translate([beta,0,zeta])
    {
        rotate([90,-45,0])
        {
             cube(box,true);
        }
    }
}



module stock_CEB200_style()
{ 
    
    
    translate([0,0,-6.25])
    {
        mirror([0,0,1])
        {
            translate([0,12.5,-21.8])
            {
                rotate([45,0,0])
                {
                     box=[200,22,22];
                     cube(box,true);
                }
            }
            
            translate([0,-12.5,-21.8])
            {
                rotate([45,0,0])
                {
                     box=[200,22,22];
                     cube(box,true);
                }
            }
            
            translate([12.5,0,-21.8])
            {
                rotate([45,0,90])
                {
                     box=[200,22,22];
                     cube(box,true);
                }
            }
            
            translate([-12.5
            ,0,-21.8])
            {
                rotate([45,0,90])
                {
                     box=[200,22,22];
                     cube(box,true);
                }
            }
            
                
            /* Top edge mass trimmer */
            
            translate([0,0,-29.25])
            {
                rotate([0,0,0])
                {
                     box=[180,25,46];
                     cube(box,true);
                }
            }
            translate([0,-0,-29.25])
            {
                rotate([0,0,90])
                {
                     box=[180,25,46];
                     cube(box,true);
                }
            }   
        }
    }
}



module stock_CXB200_style()
{ 
    
    
    translate([0,0,-6.25])
    {
        mirror([0,0,1])
        {

            /* Rotated arm cross cut which gives the 45 degree lip on each of the four corner masses with the bolt holes. */

            translate([0,12.5,-21.8])
            {
                rotate([45,0,0])
                {
                     box=[200,22,22];
                     cube(box,true);
                }
            }
            
            translate([0,-12.5,-21.8])
            {
                rotate([45,0,0])
                {
                     box=[200,22,22];
                     cube(box,true);
                }
            }
            
            translate([12.5,0,-21.8])
            {
                rotate([45,0,90])
                {
                     box=[200,22,22];
                     cube(box,true);
                }
            }
            
            translate([-12.5
            ,0,-21.8])
            {
                rotate([45,0,90])
                {
                     box=[200,22,22];
                     cube(box,true);
                }
            }
            
                
            /* Top edge mass trimmer */
            
            translate([0,0,-29.25])
            {
                rotate([0,0,0])
                {
                     box=[180,25,46];
                     cube(box,true);
                }
            }
            translate([0,-0,-29.25])
            {
                rotate([0,0,90])
                {
                     box=[180,25,46];
                     cube(box,true);
                }
            }
            
            
        }
    }
}



module octad_CUBX0012_BSQX0064_00000200_style(alpha=118)
{
    intersection()
    {
        translate([0,0,0])
        {
            rotate([0,0,90])
            {
                 box=[alpha,alpha,20];
                 cube(box,true);
            }
        }
        

        translate([0,0,0])
        {
            rotate([0,0,45])
            {
                 box=[alpha,alpha,20];
                 cube(box,true);
            }
        }
    }
}
