
// Need to make the teeth a bit smaller using a scale inderpendent tolerance parameter.


// Each block type needs special cuts and rotations to look cool and reduce mass.

// There needs to be holes throle the teeth and sides to reduce mass.

// There needs to be angled bindshafts.

// There needs to be codes built in from the outset and the need to be very intellegent.

// The bind array parameters bust be defined. Bindshaft radius. Bindshaft x distance. Bindshaft Y distance. Same goes for angled bindshafts.

// "Proto" style, "lite" style and "stock" style.

use <gear_modules.scad>



module general_block(block_length = 25.001, shaft_radius = 2.5 )
{
    difference()
    {
        cube([block_length, block_length, block_length],true);
        //cube([block_length*3/5, block_length*3/5, block_length*3/5],true);

        rotate([0,0,0]) { cylinder( h = 50, r1 = shaft_radius, r2 = shaft_radius, center = true ); }
        rotate([90,0,0]) { cylinder( h = 50, r1 = shaft_radius, r2 =shaft_radius, center = true ); }
        rotate([0,90,0]) { cylinder( h = 50, r1 = shaft_radius, r2 = shaft_radius, center = true ); }
        rotate([0,45,0]) { cylinder( h = 50, r1 = shaft_radius, r2 = shaft_radius, center = true ); }
        rotate([0,-45,0]) { cylinder( h = 50, r1 = shaft_radius, r2 =shaft_radius, center = true ); }
        rotate([0,90,0]) { cylinder( h = 50, r1 = shaft_radius, r2 = shaft_radius, center = true ); }
    
    }
}

module basic_perimeter_block(block_length = 25.001, shaft_radius = 2.5 )
{

    difference()
    {
        
        cube([block_length, block_length, block_length],true);
        //cube([block_length*3/5, block_length*3/5, block_length*3/5],true);
        
        rotate([0,0,0]) { cylinder( h = 50, r1 = shaft_radius, r2 = shaft_radius, center = true ); }
        rotate([90,0,0]) { cylinder( h = 50, r1 = shaft_radius, r2 =shaft_radius, center = true ); }
        rotate([0,90,0]){ cylinder( h = 50, r1 = shaft_radius, r2 = shaft_radius, center = true ); }
        rotate([0,90,0]) { cylinder( h = 50, r1 = shaft_radius, r2 = shaft_radius, center = true ); } 
    }

}

module corner_perimeter_block(block_length = 25.001, shaft_radius = 2.5 )
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
        //cube([3/5*block_length, 3/5*block_length, 3/5*block_length  ],true);
    
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

