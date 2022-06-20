
// Need to make the teeth a bit smaller using a scale inderpendent tolerance parameter.


// Each block type needs special cuts and rotations to look cool and reduce mass.

// There needs to be holes throle the teeth and sides to reduce mass.

// There needs to be angled bindshafts.

// There needs to be codes built in from the outset and the need to be very intellegent.

// The bind array parameters bust be defined. Bindshaft radius. Bindshaft x distance. Bindshaft Y distance. Same goes for angled bindshafts.

// "Proto" style, "lite" style and "stock" style.

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

/*CUBX0177-BPAN-B25SR2P5-X8Y8PP2-RT-SX25Y25-X8Y8-XO3YO5-X20Y20Z10-S*/
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


//$fn = 15;
//block_length = 7.5;
//shaft_radius = 2.5;


$fn = 15;
block_length = 10.00;
shaft_radius = 3.33;




/* Main gear set for differential */

/*
translate([0, 0, block_length]) { mirror([0, 0, 1]) { bevel_gear_pair(modul=3, gear_teeth=34, pinion_teeth=14, axis_angle=90, tooth_width=block_length, gear_bore=4, pinion_bore=5, pressure_angle = 20, helix_angle=20, together_built=true); } }

/* Mountable gear ; please integrate. */

/*
translate([0, 0, -1]) { CUBX0177_element(block_length, shaft_radius, 8, 8, 0.10, "regular", false); }
difference()
{
    translate([0, 0, 0]) { bevel_gear(modul=3, tooth_number=17,  partial_cone_angle=45, tooth_width=block_length, bore=shaft_radius*2, pressure_angle=20, helix_angle=-20); } 
    translate([0, 0, 0]) { shaft_array(block_length, shaft_radius, 4, 4, block_length*3); }
    translate([0 ,0 ,0]) { rotate([0,0,0]) { cylinder(block_length*3, 8.09, 8.09, true); } }
    translate([0 ,0 ,8.6]) { rotate([0,0,0]) { cylinder(block_length, 9.5, 9.5, true); } }
    translate([0, 0, 0]) { CUBX0177_element(block_length, shaft_radius, 8, 8, 0.10, "regular", false); }
}
*/

/* Single Large Gear */

/*
difference()
{
    translate([0, 0, block_length/2]) { bevel_gear(modul=3, tooth_number=28,  partial_cone_angle=45, tooth_width=7.5, bore=5, pressure_angle=15, helix_angle=-20); }   
    translate([0 ,0 ,0]) { rotate([0,0,0]) { cylinder(block_length*3, 8.09, 8.09, true); } }
}
*/

/* Cubic module */

/*
cubic_module(block_length, shaft_radius, x_units = 16, y_units = 16, z_units = 16, alpha = -3.75);
*/

/* Interior 20 degree helix bevel gear */

/*
translate([0, 0, 0]) { bevel_gear(modul=2, tooth_number=18,  partial_cone_angle=45, tooth_width=7.5*1.5, bore=5, pressure_angle=15, helix_angle=-20); } 
*/



/* Bearing config (please integrate)*/

/*
difference()
{
    translate([0, 0, 0]) { CUBX0177_element(block_length, shaft_radius, 18, 18, 0.1, "regular", false); }
    translate([0 ,0 ,0]) { rotate([0,0,0]) { cylinder(block_length+0.002, 8.08, 8.08, true); } }
}
*/


/* Improved Strait Strait Inside bevel gear */

/*
translate([0, 0, 0]) { bevel_gear(modul=1.75, tooth_number=20,  partial_cone_angle=45, tooth_width=7.5*2, bore=5, pressure_angle=15, helix_angle=0); }
translate([0, 0, 0]) { bevel_gear(modul=2, tooth_number=17,  partial_cone_angle=45, tooth_width=block_length, bore=shaft_radius*2, pressure_angle=20, helix_angle=0); } 
*/



/* Axle Adapter */

module CUBX0177_axle_adapter_v0( block_length, shaft_radius )
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
            //translate([block_length*3, block_length*0, block_length*0]) { general_block(block_length + 0.01, shaft_radius ); }
            //translate([block_length*2, block_length*0, block_length*1]) { general_block(block_length + 0.01, shaft_radius ); }

            translate([block_length*0, block_length*-2, block_length*0]) { general_block(block_length + 0.01, shaft_radius ); }
            //translate([block_length*0, block_length*-3, block_length*0]) { general_block(block_length + 0.01, shaft_radius ); }
            //translate([block_length*0, block_length*-2, block_length*1]) { general_block(block_length + 0.01, shaft_radius ); }

            translate([block_length*-2, block_length*0, block_length*0]) { general_block(block_length + 0.01, shaft_radius ); }
            //translate([block_length*-3, block_length*0, block_length*0]) { general_block(block_length + 0.01, shaft_radius ); }
            //translate([block_length*-2, block_length*0, block_length*1]) { general_block(block_length + 0.01, shaft_radius ); }
            
            translate([block_length*0, block_length*2, block_length*0]) { general_block(block_length + 0.01, shaft_radius ); }
            //translate([block_length*0, block_length*3, block_length*0]) { general_block(block_length + 0.01, shaft_radius ); }
            //translate([block_length*0, block_length*2, block_length*1]) { general_block(block_length + 0.01, shaft_radius ); }
        }
        translate([0,0,block_length*1]) { cube([block_length+0.1, block_length+0.1, block_length+0.1],true);}
        translate([0,0,block_length*2]) { cube([block_length+0.1, block_length+0.1, block_length+0.1],true);}
        
    }
}


/* Axle - Flywheel Adapter */

module CUBX0177_flywheel_adapter_v0( block_length, shaft_radius )
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


CUBX0177_BPAN(block_length = 15, shaft_radius=2.5, xunits=18, yunits=12, padding = 0.2, side_teeth_orientation = "regular", top_teeth_included = true, x_spacing = 25, y_spacing = 35, x_units=3, y_units=2, x_offset=0, y_offset=0, x_cavity_dimensions=15, y_cavity_dimensions=15, z_cavity_dimensions=5, cavity_type="C");
