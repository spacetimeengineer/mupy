$fn = 50;

module general_block(block_length = 25.001, shaft_radius = 2.5 )
{
    difference()
    {
        cube([block_length, block_length, block_length],true);

        rotate([0,0,0]) { cylinder( h = 50, r1 = shaft_radius, r2 = shaft_radius, center = true ); }
        rotate([90,0,0]) { cylinder( h = 50, r1 = shaft_radius, r2 =shaft_radius, center = true ); }
        rotate([0,90,0]){ cylinder( h = 50, r1 = shaft_radius, r2 = shaft_radius, center = true ); }
        rotate([0,90,0]) { cylinder( h = 50, r1 = shaft_radius, r2 = shaft_radius, center = true ); }
    }
}

module side_tooth(block_length = 25.001, shaft_radius = 2.5, padding = 0.20 )
{
    difference()
    {
        cube([block_length - padding, block_length, block_length],true);
    
        rotate([0,0,90]) { cylinder( h = 50, r1 = shaft_radius, r2 = shaft_radius, center = true ); }
        rotate([0,90,90]) { cylinder( h = 50, r1 = shaft_radius, r2 =shaft_radius, center = true ); }
        rotate([0,90,0]) { cylinder( h = 50, r1 = shaft_radius, r2 = shaft_radius, center = true ); }

    }
}

module top_tooth(block_length, shaft_radius, padding = 0.20 )
{
    difference()
    {
        // Primary block.        
        cube([block_length - padding, block_length - padding, block_length  ],true);
        // Inner cavity.
        //cube([3/5*block_length, 3/5*block_length, 3/5*block_length  ],true);

        rotate([0,0,0]) { cylinder( h = 50, r1 = shaft_radius, r2 = shaft_radius, center = true ); }
        rotate([90,0,0]) { cylinder( h = 50, r1 = shaft_radius, r2 =shaft_radius, center = true ); }
        rotate([0,90,0]) { cylinder( h = 50, r1 = shaft_radius, r2 = shaft_radius, center = true ); }
    }
}

module square_cavity_array(x_spacing, y_spacing, x_units, y_units, x_offset, y_offset, x_cavity_dimensions, y_cavity_dimensions, z_cavity_dimensions)
{
    /*  Constants */
    x_length = ( x_units - 1 ) * x_spacing;
    y_length = ( y_units - 1 ) * y_spacing;
    
    /* Main grid building loop. */
    for ( x_step = [ - x_length / 2 : x_spacing : x_length / 2 ])
    {
        /* Main grid building loop. */
        for ( y_step = [ - y_length / 2 : y_spacing : y_length / 2 ])
        {
            translate([x_step + x_offset, y_step + y_offset, 0 ]) { rotate([0,0,0]) { cube([x_cavity_dimensions,y_cavity_dimensions,z_cavity_dimensions], center = true); } }
        }
    }
}

module circular_cavity_array(x_spacing, y_spacing, x_units, y_units, x_offset, y_offset, x_cavity_dimensions, y_cavity_dimensions, z_cavity_dimensions)
{
    /*  Constants */
    x_length = ( x_units - 1 ) * x_spacing;
    y_length = ( y_units - 1 ) * y_spacing;
    
    /* Main grid building loop. */
    for ( x_step = [ - x_length / 2 : x_spacing : x_length / 2 ])
    {
        /* Main grid building loop. */
        for ( y_step = [ - y_length / 2 : y_spacing : y_length / 2 ])
        {
            translate([x_step + x_offset, y_step + y_offset, 0 ]) { rotate([0,0,0]) { scale([x_cavity_dimensions,y_cavity_dimensions,1]) {cylinder(h=z_cavity_dimensions, r1=1/2, r2=1/2, center=true); } } }
        }
    }
}

