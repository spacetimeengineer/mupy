
module side_profile(alpha = 2.325)
{
    translate([0,alpha,0])
    {
        difference()
        {
            translate([0,80,10])
            {
                rotate([0,0,0])
                {
                     box=[200,100,100];
                     cube(box,true);
                }
            }

            translate([0,30,-40])
            {
                rotate([45,0,0])
                {
                     box=[210,25,25];
                     cube(box,true);
                }
            }   
        }
    }   

    translate([0,-alpha,0])
    {
        difference()
        {
            translate([0,-80,10])
            {
                rotate([0,0,0])
                {
                     box=[200,100,100];
                     cube(box,true);
                }
            }

            translate([0,-30,-40])
            {
                rotate([45,0,0])
                {
                     box=[210,25,25];
                     cube(box,true);
                }
            }   
        }
    }   
}

module proto_profile()
{
    rotate([0,45,0])
    {
        difference()
        {
            translate([0,0,0])
            {
                rotate([0,0,0])
                {
                     box=[100,100,100];
                     cube(box,true);
                }
            }

            translate([-35.45,0,35.45])
            {
                rotate([0,45,0])
                {
                     box=[101,101,200];
                     cube(box,true);
                }
            }
        }
    }
}

module bottom_profile()
{
    translate([0,0,-67])
    {
        rotate([0,0,0])
        {
             box=[30,200,20];
             cube(box,true);
        }
    }    
}

module bottom_side_profile()
{
    translate([0,50,-57.0])
    {
        rotate([45,0,0])
        {
             box=[210,10,10];
             cube(box,true);
        }
    }   

    translate([0,-50,-57.0])
    {
        rotate([45,0,0])
        {
             box=[210,10,10];
             cube(box,true);
        }
    }   
}


module inner_profile()
{
    translate([0,0,-82])
    {
        rotate([0,0,0])
        {
             box=[200,55,135];
             cube(box,true);
        }
    }
    
}


module corner_cut_profile()
{
    translate([66.6,-39,0])
    {
        rotate([0,0,45])
        {
             box=[40,20,50];
             cube(box,true);
        }
    } 
    translate([-66.6,-39,0])
    {
        rotate([0,0,135])
        {
             box=[40,20,50];
             cube(box,true);
        }
    } 
    translate([70.2,-15,0])
    {
        rotate([0,0,90])
        {
             box=[40,20,50];
             cube(box,true);
        }
    } 
    translate([-70.2,-15,0])
    {
        rotate([0,0,90])
        {
             box=[40,20,50];
             cube(box,true);
        }
    } 
}

module male_snap()
{    
    
    scale([1.15,1,1.15])
    {
        
        scale([1.50,0.91,1.48])
        {
            
            scale(0.05)
            {   
                scale([1,1.9,1])
                {
                    //corner_cut_profile();
                    difference()
                    {
                        proto_profile();
                        side_profile(alpha = 13);
                        bottom_profile();
                        bottom_side_profile();
                        inner_profile();
                        corner_cut_profile();
                    }        
                }
            }
        }
    }
}



module female_snap()
{
    // Final scaling factor for tweaking.
    // Need to make slightly bigger in x,y,z or the male is smaller.
    scale([1.15,1,1.15])
    {
        difference()
        {
            scale([1.50,1,1.50])
            {
                difference()
                {
                    box = [10,10,3];
                    cube(box,true);

                    translate([0,0,1.519])
                    {

                       scale([0.05,0.05,0.05])
                       {
                           scale([1,1.9,1])
                           {
                               difference()
                                {
                                    proto_profile();
                                    side_profile(alpha = 13);
                                    bottom_profile();
                                    bottom_side_profile();
                                    corner_cut_profile();
                                }
                                
                            } 
                       }      
                       
                    }
                }
            }
            translate([-7,0,-3])
            {
                rotate([0,45,0])
                {
                     box=[11,11,7];
                     cube(box,true);
                }
            }   

            translate([7,0,-3])
            {
                rotate([0,45,0])
                {
                     box=[7,11,11];
                     cube(box,true);
                }
            }
            
            
            
            translate([0,5.5,-2.5])
            {
                rotate([45,0,0])
                {
                     box=[10,2,2];
                     cube(box,true);
                }
            } 

            translate([0,-5.5,-2.5])
            {
                rotate([45,0,0])
                {
                     box=[10,2,2];
                     cube(box,true);
                }
            } 


            
        }
    }
}


module female_snap_adapter()
{
    scale([1.15,1,1.15])
    {
        difference()
        {
            scale([1.50,1,1.50])
            {
                difference()
                {
                    box = [10,10,3];
                    cube(box,true);
                }
            }
            translate([-7,0,-3])
            {
                rotate([0,45,0])
                {
                     box=[11,11,7];
                     cube(box,true);
                }
            }   

            translate([7,0,-3])
            {
                rotate([0,45,0])
                {
                     box=[7,11,11];
                     cube(box,true);
                }
            }
        }
    }
}

/* TEST : Make snaps smaller.*/

module male_snap_stu()
{

    translate([0,1.5,0])
    {
        difference()
        {
            male_snap();
            translate([0,3,0])
            {
                rotate([0,0,0])
                {
                     box=[25,6,15];
                     cube(box,true);
                }
            }
        }
    }


    translate([0,-1.5,0])
    {
        mirror([0,1,0])
        {
            difference()
            {
                male_snap();
                translate([0,3,0])
                {
                    rotate([0,0,0])
                    {
                         box=[25,6,15];
                         cube(box,true);
                    }
                }
            }
        }
    }

}

module female_snap_stu()
{
    
    difference()
    {
    
        union()
        {   
        
            translate([0,1.5,0])
            {
                difference()
                {
                    female_snap();
                    translate([0,4,0])
                    {
                        rotate([0,0,0])
                        {
                             box=[25,8,9];
                             cube(box,true);
                        }
                    }
                }
            }


            translate([0,-1.5,0])
            {
                mirror([0,1,0])
                {
                    difference()
                    {
                        female_snap();
                        translate([0,4,0])
                        {
                            rotate([0,0,0])
                            {
                                 box=[25,8,9];
                                 cube(box,true);
                            }
                        }
                    }
                }
            }
            
        }
    }  
}


module female_snap_adapter_modified()
{
    
    difference()
    {
    
        union()
        {   
        
            translate([0,1.5,0])
            {
                difference()
                {
                    female_snap_adapter();
                    translate([0,4,0])
                    {
                        rotate([0,0,0])
                        {
                             box=[25,8,9];
                             cube(box,true);
                        }
                    }
                }
            }


            translate([0,-1.5,0])
            {
                mirror([0,1,0])
                {
                    difference()
                    {
                        female_snap_adapter();
                        translate([0,4,0])
                        {
                            rotate([0,0,0])
                            {
                                 box=[25,8,9];
                                 cube(box,true);
                            }
                        }
                    }
                }
            }
        }
    }  
}



female_snap_adapter_modified();
//female_snap_stu();
translate([0,0,10])
{
    //male_snap_stu();
}




scale([0,0,0])
{
    scale([0,0,0])
    {
         box=[100,100,100];
         cube(box,true);
    }
}




