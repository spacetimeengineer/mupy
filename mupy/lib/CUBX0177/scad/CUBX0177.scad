$fn = 50;

module general_block(block_length, shaft_radius )
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

module pin_block(block_length, shaft_radius )
{
    difference()
    {
        cube([block_length, block_length, block_length],true);

        rotate([0,0,0]) { cylinder( h = 50, r1 = shaft_radius, r2 = shaft_radius, center = true ); }
        rotate([90,0,0]) { cylinder( h = 50, r1 = shaft_radius, r2 =shaft_radius, center = true ); }
        //rotate([0,90,0]){ cylinder( h = 50, r1 = shaft_radius, r2 = shaft_radius, center = true ); }
    }
    translate([-block_length+block_length/4+0.01,0,0]){rotate([0,90,0]){ cylinder( h = block_length/2, r1 = shaft_radius, r2 = shaft_radius, center = true ); }}
}

module side_tooth(block_length, shaft_radius, padding )
{
    difference()
    {
        cube([block_length - padding, block_length, block_length],true);
    
        rotate([0,0,90]) { cylinder( h = 50, r1 = shaft_radius, r2 = shaft_radius, center = true ); }
        rotate([0,90,90]) { cylinder( h = 50, r1 = shaft_radius, r2 =shaft_radius, center = true ); }
        rotate([0,90,0]) { cylinder( h = 50, r1 = shaft_radius, r2 = shaft_radius, center = true ); }

    }
}

module top_tooth(block_length, shaft_radius, padding = 0.22 )
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
    /*  Formating */
    x_spacing = x_spacing + 0.00001;
    y_spacing = y_spacing + 0.00001;
    
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
    /*  Formating */
    x_spacing = x_spacing + 0.00001;
    y_spacing = y_spacing + 0.00001;
   
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

module CUBX0177_BPANS2(block_length, shaft_radius, x_units, y_units, padding = 0.22, side_teeth_orientation, top_teeth_included = true, x_spacing_1, y_spacing_1, x_cavity_units_1, y_cavity_units_1, x_offset_1, y_offset_1, x_cavity_dimensions_1, y_cavity_dimensions_1, z_cavity_dimensions_1, cavity_type_1, x_spacing_2, y_spacing_2, x_cavity_units_2, y_cavity_units_2, x_offset_2, y_offset_2, x_cavity_dimensions_2, y_cavity_dimensions_2, z_cavity_dimensions_2, cavity_type_2)
{
    echo();
    difference()
    {

        CUBX0177_BPAN(block_length, shaft_radius, x_units, y_units, padding, side_teeth_orientation, top_teeth_included, x_spacing_1, y_spacing_1, x_cavity_units_1, y_cavity_units_1, x_offset_1, y_offset_1, x_cavity_dimensions_1, y_cavity_dimensions_1, z_cavity_dimensions_1, cavity_type_1);

        if (cavity_type_2 == "S")
        {        
            echo(cavity_type_2)
            translate([0,0,block_length / 2])
            {
                square_cavity_array(x_spacing_2, y_spacing_2, x_cavity_units_2, y_cavity_units_2, x_offset_2, y_offset_2, x_cavity_dimensions_2, y_cavity_dimensions_2, z_cavity_dimensions_2*2);
            }
        }
        if (cavity_type_2 == "C")
        {
            translate([0,0,block_length / 2])
            {
                echo(cavity_type_2)
                circular_cavity_array(x_spacing_2, y_spacing_2, x_cavity_units_2, y_cavity_units_2, x_offset_2, y_offset_2, x_cavity_dimensions_2, y_cavity_dimensions_2, z_cavity_dimensions_2*2);
            }
        }
    }
}

module CUBX0177_SPAN(block_length, shaft_radius, x_units, y_units, x_cavity_spacing, y_cavity_spacing, x_cavity_units, y_cavity_units, x_offset, y_offset, x_cavity_dimensions, y_cavity_dimensions, z_cavity_dimensions, cavity_type)
{
    difference()
    {
        union()
        {
            /*  Constants */
            x_length = ( x_units - 1 ) * block_length;
            y_length = ( y_units - 1 ) * block_length;

            /* Main grid building loop. */
            for ( x_step = [ - x_length / 2 : block_length : x_length / 2 ])
            {
                /* Main grid building loop. */
                for ( y_step = [ - y_length / 2 : block_length : y_length / 2 ])
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
                square_cavity_array(x_cavity_spacing, y_cavity_spacing, x_cavity_units, y_cavity_units, x_offset, y_offset, x_cavity_dimensions, y_cavity_dimensions, z_cavity_dimensions*2);
            }
        }
        if (cavity_type == "C")
        {
            translate([0,0,block_length / 2])
            {
                circular_cavity_array(x_cavity_spacing, y_cavity_spacing, x_cavity_units, y_cavity_units, x_offset, y_offset, x_cavity_dimensions, y_cavity_dimensions, z_cavity_dimensions*2);
            }
        }
        else
        {
            
        }
    }
}