module CUBX0177_BPAN(block_length, shaft_radius, xunits, yunits, padding = 0.2, side_teeth_orientation = "regular", top_teeth_included = true, x_spacing, y_spacing, x_units, y_units, x_offset, y_offset, x_cavity_dimensions, y_cavity_dimensions, z_cavity_dimensions, cavity_type)
{
    difference()
    {
        union()
        {
            /*  Constants */
            xlength = ( xunits - 3 ) * block_length;
            ylength = ( yunits - 3 ) * block_length;
            inner_cavity_block_thickness = block_length;
            top_teeth_block_thickness = block_length;
            
            /* Main grid building loop. */
            for ( x_step = [ - xlength / 2 : block_length : xlength / 2 ])
            {
                /* Main grid building loop. */
                for ( y_step = [ - ylength / 2 : block_length : ylength / 2 ])
                {
                    /* If printing outer perimeter ( Not including teeth ) . */
                    if (y_step == ylength / 2 || y_step == - ylength / 2 || x_step == xlength / 2 || x_step == - xlength / 2)
                    {

                        if ( y_step == ylength / 2 && abs(x_step) != xlength / 2  ) {  translate([x_step,y_step, 0 ]) { rotate([0,0,90]) { general_block(block_length + 0.001, shaft_radius ); } } }
                        if ( y_step == - ylength / 2 && abs(x_step) != xlength / 2) {  translate([x_step,y_step, 0 ]) { rotate([0,0,-90]) { general_block(block_length + 0.001, shaft_radius ); } } }
                        if ( x_step == xlength / 2 && abs(y_step) != ylength / 2) { translate([x_step,y_step, 0 ]) { rotate([0,0,0]) { general_block(block_length + 0.001, shaft_radius ); } } }
                        if ( x_step == - xlength / 2 && abs(y_step) != ylength / 2 ) { translate([x_step,y_step, 0 ]) { rotate([0,0,180]) { general_block(block_length + 0.001, shaft_radius ); } } }
                        if ( x_step == xlength / 2 && y_step == ylength / 2 ) { translate([x_step,y_step, 0 ]) { rotate([0,0,0]) { general_block(block_length + 0.001, shaft_radius ); } } }
                        if ( x_step ==  xlength / 2 && y_step == - ylength / 2 ) { translate([x_step,y_step, 0 ]) { rotate([180,0,0]) { general_block(block_length + 0.001, shaft_radius ); } } }
                        if ( x_step == - xlength / 2 && y_step == ylength / 2 ) { translate([x_step,y_step, 0 ]) { rotate([180,0,180]) { general_block(block_length + 0.001, shaft_radius ); } } }
                        if ( x_step == - xlength / 2 && y_step == - ylength / 2 ) { translate([x_step,y_step, 0 ]) { rotate([0,0,180]) { general_block(block_length + 0.001, shaft_radius ); } } }
                    }
                    /* If printing inner cavity. */
                    else if ( y_step <= abs(ylength / 2 - block_length) || x_step <= abs(xlength / 2 - block_length ) ) 
                    { 
                        translate([ x_step,y_step, - ( block_length - inner_cavity_block_thickness ) / 2 ] ) 
                        { 
                            general_block(block_length + 0.001, shaft_radius );
                        
                        } 
                    }
                }
            }
            
            /*  Side Teeth  */
            if ( side_teeth_orientation == "regular" )
            {
                for ( x_tooth_step = [ - xlength / 2 : block_length : xlength / 2 ]) { if ( (x_tooth_step + xlength / 2 ) % ( block_length * 2 )  == block_length ) { translate([x_tooth_step , ylength / 2 + block_length , 0 ]) { side_tooth(block_length + 0.001, shaft_radius, padding ); } } }
                for ( y_tooth_step = [ - ylength / 2 : block_length : ylength / 2 ]) { if ( (y_tooth_step + ylength / 2 ) % ( block_length * 2 )  == 0 ) { translate([xlength / 2 + block_length , y_tooth_step , 0 ]) { rotate([0,0,270]) { side_tooth(block_length + 0.001, shaft_radius, padding ); } } } }
                for ( x_tooth_step = [ - xlength / 2 : block_length : xlength / 2 ]) { if ( (x_tooth_step + xlength / 2 ) % ( block_length * 2 )  == 0 ) { translate([x_tooth_step , -ylength / 2 - block_length , 0 ]) { rotate([0,0,180]) { side_tooth( block_length + 0.001, shaft_radius, padding ); } } } }
                for ( y_tooth_step = [ - ylength / 2 : block_length : ylength / 2 ]) { if ( (y_tooth_step + ylength / 2 ) % ( block_length * 2 )  == block_length ) { translate([-xlength / 2 - block_length , y_tooth_step , 0 ]) { rotate([0,0,90]) { side_tooth(block_length + 0.001, shaft_radius, padding ); } } } }
            }
            else if ( side_teeth_orientation == "inverted" )
            {
                for ( x_tooth_step = [ - xlength / 2 : block_length : xlength / 2 ]) { if ( (x_tooth_step + xlength / 2 ) % ( block_length * 2 )  == 0 ) { translate([x_tooth_step , ylength / 2 + block_length , 0 ]) { side_tooth(block_length + 0.001, shaft_radius, padding ); } } }
                for ( y_tooth_step = [ - ylength / 2 : block_length : ylength / 2 ]) { if ( (y_tooth_step + ylength / 2 ) % ( block_length * 2 )  == block_length ) { translate([xlength / 2 + block_length , y_tooth_step , 0 ]) { rotate([0,0,270]) { side_tooth(block_length + 0.001, shaft_radius, padding ); } } } }
                for ( x_tooth_step = [ - xlength / 2 : block_length : xlength / 2 ]) { if ( (x_tooth_step + xlength / 2 ) % ( block_length * 2 )  == block_length ) { translate([x_tooth_step , -ylength / 2 - block_length , 0 ]) { rotate([0,0,180]) { side_tooth( block_length + 0.001, shaft_radius, padding ); } } } }
                for ( y_tooth_step = [ - ylength / 2 : block_length : ylength / 2 ]) { if ( (y_tooth_step + ylength / 2 ) % ( block_length * 2 )  == 0 ) { translate([-xlength / 2 - block_length , y_tooth_step , 0 ]) { rotate([0,0,90]) { side_tooth(block_length + 0.001, shaft_radius, padding ); } } } }
            }
            else if ( side_teeth_orientation == "chimera" )
            {
                for ( x_tooth_step = [ - xlength / 2 : block_length : xlength / 2 ]) { if ( (x_tooth_step + xlength / 2 ) % ( block_length * 2 )  == block_length ) { translate([x_tooth_step , ylength / 2 + block_length , 0 ]) { side_tooth(block_length + 0.001, shaft_radius, padding ); } } }
                for ( y_tooth_step = [ - ylength / 2 : block_length : ylength / 2 ]) { if ( (y_tooth_step + ylength / 2 ) % ( block_length * 2 )  == 0 ) { translate([xlength / 2 + block_length , y_tooth_step , 0 ]) { rotate([0,0,270]) { side_tooth(block_length + 0.001, shaft_radius, padding ); } } } }
                for ( x_tooth_step = [ - xlength / 2 : block_length : xlength / 2 ]) { if ( (x_tooth_step + xlength / 2 ) % ( block_length * 2 )  == block_length ) { translate([x_tooth_step , -ylength / 2 - block_length , 0 ]) { rotate([0,0,180]) { side_tooth( block_length + 0.001, shaft_radius, padding ); } } } }
                for ( y_tooth_step = [ - ylength / 2 : block_length : ylength / 2 ]) { if ( (y_tooth_step + ylength / 2 ) % ( block_length * 2 )  == 0 ) { translate([-xlength / 2 - block_length , y_tooth_step , 0 ]) { rotate([0,0,90]) { side_tooth(block_length + 0.001, shaft_radius, padding ); } } } }
            }
            else if ( side_teeth_orientation == "inverted_chimera" )
            {
                for ( x_tooth_step = [ - xlength / 2 : block_length : xlength / 2 ]) { if ( (x_tooth_step + xlength / 2 ) % ( block_length * 2 )  == 0 ) { translate([x_tooth_step , ylength / 2 + block_length , 0 ]) { side_tooth(block_length + 0.001, shaft_radius, padding ); } } }
                for ( y_tooth_step = [ - ylength / 2 : block_length : ylength / 2 ]) { if ( (y_tooth_step + ylength / 2 ) % ( block_length * 2 )  == block_length ) { translate([xlength / 2 + block_length , y_tooth_step , 0 ]) { rotate([0,0,270]) { side_tooth(block_length + 0.001, shaft_radius, padding ); } } } }
                for ( x_tooth_step = [ - xlength / 2 : block_length : xlength / 2 ]) { if ( (x_tooth_step + xlength / 2 ) % ( block_length * 2 )  == 0 ) { translate([x_tooth_step , -ylength / 2 - block_length , 0 ]) { rotate([0,0,180]) { side_tooth( block_length + 0.001, shaft_radius, padding ); } } } }
                for ( y_tooth_step = [ - ylength / 2 : block_length : ylength / 2 ]) { if ( (y_tooth_step + ylength / 2 ) % ( block_length * 2 )  == block_length ) { translate([-xlength / 2 - block_length , y_tooth_step , 0 ]) { rotate([0,0,90]) { side_tooth(block_length + 0.001, shaft_radius, padding ); } } } }
            }
            else
            {
                
            }

            /*  Top Teeth  */
            if (top_teeth_included == true)
            {

                /*  Top Teeth  */
                for ( x_tooth_step = [ - xlength / 2 : block_length : xlength / 2 ]) { if ( (x_tooth_step + xlength / 2 ) % ( block_length * 2 )  == block_length && !(x_tooth_step == xlength / 2 ) && !(x_tooth_step == -xlength / 2 )) { translate([x_tooth_step , ylength / 2 , block_length - ( block_length - top_teeth_block_thickness ) / 2 ]) { if (!( x_tooth_step == xlength / 2 ) && !( x_tooth_step == - xlength / 2 ) ) { top_tooth(block_length+ 0.001, shaft_radius, padding); } } } }
                for ( y_tooth_step = [ - ylength / 2 : block_length : ylength / 2 ]) { if ( ( y_tooth_step + ylength / 2 ) % ( block_length * 2 )  == 0 && ! ( y_tooth_step == ylength / 2 ) && ! ( y_tooth_step == - ylength / 2 ) ) { translate([xlength / 2 , y_tooth_step , block_length - ( block_length - top_teeth_block_thickness ) / 2  ]) { if (!( y_tooth_step == ylength / 2 ) && !( y_tooth_step == - ylength / 2 ) )  {  top_tooth(block_length+ 0.001, shaft_radius, padding);  } } } }
                for ( x_tooth_step = [ - xlength / 2 : block_length : xlength / 2 ] ) { if ( ( x_tooth_step + xlength / 2 ) % ( block_length * 2 )  == 0 && ! ( x_tooth_step == xlength / 2 ) && ! ( x_tooth_step == -xlength / 2 ) ) { translate([x_tooth_step , - ylength / 2 , block_length - ( block_length - top_teeth_block_thickness ) / 2  ] ) { if (!( x_tooth_step == xlength / 2 ) && !( x_tooth_step == - xlength / 2 ) ) { top_tooth(block_length+ 0.001, shaft_radius, padding);  } } } }
                for ( y_tooth_step = [ - ylength / 2 : block_length : ylength / 2 ]) { if ( ( y_tooth_step + ylength / 2 ) % ( block_length * 2 )  == block_length && ! ( y_tooth_step == ylength / 2 ) && ! ( y_tooth_step == - ylength / 2 ) ) { translate([ - xlength / 2 , y_tooth_step , block_length - ( block_length - top_teeth_block_thickness ) / 2  ]) { if (!( y_tooth_step == ylength / 2 ) && !( y_tooth_step == - ylength / 2 ) ) { top_tooth(block_length+ 0.001, shaft_radius); } } } }
            }
        }
        
        if (cavity_type == "S")
        {        
            translate([0,0,block_length / 2])
            {
                square_cavity_array(x_spacing, y_spacing, x_units, y_units, x_offset, y_offset, x_cavity_dimensions, y_cavity_dimensions, z_cavity_dimensions*2);
            }
        }
        else if (cavity_type == "C")
        {
            translate([0,0,block_length / 2])
            {
                circular_cavity_array(x_spacing, y_spacing, x_units, y_units, x_offset, y_offset, x_cavity_dimensions, y_cavity_dimensions, z_cavity_dimensions*2);
            }
        }
        else
        {
            
        }
    }
}

