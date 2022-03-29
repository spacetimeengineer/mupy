shaft_radius = 1;
$fn = 20;



module girdir(x_size=1, y_size=1, shaft_radius = shaft_radius)
{
    
    // Make primitive cube.
    hexad = 1.0000*[5,5,5];
    // Extract length.
    hexad_length = hexad[0];
    
    difference()
    {
        for ( x_step = [ 0 : hexad_length : hexad_length * x_size - 1] )
        {
            for ( y_step = [ 0 : hexad_length : hexad_length * y_size - 1] )
            {
                difference()
                {
                    union()
                    {
                        // Creates the cube.
                        translate([x_step, y_step, 0])
                        {
                            cube(hexad, center = true);
                        }
                    }
                    
                    x_final = hexad_length * x_size - hexad_length;
                    y_final = hexad_length * y_size - hexad_length;
                    
                    // Special treatment operations.
                    translate([x_step, y_step, 0])
                    {
                        
                        // Treat First.
                        if (x_step == 0)
                        {
                            girdir_trim("y","-x","+z");
                            girdir_trim("y","-x","-z");
                            girdir_cavity("-x");

                        }
                        
                        // Treat First.
                        if (y_step == 0)
                        {
                            girdir_trim("x","-y","+z");
                            girdir_trim("x","-y","-z");
                            girdir_cavity("-y");
                        }
                        
                        if (x_step == 0 && y_step == 0)
                        {
                            girdir_trim("z","-y","-x");
                        }
                       
                        // Treat First.
                        if (x_step == x_final)
                        {
                            girdir_trim("y","+x","+z");
                            girdir_trim("y","+x","-z");
                            girdir_cavity("+x");
                        }
                        
                        // Treat First.
                        if (y_step == y_final)
                        {
                            girdir_trim("x","+y","+z");
                            girdir_trim("x","+y","-z");
                            girdir_cavity("+y");
                        }
                        
                        if (x_step == 0 && y_step == y_final)
                        {
                            girdir_trim("z","+y","-x");
                            girdir_trim("x","+y","+z");
                            girdir_trim("x","+y","-z");
                        }
                        
                        if (x_step == x_final && y_step == 0)
                        {
                            girdir_trim("y","+x","+z");
                            girdir_trim("y","+x","-z");
                            girdir_trim("z","-y","+x");
                        }
                        
                        if (x_step == x_final && y_step == y_final)
                        {
                            girdir_trim("z","+y","+x");
                   
                        }
                        girdir_cavity("+z");
                        girdir_cavity("-z");
                    }
                    
                    // Shafts.
                    translate([x_step, y_step, 0])
                    {
                        
                        // Cylinder along  x axis.
                        rotate([0,90,0])
                        {
                            cylinder( h = 20, r1 = shaft_radius, r2=shaft_radius, center=true );
                        }
                        // Cylinder along  y axis.
                        rotate([90,0,0])
                        {
                            cylinder( h = 20, r1 = shaft_radius, r2=shaft_radius, center=true );
                        }
                        // Cylinder along  z axis.
                        
                        
                        cylinder( h = 20, r1 = shaft_radius, r2=shaft_radius, center=true );
                        
                        
                        
                       
                        
                    }
                    
                    // Inner flush.
                    translate([x_step, y_step, 0])
                    {
                        girdir_flush();
                    }
                }

            }
        }
        
    }
}

module prime_girdir(x_size=1, y_size=1, shaft_radius = shaft_radius)
{
    
    // Make primitive cube.
    hexad = 1.00001*[5,5,5];
    // Extract length.
    hexad_length = hexad[0];
    
