# Random_2D_perturbations
testpseudo2D 

Generates a 100x100 2-dimensional random perturbation 
the code for generating a 3D (x-y-z) or (x-y-t) random field is commented. 
A random seed is generated based on the machine clock to avoid generating 
the same field each time. 

Compiling:
the platform independent commands are in the makefile and expect machine-dependent options from make.inc 

Execution:
./testpseudo2D

then in gnuplot type 
splot 'PERT.txt' w l 
or 
plot 'PERT.txt' with image
