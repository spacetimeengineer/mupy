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

module block_array(block_length = 25, xunits=1, yunits=1)
{
    /*  Constants */
    xlength = ( xunits - 1 ) * block_length;
    ylength = ( yunits - 1 ) * block_length;
    inner_cavity_block_thickness = block_length;
    top_teeth_block_thickness = block_length;
    binding_overlap = 0.01;
    
    /* Main grid building loop. */
    for ( x_step = [ - xlength / 2 : block_length : xlength / 2 ])
    {
        /* Main grid building loop. */
        for ( y_step = [ - ylength / 2 : block_length : ylength / 2 ])
        {
            translate([x_step ,y_step ,0]) { rotate([0,0,0]) { cube([block_length+binding_overlap, block_length+binding_overlap, block_length+binding_overlap],true); } }
        }
    }
}

