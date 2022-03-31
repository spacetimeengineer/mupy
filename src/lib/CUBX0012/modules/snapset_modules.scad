/* Imports */

use <snap_modules.scad>;


/* Generalized CUBX0012_BSQX0064_00000200 Snap Set Functions ( Archetype Specific ) */

module outer_CUBX0012_BSQX0064_00000200_adapters(alpha=8.8, epsilon = 82.005, gamma = -3.81, zeta = 0.17)
{
    translate([-(50-alpha),epsilon,-1])
    {
        rotate([225,0,0])
        {
            rotate([0,0,90])
            {
                translate([zeta,0,gamma])
                {
                    female_snap_adapter_modified();
                }
            }
        }
    }
    
    translate([50+alpha,epsilon,-1])
    {
        rotate([225,0,0])
        {
            rotate([0,0,90])
            {
                translate([zeta,0,gamma])
                {
                    female_snap_adapter_modified();
                }
            }
        }
    }
    
    translate([alpha,epsilon,-1])
    {
        rotate([225,0,0])
        {
            rotate([0,0,90])
            {
                translate([zeta,0,gamma])
                {
                    female_snap_adapter_modified();
                }
            }
        }
    }
    
    translate([epsilon,50-alpha,-1])
    {
        rotate([0,135,0])
        {
            rotate([0,0,0])
            {
                translate([zeta,0,gamma])
                {
                    female_snap_adapter_modified();
                }
            }
        }
    }
    
    translate([epsilon,-(50+alpha),-1])
    {
        rotate([0,135,0])
        {
            rotate([0,0,0])
            {
                translate([zeta,0,gamma])
                {
                    female_snap_adapter_modified();
                }
            }
        }
    }
    
    translate([epsilon,-alpha,-1])
    {
        rotate([0,135,0])
        {
            rotate([0,0,0])
            {
                translate([zeta,0,gamma])
                {
                    female_snap_adapter_modified();
                }
            }
        }
    }
    
    translate([-epsilon,50+alpha,-1])
    {
        rotate([0,225,0])
        {
            rotate([0,0,0])
            {
                translate([zeta,0,gamma])
                {
                    female_snap_adapter_modified();
                }
            }
        }
    }
    
    translate([-epsilon,-(50-alpha),-1])
    {
        rotate([0,225,0])
        {
            rotate([0,0,0])
            {
                translate([zeta,0,gamma])
                {
                    female_snap_adapter_modified();
                }
            }
        }
    }

    translate([-epsilon,alpha,-1])
    {
        rotate([0,225,0])
        {
            rotate([0,0,0])
            {
                translate([zeta,0,gamma])
                {
                    female_snap_adapter_modified();
                }
            }
        }
    }

    translate([-(50+alpha),-epsilon,-1])
    {
        rotate([135,0,0])
        {
            rotate([0,0,90])
            {
                translate([zeta,0,gamma])
                {
                    female_snap_adapter_modified();
                }
            }
        }
    }
    
    translate([50-alpha,-epsilon,-1])
    {
        rotate([135,0,0])
        {
            rotate([0,0,90])
            {
                translate([zeta,0,gamma])
                {
                    female_snap_adapter_modified();
                }
            }
        }
    }    
    
    translate([-alpha,-epsilon,-1])
    {
        rotate([135,0,0])
        {
            rotate([0,0,90])
            {
                translate([zeta,0,gamma])
                {
                    female_snap_adapter_modified();
                }
            }
        }
    }    
}





module outer_CUBX0012_BSQX0064_00000200_snaps(alpha=8.8, epsilon = 82.005, delta=1.26, gamma=-3.81, zeta=0.17, phi=-0.17 )
{
    /* Males */
    translate([-(50+alpha),epsilon,-1])
    {
        rotate([45,0,0])
        {
            rotate([0,0,90])
            {
                translate([phi,0,delta])
                {
                    male_snap_stu();
                }
            }
        }
    }
    
    translate([(50-alpha),epsilon,-1])
    {
        rotate([45,0,0])
        {
            rotate([0,0,90])
            {
                translate([phi,0,delta])
                {
                    male_snap_stu();
                }
            }
        }
    }
    
    translate([-alpha,epsilon,-1])
    {
        rotate([45,0,0])
        {
            rotate([0,0,90])
            {
                translate([phi,0,delta])
                {
                    male_snap_stu();
                }
            }
        }
    }
    
    translate([-epsilon,-(50+alpha),-1])
    {
        rotate([0,45,0])
        {
            rotate([0,0,0])
            {
                translate([phi,0,delta])
                {
                    male_snap_stu();
                }
            }
        }
    }
    
    translate([-epsilon,(50-alpha),-1])
    {
        rotate([0,45,0])
        {
            rotate([zeta,0,0])
            {
                translate([phi,0,delta])
                {
                    male_snap_stu();
                }
            }
        }
    }
    
    translate([-epsilon,-alpha,-1])
    {
        rotate([0,45,0])
        {
            rotate([zeta,0,0])
            {
                translate([phi,0,delta])
                {
                    male_snap_stu();
                }
            }
        }
    }
    
    translate([(50+alpha),-epsilon,-1])
    {
        rotate([315,0,0])
        {
            rotate([0,0,90])
            {
                translate([phi,0,delta])
                {
                    male_snap_stu();
                }
            }
        }
    }
    
    translate([-(50-alpha),-epsilon,-1])
    {
        rotate([315,0,0])
        {
            rotate([0,0,90])
            {
                translate([phi,0,delta])
                {
                    male_snap_stu();
                }
            }
        }
    }
    
    translate([alpha,-epsilon,-1])
    {
        rotate([315,0,0])
        {
            rotate([0,0,90])
            {
                translate([phi,0,delta])
                {
                    male_snap_stu();
                }
            }
        }
    }
    
    translate([epsilon,(50+alpha),-1])
    {
        rotate([0,315,0])
        {
            rotate([0,0,0])
            {
                translate([phi,0,delta])
                {
                    male_snap_stu();
                }
            }
        }
    }
    
    translate([epsilon,-(50-alpha),-1])
    {
        rotate([0,315,0])
        {
            rotate([0,0,0])
            {
                translate([phi,0,delta])
                {
                    male_snap_stu();
                }
            }
        }
    }
    
    translate([epsilon,alpha,-1])
    {
        rotate([0,315,0])
        {
            rotate([0,0,0])
            {
                translate([phi,0,delta])
                {
                    male_snap_stu();
                }
            }
        }
    }
    

    /* Femal snap modules */


    translate([-(50-alpha),epsilon,-1])
    {
        rotate([225,0,0])
        {
            rotate([0,0,90])
            {
                translate([zeta,0,gamma])
                {
                    female_snap_stu();
                }
            }
        }
    }
    
    translate([(50+alpha),epsilon,-1])
    {
        rotate([225,0,0])
        {
            rotate([0,0,90])
            {
                translate([zeta,0,gamma])
                {
                    female_snap_stu();
                }
            }
        }
    }
    
    translate([alpha,epsilon,-1])
    {
        rotate([225,0,0])
        {
            rotate([0,0,90])
            {
                translate([zeta,0,gamma])
                {
                    female_snap_stu();
                }
            }
        }
    }
    
    translate([epsilon,(50-alpha),-1])
    {
        rotate([0,135,0])
        {
            rotate([0,0,0])
            {
                translate([zeta,0,gamma])
                {
                    female_snap_stu();
                }
            }
        }
    }
    
    translate([epsilon,-(50+alpha),-1])
    {
        rotate([0,135,0])
        {
            rotate([0,0,0])
            {
                translate([zeta,0,gamma])
                {
                    female_snap_stu();
                }
            }
        }
    }
    
