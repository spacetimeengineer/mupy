
/*  This script provides generalized synthesis functions for elements at the family-code level for element-gen.scad   */


/* Imports the following typecode elements creation functions. */

use <BSQX0064.scad>;
use <LSQX0064.scad>;
use <SSQX0064.scad>;

//use <RSQX0064.scad>;
//use <TSQX0064.scad>;


//use <HSQX0064.scad> Huge
//use <WSQX0064.scad> Wide
//use <TSQX0064.scad> Thin



use <BXTX0064.scad>;
use <LXTX0064.scad>;
//use <SXTX0064.scad>;
//use <AXTX0064.scad>;`





//use <BXPX0064.scad>;
//use <LXPX0064.scad>;
//use <SXPX0064.scad>;

//use <HXPX0064.scad> Huge
//use <WXPX0064.scad> Wide
//use <TXPX0064.scad> Thin

/* Generates a CUBX0012 element. Top level element synthesis abstraction. */

module CUBX0012_element(type_code, rank_code, function_code, style_code, bind_code)
{
    // echo("/CUBX0012/CUBX0012.scad --> Module : CUBX0012_element()");
    if (type_code == "BSQX0064")
    {
        /* This is the primary element of this family; where all other typecodes derive their geometry from. */
        
        CUBX0012_BSQX0064_element(rank_code, function_code, style_code, bind_code);
    }
    if (type_code == "LSQX0064")
    {
        CUBX0012_LSQX0064_element(rank_code, function_code, style_code, bind_code);
    }
    if (type_code == "SSQX0064")
    {
        CUBX0012_SSQX0064_element(rank_code, function_code, style_code, bind_code);
    }
    if (type_code == "BXTX0064")
    {
        CUBX0012_BXTX0064_element(rank_code, function_code, style_code, bind_code);
    }
    if (type_code == "LXTX0064")
    {
        CUBX0012_LXTX0064_element(rank_code, function_code, style_code, bind_code);
    }
    if (type_code == "SXTX0064")
    {
        CUBX0012_SXTX0064_element(rank_code, function_code, style_code, bind_code);
    }
    if (type_code == "AXTX0064")
    {
        CUBX0012_AXTX0064_element(rank_code, function_code, style_code, bind_code);
    }
    if (type_code == "BXPX0064")
    {
        CUBX0012_BXPX0064_element(rank_code, function_code, style_code, bind_code);
    }    
    if (type_code == "LXPX0064")
    {
        CUBX0012_LXPX0064_element(rank_code, function_code, style_code, bind_code);
    }
    if (type_code == "SXPX0064")
    {
        CUBX0012_SXPX0064_element(rank_code, function_code, style_code, bind_code);
    }
}