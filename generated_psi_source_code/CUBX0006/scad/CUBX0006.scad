// Example : CUBX0006-BLK-L67W796H897 
// Schema : CUBX0006-BLK-L<Length(mm)>W<Width(mm)>H<Height(mm)
// Description : This function is invoked directly from hardware set : CUBX0006-BLK.
module CUBX0006_BLK(length,width,height)
{
    CUBX0006_hardware=[length,width,height]; // Defines block dimensions.
    cube(CUBX0006_hardware,true); // Creates block mesh with said dimensions.
}