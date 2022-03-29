module stock_CUBX0012_BSQX0064_00000200_skin(zeta=-9)
{
    translate([0,0,zeta])
    {
        for (i = [0: 10: 90])
        {
            translate([i - 45,0,0])
            {
                 box=[1,91,3];
                 cube(box,true);
            }
            
            rotate([0,0,90])
            {
                translate([i - 45,0,0])
                {
                     box=[1,91,3];
                     cube(box,true);
                }
            }
        }
    }
}

module stock_CUBX0012_BXTX0064_00000200_skin()
{
    stock_CUBX0012_BSQX0064_00000200_skin();
}

module stock_CUBX0012_BXPX0064_00000200_skin()
{
    stock_skin();
}