    difference()
    {
        for ( x_step = [ 0 : hexad_length : hexad_length * x_size - 1] )
        {
            for ( y_step = [ 0 : hexad_length : hexad_length * y_size - 1] )
            {
                difference()
                {
                    union()
                    {
                        // Creates the cube.
                        translate([x_step, y_step, 0])
                        {
                            cube(hexad, center = true);
                        }
                    }
                    
                    x_final = hexad_length * x_size - hexad_length;
                    y_final = hexad_length * y_size - hexad_length;
                    z_final = hexad_length * z_size - hexad_length;
                    
                    // Special treatment operations.
                    translate([x_step, y_step, 0])
                    {
                        
                        // Treat First.
                        if (x_step == 0)
                        {
                            //girdir_trim("y","-x","+z");
                            //girdir_trim("y","-x","-z");
                            //girdir_cavity("-x");

                        }
                        
                        // Treat First.
                        if (y_step == 0)
                        {
                            //girdir_trim("x","-y","+z");
                            //girdir_trim("x","-y","-z");
                            //girdir_cavity("-y");
                        }
                        
                        if (x_step == 0 && y_step == 0)
                        {
                            //girdir_trim("z","-y","-x");
                        }
                       
                        // Treat First.
                        if (x_step == x_final)
                        {
                            //girdir_trim("y","+x","+z");
                            //girdir_trim("y","+x","-z");
                            //girdir_cavity("+x");
                        }
                        
                        // Treat First.
                        if (y_step == y_final)
                        {
                            //girdir_trim("x","+y","+z");
                            //girdir_trim("x","+y","-z");
                            //girdir_cavity("+y");
                        }
                        
                        if (x_step == 0 && y_step == y_final)
                        {
                            //girdir_trim("z","+y","-x");
                            //girdir_trim("x","+y","+z");
                            //girdir_trim("x","+y","-z");
                        }
                        
                        if (x_step == x_final && y_step == 0)
                        {
                            //girdir_trim("y","+x","+z");
                            //girdir_trim("y","+x","-z");
                            //girdir_trim("z","-y","+x");
                        }
                        
                        if (x_step == x_final && y_step == y_final)
                        {
                            //girdir_trim("z","+y","+x");
                        }
                        //girdir_cavity("+z");
                        //girdir_cavity("-z");
                    }
                    
                    // Shafts.
                    translate([x_step, y_step, 0])
                    {
                        
                        // Cylinder along  x axis.
                        rotate([0,90,0])
                        {
                            //cylinder( h = 20, r1 = shaft_radius, r2=shaft_radius, center=true );
                        }
                        // Cylinder along  y axis.
                        rotate([90,0,0])
                        {
                            //cylinder( h = 20, r1 = shaft_radius, r2=shaft_radius, center=true );
                        }
                        // Cylinder along  z axis.
                        
                        
                        //cylinder( h = 20, r1 = shaft_radius, r2=shaft_radius, center=true );
                        
                        
                        
                       
                        
                    }
                    
                    // Inner flush.
                    translate([x_step, y_step, 0])
                    {
                        //girdir_flush();
                    }
                }

            }
        }
        
    }
}





module girdir_peg(side)
{
    
    hexad = 1.0005*[5,5,10];
    cavity = [0.5*hexad[0],0.5*hexad[1],0.2*hexad[2]];
    
    if (side == "+x")
    {
        translate([2.25 - 0.005, 0, 0])
        {
            rotate([0,90,0])
            {
                cube(cavity, center = true);
            }
        }
    }
    else if (side == "-x")
    {
        translate([-(2.25 - 0.005), 0, 0])
        {
            rotate([0,90,0])
            {
                cube(cavity, center = true);
            }
        }
    }
    else if (side == "+y")
    {
        translate([0, 2.25 - 0.005, 0])
        {
            rotate([0,90,90])
            {
                cube(cavity, center = true);
            }
        }
    }
    else if (side == "-y")
    {
        translate([0, -(2.25 - 0.005), 0])
        {
            rotate([0,90,90])
            {
                cube(cavity, center = true);
            }
        }
    }
    else if (side == "+z")
    {
        translate([0, 0, 2.25 - 0.005])
        {
            rotate([0,0,90])
            {
                cube(cavity, center = true);
            }
        }
    }
    else if (side == "-z")
    {
        translate([0, 0, -(2.25 - 0.005)])
        {
            rotate([0,0,90])
            {
                cube(cavity, center = true);
            }
        }
    }
    else
    {
        
    }
}

module girdir_cavity(side)
{
    
    hexad = 1.0005*[5,5,5];
    cavity = [0.58*hexad[0],0.58*hexad[1],0.2*hexad[2]];
    if (side == "+x")
    {
        translate([2, 0, 0])
        {
            rotate([0,90,0])
            {
                cube(cavity, center = true);
            }
        }
    }
    else if (side == "-x")
    {
        translate([-2, 0, 0])
        {
            rotate([0,90,0])
            {
                cube(cavity, center = true);
            }
        }
    }
    else if (side == "+y")
    {
        translate([0, 2, 0])
        {
            rotate([0,90,90])
            {
                cube(cavity, center = true);
            }
        }
    }
    else if (side == "-y")
    {
        translate([0, -2, 0])
        {
            rotate([0,90,90])
            {
                cube(cavity, center = true);
            }
        }
    }
    else if (side == "+z")
    {
        translate([0, 0, 2])
        {
            rotate([0,0,90])
            {
                cube(cavity, center = true);
            }
        }
    }
    else if (side == "-z")
    {
        translate([0, 0, -2])
        {
            rotate([0,0,90])
            {
                cube(cavity, center = true);
            }
        }
    }
    else
    {
        
    }
}