    translate([epsilon,-alpha,-1])
    {
        rotate([0,135,0])
        {
            rotate([0,0,0])
            {
                translate([zeta,0,gamma])
                {
                    female_snap_stu();
                }
            }
        }
    }
    
    translate([-epsilon,(50+alpha),-1])
    {
        rotate([0,225,0])
        {
            rotate([0,0,0])
            {
                translate([zeta,0,gamma])
                {
                    female_snap_stu();
                }
            }
        }
    }
    
    translate([-epsilon,-(50-alpha),-1])
    {
        rotate([0,225,0])
        {
            rotate([0,0,0])
            {
                translate([zeta,0,gamma])
                {
                    female_snap_stu();
                }
            }
        }
    }
    
    translate([-epsilon,alpha,-1])
    {
        rotate([0,225,0])
        {
            rotate([0,0,0])
            {
                translate([zeta,0,gamma])
                {
                    female_snap_stu();
                }
            }
        }
    }
    
    translate([-(50+alpha),-epsilon,-1])
    {
        rotate([135,0,0])
        {
            rotate([0,0,90])
            {
                translate([zeta,0,gamma])
                {
                    female_snap_stu();
                }
            }
        }
    }
    
    translate([(50-alpha),-epsilon,-1])
    {
        rotate([135,0,0])
        {
            rotate([0,0,90])
            {
                translate([zeta,0,gamma])
                {
                    female_snap_stu();
                }
            }
        }
    }
    
    translate([-alpha,-epsilon,-1])
    {
        rotate([135,0,0])
        {
            rotate([0,0,90])
            {
                translate([zeta,0,gamma])
                {
                    female_snap_stu();
                }
            }
        }
    }
}

module top_CUBX0012_BSQX0064_00000200_adapters(alpha = 8.8, beta = 65.73, gamma = 13.742, delta = 50)
{
    
    translate([beta,delta,gamma])
    {
        rotate([0,0,90])
        {

            translate([-alpha,0,0])
            {
                rotate([0,0,0])
                {
                    rotate([0,0,90])
                    {
                        translate([0,0,-3.49])
                        {
                            female_snap_adapter_modified();
                        }
                    }
                }
            }
        }
    }
    
    
    
    // Middle top snap modules.
    translate([beta,0,gamma])
    {
        rotate([0,0,90])
        {



            translate([-alpha,0,0])
            {
                rotate([0,0,0])
                {
                    rotate([0,0,90])
                    {
                        translate([0,0,-3.49])
                        {
                            female_snap_adapter_modified();
                        }
                    }
                }
            }
        }
    }

    translate([beta,-delta,gamma])
    {
        rotate([0,0,90])
        {



            translate([-alpha,0,0])
            {
                rotate([0,0,0])
                {
                    rotate([0,0,90])
                    {
                        translate([0,0,-3.49])
                        {
                            female_snap_adapter_modified();
                        }
                    }
                }
            }
        }
    }
    
    
    
    
    
    
    /* - X side. */
    
    
    
    translate([-beta,delta,gamma])
    {
        rotate([0,0,90])
        {


            translate([alpha,0,0])
            {
                rotate([0,0,0])
                {
                    rotate([0,0,90])
                    {
                        translate([0,0,-3.49])
                        {
                            female_snap_adapter_modified();
                        }
                    }
                }
            }
        }
    }
    
    // Middle top snap modules.
    translate([-beta,0,gamma])
    {
        rotate([0,0,90])
        {


            translate([alpha,0,0])
            {
                rotate([0,0,0])
                {
                    rotate([0,0,90])
                    {
                        translate([0,0,-3.49])
                        {
                            female_snap_adapter_modified();
                        }
                    }
                }
            }
        }
    }

    // Male { -X , -Y } side.
    
    translate([-beta,-delta,gamma])
    {
        rotate([0,0,90])
        {

            translate([alpha,0,0])
            {
                rotate([0,0,0])
                {
                    rotate([0,0,90])
                    {
                        translate([0,0,-3.49])
                        {
                            female_snap_adapter_modified();
                        }
                    }
                }
            }
        }
    }
    
    
    
    
    
    

    translate([delta,beta,gamma])
    {
        rotate([0,0,180])
        {

            translate([-alpha,0,0])
            {
                rotate([0,0,0])
                {
                    rotate([0,0,90])
                    {
                        translate([0,0,-3.49])
                        {
                            female_snap_adapter_modified();
                        }
                    }
                }
            }
        }
    }
    
    translate([0,beta,gamma])
    {
        rotate([0,0,180])
        {

            translate([-alpha,0,0])
            {
                rotate([0,0,0])
                {
                    rotate([0,0,90])
                    {
                        translate([0,0,-3.49])
                        {
                            female_snap_adapter_modified();
                        }
                    }
                }
            }
        }
    }
    
    translate([-delta,beta,gamma])
    {
        rotate([0,0,180])
        {
            translate([-alpha,0,0])
            {
                rotate([0,0,0])
                {
                    rotate([0,0,90])
                    {
                        translate([0,0,-3.49])
                        {
                            female_snap_adapter_modified();
                        }
                    }
                }
            }
        }
    }
    
    translate([delta,-beta,gamma])
    {
        rotate([0,0,180])
        {
            translate([alpha,0,0])
            {
                rotate([0,0,0])
                {
                    rotate([0,0,90])
                    {
                        translate([0,0,-3.49])
                        {
                            female_snap_adapter_modified();
                        }
                    }
                }
            }
        }
    }
    
    translate([0,-beta,gamma])
    {
        rotate([0,0,180])
        {
            translate([alpha,0,0])
            {
                rotate([0,0,0])
                {
                    rotate([0,0,90])
                    {
                        translate([0,0,-3.49])
                        {
                            female_snap_adapter_modified();
                        }
                    }
                }
            }
        }
    }
    
    translate([-delta,-beta,gamma])
    {
        rotate([0,0,180])
        {
            translate([alpha,0,0])
            {
                rotate([0,0,0])
                {
                    rotate([0,0,90])
                    {
                        translate([0,0,-3.49])
                        {
                            female_snap_adapter_modified();
                        }
                    }
                }
            }
        }
    }
}




module top_CUBX0012_BSQX0064_00000200_snaps(alpha = 8.8, beta = 65.73, gamma = 13.4, delta = 50, mu = 1)
{
    
    translate([beta,delta,gamma])
    {
        rotate([0,0,90])
        {
            translate([alpha,0,0])
            {
                rotate([180,0,0])
                {
                    rotate([0,0,90])
                    {
                        translate([0,0,mu])
                        {
                            male_snap_stu();
                        }
                    }
                }
            }


            translate([-alpha,0,0])
            {
                rotate([0,0,0])
                {
                    rotate([0,0,90])
                    {
                        translate([0,0,-3.49])
                        {
                            female_snap_stu();
                        }
                    }
                }
            }
        }
    }
    
    // Middle top snap modules.
    translate([beta,0,gamma])
    {
        rotate([0,0,90])
        {
            translate([alpha,0,0])
            {
                rotate([180,0,0])
                {
                    rotate([0,0,90])
                    {
                        translate([0,0,mu])
                        {
                            male_snap_stu();
                        }
                    }
                }
            }


            translate([-alpha,0,0])
            {
                rotate([0,0,0])
                {
                    rotate([0,0,90])
                    {
                        translate([0,0,-3.49])
                        {
                            female_snap_stu();
                        }
                    }
                }
            }
        }
    }

    translate([beta,-delta,gamma])
    {
        rotate([0,0,90])
        {
            translate([alpha,0,0])
            {
                rotate([180,0,0])
                {
                    rotate([0,0,90])
                    {
                        translate([0,0,mu])
                        {
                            male_snap_stu();
                        }
                    }
                }
            }


            translate([-alpha,0,0])
            {
                rotate([0,0,0])
                {
                    rotate([0,0,90])
                    {
                        translate([0,0,-3.49])
                        {
                            female_snap_stu();
                        }
                    }
                }
            }
        }
    }
    
    
    
    
    
    
    /* - X side. */
    
    
    
