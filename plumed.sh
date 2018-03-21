# POPG

## Atom number of first POPG mol = 22742
## Resiude number of first POPG mol = 2264
## (see system.gro)
 
{
echo "RESTART NO"
echo "INCLUDE FILE=plumed-core.dat"
} > plumed-popg.dat

for i in {0..964}; do

        x=$((i+5))

        first=$(awk -v i=$i 'BEGIN{print 22742+12*i}')
        secnd=$(awk -v i=$i 'BEGIN{print 22742+12*i+11}')
        resid=$(awk -v i=$i 'BEGIN{print 2264+i}')

        {

	echo " "
        
	echo "WHOLEMOLECULES ENTITY0=${first}-${secnd}" 
        
	echo "C${x}:	CENTER 	   	ATOMS=${first}-${secnd}" 	
        echo "d1${x}:	DISTANCE 	ATOMS=C2,C$x 	  COMPONENTS" 	
        echo "p${x}:	POSITION 	ATOM=C$x 	  NOPBC" 	
        echo "psi${x}:	ANGLE 		ATOMS=C1,C2,C$x" 		
        echo "l${x}:	DISTANCE  	ATOMS=C1,C$x 	  COMPONENTS" 	

        echo "############" 
        echo "len${x}:   MATHEVAL ARG=l${x}.x,l${x}.y 			VAR=ax,ay FUNC=sqrt(ax*ax+ay*ay) 				PERIODIC=NO" 
        echo "dot${x}:   MATHEVAL ARG=d12.x,d12.y,d1${x}.x,d1${x}.y 	VAR=ax,ay,bx,by FUNC=(ax*bx+ay*by) 				PERIODIC=NO" 
        echo "cross${x}: MATHEVAL ARG=d12.x,d12.y,d1${x}.x,d1${x}.y 	VAR=ax,ay,bx,by FUNC=sqrt((ax*by-ay*bx)*(ax*by-ay*bx)) 		PERIODIC=NO" 
        echo "dist${x}:  MATHEVAL ARG=p1.x,p1.y,p${x}.x,p${x}.y 	VAR=ax,ay,bx,by FUNC=sqrt((bx-ax)*(bx-ax)+(by-ay)*(by-ay)) 	PERIODIC=NO" 
        echo "############" 
        
	echo "PRINT ARG=dot${x},cross${x},dot3,cross3,dot4,cross4,dist${x},psi${x},len${x} FILE=COLVAR${resid}" 
        echo " " 
	
	} >> plumed-popg.dat

done