module girdir_shaft(axis)
{
    if (axis == "x")
    {
        
    }
    else if (axis == "y")
    {
        
    }
    else if (axis == "z")
    {
        
    }
    else
    {
        
    }

}


module girdir_trim(axis, side, edge)
{
    trim = 1.0001*[5,0.5,1];
    centroid_distance = 0.4647 * 5;
    
    if (axis == "z")
    {
        if (side == "+x")
        {
            if (edge == "+y")
            {
                translate([centroid_distance, centroid_distance, 0])
                {
                    rotate([45,90,0])
                    {
                        cube(trim, center = true);
                    }
                }
            }
            else if (edge == "-y")
            {
                translate([centroid_distance, -centroid_distance, 0])
                {
                    rotate([-45,90,0])
                    {
                        cube(trim, center = true);
                    }
                }
            }
            else
            {
            
            }
        }
        else if (side == "-x")
        {
            
            if (edge == "+y")
            {
                translate([-centroid_distance, centroid_distance, 0])
                {
                    rotate([-45,90,0])
                    {
                        cube(trim, center = true);
                    }
                }
            }
            else if (edge == "-y")
            {
                translate([-centroid_distance, -centroid_distance, 0])
                {
                    rotate([45,90,0])
                    {
                        cube(trim, center = true);
                    }
                }
            }
            else
            {
            
            }
            
        }
        else if (side == "+y")
        {
            
            if (edge == "+x")
            {
                translate([centroid_distance, centroid_distance, 0])
                {
                    rotate([45,90,0])
                    {
                        cube(trim, center = true);
                    }
                }
            }
            else if (edge == "-x")
            {
                translate([-centroid_distance, centroid_distance, 0])
                {
                    rotate([-45,90,0])
                    {
                        cube(trim, center = true);
                    }
                }
            }
            else
            {
            
            }
        }
        else if (side == "-y")
        {

            if (edge == "+x")
            {
                translate([centroid_distance, -centroid_distance, 0])
                {
                    rotate([-45,90,0])
                    {
                        cube(trim, center = true);
                    }
                }
            }
            else if (edge == "-x")
            {
                translate([-centroid_distance, -centroid_distance, 0])
                {
                    rotate([45,90,0])
                    {
                        cube(trim, center = true);
                    }
                }
            }
            else
            {
            
            }
        }
        else
        {

        }
    }
    
    else if (axis == "x")
    {
        if (side == "+y")
        {
            if (edge == "+z")
            {
                translate([0, centroid_distance, centroid_distance])
                {
                    rotate([45,0,0])
                    {
                        cube(trim, center = true);
                    }
                }
            }
            else if (edge == "-z")
            {
                translate([0, centroid_distance, -centroid_distance])
                {
                    rotate([-45,0,0])
                    {
                        cube(trim, center = true);
                    }
                }
            }
            else
            {
            
            }
        }
        else if (side == "-y")
        {
            if (edge == "+z")
            {
                translate([0, -centroid_distance, centroid_distance])
                {
                    rotate([-45,0,0])
                    {
                        cube(trim, center = true);
                    }
                }
            }
            else if (edge == "-z")
            {
                translate([0,-centroid_distance, -centroid_distance])
                {
                    rotate([45,0,0])
                    {
                        cube(trim, center = true);
                    }
                }
            }
            else
            {
            
            }
            
        }
        else if (side == "+z")
        {
            
            
            if (edge == "+y")
            {
                translate([0, centroid_distance, centroid_distance])
                {
                    rotate([45,0,0])
                    {
                        cube(trim, center = true);
                    }
                }
            }
            else if (edge == "-y")
            {
                translate([0, -centroid_distance, centroid_distance])
                {
                    rotate([-45,0,0])
                    {
                        cube(trim, center = true);
                    }
                }
            }
            else
            {
            
            }
            
           

        }
        else if (side == "-z")
        {
            
            
            if (edge == "+y")
            {
                translate([0, centroid_distance, -centroid_distance])
                {
                    rotate([-45,0,0])
                    {
                        cube(trim, center = true);
                    }
                }
            }
            else if (edge == "-y")
            {
                translate([0,-centroid_distance, -centroid_distance])
                {
                    rotate([45,0,0])
                    {
                        cube(trim, center = true);
                    }
                }
            }
            else
            {
            
            }
        }
        else
        {

        }
    }
    
