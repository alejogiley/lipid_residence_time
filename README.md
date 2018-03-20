# plumed_residence_time

Calculate the residence time of lipids at a specific region of the protein interface. It uses [plumed](https://plumed.github.io) and bash scripts to postprocess a MD trajectory.

## Citation

Please cite the following publication:

G.A. Tribello, M. Bonomi, D. Branduardi, C. Camilloni, G. Bussi, PLUMED2: New feathers for an old bird, Comp. Phys. Comm. 185, 604 (2014)

## Directory Tree

```
/msd_map/
├── Example
    ├── plumed-core.dat  --> plumed input file.
    ├── residence.sh     --> bash script.
    └── COLVAR 		 --> directory
	└── COLVAR1      --> CVs for lipid 1
└── Figure
    ├── gnuplot.plt --> gnuplot script.
    └── Fig1.png    --> diagram of CVs.
```

## PLUMED

The file ```plumed-core.dat``` includes the definition of atoms groups and distance vectors internal to the protein. These CVs will define the position and orientation of the lipid-protein binding interface.
For a in-deep explanation of this file syntax check the [plumed](https://plumed.github.io/doc-v2.4/user-doc/html/index.html) manual.

```javascript
WHOLEMOLECULES ENTITY0=364,366,367,370,372,806,808,810,813,815,261,268,270,272,694,696,705,706,708,429-432,505-508

C1: CENTER ATOMS=364,366,367,370,372,806,808,810,813,815
C2: CENTER ATOMS=261,268,270,272,694,696,705,706,708
C3: CENTER ATOMS=429-432
C4: CENTER ATOMS=505-508
```
---

The variable ```C1``` includes the MARTINI BB beads of residues at the dimerization interface of [CLC-ec1](https://www.rcsb.org/structure/1OTS), the protein used in the [Example](./Example) directory. To see in VMD use:

	serial 364 366 367 370 372 806 808 810 813 815

Variable ```C2``` includes a group of atoms colinear along the *x*-axis with ```C1```. The centers of these groups will be used later to define a vector normal to the lipid-protein interface plane.
