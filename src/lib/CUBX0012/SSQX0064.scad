use <BSQX0064.scad>;
use <LSQX0064.scad>;

module CUBX0012_SSQX0064_element(rank_code, function_code, style_code, bind_code)
{
    if (rank_code == "00266D66")
    {
        CUBX0012_SSQX0064_00266D66_element(function_code, style_code, bind_code);
    }
    if (rank_code == "00000200")
    {
        CUBX0012_SSQX0064_00000200_element(function_code, style_code, bind_code);
    }
    if (rank_code == "00000150")
    {
        CUBX0012_SSQX0064_00000150_element(function_code, style_code, bind_code);
    }
    if (rank_code == "000112D5")
    {
        CUBX0012_SSQX0064_000112D5_element(function_code, style_code, bind_code);
    }
    if (rank_code == "0084D375")
    {
        CUBX0012_SSQX0064_0084D375_element(function_code, style_code, bind_code);
    }
    if (rank_code == "63D28125")
    {
        CUBX0012_SSQX0064_63D28125_element(function_code, style_code, bind_code);
    } 
}

module CUBX0012_SSQX0064_00266D66_element(function_code, style_code, bind_code)
{
    scale(4/3) 
    {
        CUBX0012_SSQX0064_00000200_element(function_code, style_code, bind_code);
    }
}

module CUBX0012_SSQX0064_00000200_element(function_code, style_code, bind_code)
{
    union()
    {
        translate([50,0,0])
        {
            difference()
            {
                CUBX0012_LSQX0064_00000200_element(function_code, style_code, bind_code);

                box=[100,100,50];
                cube(box,true);

                translate([50,0,0])
                {
                     box=[100,100,50];
                     cube(box,true);
                }
            }
        }
             
        translate([-50,0,0])
        {
            difference()
            {
                CUBX0012_LSQX0064_00000200_element(function_code, style_code, bind_code);
                box=[100,100,50];
                cube(box,true);

                translate([-50,0,0])
                {
                     box=[100,100,50];
                     cube(box,true);
                }
            }
        }
    }
}

module CUBX0012_SSQX0064_00000150_element(function_code, style_code, bind_code)
{
    scale(3/4) 
    {
        CUBX0012_SSQX0064_00000200_element(function_code, style_code, bind_code);
    }
}

module CUBX0012_SSQX0064_000112D5_element(function_code, style_code, bind_code)
{
    scale(3/4*3/4) 
    {
        CUBX0012_SSQX0064_00000200_element(function_code, style_code, bind_code);
    }
}

module CUBX0012_SSQX0064_0084D375_element(function_code, style_code, bind_code)
{
    scale(3/4*3/4*3/4) 
    {
        CUBX0012_SSQX0064_00000200_element(function_code, style_code, bind_code);
    }
}

module CUBX0012_SSQX0064_63D28125_element(function_code, style_code, bind_code)
{
    scale(3/4*3/4*3/4*3/4) 
    {
        CUBX0012_SSQX0064_00000200_element(function_code, style_code, bind_code);
    }
}