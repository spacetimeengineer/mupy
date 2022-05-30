use <style_modules.scad>;
use <skin_modules.scad>;
use <cavity_modules.scad>;

module generate_binds(bind_code)
{
    if (bind_code == "00266D66")
    {
        
    }
    if (bind_code == "00000200")
    {
        /* This function is the true parent superfunction. */
    }
    if (bind_code == "00000150")
    {

    }
}

module generate_styles(style_code)
{

    if (style_code == "STDGRD04")
    {
        stock_CUBX0012_BSQX0064_00000200_style();
        stock_CUBX0012_BSQX0064_00000200_skin();
    }
    if (style_code == "RPTGRD04")
    {
        raptor_CUBX0012_BSQX0064_00000200_style();
        stock_CUBX0012_BSQX0064_00000200_skin();
    }
    if (style_code == "LITFRM04")
    {
        stock_CUBX0012_BSQX0064_00000200_style();
        raptor_CUBX0012_BSQX0064_00000200_style();
        total_CUBX0012_BSQX0064_00000200_cavity();
    }
}

module generate_functions(function_code)
{
    if (function_code == "STDBND02")
    {
        
    }
    if (function_code == "STDFRM02")
    {

    }
}