    translate([-beta,delta,gamma])
    {
        rotate([0,0,90])
        {
            translate([-alpha,0,0])
            {
                rotate([180,0,0])
                {
                    rotate([0,0,90])
                    {
                        translate([0,0,mu])
                        {
                            male_snap_stu();
                        }
                    }
                }
            }


            translate([alpha,0,0])
            {
                rotate([0,0,0])
                {
                    rotate([0,0,90])
                    {
                        translate([0,0,-3.49])
                        {
                            female_snap_stu();
                        }
                    }
                }
            }
        }
    }
    
    // Middle top snap modules.
    translate([-beta,0,gamma])
    {
        rotate([0,0,90])
        {
            translate([-alpha,0,0])
            {
                rotate([180,0,0])
                {
                    rotate([0,0,90])
                    {
                        translate([0,0,mu])
                        {
                            male_snap_stu();
                        }
                    }
                }
            }


            translate([alpha,0,0])
            {
                rotate([0,0,0])
                {
                    rotate([0,0,90])
                    {
                        translate([0,0,-3.49])
                        {
                            female_snap_stu();
                        }
                    }
                }
            }
        }
    }

    // Male { -X , -Y } side.
    
    translate([-beta,-delta,gamma])
    {
        rotate([0,0,90])
        {
            translate([-alpha,0,0])
            {
                rotate([180,0,0])
                {
                    rotate([0,0,90])
                    {
                        translate([0,0,mu])
                        {
                            male_snap_stu();
                        }
                    }
                }
            }


            translate([alpha,0,0])
            {
                rotate([0,0,0])
                {
                    rotate([0,0,90])
                    {
                        translate([0,0,-3.49])
                        {
                            female_snap_stu();
                        }
                    }
                }
            }
        }
    }
    
    
    
    
    
    

    translate([delta,beta,gamma])
    {
        rotate([0,0,180])
        {
            translate([alpha,0,0])
            {
                rotate([180,0,0])
                {
                    rotate([0,0,90])
                    {
                        translate([0,0,mu])
                        {
                            male_snap_stu();
                        }
                    }
                }
            }


            translate([-alpha,0,0])
            {
                rotate([0,0,0])
                {
                    rotate([0,0,90])
                    {
                        translate([0,0,-3.49])
                        {
                            female_snap_stu();
                        }
                    }
                }
            }
        }
    }
    
    translate([0,beta,gamma])
    {
        rotate([0,0,180])
        {
            translate([alpha,0,0])
            {
                rotate([180,0,0])
                {
                    rotate([0,0,90])
                    {
                        translate([0,0,mu])
                        {
                            male_snap_stu();
                        }
                    }
                }
            }


            translate([-alpha,0,0])
            {
                rotate([0,0,0])
                {
                    rotate([0,0,90])
                    {
                        translate([0,0,-3.49])
                        {
                            female_snap_stu();
                        }
                    }
                }
            }
        }
    }
    
    translate([-delta,beta,gamma])
    {
        rotate([0,0,180])
        {
            translate([alpha,0,0])
            {
                rotate([180,0,0])
                {
                    rotate([0,0,90])
                    {
                        translate([0,0,mu])
                        {
                            male_snap_stu();
                        }
                    }
                }
            }


            translate([-alpha,0,0])
            {
                rotate([0,0,0])
                {
                    rotate([0,0,90])
                    {
                        translate([0,0,-3.49])
                        {
                            female_snap_stu();
                        }
                    }
                }
            }
        }
    }
    
    translate([delta,-beta,gamma])
    {
        rotate([0,0,180])
        {
            translate([-alpha,0,0])
            {
                rotate([180,0,0])
                {
                    rotate([0,0,90])
                    {
                        translate([0,0,mu])
                        {
                            male_snap_stu();
                        }
                    }
                }
            }


            translate([alpha,0,0])
            {
                rotate([0,0,0])
                {
                    rotate([0,0,90])
                    {
                        translate([0,0,-3.49])
                        {
                            female_snap_stu();
                        }
                    }
                }
            }
        }
    }
    
    translate([0,-beta,gamma])
    {
        rotate([0,0,180])
        {
            translate([-alpha,0,0])
            {
                rotate([180,0,0])
                {
                    rotate([0,0,90])
                    {
                        translate([0,0,mu])
                        {
                            male_snap_stu();
                        }
                    }
                }
            }


            translate([alpha,0,0])
            {
                rotate([0,0,0])
                {
                    rotate([0,0,90])
                    {
                        translate([0,0,-3.49])
                        {
                            female_snap_stu();
                        }
                    }
                }
            }
        }
    }
    
    translate([-delta,-beta,gamma])
    {
        rotate([0,0,180])
        {
            translate([-alpha,0,0])
            {
                rotate([180,0,0])
                {
                    rotate([0,0,90])
                    {
                        translate([0,0,mu])
                        {
                            male_snap_stu();
                        }
                    }
                }
            }


            translate([alpha,0,0])
            {
                rotate([0,0,0])
                {
                    rotate([0,0,90])
                    {
                        translate([0,0,-3.49])
                        {
                            female_snap_stu();
                        }
                    }
                }
            }
        }
    }
}










/* Generalized CUBX0012_BXTX0064_00000200 Snap Set Functions ( Archetype Specific ) */


module inner_CUBX0012_BXTX0064_00000200_snaps(alpha=8.8, epsilon = 69.481, delta=1.26, gamma=-3.81, zeta=-0.20, phi=-0.17 )
{
    /* Males */
    translate([(50+alpha),epsilon,-1])
    {
        rotate([45,0,0])
        {
            rotate([0,0,90])
            {
                translate([phi,0,delta])
                {
                    male_snap_stu();
                }
            }
        }
    }
    
    translate([-(50-alpha),epsilon,-1])
    {
        rotate([45,0,0])
        {
            rotate([0,0,90])
            {
                translate([phi,0,delta])
                {
                    male_snap_stu();
                }
            }
        }
    }
    
    translate([alpha,epsilon,-1])
    {
        rotate([45,0,0])
        {
            rotate([0,0,90])
            {
                translate([phi,0,delta])
                {
                    male_snap_stu();
                }
            }
        }
    }
    
    translate([-epsilon,(50+alpha),-1])
    {
        rotate([0,45,0])
        {
            rotate([0,0,0])
            {
                translate([phi,0,delta])
                {
                    male_snap_stu();
                }
            }
        }
    }
    
    translate([-epsilon,-(50-alpha),-1])
    {
        rotate([0,45,0])
        {
            rotate([zeta,0,0])
            {
                translate([phi,0,delta])
                {
                    male_snap_stu();
                }
            }
        }
    }
    
    translate([-epsilon,alpha,-1])
    {
        rotate([0,45,0])
        {
            rotate([zeta,0,0])
            {
                translate([phi,0,delta])
                {
                    male_snap_stu();
                }
            }
        }
    }
    
    translate([-(50+alpha),-epsilon,-1])
    {
        rotate([315,0,0])
        {
            rotate([0,0,90])
            {
                translate([phi,0,delta])
                {
                    male_snap_stu();
                }
            }
        }
    }
    
    translate([(50-alpha),-epsilon,-1])
    {
        rotate([315,0,0])
        {
            rotate([0,0,90])
            {
                translate([phi,0,delta])
                {
                    male_snap_stu();
                }
            }
        }
    }
    
    translate([-alpha,-epsilon,-1])
    {
        rotate([315,0,0])
        {
            rotate([0,0,90])
            {
                translate([phi,0,delta])
                {
                    male_snap_stu();
                }
            }
        }
    }
    
