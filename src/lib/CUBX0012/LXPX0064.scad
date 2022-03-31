/*  This script takes in an element code input and uses it to generate a part to which the sub parts are abstracted from eachother.   */

/*
    Form :

        $ ./element-gen.py <FAMILYCODE>-<TYPECODE>-<RANKCODE>-<FUNCTIONCODE>-<STYLECODE>-<BINDCODE>
        $ python3 element-gen.py <FAMILYCODE>-<TYPECODE>-<RANKCODE>-<FUNCTIONCODE>-<STYLECODE>-<BINDCODE>

    Example : 

        $ ./element-gen.py CUBX0012-BSQX0064-00000200-FRMX0010-STDX0100-HYBX0001
        $ python3 element-gen.py CUBX0012-BSQX0064-00000200-FRMX0010-STDX0100-HYBX0001

*/

/* List all available family scripts. */

use <element.scad>


/* Primary function of this script; Takes in the family_code mainly as primary parameter and passes down the rest to child functions. */

module RHO_element(family_code, type_code, rank_code, function_code, style_code, bind_code)
{

    echo("HI")

    /* If the CUBX0012 family code was provided. */

    if (family_code == "CUBX0012")
    {
        echo("HI")
        CUBX0012_element(type_code, rank_code, function_code, style_code, bind_code);
    }
    

    /* If the GRDX0033 family code was provided. */

    if (family_code == "GRDX0033")
    {
        GIRX0033_element(type_code, rank_code, function_code, style_code, bind_code);
    }
}


/* Placeholder variables supplied by command line input. */

/*
    Form :

        $ ./element-gen.py <FAMILYCODE>-<TYPECODE>-<RANKCODE>-<FUNCTIONCODE>-<STYLECODE>-<BINDCODE>
        $ python3 element-gen.py <FAMILYCODE>-<TYPECODE>-<RANKCODE>-<FUNCTIONCODE>-<STYLECODE>-<BINDCODE>

    Example : 

        $ ./element-gen.py CUBX0012-BSQX0064-00000200-FRMX0010-STDX0100-HYBX0001
        $ python3 element-gen.py CUBX0012-BSQX0064-00000200-FRMX0010-STDX0100-HYBX0001

*/

/* Codes are initialized with whatever arguments initially provided in the command line. */

family_code = "";
type_code = "";
rank_code = "";
function_code = "";
style_code = "";
bind_code = "";
version_code = "";

/* Debug */

// echo(family_code);echo(type_code);echo(rank_code);echo(function_code);echo(style_code);echo(bind_code);echo(version_code);



/* Run utility element generation sequence. */

RHO_element(family_code, type_code, rank_code, function_code, style_code, bind_code);