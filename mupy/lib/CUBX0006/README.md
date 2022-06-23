# CUBX0006
The CUBX0006 family was created for basic cubic stuctures ( there is only one CUBX0006 type : 'BLK' which stands for 'block' ) ; all 90 degree angles. It is one of the simplest. Here this code will generate a CUBX0006 rendering

### Manufacturing Reccomendations
Avoid 3D printing with this family and stick to woodworkingand computer simulation. This family is bulky and will make 3D prints very long.

## BLK - Block

This is a simple hardware type which gives users the ability to create boxes of any length width and height.

### Example(s)

    μ:# CUBX0006-BLK-L1000W200H15
    
![Alt Text](resources/CUBX0006-BLK-L1000W200H15.png)


### System Code Schema
<family_code>-<type_code>-L<length_in_mm>W<width_in_mm>H<height_in_mm>



### Parameterization Table
| Parameter             | Description                    |        Input Type                                            |    Input Units |    Input Example  |
| --------------------- | ------------------------------ | -------------------------------------------------------------|----------------|-------------------|
| length_in_mm          | Block length.                  | number (Use 'P' to indicate decimal within numerical string) |    mm          |      25P2         |
| width_in_mm           | Block width.                   | number (Use 'P' to indicate decimal within numerical string) |    mm          |      50P0         |
| height_in_mm          | Block height.                  | number (Use 'P' to indicate decimal within numerical string) |    mm          |      100          | 