    translate([epsilon,-(50+alpha),-1])
    {
        rotate([0,315,0])
        {
            rotate([0,0,0])
            {
                translate([phi,0,delta])
                {
                    male_snap_stu();
                }
            }
        }
    }
    
    translate([epsilon,(50-alpha),-1])
    {
        rotate([0,315,0])
        {
            rotate([0,0,0])
            {
                translate([phi,0,delta])
                {
                    male_snap_stu();
                }
            }
        }
    }
    
    translate([epsilon,-alpha,-1])
    {
        rotate([0,315,0])
        {
            rotate([0,0,0])
            {
                translate([phi,0,delta])
                {
                    male_snap_stu();
                }
            }
        }
    }
    

    /* Female snap modules */


    translate([(50-alpha),epsilon,-1])
    {
        rotate([225,0,0])
        {
            rotate([0,0,90])
            {
                translate([zeta,0,gamma])
                {
                    female_snap_stu();
                }
            }
        }
    }
    
    translate([-(50+alpha),epsilon,-1])
    {
        rotate([225,0,0])
        {
            rotate([0,0,90])
            {
                translate([zeta,0,gamma])
                {
                    female_snap_stu();
                }
            }
        }
    }
    
    translate([-alpha,epsilon,-1])
    {
        rotate([225,0,0])
        {
            rotate([0,0,90])
            {
                translate([zeta,0,gamma])
                {
                    female_snap_stu();
                }
            }
        }
    }
    
    translate([epsilon,-(50-alpha),-1])
    {
        rotate([0,135,0])
        {
            rotate([0,0,0])
            {
                translate([zeta,0,gamma])
                {
                    female_snap_stu();
                }
            }
        }
    }
    
    translate([epsilon,(50+alpha),-1])
    {
        rotate([0,135,0])
        {
            rotate([0,0,0])
            {
                translate([zeta,0,gamma])
                {
                    female_snap_stu();
                }
            }
        }
    }
    
    translate([epsilon,alpha,-1])
    {
        rotate([0,135,0])
        {
            rotate([0,0,0])
            {
                translate([zeta,0,gamma])
                {
                    female_snap_stu();
                }
            }
        }
    }
    
    translate([-epsilon,-(50+alpha),-1])
    {
        rotate([0,225,0])
        {
            rotate([0,0,0])
            {
                translate([zeta,0,gamma])
                {
                    female_snap_stu();
                }
            }
        }
    }
    
    translate([-epsilon,(50-alpha),-1])
    {
        rotate([0,225,0])
        {
            rotate([0,0,0])
            {
                translate([zeta,0,gamma])
                {
                    female_snap_stu();
                }
            }
        }
    }
    
    translate([-epsilon,-alpha,-1])
    {
        rotate([0,225,0])
        {
            rotate([0,0,0])
            {
                translate([zeta,0,gamma])
                {
                    female_snap_stu();
                }
            }
        }
    }
    
    translate([(50+alpha),-epsilon,-1])
    {
        rotate([135,0,0])
        {
            rotate([0,0,90])
            {
                translate([zeta,0,gamma])
                {
                    female_snap_stu();
                }
            }
        }
    }
    
    translate([-(50-alpha),-epsilon,-1])
    {
        rotate([135,0,0])
        {
            rotate([0,0,90])
            {
                translate([zeta,0,gamma])
                {
                    female_snap_stu();
                }
            }
        }
    }
    
    translate([alpha,-epsilon,-1])
    {
        rotate([135,0,0])
        {
            rotate([0,0,90])
            {
                translate([zeta,0,gamma])
                {
                    female_snap_stu();
                }
            }
        }
    }
}


module inner_CUBX0012_BXTX0064_00000200_adapters(alpha=8.8, gamma = -3.79, delta = 58.8, epsilon = 69.481, zeta = -0.2)
{

    translate([(50-alpha),epsilon,-1])
    {
        rotate([225,0,0])
        {
            rotate([0,0,90])
            {
                translate([zeta,0,gamma])
                {
                    female_snap_adapter_modified();
                }
            }
        }
    }
    
    translate([-(50+alpha),epsilon,-1])
    {
        rotate([225,0,0])
        {
            rotate([0,0,90])
            {
                translate([zeta,0,gamma])
                {
                    female_snap_adapter_modified();
                }
            }
        }
    }
    
    translate([-alpha,epsilon,-1])
    {
        rotate([225,0,0])
        {
            rotate([0,0,90])
            {
                translate([zeta,0,gamma])
                {
                    female_snap_adapter_modified();
                }
            }
        }
    }
    
    translate([epsilon,-(50-alpha),-1])
    {
        rotate([0,135,0])
        {
            rotate([0,0,0])
            {
                translate([zeta,0,gamma])
                {
                    female_snap_adapter_modified();
                }
            }
        }
    }
    
    translate([epsilon,(50+alpha),-1])
    {
        rotate([0,135,0])
        {
            rotate([0,0,0])
            {
                translate([zeta,0,gamma])
                {
                    female_snap_adapter_modified();
                }
            }
        }
    }
    
    translate([epsilon,alpha,-1])
    {
        rotate([0,135,0])
        {
            rotate([0,0,0])
            {
                translate([zeta,0,gamma])
                {
                    female_snap_adapter_modified();
                }
            }
        }
    }
    
    translate([-epsilon,-(50+alpha),-1])
    {
        rotate([0,225,0])
        {
            rotate([0,0,0])
            {
                translate([zeta,0,gamma])
                {
                    female_snap_adapter_modified();
                }
            }
        }
    }
    
    translate([-epsilon,(50-alpha),-1])
    {
        rotate([0,225,0])
        {
            rotate([0,0,0])
            {
                translate([zeta,0,gamma])
                {
                    female_snap_adapter_modified();
                }
            }
        }
    }
    
    translate([-epsilon,-alpha,-1])
    {
        rotate([0,225,0])
        {
            rotate([0,0,0])
            {
                translate([zeta,0,gamma])
                {
                    female_snap_adapter_modified();
                }
            }
        }
    }
    
    translate([(50+alpha),-epsilon,-1])
    {
        rotate([135,0,0])
        {
            rotate([0,0,90])
            {
                translate([zeta,0,gamma])
                {
                    female_snap_adapter_modified();
                }
            }
        }
    }
    
    translate([-(50-alpha),-epsilon,-1])
    {
        rotate([135,0,0])
        {
            rotate([0,0,90])
            {
                translate([zeta,0,gamma])
                {
                    female_snap_adapter_modified();
                }
            }
        }
    }
    
    translate([alpha,-epsilon,-1])
    {
        rotate([135,0,0])
        {
            rotate([0,0,90])
            {
                translate([zeta,0,gamma])
                {
                    female_snap_adapter_modified();
                }
            }
        }
    }
}








module top_CUBX0012_BXTX0064_00000200_snaps()
{
    top_CUBX0012_BSQX0064_00000200_snaps();
}

module top_CUBX0012_BXTX0064_00000200_adapters()
{
    top_CUBX0012_BSQX0064_00000200_adapters();
}




/* Generalized CUBX0012_BXTX0064_00000200 Snap Set Functions ( Archetype Specific ) */


module inner_CUBX0012_BXTX0064_00000200_adapters(alpha=8.8, gamma = -3.79, delta = 58.8, epsilon = 69.481, zeta = -0.2)
{
    translate([(50-alpha),epsilon,-1])
    {
        rotate([225,0,0])
        {
            rotate([0,0,90])
            {
                translate([zeta,0,gamma])
                {
                    female_snap_adapter_modified();
                }
            }
        }
    }
    