module CUBX0177_SPAN(block_length, shaft_radius, xunits, yunits, x_spacing, y_spacing, x_units, y_units, x_offset, y_offset, x_cavity_dimensions, y_cavity_dimensions, z_cavity_dimensions, cavity_type)
{
    difference()
    {
        union()
        {
            /*  Constants */
            xlength = ( xunits - 1 ) * block_length;
            ylength = ( yunits - 1 ) * block_length;

            /* Main grid building loop. */
            for ( x_step = [ - xlength / 2 : block_length : xlength / 2 ])
            {
                /* Main grid building loop. */
                for ( y_step = [ - ylength / 2 : block_length : ylength / 2 ])
                {
                    translate([ x_step,y_step, 0 ] ) 
                    { 
                        general_block(block_length + 0.001, shaft_radius );
                    }  
                }
            }

        }
        
        if (cavity_type == "S")
        {        
            translate([0,0,block_length / 2])
            {
                square_cavity_array(x_spacing, y_spacing, x_units, y_units, x_offset, y_offset, x_cavity_dimensions, y_cavity_dimensions, z_cavity_dimensions*2);
            }
        }
        else if (cavity_type == "C")
        {
            translate([0,0,block_length / 2])
            {
                circular_cavity_array(x_spacing, y_spacing, x_units, y_units, x_offset, y_offset, x_cavity_dimensions, y_cavity_dimensions, z_cavity_dimensions*2);
            }
        }
        else
        {
            
        }
    }
}

