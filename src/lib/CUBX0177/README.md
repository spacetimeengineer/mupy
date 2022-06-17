# CUBX0177
The CUBX0177 family was developed for simple prototyping and construction. Joinery based binding. This particular family is fun for kids too.

### Manufacturing Reccomendations
It is reccomended that CUBX0177 parts are 3D printed only if they are smaller which is the expected case. If larger utilize any manufacturing method that suites your needs. These are simple parts.

## BPAN

### Example(s)

    μ:# CUBX0177-BPAN-B25SR2P5-X8Y8PP2-RT-SX25Y25-X8Y8-XO3YO5-X20Y20Z10-S

### System Schema

    μ:# <namespace>-CUBX0177-BPAN-B<block_unit_length_in_mm>SR<shaft_radius_in_mm>-X<x_block_unit_count>Y<y_block_unit_count>P<teeth_padding_in_mm>-R<orientation>T<teeth_present>-SX<x_cavity_spacing_in_mm>Y<y_cavity_spacing_in_mm>-X<x_cavity_count>Y<y_cavity_count>-XO<x_offset_in_mm>YO<y_offset_in_mm>-X<x_cavity_dimensions_in_mm>Y<y_cavity_dimensions_in_mm>Z<z_cavity_dimensions_in_mm>-<cavity_type>

### block_unit_length_in_mm
### shaft_radius_in_mm

### x_block_unit_count
### y_block_unit_count
### teeth_padding_in_mm



| Parameter             | Description                    |        Type       |    Units    |
| --------------------- | ------------------------------ | ------------------|--------------
| block_unit_length_in_mm  | Each part exists as a mathematical array of these 'unit_blocks' which are perfect cubes. This parameter describes the unit_blocks unit-length, unit-width & unit-height (which shall always be the same). | int, float  |    mm    |
| shaft_radius_in_mm  | Each block_unit programmatically contains a hole with a variable radius set by user (even if radius is zero). This parameter sets the radius in mm which is bored through each block_unit. Typically these bores are used for bolting. | int, float  |     mm      |