    translate([-(50+alpha),epsilon,-1])
    {
        rotate([225,0,0])
        {
            rotate([0,0,90])
            {
                translate([zeta,0,gamma])
                {
                    female_snap_adapter_modified();
                }
            }
        }
    }
    
    translate([-alpha,epsilon,-1])
    {
        rotate([225,0,0])
        {
            rotate([0,0,90])
            {
                translate([zeta,0,gamma])
                {
                    female_snap_adapter_modified();
                }
            }
        }
    }
    
    translate([epsilon,-(50-alpha),-1])
    {
        rotate([0,135,0])
        {
            rotate([0,0,0])
            {
                translate([zeta,0,gamma])
                {
                    //female_snap_adapter_modified();
                }
            }
        }
    }
    
    translate([epsilon,(50+alpha),-1])
    {
        rotate([0,135,0])
        {
            rotate([0,0,0])
            {
                translate([zeta,0,gamma])
                {
                    //female_snap_adapter_modified();
                }
            }
        }
    }
    
    translate([epsilon,alpha,-1])
    {
        rotate([0,135,0])
        {
            rotate([0,0,0])
            {
                translate([zeta,0,gamma])
                {
                    //female_snap_adapter_modified();
                }
            }
        }
    }
    
    translate([-epsilon,-(50+alpha),-1])
    {
        rotate([0,225,0])
        {
            rotate([0,0,0])
            {
                translate([zeta,0,gamma])
                {
                    //female_snap_adapter_modified();
                }
            }
        }
    }
    
    translate([-epsilon,(50-alpha),-1])
    {
        rotate([0,225,0])
        {
            rotate([0,0,0])
            {
                translate([zeta,0,gamma])
                {
                    //female_snap_adapter_modified();
                }
            }
        }
    }
    
    translate([-epsilon,-alpha,-1])
    {
        rotate([0,225,0])
        {
            rotate([0,0,0])
            {
                translate([zeta,0,gamma])
                {
                    //female_snap_adapter_modified();
                }
            }
        }
    }
    
    translate([(50+alpha),-epsilon,-1])
    {
        rotate([135,0,0])
        {
            rotate([0,0,90])
            {
                translate([zeta,0,gamma])
                {
                    female_snap_adapter_modified();
                }
            }
        }
    }
    
    translate([-(50-alpha),-epsilon,-1])
    {
        rotate([135,0,0])
        {
            rotate([0,0,90])
            {
                translate([zeta,0,gamma])
                {
                    female_snap_adapter_modified();
                }
            }
        }
    }
    
    translate([alpha,-epsilon,-1])
    {
        rotate([135,0,0])
        {
            rotate([0,0,90])
            {
                translate([zeta,0,gamma])
                {
                    female_snap_adapter_modified();
                }
            }
        }
    }
    
    
}


module inner_CUBX0012_BXTX0064_00000200_snaps(alpha=8.8, epsilon = 69.481, delta=1.26, gamma=-3.81, zeta=-0.20, phi=-0.17 )
{
/* Males */
    translate([(50+alpha),epsilon,-1])
    {
        rotate([45,0,0])
        {
            rotate([0,0,90])
            {
                translate([phi,0,delta])
                {
                    male_snap_stu();
                }
            }
        }
    }
    
    translate([-(50-alpha),epsilon,-1])
    {
        rotate([45,0,0])
        {
            rotate([0,0,90])
            {
                translate([phi,0,delta])
                {
                    male_snap_stu();
                }
            }
        }
    }
    
    translate([alpha,epsilon,-1])
    {
        rotate([45,0,0])
        {
            rotate([0,0,90])
            {
                translate([phi,0,delta])
                {
                    male_snap_stu();
                }
            }
        }
    }
    
    translate([-epsilon,(50+alpha),-1])
    {
        rotate([0,45,0])
        {
            rotate([0,0,0])
            {
                translate([phi,0,delta])
                {
                    //male_snap_stu();
                }
            }
        }
    }
    
    translate([-epsilon,-(50-alpha),-1])
    {
        rotate([0,45,0])
        {
            rotate([zeta,0,0])
            {
                translate([phi,0,delta])
                {
                    //male_snap_stu();
                }
            }
        }
    }
    
    translate([-epsilon,alpha,-1])
    {
        rotate([0,45,0])
        {
            rotate([zeta,0,0])
            {
                translate([phi,0,delta])
                {
                    //male_snap_stu();
                }
            }
        }
    }
    
    translate([-(50+alpha),-epsilon,-1])
    {
        rotate([315,0,0])
        {
            rotate([0,0,90])
            {
                translate([phi,0,delta])
                {
                    male_snap_stu();
                }
            }
        }
    }
    
    translate([(50-alpha),-epsilon,-1])
    {
        rotate([315,0,0])
        {
            rotate([0,0,90])
            {
                translate([phi,0,delta])
                {
                    male_snap_stu();
                }
            }
        }
    }
    
    translate([-alpha,-epsilon,-1])
    {
        rotate([315,0,0])
        {
            rotate([0,0,90])
            {
                translate([phi,0,delta])
                {
                    male_snap_stu();
                }
            }
        }
    }
    
    translate([epsilon,-(50+alpha),-1])
    {
        rotate([0,315,0])
        {
            rotate([0,0,0])
            {
                translate([phi,0,delta])
                {
                    //male_snap_stu();
                }
            }
        }
    }
    
    translate([epsilon,(50-alpha),-1])
    {
        rotate([0,315,0])
        {
            rotate([0,0,0])
            {
                translate([phi,0,delta])
                {
                    //male_snap_stu();
                }
            }
        }
    }
    
    translate([epsilon,-alpha,-1])
    {
        rotate([0,315,0])
        {
            rotate([0,0,0])
            {
                translate([phi,0,delta])
                {
                    //male_snap_stu();
                }
            }
        }
    }
    

    /* Female snap modules */


    translate([(50-alpha),epsilon,-1])
    {
        rotate([225,0,0])
        {
            rotate([0,0,90])
            {
                translate([zeta,0,gamma])
                {
                    female_snap_stu();
                }
            }
        }
    }
    
    translate([-(50+alpha),epsilon,-1])
    {
        rotate([225,0,0])
        {
            rotate([0,0,90])
            {
                translate([zeta,0,gamma])
                {
                    female_snap_stu();
                }
            }
        }
    }
    
    translate([-alpha,epsilon,-1])
    {
        rotate([225,0,0])
        {
            rotate([0,0,90])
            {
                translate([zeta,0,gamma])
                {
                    female_snap_stu();
                }
            }
        }
    }
    
    translate([epsilon,-(50-alpha),-1])
    {
        rotate([0,135,0])
        {
            rotate([0,0,0])
            {
                translate([zeta,0,gamma])
                {
                    //female_snap_stu();
                }
            }
        }
    }
    
    translate([epsilon,(50+alpha),-1])
    {
        rotate([0,135,0])
        {
            rotate([0,0,0])
            {
                translate([zeta,0,gamma])
                {
                    //female_snap_stu();
                }
            }
        }
    }
    
    translate([epsilon,alpha,-1])
    {
        rotate([0,135,0])
        {
            rotate([0,0,0])
            {
                translate([zeta,0,gamma])
                {
                    //female_snap_stu();
                }
            }
        }
    }
    
    translate([-epsilon,-(50+alpha),-1])
    {
        rotate([0,225,0])
        {
            rotate([0,0,0])
            {
                translate([zeta,0,gamma])
                {
                    //female_snap_stu();
                }
            }
        }
    }
    
    translate([-epsilon,(50-alpha),-1])
    {
        rotate([0,225,0])
        {
            rotate([0,0,0])
            {
                translate([zeta,0,gamma])
                {
                    //female_snap_stu();
                }
            }
        }
    }
    