module CUBX0177_element(block_length = 25, shaft_radius=2.5, xunits=8, yunits=8, padding = 0.2, side_teeth_orientation = "regular", top_teeth_included = true )
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

                if ( y_step == ylength / 2 && abs(x_step) != xlength / 2  ) {  translate([x_step,y_step, 0 ]) { rotate([0,0,90]) { basic_perimeter_block(block_length + 0.001, shaft_radius ); } } }
                if ( y_step == - ylength / 2 && abs(x_step) != xlength / 2) {  translate([x_step,y_step, 0 ]) { rotate([0,0,-90]) { basic_perimeter_block(block_length + 0.001, shaft_radius ); } } }
                if ( x_step == xlength / 2 && abs(y_step) != ylength / 2) { translate([x_step,y_step, 0 ]) { rotate([0,0,0]) { basic_perimeter_block(block_length + 0.001, shaft_radius ); } } }
                if ( x_step == - xlength / 2 && abs(y_step) != ylength / 2 ) { translate([x_step,y_step, 0 ]) { rotate([0,0,180]) { basic_perimeter_block(block_length + 0.001, shaft_radius ); } } }
                if ( x_step == xlength / 2 && y_step == ylength / 2 ) { translate([x_step,y_step, 0 ]) { rotate([0,0,0]) { corner_perimeter_block(block_length + 0.001, shaft_radius ); } } }
                if ( x_step ==  xlength / 2 && y_step == - ylength / 2 ) { translate([x_step,y_step, 0 ]) { rotate([180,0,0]) { corner_perimeter_block(block_length + 0.001, shaft_radius ); } } }
                if ( x_step == - xlength / 2 && y_step == ylength / 2 ) { translate([x_step,y_step, 0 ]) { rotate([180,0,180]) { corner_perimeter_block(block_length + 0.001, shaft_radius ); } } }
                if ( x_step == - xlength / 2 && y_step == - ylength / 2 ) { translate([x_step,y_step, 0 ]) { rotate([0,0,180]) { corner_perimeter_block(block_length + 0.001, shaft_radius ); } } }
            }
            /* If printing inner cavity. */
            else if ( y_step <= abs(ylength / 2 - block_length) || x_step <= abs(xlength / 2 - block_length ) ) 
            { 
                translate([ x_step,y_step, - ( block_length - inner_cavity_block_thickness ) / 2 ] ) 
                { 
                    side_tooth(block_length + 0.001, shaft_radius, padding );
                
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

    if (top_teeth_included == true)
    {

        /*  Top Teeth  */
        for ( x_tooth_step = [ - xlength / 2 : block_length : xlength / 2 ]) { if ( (x_tooth_step + xlength / 2 ) % ( block_length * 2 )  == block_length && !(x_tooth_step == xlength / 2 ) && !(x_tooth_step == -xlength / 2 )) { translate([x_tooth_step , ylength / 2 , block_length - ( block_length - top_teeth_block_thickness ) / 2 ]) { if (!( x_tooth_step == xlength / 2 ) && !( x_tooth_step == - xlength / 2 ) ) { top_tooth(block_length+ 0.001, shaft_radius, padding); } } } }
        for ( y_tooth_step = [ - ylength / 2 : block_length : ylength / 2 ]) { if ( ( y_tooth_step + ylength / 2 ) % ( block_length * 2 )  == 0 && ! ( y_tooth_step == ylength / 2 ) && ! ( y_tooth_step == - ylength / 2 ) ) { translate([xlength / 2 , y_tooth_step , block_length - ( block_length - top_teeth_block_thickness ) / 2  ]) { if (!( y_tooth_step == ylength / 2 ) && !( y_tooth_step == - ylength / 2 ) )  {  top_tooth(block_length+ 0.001, shaft_radius, padding);  } } } }
        for ( x_tooth_step = [ - xlength / 2 : block_length : xlength / 2 ] ) { if ( ( x_tooth_step + xlength / 2 ) % ( block_length * 2 )  == 0 && ! ( x_tooth_step == xlength / 2 ) && ! ( x_tooth_step == -xlength / 2 ) ) { translate([x_tooth_step , - ylength / 2 , block_length - ( block_length - top_teeth_block_thickness ) / 2  ] ) { if (!( x_tooth_step == xlength / 2 ) && !( x_tooth_step == - xlength / 2 ) ) { top_tooth(block_length+ 0.001, shaft_radius, padding);  } } } }
        for ( y_tooth_step = [ - ylength / 2 : block_length : ylength / 2 ]) { if ( ( y_tooth_step + ylength / 2 ) % ( block_length * 2 )  == block_length && ! ( y_tooth_step == ylength / 2 ) && ! ( y_tooth_step == - ylength / 2 ) ) { translate([ - xlength / 2 , y_tooth_step , block_length - ( block_length - top_teeth_block_thickness ) / 2  ]) { if (!( y_tooth_step == ylength / 2 ) && !( y_tooth_step == - ylength / 2 ) ) { top_tooth(block_length+ 0.001, shaft_radius); } } } }
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
        basic_perimeter_block(block_length, shaft_radius);
        
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



module shaft_array(spacing = 25, shaft_radius=2.5, xunits=1, yunits=1, height=block_length+0.1)
{
    /*  Constants */
    xlength = ( xunits - 1 ) * spacing;
    ylength = ( yunits - 1 ) * spacing;
    inner_cavity_block_thickness = spacing;
    top_teeth_block_thickness = spacing;
    
    /* Main grid building loop. */
    for ( x_step = [ - xlength / 2 : spacing : xlength / 2 ])
    {
        /* Main grid building loop. */
        for ( y_step = [ - ylength / 2 : spacing : ylength / 2 ])
        {
            translate([x_step ,y_step ,0]) { rotate([0,0,0]) { cylinder(height, shaft_radius, shaft_radius, true); } }
        }
    }
}


module block_array(block_length = 25, shaft_radius=2.5, xunits=1, yunits=1, padding = 0.1)
{
    /*  Constants */
    xlength = ( xunits - 1 ) * block_length;
    ylength = ( yunits - 1 ) * block_length;
    inner_cavity_block_thickness = block_length;
    top_teeth_block_thickness = block_length;
    
    /* Main grid building loop. */
    for ( x_step = [ - xlength / 2 : block_length : xlength / 2 ])
    {
        /* Main grid building loop. */
        for ( y_step = [ - ylength / 2 : block_length : ylength / 2 ])
        {
            translate([x_step ,y_step ,0]) { rotate([0,0,0]) { cube([block_length, block_length, block_length],true); } }
        }
    }
}






module array(block_length, shaft_radius)
{
    
}

module ring(block_length, shaft_radius)
{
    
}

module custom(block_length, shaft_radius)
{
    
}



$fn = 15;
block_length = 7.5;
shaft_radius = 2.5;

//triangular_corner_difference(block_length, shaft_radius);




/* Bearing config (please integrate)*/

/*
difference()
{
    translate([0, 0, 0]) { CUBX0177_element(block_length, shaft_radius, 8, 8, 0.1, "regular", false); }
    translate([0 ,0 ,0]) { rotate([0,0,0]) { cylinder(block_length+0.002, 8.09, 8.09, true); } }
}
*/
//translate([0, 0, block_length]) { mirror([0, 0, 1]) { bevel_gear_pair(modul=3, gear_teeth=34, pinion_teeth=14, axis_angle=90, tooth_width=block_length, gear_bore=4, pinion_bore=5, pressure_angle = 20, helix_angle=20, together_built=true); } }

/* Mountable gear ; please integrate. */

//translate([0, 0, -1]) { CUBX0177_element(block_length, shaft_radius, 8, 8, 0.10, "regular", false); }
//difference()
//{
    //translate([0, 0, 0]) { bevel_gear(modul=3, tooth_number=17,  partial_cone_angle=45, tooth_width=block_length, bore=shaft_radius*2, pressure_angle=20, helix_angle=-20); } 
    //translate([0, 0, 0]) { shaft_array(block_length, shaft_radius, 4, 4, block_length*3); }
    //translate([0 ,0 ,0]) { rotate([0,0,0]) { cylinder(block_length*3, 8.09, 8.09, true); } }
    //translate([0 ,0 ,8.6]) { rotate([0,0,0]) { cylinder(block_length, 9.5, 9.5, true); } }
    //translate([0, 0, 0]) { CUBX0177_element(block_length, shaft_radius, 8, 8, 0.10, "regular", false); }
//}
//difference()
//{
    //translate([0, 0, block_length/2]) { bevel_gear(modul=3, tooth_number=28,  partial_cone_angle=45, tooth_width=7.5, bore=5, pressure_angle=15, helix_angle=-20); }   
    //translate([0 ,0 ,0]) { rotate([0,0,0]) { cylinder(block_length*3, 8.09, 8.09, true); } }
//}

/* Cubic module */

//cubic_module(block_length, shaft_radius, x_units = 16, y_units = 16, z_units = 16, alpha = -3.75);


/* Inside bevel gear */

//translate([0, 0, 0]) { bevel_gear(modul=2, tooth_number=18,  partial_cone_angle=45, tooth_width=7.5*1.5, bore=5, pressure_angle=15, helix_angle=-20); }



/* Bearing config (please integrate)*/

/*
difference()
{
    translate([0, 0, 0]) { CUBX0177_element(block_length, shaft_radius, 18, 18, 0.1, "regular", false); }
    translate([0 ,0 ,0]) { rotate([0,0,0]) { cylinder(block_length+0.002, 8.08, 8.08, true); } }
}
*/


/* New Strait Inside bevel gear */
//translate([0, 0, 0]) { bevel_gear(modul=1.75, tooth_number=20,  partial_cone_angle=45, tooth_width=7.5*2, bore=5, pressure_angle=15, helix_angle=0); }

//translate([0, 0, 0]) { bevel_gear(modul=2, tooth_number=17,  partial_cone_angle=45, tooth_width=block_length, bore=shaft_radius*2, pressure_angle=20, helix_angle=0); } 




difference()
{
    union()
    {

        translate([block_length*0, block_length*0, block_length*0]) { basic_perimeter_block(block_length + 0.01, shaft_radius ); }
        translate([block_length*1, block_length*0, block_length*0]) { basic_perimeter_block(block_length + 0.01, shaft_radius ); }
        translate([block_length*1, block_length*-1, block_length*0]) { basic_perimeter_block(block_length + 0.01, shaft_radius ); }
        translate([block_length*-1, block_length*-1, block_length*0]) { basic_perimeter_block(block_length + 0.01, shaft_radius ); }
        translate([block_length*-1, block_length*1, block_length*0]) { basic_perimeter_block(block_length + 0.01, shaft_radius ); }
        translate([block_length*-1, block_length*0, block_length*0]) { basic_perimeter_block(block_length + 0.01, shaft_radius ); }
        translate([block_length*0, block_length*-1, block_length*0]) { basic_perimeter_block(block_length + 0.01, shaft_radius ); }
        translate([block_length*0, block_length*1, block_length*0]) { basic_perimeter_block(block_length + 0.01, shaft_radius ); }
        translate([block_length*1, block_length*1, block_length*0]) { basic_perimeter_block(block_length + 0.01, shaft_radius ); }

        translate([block_length*1, block_length*0, block_length*1]) { basic_perimeter_block(block_length + 0.01, shaft_radius ); }
        translate([block_length*1, block_length*-1, block_length*1]) { basic_perimeter_block(block_length + 0.01, shaft_radius ); }
        translate([block_length*-1, block_length*-1, block_length*1]) { basic_perimeter_block(block_length + 0.01, shaft_radius ); }
        translate([block_length*-1, block_length*1, block_length*1]) { basic_perimeter_block(block_length + 0.01, shaft_radius ); }
        translate([block_length*-1, block_length*0, block_length*1]) { basic_perimeter_block(block_length + 0.01, shaft_radius ); }
        translate([block_length*0, block_length*-1, block_length*1]) { basic_perimeter_block(block_length + 0.01, shaft_radius ); }
        translate([block_length*0, block_length*1, block_length*1]) { basic_perimeter_block(block_length + 0.01, shaft_radius ); }
        translate([block_length*1, block_length*1, block_length*1]) { basic_perimeter_block(block_length + 0.01, shaft_radius ); }

        translate([block_length*1, block_length*0, block_length*2]) { basic_perimeter_block(block_length + 0.01, shaft_radius ); }
        translate([block_length*1, block_length*-1, block_length*2]) { basic_perimeter_block(block_length + 0.01, shaft_radius ); }
        translate([block_length*-1, block_length*-1, block_length*2]) { basic_perimeter_block(block_length + 0.01, shaft_radius ); }
        translate([block_length*-1, block_length*1, block_length*2]) { basic_perimeter_block(block_length + 0.01, shaft_radius ); }
        translate([block_length*-1, block_length*0, block_length*2]) { basic_perimeter_block(block_length + 0.01, shaft_radius ); }
        translate([block_length*0, block_length*-1, block_length*2]) { basic_perimeter_block(block_length + 0.01, shaft_radius ); }
        translate([block_length*0, block_length*1, block_length*2]) { basic_perimeter_block(block_length + 0.01, shaft_radius ); }
        translate([block_length*1, block_length*1, block_length*2]) { basic_perimeter_block(block_length + 0.01, shaft_radius ); }
        
        
        translate([block_length*2, block_length*0, block_length*0]) { basic_perimeter_block(block_length + 0.01, shaft_radius ); }
        //translate([block_length*3, block_length*0, block_length*0]) { basic_perimeter_block(block_length + 0.01, shaft_radius ); }
        //translate([block_length*2, block_length*0, block_length*1]) { basic_perimeter_block(block_length + 0.01, shaft_radius ); }

        translate([block_length*0, block_length*-2, block_length*0]) { basic_perimeter_block(block_length + 0.01, shaft_radius ); }
        //translate([block_length*0, block_length*-3, block_length*0]) { basic_perimeter_block(block_length + 0.01, shaft_radius ); }
        //translate([block_length*0, block_length*-2, block_length*1]) { basic_perimeter_block(block_length + 0.01, shaft_radius ); }

        translate([block_length*-2, block_length*0, block_length*0]) { basic_perimeter_block(block_length + 0.01, shaft_radius ); }
        //translate([block_length*-3, block_length*0, block_length*0]) { basic_perimeter_block(block_length + 0.01, shaft_radius ); }
        //translate([block_length*-2, block_length*0, block_length*1]) { basic_perimeter_block(block_length + 0.01, shaft_radius ); }
        
        translate([block_length*0, block_length*2, block_length*0]) { basic_perimeter_block(block_length + 0.01, shaft_radius ); }
        //translate([block_length*0, block_length*3, block_length*0]) { basic_perimeter_block(block_length + 0.01, shaft_radius ); }
        //translate([block_length*0, block_length*2, block_length*1]) { basic_perimeter_block(block_length + 0.01, shaft_radius ); }
    }
    translate([0,0,block_length*1]) { cube([block_length+0.1, block_length+0.1, block_length+0.1],true);}
    translate([0,0,block_length*2]) { cube([block_length+0.1, block_length+0.1, block_length+0.1],true);}
    
}








/* Axle - Bearing Adapter */

/*
translate([0,0,-20])
{


        translate([block_length*0, block_length*0, block_length*0]) { basic_perimeter_block(block_length + 0.01, shaft_radius ); }
        translate([block_length*1, block_length*0, block_length*0]) { basic_perimeter_block(block_length + 0.01, shaft_radius ); }
        translate([block_length*1, block_length*-1, block_length*0]) { basic_perimeter_block(block_length + 0.01, shaft_radius ); }
        translate([block_length*-1, block_length*-1, block_length*0]) { basic_perimeter_block(block_length + 0.01, shaft_radius ); }
        translate([block_length*-1, block_length*1, block_length*0]) { basic_perimeter_block(block_length + 0.01, shaft_radius ); }
        translate([block_length*-1, block_length*0, block_length*0]) { basic_perimeter_block(block_length + 0.01, shaft_radius ); }
        translate([block_length*0, block_length*-1, block_length*0]) { basic_perimeter_block(block_length + 0.01, shaft_radius ); }
        translate([block_length*0, block_length*1, block_length*0]) { basic_perimeter_block(block_length + 0.01, shaft_radius ); }
        translate([block_length*1, block_length*1, block_length*0]) { basic_perimeter_block(block_length + 0.01, shaft_radius ); }
        
        translate([block_length*2, block_length*0, block_length*0]) { basic_perimeter_block(block_length + 0.01, shaft_radius ); }
        translate([block_length*2, block_length*0, block_length*1]) { basic_perimeter_block(block_length + 0.01, shaft_radius ); }

        translate([block_length*0, block_length*-2, block_length*0]) { basic_perimeter_block(block_length + 0.01, shaft_radius ); }
        translate([block_length*0, block_length*-2, block_length*1]) { basic_perimeter_block(block_length + 0.01, shaft_radius ); }

        translate([block_length*-2, block_length*0, block_length*0]) { basic_perimeter_block(block_length + 0.01, shaft_radius ); }
        translate([block_length*-2, block_length*0, block_length*1]) { basic_perimeter_block(block_length + 0.01, shaft_radius ); }
        
        translate([block_length*0, block_length*2, block_length*0]) { basic_perimeter_block(block_length + 0.01, shaft_radius ); }
        translate([block_length*0, block_length*2, block_length*1]) { basic_perimeter_block(block_length + 0.01, shaft_radius ); }
    }
*/






/* Differential Kit 1:1 */ 


/* Right Angle Gearbox Kit 1:1 */ 



/* Rotation Inverter Kit 1:2 */ 



/* 1:2 Gearbox Kit */ 
/* 1:3 Gearbox Kit */ 
/* 1:5 Gearbox Kit */ 
/* 1:7 Gearbox Kit */ 