module CUBX0177_SPANS2(block_length, shaft_radius, x_units, y_units, x_cavity_spacing_1, y_cavity_spacing_1, x_cavity_units_1, y_cavity_units_1, x_offset_1, y_offset_1, x_cavity_dimensions_1, y_cavity_dimensions_1, z_cavity_dimensions_1, cavity_type_1, x_cavity_spacing_2, y_cavity_spacing_2, x_cavity_units_2, y_cavity_units_2, x_offset_2, y_offset_2, x_cavity_dimensions_2, y_cavity_dimensions_2, z_cavity_dimensions_2, cavity_type_2)
{
    echo();
    difference()
    {

        CUBX0177_SPAN(block_length, shaft_radius, x_units, y_units, x_cavity_spacing_1, y_cavity_spacing_1, x_cavity_units_1, y_cavity_units_1, x_offset_1, y_offset_1, x_cavity_dimensions_1, y_cavity_dimensions_1, z_cavity_dimensions_1, cavity_type_1);

        if (cavity_type_2 == "S")
        {        
            echo(cavity_type_2)
            translate([0,0,block_length / 2])
            {
                square_cavity_array(x_cavity_spacing_2, y_cavity_spacing_2, x_cavity_units_2, y_cavity_units_2, x_offset_2, y_offset_2, x_cavity_dimensions_2, y_cavity_dimensions_2, z_cavity_dimensions_2*2);
            }
        }
        if (cavity_type_2 == "C")
        {
            translate([0,0,block_length / 2])
            {
                echo(cavity_type_2)
                circular_cavity_array(x_cavity_spacing_2, y_cavity_spacing_2, x_cavity_units_2, y_cavity_units_2, x_offset_2, y_offset_2, x_cavity_dimensions_2, y_cavity_dimensions_2, z_cavity_dimensions_2*2);
            }
        }
    }
}

/* Axle Adapter */
module CUBX0177_AXAD( block_length, shaft_radius, padding = 0.3)
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
            translate([block_length*2, block_length*1, block_length*0]) { general_block(block_length + 0.01, shaft_radius ); }
            translate([block_length*2, block_length*-1, block_length*0]) { general_block(block_length + 0.01, shaft_radius ); }
            translate([block_length*3, block_length*0, block_length*0]) { general_block(block_length + 0.01, shaft_radius ); }
            
            translate([block_length*0, block_length*-2, block_length*0]) { general_block(block_length + 0.01, shaft_radius ); }
            translate([block_length*1, block_length*-2, block_length*0]) { general_block(block_length + 0.01, shaft_radius ); }
            translate([block_length*-1, block_length*-2, block_length*0]) { general_block(block_length + 0.01, shaft_radius ); }
            translate([block_length*0, block_length*-3, block_length*0]) { general_block(block_length + 0.01, shaft_radius ); }
            
            translate([block_length*-2, block_length*0, block_length*0]) { general_block(block_length + 0.01, shaft_radius ); }
            translate([block_length*-2, block_length*1, block_length*0]) { general_block(block_length + 0.01, shaft_radius ); }
            translate([block_length*-2, block_length*-1, block_length*0]) { general_block(block_length + 0.01, shaft_radius ); }
            translate([block_length*-3, block_length*0, block_length*0]) { general_block(block_length + 0.01, shaft_radius ); }
            
            translate([block_length*0, block_length*2, block_length*0]) { general_block(block_length + 0.01, shaft_radius ); }
            translate([block_length*1, block_length*2, block_length*0]) { general_block(block_length + 0.01, shaft_radius ); }
            translate([block_length*-1, block_length*2, block_length*0]) { general_block(block_length + 0.01, shaft_radius ); }
            translate([block_length*0, block_length*3, block_length*0]) { general_block(block_length + 0.01, shaft_radius ); }
        }

        translate([0,0,block_length*1]) { cube([block_length+padding, block_length+padding, block_length+padding],true);}
        translate([0,0,block_length*2]) { cube([block_length+padding, block_length+padding, block_length+padding],true);}
        
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
    
    
    
    translate([block_length*2, block_length*1, block_length*0]) { general_block(block_length + 0.01, shaft_radius ); }
    translate([block_length*2, block_length*-1, block_length*0]) { general_block(block_length + 0.01, shaft_radius ); }
    
    translate([block_length*-2, block_length*1, block_length*0]) { general_block(block_length + 0.01, shaft_radius ); }
    translate([block_length*-2, block_length*-1, block_length*0]) { general_block(block_length + 0.01, shaft_radius ); }
    
    translate([block_length*1, block_length*2, block_length*0]) { general_block(block_length + 0.01, shaft_radius ); }
    translate([block_length*-1, block_length*2, block_length*0]) { general_block(block_length + 0.01, shaft_radius ); }
    
    translate([block_length*1, block_length*-2, block_length*0]) { general_block(block_length + 0.01, shaft_radius ); }
    translate([block_length*-1, block_length*-2, block_length*0]) { general_block(block_length + 0.01, shaft_radius ); }
    
    translate([block_length*2, block_length*0, block_length*0]) { general_block(block_length + 0.01, shaft_radius ); }
    translate([block_length*3, block_length*0, block_length*0]) { general_block(block_length + 0.01, shaft_radius ); }
    translate([block_length*3, block_length*0, block_length*1]) { general_block(block_length + 0.01, shaft_radius ); }
    
    translate([block_length*0, block_length*-2, block_length*0]) { general_block(block_length + 0.01, shaft_radius ); }
    translate([block_length*0, block_length*-3, block_length*0]) { general_block(block_length + 0.01, shaft_radius ); }
    translate([block_length*0, block_length*-3, block_length*1]) { general_block(block_length + 0.01, shaft_radius ); }
    
    translate([block_length*-2, block_length*0, block_length*0]) { general_block(block_length + 0.01, shaft_radius ); }
    translate([block_length*-3, block_length*0, block_length*0]) { general_block(block_length + 0.01, shaft_radius ); }
    translate([block_length*-3, block_length*0, block_length*1]) { general_block(block_length + 0.01, shaft_radius ); }
    
    
    translate([block_length*0, block_length*2, block_length*0]) { general_block(block_length + 0.01, shaft_radius ); }
    translate([block_length*0, block_length*3, block_length*0]) { general_block(block_length + 0.01, shaft_radius ); }
    translate([block_length*0, block_length*3, block_length*1]) { general_block(block_length + 0.01, shaft_radius ); }
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