    translate([-epsilon,-alpha,-1])
    {
        rotate([0,225,0])
        {
            rotate([0,0,0])
            {
                translate([zeta,0,gamma])
                {
                    //female_snap_stu();
                }
            }
        }
    }
    
    translate([(50+alpha),-epsilon,-1])
    {
        rotate([135,0,0])
        {
            rotate([0,0,90])
            {
                translate([zeta,0,gamma])
                {
                    female_snap_stu();
                }
            }
        }
    }
    
    translate([-(50-alpha),-epsilon,-1])
    {
        rotate([135,0,0])
        {
            rotate([0,0,90])
            {
                translate([zeta,0,gamma])
                {
                    female_snap_stu();
                }
            }
        }
    }
    
    translate([alpha,-epsilon,-1])
    {
        rotate([135,0,0])
        {
            rotate([0,0,90])
            {
                translate([zeta,0,gamma])
                {
                    female_snap_stu();
                }
            }
        }
    }
}


module outer_CUBX0012_BXTX0064_00000200_adapters(alpha=8.8, epsilon = 82.005, gamma = -3.81, zeta = 0.17)
{
    translate([-(50-alpha),epsilon,-1])
    {
        rotate([225,0,0])
        {
            rotate([0,0,90])
            {
                translate([zeta,0,gamma])
                {
                    //female_snap_adapter_modified();
                }
            }
        }
    }
    
    translate([50+alpha,epsilon,-1])
    {
        rotate([225,0,0])
        {
            rotate([0,0,90])
            {
                translate([zeta,0,gamma])
                {
                    //female_snap_adapter_modified();
                }
            }
        }
    }
    
    translate([alpha,epsilon,-1])
    {
        rotate([225,0,0])
        {
            rotate([0,0,90])
            {
                translate([zeta,0,gamma])
                {
                    //female_snap_adapter_modified();
                }
            }
        }
    }
    
    translate([epsilon,50-alpha,-1])
    {
        rotate([0,135,0])
        {
            rotate([0,0,0])
            {
                translate([zeta,0,gamma])
                {
                    female_snap_adapter_modified();
                }
            }
        }
    }
    
    translate([epsilon,-(50+alpha),-1])
    {
        rotate([0,135,0])
        {
            rotate([0,0,0])
            {
                translate([zeta,0,gamma])
                {
                    female_snap_adapter_modified();
                }
            }
        }
    }
    
    translate([epsilon,-alpha,-1])
    {
        rotate([0,135,0])
        {
            rotate([0,0,0])
            {
                translate([zeta,0,gamma])
                {
                    female_snap_adapter_modified();
                }
            }
        }
    }
    
    translate([-epsilon,50+alpha,-1])
    {
        rotate([0,225,0])
        {
            rotate([0,0,0])
            {
                translate([zeta,0,gamma])
                {
                    female_snap_adapter_modified();
                }
            }
        }
    }
    
    translate([-epsilon,-(50-alpha),-1])
    {
        rotate([0,225,0])
        {
            rotate([0,0,0])
            {
                translate([zeta,0,gamma])
                {
                    female_snap_adapter_modified();
                }
            }
        }
    }

    translate([-epsilon,alpha,-1])
    {
        rotate([0,225,0])
        {
            rotate([0,0,0])
            {
                translate([zeta,0,gamma])
                {
                    female_snap_adapter_modified();
                }
            }
        }
    }

    translate([-(50+alpha),-epsilon,-1])
    {
        rotate([135,0,0])
        {
            rotate([0,0,90])
            {
                translate([zeta,0,gamma])
                {
                    //female_snap_adapter_modified();
                }
            }
        }
    }
    
    translate([50-alpha,-epsilon,-1])
    {
        rotate([135,0,0])
        {
            rotate([0,0,90])
            {
                translate([zeta,0,gamma])
                {
                    //female_snap_adapter_modified();
                }
            }
        }
    }    
    
    translate([-alpha,-epsilon,-1])
    {
        rotate([135,0,0])
        {
            rotate([0,0,90])
            {
                translate([zeta,0,gamma])
                {
                    //female_snap_adapter_modified();
                }
            }
        }
    }
}











module outer_CUBX0012_BXTX0064_00000200_snaps(alpha=8.8, epsilon = 82.005, delta=1.26, gamma=-3.81, zeta=0.17, phi=-0.17 )
{
/* Males */
    translate([-(50+alpha),epsilon,-1])
    {
        rotate([45,0,0])
        {
            rotate([0,0,90])
            {
                translate([phi,0,delta])
                {
                    //male_snap_stu();
                }
            }
        }
    }
    
    translate([(50-alpha),epsilon,-1])
    {
        rotate([45,0,0])
        {
            rotate([0,0,90])
            {
                translate([phi,0,delta])
                {
                    //male_snap_stu();
                }
            }
        }
    }
    
    translate([-alpha,epsilon,-1])
    {
        rotate([45,0,0])
        {
            rotate([0,0,90])
            {
                translate([phi,0,delta])
                {
                    //male_snap_stu();
                }
            }
        }
    }
    
    translate([-epsilon,-(50+alpha),-1])
    {
        rotate([0,45,0])
        {
            rotate([0,0,0])
            {
                translate([phi,0,delta])
                {
                    male_snap_stu();
                }
            }
        }
    }
    
    translate([-epsilon,(50-alpha),-1])
    {
        rotate([0,45,0])
        {
            rotate([zeta,0,0])
            {
                translate([phi,0,delta])
                {
                    male_snap_stu();
                }
            }
        }
    }
    
    translate([-epsilon,-alpha,-1])
    {
        rotate([0,45,0])
        {
            rotate([zeta,0,0])
            {
                translate([phi,0,delta])
                {
                    male_snap_stu();
                }
            }
        }
    }
    
    translate([(50+alpha),-epsilon,-1])
    {
        rotate([315,0,0])
        {
            rotate([0,0,90])
            {
                translate([phi,0,delta])
                {
                    //male_snap_stu();
                }
            }
        }
    }
    
    translate([-(50-alpha),-epsilon,-1])
    {
        rotate([315,0,0])
        {
            rotate([0,0,90])
            {
                translate([phi,0,delta])
                {
                    //male_snap_stu();
                }
            }
        }
    }
    
    translate([alpha,-epsilon,-1])
    {
        rotate([315,0,0])
        {
            rotate([0,0,90])
            {
                translate([phi,0,delta])
                {
                    //male_snap_stu();
                }
            }
        }
    }
    
    translate([epsilon,(50+alpha),-1])
    {
        rotate([0,315,0])
        {
            rotate([0,0,0])
            {
                translate([phi,0,delta])
                {
                    male_snap_stu();
                }
            }
        }
    }
    
    translate([epsilon,-(50-alpha),-1])
    {
        rotate([0,315,0])
        {
            rotate([0,0,0])
            {
                translate([phi,0,delta])
                {
                    male_snap_stu();
                }
            }
        }
    }
    
    translate([epsilon,alpha,-1])
    {
        rotate([0,315,0])
        {
            rotate([0,0,0])
            {
                translate([phi,0,delta])
                {
                    male_snap_stu();
                }
            }
        }
    }
    

    /* Femal snap modules */


    translate([-(50-alpha),epsilon,-1])
    {
        rotate([225,0,0])
        {
            rotate([0,0,90])
            {
                translate([zeta,0,gamma])
                {
                    //female_snap_stu();
                }
            }
        }
    }
    
    translate([(50+alpha),epsilon,-1])
    {
        rotate([225,0,0])
        {
            rotate([0,0,90])
            {
                translate([zeta,0,gamma])
                {
                    //female_snap_stu();
                }
            }
        }
    }
    
