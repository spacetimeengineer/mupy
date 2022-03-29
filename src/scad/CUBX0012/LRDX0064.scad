use <CCB200.scad>

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
final_CCL200();
//final_CCR200();