module CUBX0177_SHAFT( block_length, shaft_radius, block_units_shaft_length, padding )
{
    difference()
    {
        union()
        {
            for (z_block_unit_coordinate = [0:block_units_shaft_length-1])
            { 
                translate([block_length*0, block_length*0, block_length*z_block_unit_coordinate]) { general_block(block_length + 0.01, shaft_radius ); }
                translate([block_length*1, block_length*0, block_length*z_block_unit_coordinate]) { general_block(block_length + 0.01, shaft_radius ); }
                translate([block_length*1, block_length*-1, block_length*z_block_unit_coordinate]) { general_block(block_length + 0.01, shaft_radius ); }
                translate([block_length*-1, block_length*-1, block_length*z_block_unit_coordinate]) { general_block(block_length + 0.01, shaft_radius ); }
                translate([block_length*-1, block_length*1, block_length*z_block_unit_coordinate]) { general_block(block_length + 0.01, shaft_radius ); }
                translate([block_length*-1, block_length*0, block_length*z_block_unit_coordinate]) { general_block(block_length + 0.01, shaft_radius ); }
                translate([block_length*0, block_length*-1, block_length*z_block_unit_coordinate]) { general_block(block_length + 0.01, shaft_radius ); }
                translate([block_length*0, block_length*1, block_length*z_block_unit_coordinate]) { general_block(block_length + 0.01, shaft_radius ); }
                translate([block_length*1, block_length*1, block_length*z_block_unit_coordinate]) { general_block(block_length + 0.01, shaft_radius ); }
            }
        }
        
        for (z_block_unit_coordinate = [0:block_units_shaft_length-1])
        { 
            translate([0,0,block_length*z_block_unit_coordinate]) { cube([block_length+padding, block_length+padding, block_length+padding], true );}
        }
    }
}

