echo "RESTART NO" > plumed-tmp0.dat
echo "INCLUDE FILE=plumed-core.dat" >> plumed-tmp0.dat
	
##### POPE
	
for i in {0..1818..2}; do
	
		x=$((i+5))
		first=$(awk -v i=$i 'BEGIN{print 914+12*i}')
		second=$(awk -v i=$i 'BEGIN{print 914+12*i+11}')
		resid=$(awk -v i=$i 'BEGIN{print 445+i}')
		
		echo " " >> plumed-tmp0.dat
		echo "WHOLEMOLECULES ENTITY0=${first}-${second}" >> plumed-tmp0.dat
		echo "C${x}: CENTER ATOMS=${first}-${second}" >> plumed-tmp0.dat
		echo "d1${x}: DISTANCE ATOMS=C1,C$x COMPONENTS" >> plumed-tmp0.dat
		echo "p${x}: POSITION ATOM=C$x NOPBC" >> plumed-tmp0.dat 
		echo "psi${x}: ANGLE ATOMS=C1,C2,C$x" >> plumed-tmp0.dat	
		echo "l${x}: DISTANCE ATOMS=C1,C$x COMPONENTS" >> plumed-tmp0.dat
		
		echo "############" >> plumed-tmp0.dat
		echo "len${x}: MATHEVAL ARG=l${x}.x,l${x}.y VAR=ax,ay FUNC=sqrt(ax*ax+ay*ay) PERIODIC=NO" >> plumed-tmp0.dat
		echo "############" >> plumed-tmp0.dat
		echo "dot${x}: MATHEVAL ARG=d12.x,d12.y,d1${x}.x,d1${x}.y VAR=ax,ay,bx,by FUNC=(ax*bx+ay*by) PERIODIC=NO" >> plumed-tmp0.dat
		echo "############" >> plumed-tmp0.dat
		echo "cross${x}: MATHEVAL ARG=d12.x,d12.y,d1${x}.x,d1${x}.y VAR=ax,ay,bx,by FUNC=sqrt((ax*by-ay*bx)*(ax*by-ay*bx)) PERIODIC=NO" >> plumed-tmp0.dat
		echo "############" >> plumed-tmp0.dat
		echo "dist${x}: MATHEVAL ARG=p1.x,p1.y,p${x}.x,p${x}.y VAR=ax,ay,bx,by FUNC=sqrt((bx-ax)*(bx-ax)+(by-ay)*(by-ay)) PERIODIC=NO" >> plumed-tmp0.dat
		echo "############" >> plumed-tmp0.dat
		echo "PRINT ARG=dot${x},cross${x},dot3,cross3,dot4,cross4,dist${x},psi${x},len${x} FILE=COLVAR${resid}" >> plumed-tmp0.dat
		echo " " >> plumed-tmp0.dat
	
	done

	nohup plumed driver --plumed plumed-tmp0.dat --mf_xtc ../../rep${k}_combine_pbc.xtc &>out0&
	
	echo "RESTART NO" > plumed-tmp0.1.dat
	echo "INCLUDE FILE=plumed-core.dat" >> plumed-tmp0.1.dat
	
	for i in {1..1818..2}; do
	
	        x=$((i+5))
	        first=$(awk -v i=$i 'BEGIN{print 914+12*i}')
	        second=$(awk -v i=$i 'BEGIN{print 914+12*i+11}')
	        resid=$(awk -v i=$i 'BEGIN{print 445+i}')
	
	        echo " " >> plumed-tmp0.1.dat
	        echo "WHOLEMOLECULES ENTITY0=${first}-${second}" >> plumed-tmp0.1.dat
	        echo "C${x}: CENTER ATOMS=${first}-${second}" >> plumed-tmp0.1.dat
	        echo "d1${x}: DISTANCE ATOMS=C1,C$x COMPONENTS" >> plumed-tmp0.1.dat
	        echo "p${x}: POSITION ATOM=C$x NOPBC" >> plumed-tmp0.1.dat
	        echo "psi${x}: ANGLE ATOMS=C1,C2,C$x" >> plumed-tmp0.1.dat
	        echo "l${x}: DISTANCE ATOMS=C1,C$x COMPONENTS" >> plumed-tmp0.1.dat
	
	        echo "############" >> plumed-tmp0.1.dat
	        echo "len${x}: MATHEVAL ARG=l${x}.x,l${x}.y VAR=ax,ay FUNC=sqrt(ax*ax+ay*ay) PERIODIC=NO" >> plumed-tmp0.1.dat
	        echo "############" >> plumed-tmp0.1.dat
	        echo "dot${x}: MATHEVAL ARG=d12.x,d12.y,d1${x}.x,d1${x}.y VAR=ax,ay,bx,by FUNC=(ax*bx+ay*by) PERIODIC=NO" >> plumed-tmp0.1.dat
	        echo "############" >> plumed-tmp0.1.dat
	        echo "cross${x}: MATHEVAL ARG=d12.x,d12.y,d1${x}.x,d1${x}.y VAR=ax,ay,bx,by FUNC=sqrt((ax*by-ay*bx)*(ax*by-ay*bx)) PERIODIC=NO" >> plumed-tmp0.1.dat
	        echo "############" >> plumed-tmp0.1.dat
	        echo "dist${x}: MATHEVAL ARG=p1.x,p1.y,p${x}.x,p${x}.y VAR=ax,ay,bx,by FUNC=sqrt((bx-ax)*(bx-ax)+(by-ay)*(by-ay)) PERIODIC=NO" >> plumed-tmp0.1.dat
	        echo "############" >> plumed-tmp0.1.dat
	        echo "PRINT ARG=dot${x},cross${x},dot3,cross3,dot4,cross4,dist${x},psi${x},len${x} FILE=COLVAR${resid}" >> plumed-tmp0.1.dat
	        echo " " >> plumed-tmp0.1.dat
	
	done
	
	nohup plumed driver --plumed plumed-tmp0.1.dat --mf_xtc ../../rep${k}_combine_pbc.xtc &>out1&
	
	
	#POPG
	
	echo "RESTART NO" > plumed-tmp1.dat
	echo "INCLUDE FILE=plumed-core.dat" >> plumed-tmp1.dat
	
	
	for i in {0..964}; do
	
	        x=$((i+5))
	        first=$(awk -v i=$i 'BEGIN{print 22742+12*i}')
	        second=$(awk -v i=$i 'BEGIN{print 22742+12*i+11}')
	        resid=$(awk -v i=$i 'BEGIN{print 2264+i}')
	
	        echo " " >> plumed-tmp1.dat
	        echo "WHOLEMOLECULES ENTITY0=${first}-${second}" >> plumed-tmp1.dat
	        echo "C${x}: CENTER ATOMS=${first}-${second}" >> plumed-tmp1.dat
	        echo "d1${x}: DISTANCE ATOMS=C1,C$x COMPONENTS" >> plumed-tmp1.dat
	        echo "p${x}: POSITION ATOM=C$x NOPBC" >> plumed-tmp1.dat
	        echo "psi${x}: ANGLE ATOMS=C1,C2,C$x" >> plumed-tmp1.dat
	        echo "l${x}: DISTANCE ATOMS=C1,C$x COMPONENTS" >> plumed-tmp1.dat
	
	        echo "############" >> plumed-tmp1.dat
	        echo "len${x}: MATHEVAL ARG=l${x}.x,l${x}.y VAR=ax,ay FUNC=sqrt(ax*ax+ay*ay) PERIODIC=NO" >> plumed-tmp1.dat
	        echo "############" >> plumed-tmp1.dat
	        echo "dot${x}: MATHEVAL ARG=d12.x,d12.y,d1${x}.x,d1${x}.y VAR=ax,ay,bx,by FUNC=(ax*bx+ay*by) PERIODIC=NO" >> plumed-tmp1.dat
	        echo "############" >> plumed-tmp1.dat
	        echo "cross${x}: MATHEVAL ARG=d12.x,d12.y,d1${x}.x,d1${x}.y VAR=ax,ay,bx,by FUNC=sqrt((ax*by-ay*bx)*(ax*by-ay*bx)) PERIODIC=NO" >> plumed-tmp1.dat
	        echo "############" >> plumed-tmp1.dat
	        echo "dist${x}: MATHEVAL ARG=p1.x,p1.y,p${x}.x,p${x}.y VAR=ax,ay,bx,by FUNC=sqrt((bx-ax)*(bx-ax)+(by-ay)*(by-ay)) PERIODIC=NO" >> plumed-tmp1.dat
	        echo "############" >> plumed-tmp1.dat
	        echo "PRINT ARG=dot${x},cross${x},dot3,cross3,dot4,cross4,dist${x},psi${x},len${x} FILE=COLVAR${resid}" >> plumed-tmp1.dat
	        echo " " >> plumed-tmp1.dat
	
	done
	
	nohup plumed driver --plumed plumed-tmp1.dat --mf_xtc ../../rep${k}_combine_pbc.xtc &>out2&

	cd ../../
done

rm COLVAR/rep*/bck.*