    translate([alpha,epsilon,-1])
    {
        rotate([225,0,0])
        {
            rotate([0,0,90])
            {
                translate([zeta,0,gamma])
                {
                    //female_snap_stu();
                }
            }
        }
    }
    
    translate([epsilon,(50-alpha),-1])
    {
        rotate([0,135,0])
        {
            rotate([0,0,0])
            {
                translate([zeta,0,gamma])
                {
                    female_snap_stu();
                }
            }
        }
    }
    
    translate([epsilon,-(50+alpha),-1])
    {
        rotate([0,135,0])
        {
            rotate([0,0,0])
            {
                translate([zeta,0,gamma])
                {
                    female_snap_stu();
                }
            }
        }
    }
    
    translate([epsilon,-alpha,-1])
    {
        rotate([0,135,0])
        {
            rotate([0,0,0])
            {
                translate([zeta,0,gamma])
                {
                    female_snap_stu();
                }
            }
        }
    }
    
    translate([-epsilon,(50+alpha),-1])
    {
        rotate([0,225,0])
        {
            rotate([0,0,0])
            {
                translate([zeta,0,gamma])
                {
                    female_snap_stu();
                }
            }
        }
    }
    
    translate([-epsilon,-(50-alpha),-1])
    {
        rotate([0,225,0])
        {
            rotate([0,0,0])
            {
                translate([zeta,0,gamma])
                {
                    female_snap_stu();
                }
            }
        }
    }
    
    translate([-epsilon,alpha,-1])
    {
        rotate([0,225,0])
        {
            rotate([0,0,0])
            {
                translate([zeta,0,gamma])
                {
                    female_snap_stu();
                }
            }
        }
    }
    
    translate([-(50+alpha),-epsilon,-1])
    {
        rotate([135,0,0])
        {
            rotate([0,0,90])
            {
                translate([zeta,0,gamma])
                {
                    //female_snap_stu();
                }
            }
        }
    }
    
    translate([(50-alpha),-epsilon,-1])
    {
        rotate([135,0,0])
        {
            rotate([0,0,90])
            {
                translate([zeta,0,gamma])
                {
                    //female_snap_stu();
                }
            }
        }
    }
    
    translate([-alpha,-epsilon,-1])
    {
        rotate([135,0,0])
        {
            rotate([0,0,90])
            {
                translate([zeta,0,gamma])
                {
                    //female_snap_stu();
                }
            }
        }
    }
}
    
    

module alpha_CUBX0012_BSQX0064_00000200_snaps()
{
    translate([0,0,-6.25])
    {
        outer_CUBX0012_BSQX0064_00000200_snaps();
    }
}

module beta_CUBX0012_BSQX0064_00000200_snaps()
{
    translate([0,0,6.25])
    {
        mirror([0,1,0])
        {
            mirror([0,0,1])
            {
                outer_CUBX0012_BSQX0064_00000200_snaps(); 
            }
        }
    }
}

module zeta_CUBX0012_BSQX0064_00000200_snaps(alpha = 8.8, beta = 65.73, gamma = 13.4, delta = 50, mu = 1)
{
    
    translate([beta,delta,gamma])
    {
        rotate([0,0,90])
        {
            translate([alpha,0,0])
            {
                rotate([180,0,0])
                {
                    rotate([0,0,90])
                    {
                        translate([0,0,mu])
                        {
                            male_snap_stu();
                        }
                    }
                }
            }


            translate([-alpha,0,0])
            {
                rotate([0,0,0])
                {
                    rotate([0,0,90])
                    {
                        translate([0,0,-3.49])
                        {
                            female_snap_stu();
                        }
                    }
                }
            }
        }
    }
    
    // Middle top snap modules.
    translate([beta,0,gamma])
    {
        rotate([0,0,90])
        {
            translate([alpha,0,0])
            {
                rotate([180,0,0])
                {
                    rotate([0,0,90])
                    {
                        translate([0,0,mu])
                        {
                            male_snap_stu();
                        }
                    }
                }
            }


            translate([-alpha,0,0])
            {
                rotate([0,0,0])
                {
                    rotate([0,0,90])
                    {
                        translate([0,0,-3.49])
                        {
                            female_snap_stu();
                        }
                    }
                }
            }
        }
    }

    translate([beta,-delta,gamma])
    {
        rotate([0,0,90])
        {
            translate([alpha,0,0])
            {
                rotate([180,0,0])
                {
                    rotate([0,0,90])
                    {
                        translate([0,0,mu])
                        {
                            male_snap_stu();
                        }
                    }
                }
            }


            translate([-alpha,0,0])
            {
                rotate([0,0,0])
                {
                    rotate([0,0,90])
                    {
                        translate([0,0,-3.49])
                        {
                            female_snap_stu();
                        }
                    }
                }
            }
        }
    }
    
    
    
    
    
    
    /* - X side. */
    
    
    
    translate([-beta,delta,gamma])
    {
        rotate([0,0,90])
        {
            translate([-alpha,0,0])
            {
                rotate([180,0,0])
                {
                    rotate([0,0,90])
                    {
                        translate([0,0,mu])
                        {
                            male_snap_stu();
                        }
                    }
                }
            }


            translate([alpha,0,0])
            {
                rotate([0,0,0])
                {
                    rotate([0,0,90])
                    {
                        translate([0,0,-3.49])
                        {
                            female_snap_stu();
                        }
                    }
                }
            }
        }
    }
    
    // Middle top snap modules.
    translate([-beta,0,gamma])
    {
        rotate([0,0,90])
        {
            translate([-alpha,0,0])
            {
                rotate([180,0,0])
                {
                    rotate([0,0,90])
                    {
                        translate([0,0,mu])
                        {
                            male_snap_stu();
                        }
                    }
                }
            }


            translate([alpha,0,0])
            {
                rotate([0,0,0])
                {
                    rotate([0,0,90])
                    {
                        translate([0,0,-3.49])
                        {
                            female_snap_stu();
                        }
                    }
                }
            }
        }
    }

    // Male { -X , -Y } side.
    
    translate([-beta,-delta,gamma])
    {
        rotate([0,0,90])
        {
            translate([-alpha,0,0])
            {
                rotate([180,0,0])
                {
                    rotate([0,0,90])
                    {
                        translate([0,0,mu])
                        {
                            male_snap_stu();
                        }
                    }
                }
            }


            translate([alpha,0,0])
            {
                rotate([0,0,0])
                {
                    rotate([0,0,90])
                    {
                        translate([0,0,-3.49])
                        {
                            female_snap_stu();
                        }
                    }
                }
            }
        }
    }
    
    
    
    
    
    

    translate([delta,beta,gamma])
    {
        rotate([0,0,180])
        {
            translate([alpha,0,0])
            {
                rotate([180,0,0])
                {
                    rotate([0,0,90])
                    {
                        translate([0,0,mu])
                        {
                            male_snap_stu();
                        }
                    }
                }
            }


            translate([-alpha,0,0])
            {
                rotate([0,0,0])
                {
                    rotate([0,0,90])
                    {
                        translate([0,0,-3.49])
                        {
                            female_snap_stu();
                        }
                    }
                }
            }
        }
    }
    
    translate([0,beta,gamma])
    {
        rotate([0,0,180])
        {
            translate([alpha,0,0])
            {
                rotate([180,0,0])
                {
                    rotate([0,0,90])
                    {
                        translate([0,0,mu])
                        {
                            male_snap_stu();
                        }
                    }
                }
            }


            translate([-alpha,0,0])
            {
                rotate([0,0,0])
                {
                    rotate([0,0,90])
                    {
                        translate([0,0,-3.49])
                        {
                            female_snap_stu();
                        }
                    }
                }
            }
        }
    }
    