module CUBX0177_COUP( block_length, shaft_radius, block_units_shaft_length, padding, coupling_type )
{
    if (coupling_type == "S") // Surface type coupling.
    {
        translate([0,0,block_length]) { rotate([0,0,0]) { CUBX0177_SHAFT( block_length, shaft_radius, block_units_shaft_length, padding ); } }
        translate([0,-block_length,0]) { rotate([90,0,0]) { CUBX0177_SHAFT( block_length, shaft_radius, block_units_shaft_length, padding ); } }
        translate([block_length,0,0]) { rotate([90,0,90]) { CUBX0177_SHAFT( block_length, shaft_radius, block_units_shaft_length, padding ); } }
        translate([-block_length,0,0]) { rotate([90,0,270]) { CUBX0177_SHAFT( block_length, shaft_radius, block_units_shaft_length, padding ); } }
        translate([0,block_length,0]) { rotate([90,0,180]) { CUBX0177_SHAFT( block_length, shaft_radius, block_units_shaft_length, padding ); } }
    }
    if (coupling_type == "C") // Surface type coupling.
    {
        translate([0,0,block_length]) { rotate([0,0,0]) { CUBX0177_SHAFT( block_length, shaft_radius, block_units_shaft_length, padding ); } }
        translate([0,-block_length,0]) { rotate([90,0,0]) { CUBX0177_SHAFT( block_length, shaft_radius, block_units_shaft_length, padding ); } }
        translate([block_length,0,0]) { rotate([90,0,90]) { CUBX0177_SHAFT( block_length, shaft_radius, block_units_shaft_length, padding ); } }
        translate([-block_length,0,0]) { rotate([90,0,270]) { CUBX0177_SHAFT( block_length, shaft_radius, block_units_shaft_length, padding ); } }
        translate([0,block_length,0]) { rotate([90,0,180]) { CUBX0177_SHAFT( block_length, shaft_radius, block_units_shaft_length, padding ); } }
        translate([0,0,-block_length]) { rotate([0,180,0]) { CUBX0177_SHAFT( block_length, shaft_radius, block_units_shaft_length, padding ); } }
    }
    if (coupling_type == "E") // Surface type coupling.
    {
        translate([0,0,block_length]) { rotate([0,0,0]) { CUBX0177_SHAFT( block_length, shaft_radius, block_units_shaft_length, padding ); } }
        //translate([0,-block_length,0]) { rotate([90,0,0]) { CUBX0177_SHAFT( block_length, shaft_radius, block_units_shaft_length, padding ); } }
        translate([block_length,0,0]) { rotate([90,0,90]) { CUBX0177_SHAFT( block_length, shaft_radius, block_units_shaft_length, padding ); } }
        translate([-block_length,0,0]) { rotate([90,0,270]) { CUBX0177_SHAFT( block_length, shaft_radius, block_units_shaft_length, padding ); } }
        translate([0,block_length,0]) { rotate([90,0,180]) { CUBX0177_SHAFT( block_length, shaft_radius, block_units_shaft_length, padding ); } }
        translate([block_length*0, block_length*-1, block_length*-1]) { general_block(block_length + 0.01, shaft_radius ); }
        //translate([0,0,-2*block_length]) { rotate([0,0,0]) { CUBX0177_SHAFT( block_length, shaft_radius, block_units_shaft_length, padding ); } }
    }
}

module CUBX0177_PIN( block_length, shaft_radius, block_units_pin_length )
{
    cylinder(h = block_units_pin_length*block_length, r1 = shaft_radius, r2 = shaft_radius, center = true);
    pin_length = block_length*block_units_pin_length;
}

module CUBX0177_BPIN( block_length, shaft_radius, block_units_pin_length )
{
    cylinder(h = block_units_pin_length*block_length, r1 = shaft_radius, r2 = shaft_radius, center = true);
    pin_length = block_length*block_units_pin_length;
}


//translate([-7.5, 0, 0 ]){ general_block(7.5, 2.2);}
//pin_block(7.5, 2.2 );
// To be integrated into mupy
//CUBX0177_PIN( block_length = 7.5, shaft_radius=  2.25, block_units_pin_length = 4 );
//CUBX0177_BPIN( block_length = 7.5, shaft_radius=  2.25, block_units_pin_length = 4 );
//CUBX0177_SPAN(block_length=7.5, shaft_radius=2.20, xunits=9, yunits=9, x_spacing=2*7.5, y_spacing=2*7.5, x_units=4, y_units=4, x_offset=0, y_offset=0, x_cavity_dimensions=7.7, y_cavity_dimensions=7.7, z_cavity_dimensions=26, cavity_type="S");
//CUBX0177_BPANS2( 7.5, 2.18, 10, 10, 0.21, "regular", false, 0, 0, 1, 1, 0, 0, 6*7.5, 6*7.5, 6, "S", 20, 20, 1, 1, 0, 0, 12, 12, 15, "S");
//CUBX0177_SPANS2( 7.5, 2.18, 6, 6, 0, 0, 1, 1, 0, 0, 19, 19, 0.75, "C", 0, 0, 1, 1, 0, 0, 12, 12, 10, "S"); // CUBX0177-SPANS2-B7P5SR2P2-X6Y6-SX0Y0-X1Y1-XO0YO0-X18Y18Z0P75-C-SX0Y0-X1Y1-XO0YO0-X7P5Y7P5Z10-S


//CUBX0177_BPAN( 7.5, 1, 8, 8, 0.21, "regular", false, 0, 0, 1, 1, 0, 0, 19, 19, 1.5, "C");
//CUBX0177_COUP( block_length = 7.5, shaft_radius = 2.20, block_units_shaft_length = 2, padding = 0.2, coupling_type = "S" );
//CUBX0177_AXLE( block_length = 7.5, shaft_radius = 2.25, axle_blocks = 20);

CUBX0177_FYAD( block_length = 7.5, shaft_radius = 2.18 );
//CUBX0177_AXAD( block_length = 7.5, shaft_radius = 2.18 );