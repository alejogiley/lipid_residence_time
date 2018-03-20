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

The file ```plumed-core.dat``` includes the
