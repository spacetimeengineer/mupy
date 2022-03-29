module stock_CUBX0012_BSQX0064_00000200_cavity()
{
    translate([0,0,1/2*1/8*25+0.001])
    {
        rotate([0,0,0])
        {
             box=[112.5,112.5,7/8*25];
             cube(box,true);
        }
    }
}

module stock_CUBX0012_BXPX0064_00000200_cavity()
{
    stock_CUBX0012_BSQX0064_00000200_cavity();
}

module stock_CUBX0012_BXTX0064_00000200_cavity()
{
    stock_CUBX0012_BSQX0064_00000200_cavity();
}

module stock_CUBX0012_BSQX0064_00000200_undershave()
{
    translate([0,0,-18.75])
    {
        rotate([0,0,90])
        {
             box=[150,150,12.5];
             cube(box,true);
        }
    }
}

module total_CUBX0012_BSQX0064_00000200_cavity(alpha = 112.5, beta=50)
{
    translate([0,0,0])
    {
        rotate([0,0,0])
        {
             box=[alpha,alpha,beta];
             cube(box,true);
        }
    }
}



module stock_CUBX0012_BXPX0064_00000200_undershave()
{
    stock_CUBX0012_BSQX0064_00000200_undershave();
}

module stock_CUBX0012_BXTX0064_00000200_undershave()
{
    stock_CUBX0012_BSQX0064_00000200_undershave();
}


module stock_CUBX0012_BSQX0064_00000200_topshave()
{
    mirror([0,0,-1])
    {
        stock_CUBX0012_BSQX0064_00000200_undershave();
    }
}

module stock_CUBX0012_BXPX0064_00000200_topshave()
{
    stock_CUBX0012_BSQX0064_00000200_topshave();
}

module stock_CUBX0012_BXTX0064_00000200_topshave()
{
    stock_CUBX0012_BSQX0064_00000200_topshave();
}
