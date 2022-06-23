# CUBX0177
The CUBX0177 family was developed for simple prototyping and construction. Joinery based binding. This particular family is fun for kids too.

### Manufacturing Reccomendations
It is reccomended that CUBX0177 parts are 3D printed only if they are smaller which is the expected case. If larger utilize any manufacturing method that suites your needs. These are simple parts.

## BPAN

### Example(s)

    μ:# CUBX0177-BPAN-B25SR2P5-X8Y8PP2-RT-SX25Y25-X8Y8-XO3YO5-X20Y20Z10-S

### System Schema

    μ:# <namespace>-CUBX0177-BPAN-B<block_unit_length_in_mm>SR<shaft_radius_in_mm>-X<x_block_unit_count>Y<y_block_unit_count>P<teeth_padding_in_mm>-R<orientation>T<teeth_present>-SX<x_cavity_spacing_in_mm>Y<y_cavity_spacing_in_mm>-X<x_cavity_count>Y<y_cavity_count>-XO<x_offset_in_mm>YO<y_offset_in_mm>-X<x_cavity_dimensions_in_mm>Y<y_cavity_dimensions_in_mm>Z<z_cavity_dimensions_in_mm>-<cavity_type>



| Parameter             | Description                    |        Type       |    Units    |    Example  |  Example Meaning  |
| --------------------- | ------------------------------ | ------------------|-------------|-------------|-------------------|
| block_unit_length_in_mm  | Each part exists as a mathematical array of these 'unit_blocks' which are perfect cubes. This parameter describes the unit_blocks unit-length, unit-width & unit-height (which shall always be the same). | number (Use 'P' to indicate decimal within numerical string)  |    mm    |      S       |       S       |
| shaft_radius_in_mm  | Radius of bolt shaft. | number (Use 'P' to indicate decimal within numerical string)  |     mm      |      S       |       S       |
| x_block_unit_count  | Block units in x dimension. | number (Use 'P' to indicate decimal within numerical string)  |     block_unit      |      S       |       M       |
| y_block_unit_count  |  Block units in y dimension. | number (Use 'P' to indicate decimal within numerical string)  |     block_units     |      S       |       M       | 
| teeth_padding_in_mm  | Interteeth padding distance. Recommended is '0.12' or 'P12' or '0P12' but this is kept variable due to variance in 3D printer quality. Increase to loosen. Decrease to tighten.| int, float  |     block_unit      |      S       |        M       |
| orientation  | For box panel hardware components there is an orientation variable which refers to the way the side teeth are placed with respect to the bulk of the panel. There are 4 states however this reduces to two states if the top and bottom sides are identical ; If no top-teeth are added.| R,I,C,X  |     topological state      |       I       |    The box panel hardware element is inverted  |
| teeth_present  | Are top teeth present. These are nessecary in order to join CUBX0177 complete boxes to one another. | boolean (T - true, F - false)  |     state      |      T       |        Teeth are present.       |
| x_cavity_spacing_in_mm  | XXXX | number (Use 'P' to indicate decimal within numerical string)  |     mm      |      S       |        M       |
| y_cavity_spacing_in_mm  | XXXX | number (Use 'P' to indicate decimal within numerical string)  |     mm      |      S       |        M       |
| x_cavity_count  | XXXX | number (Use 'P' to indicate decimal within numerical string)  |     mm      |      S       |        M       |
| y_cavity_count  | XXXX | number (Use 'P' to indicate decimal within numerical string)  |     mm      |      S       |        M       |
| x_offset_in_mm  | XXXX | number (Use 'P' to indicate decimal within numerical string)  |     mm      |      S       |        M       |
| y_offset_in_mm  | XXXX | number (Use 'P' to indicate decimal within numerical string)  |     mm      |      S       |        M       |
| x_cavity_dimensions_in_mm  | XXXX | number (Use 'P' to indicate decimal within numerical string)  |     mm      |      S       |        M       |
| y_cavity_dimensions_in_mm  | XXXX | number (Use 'P' to indicate decimal within numerical string)  |     mm      |      S       |        M       |
| z_cavity_dimensions_in_mm  | XXXX | number (Use 'P' to indicate decimal within numerical string)  |     mm      |      S       |        M       |
| cavity_type  | For the cavity array embedded on the panel, specifies if the cavities are circular (C) or square (S). | character  |     state      |      S       |        Square type cavities.       |
