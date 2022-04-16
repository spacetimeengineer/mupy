It is often subtle how technology in the world progresses and while most of the reasons are credited with creativity and hard work the falaciy is that most people are not tht creative when in fact only few have the tools to realize this creativity. 

Imagine a technology designed to assist lrgly in the advancemenct of human technology and innovation.



'''

    from src.workspace import WorkSpace
    from src.hardware import Hardware
    from src.coordinates import Coordinates
    from src.assembly import Assembly


    # A workspace represents a virtual 3D spce which serves as a virtual workbench except it is not a surface but a space.
    """ Workspace """

    workspace = WorkSpace("/home/mryan/Desktop/psi/modular_gearboxes/")

    """ Hardware """
    # Declare Hardware codes and unique part names.
    panel_a = Hardware("panel_a", "CUBX0177-BPAN-B25SR2P5-X8Y8P18-RT-SX25Y25-X8Y8-X20Y20Z5")
    panel_b = Hardware("panel_b", "CUBX0177-BPAN-B25SR2P5-X8Y8P18-RT-SX25Y25-X8Y8-X20Y20Z5")
    panel_c = Hardware("panel_c", "CUBX0177-BPAN-B25SR2P5-X8Y8P18-RT-SX25Y25-X8Y8-X20Y20Z5")
    panel_d = Hardware("panel_d", "CUBX0177-BPAN-B25SR2P5-X8Y8P18-RT-SX25Y25-X8Y8-X20Y20Z5")
    panel_e = Hardware("panel_e", "CUBX0177-BPAN-B25SR2P5-X8Y8P18-RT-SX25Y25-X8Y8-X20Y20Z5")
    panel_f = Hardware("panel_f", "CUBX0177-BPAN-B25SR2P5-X8Y8P18-RT-SX25Y25-X8Y8-X20Y20Z5")



    alpha = 200 
    chamber_assembly = Assembly("chamber_assembly")
    chamber_assembly.include(panel_a, Coordinates(0,1,[0, 0 , 8 * 25 / 2 + alpha],[0, 0 , 8 * 25 / 2 ],[0,0,1000],[0,0,0])) # Coordinates complete!
    chamber_assembly.include(panel_b, Coordinates(0,1,[0, 8 * 25 / 2 + alpha, 0],[0, 8 * 25 / 2, 0],[0,0,1000],[-90,0,0])) # Coordinates complete!
    chamber_assembly.include(panel_c, Coordinates(0,1,[ - 8 * 25 / 2 - alpha, 0, 0 ],[ - 8 * 25 / 2, 0, 0 ],[0,0,1000],[0,-90,0])) # Coordinates complete!
    chamber_assembly.include(panel_d, Coordinates(0,1,[0 , 0, -8 * 25 / 2 - alpha],[0 , 0, -8 * 25 / 2 ],[0,0,1000],[0,180,0])) # Coordinates complete!
    chamber_assembly.include(panel_e, Coordinates(0,1,[0, - 8 * 25 / 2 - alpha, 0 ],[0, - 8 * 25 / 2, 0 ],[0,0,1000],[90,0,0])) # Coordinates complete!
    chamber_assembly.include(panel_f, Coordinates(0,1,[8 * 25 / 2 + alpha, 0 , 0],[8 * 25 / 2, 0 , 0],[0,0,1000],[90,0,90])) # Coordinates complete!

    workspace.run(chamber_assembly, Coordinates(0,1,[0,0,0],[0,0,0],[0,0,0],[0,0,0]))

'''

Form

    - PHICLI - Parametric Hardware Instructions CLI / Used for human tasks / real-time read human input.
    - PHIAPI - Parametric Hardware Instructions API / Used for automated tasks / real-time write human input
    - PHIUI - Parametric Hardware Instructions UI / Used for human tasks


Functions :

    - Encodes/Decodes Assembly
    - Encodes/Decodes Hardware
    - Encodes/Decodes Material
    - Encodes/Decodes Process
    - Data Compression Mechanism
    - Writes Simulation / Operation Code

Enviornment :

    - python3 pip package / openscad libraries (can be converted to python3)
    - Docker container option

Development Enviornment :

    - VSCode
    - Linux
    - Github
    - python3 pip

Product :

    - Openscad Code
    - Assembly Instructions
    - Assembly Simulations
    - Operational Simulations
    - Liscens Files
    - Metadata
    - Cura Files (3D Print)

Purpose :

    - Save time on manufacturing.
    - Save money on materials.
    - Transmit complex information about inventions.
    - Coordinate complex development.
    - Optimization space.
    - Contain near infinite levels of effective designs for little disk space.
    





Engineering :

- Manufacturing Utility 
- Educational Resource
- Technology Database
- Generates / Decodes modular and adaptive hardware from codes.
- Generates / Decodes modular and adaptive assembly from codes -> Reference to a .phi file (annotated scad file.)
- Certifies / Encodes new hardware
- Certifies / Encodes new assemblys
- Performs Assembly / Disasemmbly / Operational 3d simulations 
- Provides mechanism for remote manufacturing.
- Provides mechanism for handling new parts or designs.
- Provides mechanism for translating complex engineering to simple step by step guides.
- Provides hands on STEM training.


Science Functions :

- Design aparatus.
- Build Custom advanced equiptment and distribute to science journalsso that can be verified.

Market Functions :

- Buy / Sell  Assemblys, Parts, Services
- Treasury


Future Functions :

- Make it a videogame.
- Integrate with metaverse.
- design robots which learn to assemble since it is encoded.
- Build a spaceship.


Long Term Functions :

- Provides a mechanism for efficient innovation.
- Provides a mechanism for spacecraft fabrication.
- 

My Roles :


