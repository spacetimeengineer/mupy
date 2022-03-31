use <cavity_modules.scad>;
use <bindshaft_modules.scad>;
use <pegset_modules.scad>;

module raw_CUBX0012_BSQX0064_00000200_element(plate_thickness = 12.5, plate_length = 175)
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



module proto_CUBX0012_BSQX0064_00000200_element(plate_thickness = 12.5, plate_length = 175)
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

                triangular_corner_difference();
            }
        }
    }
}


module prime_CUBX0012_BSQX0064_00000200_element()
{
    difference()
    {
        union()
        {
            difference()
            {
                proto_CUBX0012_BSQX0064_00000200_element();
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
        
    }
}



module triangular_corner_difference()
{
    translate([101.17,-101.17,-35.8])
    {
        rotate([0,0,45])
        {
            rotate([35.3,0,0])
            {
                 box=[60,80.01,60];
                 cube(box,true);
            }
        }
    }
    
    translate([101.17,101.17,-35.8])
    {
            rotate([0,0,135])
            {
                rotate([35.2,0,0])
                {
                     box=[60,80.1,60];
                     cube(box,true);
                }
            }
    }
    
    translate([-101.17,101.17,-35.8])
    {
            rotate([0,0,225])
            {
                rotate([35.2,0,0])
                {
                     box=[60,80.01,60];
                     cube(box,true);
                }
            }
    }
    
    translate([-101.17,-101.17,-35.8])
    {
        rotate([0,0,315])
        {
            rotate([35.2,0,0])
            {
                 box=[60,80.01,60];
                 cube(box,true);
            }
        }
    }
}


module proto_CUBX0012_BXTX0064_00000200_element()
{
    difference()
    {
        translate([0,0,0])
        {
            proto_CUBX0012_BSQX0064_00000200_element();
        }

        translate([0,-150,0])
        {
            proto_CUBX0012_BSQX0064_00000200_element();
        }

        translate([-150,0,0])
        {
            //proto_CUBX0012_BSQX0064_00000200_element();
        }
            
        translate([0,150,0])
        {
            proto_CUBX0012_BSQX0064_00000200_element();
        }

        translate([150,0,0])
        {
            //proto_CUBX0012_BSQX0064_00000200_element();
        }
    }

}

module proto_CUBX0012_LXTX0064_00000200_element()
{

    translate([0,50.0001,0])
    {
        // The -y side is visible.
        difference()
        {
            proto_CUBX0012_BXTX0064_00000200_element();
            union()
            {
                // Middle cut box.
                translate([0,0,0])
                {
                    rotate([0,0,0])
                    {
                         box=[200,100,30];
                         cube(box,true);
                    }
                }
                // Box that hides the uneeded half.
                translate([0,75,0])
                {
                    rotate([0,0,0])
                    {
                         box=[200,100,30];
                         cube(box,true);
                    }
                }
            }
        }
    }

    translate([0,-50.0001,0])
    {
        // The +y side is visible.
        difference()
        {

            proto_CUBX0012_BXTX0064_00000200_element();

            union()
            {
                // Middle cut box.
                translate([0,0,0])
                {
                    rotate([0,0,0])
                    {
                         box=[200,100,30];
                         cube(box,true);
                    }
                }
                // Box that hides the uneeded half.
                translate([0,-75,0])
                {
                    rotate([0,0,0])
                    {
                         box=[200,100,30];
                         cube(box,true);
                    }
                }
            }

        }
    }
}



module proto_CUBX0012_AXTX0064_00000200_element()
{

    translate([50.0001,0,0])
    {
        // The -y side is visible.
        difference()
        {
            proto_CUBX0012_BXTX0064_00000200_element();
            union()
            {
                // Middle cut box.
                translate([0,0,0])
                {
                    rotate([0,0,0])
                    {
                         box=[100,200,30];
                         cube(box,true);
                    }
                }
                // Box that hides the uneeded half.
                translate([75,0,0])
                {
                    rotate([0,0,0])
                    {
                         box=[100,200,30];
                         cube(box,true);
                    }
                }
            }
        }
    }

    translate([-50.0001,0,0])
    {
        // The +y side is visible.
        difference()
        {

            proto_CUBX0012_BXTX0064_00000200_element();

            union()
            {
                // Middle cut box.
                translate([0,0,0])
                {
                    rotate([0,0,0])
                    {
                         box=[100,200,30];
                         cube(box,true);
                    }
                }
                // Box that hides the uneeded half.
                translate([-75,0,0])
                {
                    rotate([0,0,0])
                    {
                         box=[100,200,30];
                         cube(box,true);
                    }
                }
            }
        }
    }
}


module proto_CUBX0012_BXPX0064_00000200_element()
{
    difference()
    {
        translate([0,0,0])
        {
            import("proto_CUBX0012_BSQX0064_00000200.stl");
            //proto_CUBX0012_BSQX0064_00000200();
        }

        translate([0,-150,0])
        {
            import("proto_CUBX0012_BSQX0064_00000200.stl");
            //proto_CUBX0012_BSQX0064_00000200();
        }

        translate([-150,0,0])
        {
            import("proto_CUBX0012_BSQX0064_00000200.stl");
            //proto_CUBX0012_BSQX0064_00000200();
        }
            
        translate([0,150,0])
        {
            import("proto_CUBX0012_BSQX0064_00000200.stl");
            //proto_CUBX0012_BSQX0064_00000200();
        }

        translate([150,0,0])
        {
            import("proto_CUBX0012_BSQX0064_00000200.stl");
            //proto_CUBX0012_BSQX0064_00000200();
        }
    }
}


module proto_CUBX0012_LXPX0064_00000200_element()
{

    translate([0,50.0001,0])
    {
        // The -y side is visible.
        difference()
        {
            proto_CUBX0012_BXPX0064_00000200_element();
            union()
            {
                // Middle cut box.
                translate([0,0,0])
                {
                    rotate([0,0,0])
                    {
                         box=[200,100,30];
                         cube(box,true);
                    }
                }
                // Box that hides the uneeded half.
                translate([0,75,0])
                {
                    rotate([0,0,0])
                    {
                         box=[200,100,30];
                         cube(box,true);
                    }
                }
            }
        }
    }

    translate([0,-50.0001,0])
    {
        // The +y side is visible.
        difference()
        {

            proto_CUBX0012_BXPX0064_00000200_element();

            union()
            {
                // Middle cut box.
                translate([0,0,0])
                {
                    rotate([0,0,0])
                    {
                         box=[200,100,30];
                         cube(box,true);
                    }
                }
                
                // Box that hides the uneeded half.
                translate([0,-75,0])
                {
                    rotate([0,0,0])
                    {
                         box=[200,100,30];
                         cube(box,true);
                    }
                }
            }

        }
    }
}



module proto_CUBX0012_SXPX0064_00000200_element()
{
    union()
    {
        translate([50,0,0])
        {
            difference()
            {
                proto_CUBX0012_LXPX0064_00000200_element();

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
                proto_CUBX0012_LXPX0064_00000200_element();

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

//proto_CUBX0012_BXPX0064_00000200_element();
//proto_CUBX0012_LXPX0064_00000200_element();
//proto_CUBX0012_SXPX0064_00000200_element();

//proto_CUBX0012_BXTX0064_00000200_element();
//proto_CUBX0012_LXTX0064_00000200_element();
//proto_CUBX0012_SXTX0064_00000200_element();
//proto_CUBX0012_AXTX0064_00000200_element();