module cubic_module(block_length = 25, shaft_radius=2.5, x_units = 8, y_units = 12, z_units = 4, alpha = 200)
{
    //translate([0, 0 , z_units * block_length / 2 + alpha]) { rotate([0,0,0]) { color(0.65) { CUBX0177_element(block_length, shaft_radius, x_units, y_units, 0.08, "regular", false); } } } // +z side.
    translate( [ 0, y_units * block_length / 2 + alpha, 0]) { rotate([-90,0,0]) { color(0.65) { CUBX0177_element(block_length, shaft_radius, x_units, z_units, 0.08,"regular", false); } } } // +y side.
    translate([ - x_units * block_length / 2 - alpha, 0, 0 ] ) { rotate([0,-90,0]) { color(0.65) { CUBX0177_element(block_length, shaft_radius, z_units, y_units, 0.08,"regular", false); } } } // -x side.
    //translate([0 , 0, -z_units*block_length / 2 - alpha] ) { rotate([0,180,0]) { color(0.65) { CUBX0177_element(block_length, shaft_radius, x_units, y_units, 0.08,"regular", false); } } } // -z side.
    translate( [ 0, - y_units * block_length / 2 - alpha, 0 ] ) { rotate([90,0,0]) { color( 0.65) { CUBX0177_element(block_length, shaft_radius, x_units, z_units, 0.08,"regular", false); } } } // -y side.
    //translate([ x_units * block_length / 2 + alpha, 0 ,0 ] ) { rotate([90,0,90]) { color( 0.65) { CUBX0177_element(block_length, shaft_radius, y_units, z_units, 0.08,"regular", false); } } } // +x side.
}