    translate([-delta,beta,gamma])
    {
        rotate([0,0,180])
        {
            translate([alpha,0,0])
            {
                rotate([180,0,0])
                {
                    rotate([0,0,90])
                    {
                        translate([0,0,mu])
                        {
                            male_snap_stu();
                        }
                    }
                }
            }


            translate([-alpha,0,0])
            {
                rotate([0,0,0])
                {
                    rotate([0,0,90])
                    {
                        translate([0,0,-3.49])
                        {
                            female_snap_stu();
                        }
                    }
                }
            }
        }
    }
    
    translate([delta,-beta,gamma])
    {
        rotate([0,0,180])
        {
            translate([-alpha,0,0])
            {
                rotate([180,0,0])
                {
                    rotate([0,0,90])
                    {
                        translate([0,0,mu])
                        {
                            male_snap_stu();
                        }
                    }
                }
            }


            translate([alpha,0,0])
            {
                rotate([0,0,0])
                {
                    rotate([0,0,90])
                    {
                        translate([0,0,-3.49])
                        {
                            female_snap_stu();
                        }
                    }
                }
            }
        }
    }
    
    translate([0,-beta,gamma])
    {
        rotate([0,0,180])
        {
            translate([-alpha,0,0])
            {
                rotate([180,0,0])
                {
                    rotate([0,0,90])
                    {
                        translate([0,0,mu])
                        {
                            male_snap_stu();
                        }
                    }
                }
            }


            translate([alpha,0,0])
            {
                rotate([0,0,0])
                {
                    rotate([0,0,90])
                    {
                        translate([0,0,-3.49])
                        {
                            female_snap_stu();
                        }
                    }
                }
            }
        }
    }
    
    translate([-delta,-beta,gamma])
    {
        rotate([0,0,180])
        {
            translate([-alpha,0,0])
            {
                rotate([180,0,0])
                {
                    rotate([0,0,90])
                    {
                        translate([0,0,mu])
                        {
                            male_snap_stu();
                        }
                    }
                }
            }


            translate([alpha,0,0])
            {
                rotate([0,0,0])
                {
                    rotate([0,0,90])
                    {
                        translate([0,0,-3.49])
                        {
                            female_snap_stu();
                        }
                    }
                }
            }
        }
    }
}


module alpha_CUBX0012_BSQX0064_00000200_adapters()
{
    translate([0,0,-6.25])
    {
        // Snap adapters.
        outer_CUBX0012_BSQX0064_00000200_adapters();
    }
}


module beta_CUBX0012_BSQX0064_00000200_adapters()
{
    translate([0,0,6.25])
    {
        mirror([0,1,0])
        {
            mirror([0,0,1])
            {
                // Snap adapters.
                outer_CUBX0012_BSQX0064_00000200_adapters();
            }
        }
    }
}


module zeta_CUBX0012_BSQX0064_00000200_adapters()
{
     top_CUBX0012_BSQX0064_00000200_adapters(alpha = 8.8, beta = 65.73, gamma = 13.742, delta = 50);
}





   











































/* Abstracted CUBX0012_BSQX0064_00000200 Snap Set Functions ( Archetype Specific ) */

  
module alpha_CUBX0012_BSQX0064_00000200_snaps()
{
    translate([0,0,-6.25])
    {
        outer_CUBX0012_BSQX0064_00000200_snaps();
    }
}

module beta_CUBX0012_BSQX0064_00000200_snaps()
{
    translate([0,0,6.25])
    {
        mirror([0,1,0])
        {
            mirror([0,0,1])
            {
                outer_CUBX0012_BSQX0064_00000200_snaps(); 
            }
        }
    }
}


module zeta_CUBX0012_BSQX0064_00000200_snaps()
{
    top_CUBX0012_BSQX0064_00000200_snaps();
}




module alpha_CUBX0012_BSQX0064_00000200_adapters()
{
    translate([0,0,-6.25])
    {
        // Snap adapters.
        outer_CUBX0012_BSQX0064_00000200_adapters();
    }
}


module beta_CUBX0012_BSQX0064_00000200_adapters()
{
    translate([0,0,6.25])
    {
        mirror([0,1,0])
        {
            mirror([0,0,1])
            {
                // Snap adapters.
                outer_CUBX0012_BSQX0064_00000200_adapters();
            }
        }
    }
}


module zeta_CUBX0012_BSQX0064_00000200_adapters()
{
     top_CUBX0012_BSQX0064_00000200_adapters();
}




/* Abstracted CUBX0012_BXTX0064_00000200 Snap Set Functions ( Archetype Specific ) */


module delta_CUBX0012_BXTX0064_00000200_snaps()
{
    translate([0,0,6.25])
    {
        inner_CUBX0012_BXTX0064_00000200_snaps();
    }
}

module theta_CUBX0012_BXTX0064_00000200_snaps()
{
    translate([0,0,-6.25])
    {
        mirror([0,1,0])
        {
            mirror([0,0,1])
            {
                inner_CUBX0012_BXTX0064_00000200_snaps(); 
            }
        }
    }
}



module delta_CUBX0012_BXTX0064_00000200_adapters()
{
    translate([0,0,6.25])
    {
        // Snap adapters.
        inner_CUBX0012_BXTX0064_00000200_adapters();
    }
}

module theta_CUBX0012_BXTX0064_00000200_adapters()
{
    translate([0,0,-6.25])
    {
        mirror([0,1,0])
        {
            mirror([0,0,1])
            {
                // Snap adapters.
                inner_CUBX0012_BXTX0064_00000200_adapters();
            }
        }
    }
}

module zeta_CUBX0012_BXTX0064_00000200_adapters()
{
     top_CUBX0012_BXTX0064_00000200_adapters();
}


module zeta_CUBX0012_BXTX0064_00000200_snaps()
{
     top_CUBX0012_BXTX0064_00000200_snaps();
}










module alpha_CUBX0012_BXTX0064_00000200_snaps()
{
    translate([0,0,-6.25])
    {
        outer_CUBX0012_BXTX0064_00000200_snaps();
    }
}

module beta_CUBX0012_BXTX0064_00000200_snaps()
{
    translate([0,0,6.25])
    {
        mirror([0,1,0])
        {
            mirror([0,0,1])
            {
                outer_CUBX0012_BXTX0064_00000200_snaps();
            }
        }
    }
}


module delta_CUBX0012_BXTX0064_00000200_snaps()
{
    translate([0,0,6.25])
    {
        inner_CUBX0012_BXTX0064_00000200_snaps();
    }
}

module theta_CUBX0012_BXTX0064_00000200_snaps()
{
    translate([0,0,-6.25])
    {
        mirror([0,1,0])
        {
            mirror([0,0,1])
            {
                inner_CUBX0012_BXTX0064_00000200_snaps(); 
            }
        }
    }
}



module zeta_CUBX0012_BXTX0064_00000200_snaps()
{
    zeta_CUBX0012_BSQX0064_00000200_snaps();
}


module alpha_CUBX0012_BXTX0064_00000200_adapters()
{
    alpha_CUBX0012_BSQX0064_00000200_adapters();
}

module beta_CUBX0012_BXTX0064_00000200_adapters()
{
    beta_CUBX0012_BSQX0064_00000200_adapters();
}





module delta_CUBX0012_BXTX0064_00000200_adapters()
{
    translate([0,0,6.25])
    {
        inner_CUBX0012_BXTX0064_00000200_adapters();
    }
}

module theta_CUBX0012_BXTX0064_00000200_adapters()
{
    translate([0,0,-6.25])
    {
        mirror([0,1,0])
        {
            mirror([0,0,1])
            {
                inner_CUBX0012_BXTX0064_00000200_adapters();
            }
        }
    }
}



module zeta_CUBX0012_BXTX0064_00000200_adapters()
{

    zeta_CUBX0012_BSQX0064_00000200_adapters();

}