    else if (axis == "y")
    {
        if (side == "+x")
        {
            if (edge == "+z")
            {
                translate([centroid_distance, 0 ,centroid_distance])
                {
                    rotate([45,0,-90])
                    {
                        cube(trim, center = true);
                    }
                }
            }
            else if (edge == "-z")
            {
                translate([centroid_distance, 0, -centroid_distance])
                {
                    rotate([-45,0,-90])
                    {
                        cube(trim, center = true);
                    }
                }
            }
            else
            {
            
            }
        }
        else if (side == "-x")
        {
            
            if (edge == "+z")
            {
                translate([-centroid_distance, 0, centroid_distance])
                {
                    rotate([-45,0,-90])
                    {
                        cube(trim, center = true);
                    }
                }
            }
            else if (edge == "-z")
            {
                translate([-centroid_distance, 0, -centroid_distance])
                {
                    rotate([45,0,-90])
                    {
                        cube(trim, center = true);
                    }
                }
            }
            else
            {
            
            }
        }
        else if (side == "+z")
        {
            if (edge == "+x")
            {
                translate([centroid_distance, 0 ,centroid_distance])
                {
                    rotate([45,0,-90])
                    {
                        cube(trim, center = true);
                    }
                }
            }
            else if (edge == "-x")
            {
                translate([-centroid_distance, 0, centroid_distance])
                {
                    rotate([-45,0,-90])
                    {
                        cube(trim, center = true);
                    }
                }
            }
            else
            {
            
            }
        }
        else if (side == "-z")
        {
            if (edge == "+x")
            {
                translate([centroid_distance, 0, -centroid_distance])
                {
                    rotate([-45,0,-90])
                    {
                        cube(trim, center = true);
                    }
                }
            }
            else if (edge == "-x")
            {
                translate([-centroid_distance, 0, -centroid_distance])
                {
                    rotate([45,0,-90])
                    {
                        cube(trim, center = true);
                    }
                }
            }
            else
            {
            
            }
        }
        else
        {

        }
    }
}


module girdir_flush(shaft_radius = shaft_radius)
{
    hexad = [5,5,5];
    rotate([90,0,0])
    {
        cylinder( h = 2.5, r1 = shaft_radius, r2=shaft_radius, center=true );
    }
    rotate([0,0,0])
    {
        cylinder( h = 2.5, r1 = shaft_radius, r2=shaft_radius, center=true );
    }
    rotate([0,90,0])
    {
        cylinder( h = 2.5, r1 = shaft_radius, r2=shaft_radius, center=true );
    }
    translate([0, 0, 0])
    {
        cube(0.4*hexad, center = true);
    }
}


module girdir_endslot()
{


}

module girdir_grooves()
{


}








module corner_piece()
{
    translate([0,0,0])
    {
        girdir(1,1);
    }
    translate([0,0,-5])
    {
        girdir(1,1);
    }
    translate([-5,0,0])
    {
        girdir(1,1);
    }
    translate([0,-5,0])
    {
        girdir(1,1);
    }
    translate([5,0,0])
    {
        girdir(1,1);
    }
    translate([0,5,0])
    {
        girdir(1,1);
    }
    translate([0,0,5])
    {
        girdir(1,1);
    }
    translate([-5,5,0])
    {
        girdir(1,1);
    }
    translate([0,5,-5])
    {
        girdir(1,1);
    }
    translate([5,-5,0])
    {
        girdir(1,1);
    }
    translate([0,-5,5])
    {
        girdir(1,1);
    }
    translate([-5,0,5])
    {
        girdir(1,1);
    }
    translate([5,0,-5])
    {
        girdir(1,1);
    }
    
    translate([5,0,-10])
    {
        girdir(1,1);
    }
    
    translate([0,5,0])
    {
        girdir(1,1);
    }
    
    translate([-10,5,0])
    {
        girdir(1,1);
    }
    
    translate([0,5,-10])
    {
        girdir(1,1);
    }
    
    translate([-10,0,5])
    {
        girdir(1,1);
    }
    
    translate([0,-10,5])
    {
        girdir(1,1);
    }
    
    translate([5,-10,0])
    {
        girdir(1,1);
    }
    
}



girdir(1,1);


//prime_girdir(1,10);