module triangular_corner_difference(block_length, shaft_radius)
{
    $fn = 100;
    constant = 30;
    difference()
    {
        general_block(block_length, shaft_radius);
        
        color("blue", 0.5)
        {
            translate([0,block_length*constant,block_length*constant]) { rotate([0,90,0]) { cylinder(block_length, (sqrt(2*pow(constant,2))-sqrt(2/4))*block_length+0.5, (sqrt(2*pow(constant,2))-sqrt(2/4))*block_length+0.5, true); } }
            translate([block_length*constant,0,block_length*constant]) { rotate([90,0,0]) { cylinder(block_length, (sqrt(2*pow(constant,2))-sqrt(2/4))*block_length+0.5,(sqrt(2*pow(constant,2))-sqrt(2/4))*block_length+0.5, true); } }
            translate([0,-block_length*constant,block_length*constant]) { rotate([0,-90,0]) { cylinder(block_length, (sqrt(2*pow(constant,2))-sqrt(2/4))*block_length+0.5, (sqrt(2*pow(constant,2))-sqrt(2/4))*block_length+0.5, true); } }
            translate([-block_length*constant,0,block_length*constant]) { rotate([-90,0,0]) { cylinder(block_length, (sqrt(2*pow(constant,2))-sqrt(2/4))*block_length+0.5,(sqrt(2*pow(constant,2))-sqrt(2/4))*block_length+0.5, true); } }
            
            translate([0,block_length*constant,-block_length*constant]) { rotate([0,90,0]) { cylinder(block_length, (sqrt(2*pow(constant,2))-sqrt(2/4))*block_length+0.5, (sqrt(2*pow(constant,2))-sqrt(2/4))*block_length+0.5, true); } }
            translate([block_length*constant,0,-block_length*constant]) { rotate([90,0,0]) { cylinder(block_length, (sqrt(2*pow(constant,2))-sqrt(2/4))*block_length+0.5,(sqrt(2*pow(constant,2))-sqrt(2/4))*block_length+0.5, true); } }
            translate([0,-block_length*constant,-block_length*constant]) { rotate([0,-90,0]) { cylinder(block_length, (sqrt(2*pow(constant,2))-sqrt(2/4))*block_length+0.5, (sqrt(2*pow(constant,2))-sqrt(2/4))*block_length+0.5, true); } }
            translate([-block_length*constant,0,-block_length*constant]) { rotate([-90,0,0]) { cylinder(block_length, (sqrt(2*pow(constant,2))-sqrt(2/4))*block_length+0.5,(sqrt(2*pow(constant,2))-sqrt(2/4))*block_length+0.5, true); } }
        }
        
        //translate([block_length*constant,block_length*constant,block_length*constant]) { rotate([0,0,0]) { sphere((sqrt(3*pow(constant,2))-sqrt(3/4))*block_length+1,true); } }
        //translate([-block_length*constant,block_length*constant,block_length*constant]) { rotate([0,0,0]) { sphere((sqrt(3*pow(constant,2))-sqrt(3/4))*block_length+1,true); } }
        //translate([block_length*constant,-block_length*constant,block_length*constant]) { rotate([0,0,0]) { sphere((sqrt(3*pow(constant,2))-sqrt(3/4))*block_length+1,true); } }
        //translate([-block_length*constant,-block_length*constant,block_length*constant]) { rotate([0,0,0]) { sphere((sqrt(3*pow(constant,2))-sqrt(3/4))*block_length+1,true); } }
    }
    
}