Days as a laborer :
Days as a carpenter / tiler :
Days as an electrical apprentice :
Days as a physics student :
Days as a theoretical physics practitioner :
Days as a robotics / comms engineer :
Days as a electrical engineer :
Days as a software engineer :
Days as a mobile engineer :
Days as a integration engineer :
Days as a systems engineer :
Days as an open source developer :
Days as an science software developer :
Days as a inventor :

Jack of all trades - mster of something new - > Mastery
Problem Solver




TimeLine :




2016 : Officially began preparing to develop a multi year developing project researching on how to develop custom hardware for innovative purposes.  I was trying to depart from a pure software, electrical, systems mindset to a more physical hardware hands on mindset.

    2016 Motivations : 

    - I hated waste. I hated the time needed to set up / break down projects. 
    - I began to realize the relationship between waste and development and this in addition related to the difficulty with scaling anything in general.
    - I could not build a spacecraft in my lifetime with my level of resources. I could not adequetly achieve a level of power and knowledge fast enough.
    - Needed to develop a modularhardware family.

    2016 Inspirations : Unemployment

    - 



2017 : Began prototyping first hardware family with woodworking equiptment. Built Flowerboxes mostly but proved to myself that we gained a manufacturing edge due to the modularity. each hardware element was constructed in 90 seconds.

    2017 Motivations :

    - I began to realize that building parts were cool but difficult to sell becasue there was no finished product. I
    - I realized that I hated one offs, My inability to marry any project I developed made it difficult to maintain endurance since after a certain period of time I got bored and couldnt sustain development momentum and efficieny.
    - I needed a project that I could chew on for years ; or the rest of my life with constant oppertunites for new developments and projects.
    - Had to do it on my own.

    2017 Inspirations : Docker



2018 : Began developing designs in open scad. (3D geometrylanguage.)

- 2018 Motivations :

    - I wanted to construct higher order improvesments and knew I needed a 3D printer.
    - Docker but in hardware form.

- 2018 Inspirations : Modularity




-2019 : Buy First 3D printer and test and assemble designs. The goal became to make the parts better and better and better.

- 2019 Motivations :

- I wanted to construct higher order improvesments and knew I needed a 3D printer.

- 2019 Inspirations : Parametrization





2020 : Designs extremely modular and takes advantage of hardware parametrization..
- 2020 Motivations :
- Enjoyed manufacturing but did not like being limited to 3d printers.
- 2020 Inspirations : Encoding

- I wanted to construct higher order improvesments and knew I needed a 3D printer.
    Develop count of 1000 modular parts for multiple families.
    Develop 4 new families and integrate 2 new familes.
    Inspirations :
    Motivations : 


2021 :  Develop schemaless hardware parametrization scheme.
        Develop hardware certification scheme.
        Develop hardware generation functions
        Develop PhiTERM and hardware wizard.

        Hard to manage so many parts, need schemaless encoding mechanism.
        Managing the parts became the new job so encodting them would simplify everything especially if it was with paramaters.

- 2021 Motivations :

- I wanted to construct higher order improvesments and knew I needed a 3D printer.

2022 : Develops Phiterm to aggregrate scripts in a working on the go process.
       Encode first kit and implement first prototypes.

        Inspirations :
        Motivations : 

- 2022 Motivations :


-2023 Just build kits....



Statement of intent as of 2022:



On Modularity :

    PHITerm provides encodings to all possible parts which meet general requierments but modular and adaptive parts are most coveted since they offer long term reusability.

    Efficient Assemly / Disasembly freedom - a metric which reffers to the count of possible ways something can be assembled or disasembled.


On Teamwork

    Teamwork and democracy is essential but that is only one half of the equation. In addition the individual must be equipt with tools, resources and must be given the power to be an army of one.

On Monetization

    The terminal is free but some features will be monitized and some will not. The free open source aspect of this project is extremely powerful make no mistake but it was nesseacary to make it free so that people would actually know it exist andd they can use it. Also it really is geniunly more powerful if it is free and open. Only the systes which it construct or the hardware families that shpuod be monitizable. Many parts I release willbe free. I intend to make money from company handuts if requirements are proposed..

On Enviormentalism

    I would prefer to focus on projects whoich promote cost effective enviormentaly freindly devices that help solve the enviormnet.

    The tool itself maintainls a low carbon footprint.
    The motivations for such a tool is to build machines which help the enviornment.



Statement of work :

Process : 

    - Theorizing New Projects & thought experimentation.
    
    - Opens an interesting usefule project has been identified; Research and Development of new adaptive and modular parts to build said project in OpenScad piece by piece. All parts are constraint driven and requirement driven and nessecity driven and solutions oriented. Also the philosophy is identical to that of linux programs make a bunch of little utilites that do thier job realy really really really well.
    
    - Simulate, perfect and print restart.

    - Once a viable canidate is identified: Next process is to paramaterize whch means removing the hardcodings and relplace for paramaters. This is useful becasue it allows multiple implimentation of the same part in this there is much value from reusability.

    - Once he open scad library is complete and paramaterized it is then sterilized with proper annotations so that it can be ingested by certification algorithm which basically assigns hardware codes to every possible part. These codes are themselves references to paramaters which are used to render the part.

    - Opnce yo have parts in the system you can begin printing and manufacturing but the process is only halfway complete. You now need to identify problems in the workd that people are willing to pay money for and build things with these parts in the real wolrd or a simulator. 
    - Once you uild it you need to identify the assembly procedure and encode into the system with the assembly-builderalgorithm which builds an empty 


Use Cases

    - On the moon.
    - On a flash drive.
    - Solves bordem.
    - Start business without paying royalties.
    - Start a project with friends.
    - Educate yourself or people.
    - Reprogramor integrate.

"""
