
/*  This script provides generalized synthesis functions for elements at the family-code level for element-gen.scad   */


/* Imports the following typecode elements creation functions. */

use <BSQX0184.scad>;
use <LSQX0184.scad>;
use <SSQX0184.scad>;

//use <RSQX0184.scad>;
//use <TSQX0184.scad>;


//use <HSQX0184.scad> Huge
//use <WSQX0184.scad> Wide
//use <TSQX0184.scad> Thin



use <BXTX0184.scad>;
use <LXTX0184.scad>;
//use <SXTX0184.scad>;
//use <AXTX0184.scad>;`





//use <BXPX0184.scad>;
//use <LXPX0184.scad>;
//use <SXPX0184.scad>;

//use <HXPX0184.scad> Huge
//use <WXPX0184.scad> Wide
//use <TXPX0184.scad> Thin

/* Generates a CUBX0125 element. Top level element synthesis abstraction. */

module CUBX0125_element(type_code, rank_code, function_code, style_code, bind_code)
{
    // echo("/CUBX0125/CUBX0125.scad --> Module : CUBX0125_element()");
    if (type_code == "BSQX0184")
    {
        /* This is the primary element of this family; where all other typecodes derive their geometry from. */
        
        CUBX0125_BSQX0184_element(rank_code, function_code, style_code, bind_code);
    }
    if (type_code == "LSQX0184")
    {
        CUBX0125_LSQX0184_element(rank_code, function_code, style_code, bind_code);
    }
    if (type_code == "SSQX0184")
    {
        CUBX0125_SSQX0184_element(rank_code, function_code, style_code, bind_code);
    }
    if (type_code == "BXTX0184")
    {
        CUBX0125_BXTX0184_element(rank_code, function_code, style_code, bind_code);
    }
    if (type_code == "LXTX0184")
    {
        CUBX0125_LXTX0184_element(rank_code, function_code, style_code, bind_code);
    }
    if (type_code == "SXTX0184")
    {
        CUBX0125_SXTX0184_element(rank_code, function_code, style_code, bind_code);
    }
    if (type_code == "AXTX0184")
    {
        CUBX0125_AXTX0184_element(rank_code, function_code, style_code, bind_code);
    }
    if (type_code == "BXPX0184")
    {
        CUBX0125_BXPX0184_element(rank_code, function_code, style_code, bind_code);
    }    
    if (type_code == "LXPX0184")
    {
        CUBX0125_LXPX0184_element(rank_code, function_code, style_code, bind_code);
    }
    if (type_code == "SXPX0184")
    {
        CUBX0125_SXPX0184_element(rank_code, function_code, style_code, bind_code);
    }
}