/* Axle Adapter */
module CUBX0177_AXAD( block_length, shaft_radius )
{
    difference()
    {
        union()
        {
            translate([block_length*0, block_length*0, block_length*0]) { general_block(block_length + 0.01, shaft_radius ); }
            translate([block_length*1, block_length*0, block_length*0]) { general_block(block_length + 0.01, shaft_radius ); }
            translate([block_length*1, block_length*-1, block_length*0]) { general_block(block_length + 0.01, shaft_radius ); }
            translate([block_length*-1, block_length*-1, block_length*0]) { general_block(block_length + 0.01, shaft_radius ); }
            translate([block_length*-1, block_length*1, block_length*0]) { general_block(block_length + 0.01, shaft_radius ); }
            translate([block_length*-1, block_length*0, block_length*0]) { general_block(block_length + 0.01, shaft_radius ); }
            translate([block_length*0, block_length*-1, block_length*0]) { general_block(block_length + 0.01, shaft_radius ); }
            translate([block_length*0, block_length*1, block_length*0]) { general_block(block_length + 0.01, shaft_radius ); }
            translate([block_length*1, block_length*1, block_length*0]) { general_block(block_length + 0.01, shaft_radius ); }

            translate([block_length*1, block_length*0, block_length*1]) { general_block(block_length + 0.01, shaft_radius ); }
            translate([block_length*1, block_length*-1, block_length*1]) { general_block(block_length + 0.01, shaft_radius ); }
            translate([block_length*-1, block_length*-1, block_length*1]) { general_block(block_length + 0.01, shaft_radius ); }
            translate([block_length*-1, block_length*1, block_length*1]) { general_block(block_length + 0.01, shaft_radius ); }
            translate([block_length*-1, block_length*0, block_length*1]) { general_block(block_length + 0.01, shaft_radius ); }
            translate([block_length*0, block_length*-1, block_length*1]) { general_block(block_length + 0.01, shaft_radius ); }
            translate([block_length*0, block_length*1, block_length*1]) { general_block(block_length + 0.01, shaft_radius ); }
            translate([block_length*1, block_length*1, block_length*1]) { general_block(block_length + 0.01, shaft_radius ); }

            translate([block_length*1, block_length*0, block_length*2]) { general_block(block_length + 0.01, shaft_radius ); }
            translate([block_length*1, block_length*-1, block_length*2]) { general_block(block_length + 0.01, shaft_radius ); }
            translate([block_length*-1, block_length*-1, block_length*2]) { general_block(block_length + 0.01, shaft_radius ); }
            translate([block_length*-1, block_length*1, block_length*2]) { general_block(block_length + 0.01, shaft_radius ); }
            translate([block_length*-1, block_length*0, block_length*2]) { general_block(block_length + 0.01, shaft_radius ); }
            translate([block_length*0, block_length*-1, block_length*2]) { general_block(block_length + 0.01, shaft_radius ); }
            translate([block_length*0, block_length*1, block_length*2]) { general_block(block_length + 0.01, shaft_radius ); }
            translate([block_length*1, block_length*1, block_length*2]) { general_block(block_length + 0.01, shaft_radius ); }
            
            translate([block_length*2, block_length*0, block_length*0]) { general_block(block_length + 0.01, shaft_radius ); }
            translate([block_length*0, block_length*-2, block_length*0]) { general_block(block_length + 0.01, shaft_radius ); }
            translate([block_length*-2, block_length*0, block_length*0]) { general_block(block_length + 0.01, shaft_radius ); }
            translate([block_length*0, block_length*2, block_length*0]) { general_block(block_length + 0.01, shaft_radius ); }

        }
        translate([0,0,block_length*1]) { cube([block_length+0.1, block_length+0.1, block_length+0.1],true);}
        translate([0,0,block_length*2]) { cube([block_length+0.1, block_length+0.1, block_length+0.1],true);}
        
    }
}


