count=0

for k in {0..9}; do
for file in COLVAR/rep${k}/COLVAR*; do 

	let count=$count+1
	echo "#"${file:18:24}

	awk 'function Atan2(a,b){

		if(a==0.0 && b==0.0)return(0.0)
		return(atan2(a,b))

	}
	BEGIN{
		c=0
		on=0
	}
	$1~/[0-9]/{
		
		if(Atan2($3,$2) <= Atan2($5,$4) && Atan2($3,$2) <= Atan2($7,$6) && $8 <=4.5 && $10<=$8){
			if(on==0) c++
			a[c]+=200
			on=1

		}else{
			on=0
		}
	}END{

		if(c>0) for(i=1;i<c;i++) print a[i]

	}' $file

done > residence_${k}.dat
done