/* Axle - Flywheel Adapter */
module CUBX0177_FYAD( block_length, shaft_radius )
{
    translate([0*block_length, 0*block_length, 0*block_length]) { general_block(block_length + 0.01, shaft_radius ); }
    translate([block_length*1, block_length*0, block_length*0]) { general_block(block_length + 0.01, shaft_radius ); }
    translate([block_length*1, block_length*-1, block_length*0]) { general_block(block_length + 0.01, shaft_radius ); }
    translate([block_length*-1, block_length*-1, block_length*0]) { general_block(block_length + 0.01, shaft_radius ); }
    translate([block_length*-1, block_length*1, block_length*0]) { general_block(block_length + 0.01, shaft_radius ); }
    translate([block_length*-1, block_length*0, block_length*0]) { general_block(block_length + 0.01, shaft_radius ); }
    translate([block_length*0, block_length*-1, block_length*0]) { general_block(block_length + 0.01, shaft_radius ); }
    translate([block_length*0, block_length*1, block_length*0]) { general_block(block_length + 0.01, shaft_radius ); }
    translate([block_length*1, block_length*1, block_length*0]) { general_block(block_length + 0.01, shaft_radius ); }
    
    translate([block_length*2, block_length*0, block_length*0]) { general_block(block_length + 0.01, shaft_radius ); }
    translate([block_length*2, block_length*0, block_length*1]) { general_block(block_length + 0.01, shaft_radius ); }

    translate([block_length*0, block_length*-2, block_length*0]) { general_block(block_length + 0.01, shaft_radius ); }
    translate([block_length*0, block_length*-2, block_length*1]) { general_block(block_length + 0.01, shaft_radius ); }

    translate([block_length*-2, block_length*0, block_length*0]) { general_block(block_length + 0.01, shaft_radius ); }
    translate([block_length*-2, block_length*0, block_length*1]) { general_block(block_length + 0.01, shaft_radius ); }
    
    translate([block_length*0, block_length*2, block_length*0]) { general_block(block_length + 0.01, shaft_radius ); }
    translate([block_length*0, block_length*2, block_length*1]) { general_block(block_length + 0.01, shaft_radius ); }
}

/* Axle - Flywheel Adapter */
module CUBX0177_AXLE( block_length, shaft_radius, axle_blocks )
{
    length = block_length*(axle_blocks-1);
    for ( x_block_step = [ - length / 2 : block_length : length / 2 ]) 
    { 
        translate([x_block_step,0,0])
        {
            scale([1.0001,1,1])
            {
                general_block(block_length, shaft_radius);
            }
        }
    }
}


CUBX0177_SPAN(block_length=25, shaft_radius=3, xunits=5, yunits=5, x_spacing=15, y_spacing=10, x_units=2, y_units=3, x_offset=0, y_offset=0, x_cavity_dimensions=5, y_cavity_dimensions=5, z_cavity_dimensions=5, cavity_type="S");
