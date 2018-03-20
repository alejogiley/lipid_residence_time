#!/bin/bash

set term context size 6,2 standalone color font ",6"
set output 'residence.tex'

set style fill transparent solid 0.25 noborder
set style function filledcurves y1=0

set logscale y
set mytics 10
set ytics scale 0.5

set xtics 0,200,1000 scale 0.5
set x2tics 100,200,900 scale 0.5 mirror

set multiplot

set lmargin at screen 0.1; set rmargin at screen 0.7

set key samplen 0.2 
set key horizontal

plot[0:][0.1:10000] "<cat ../../../100_0_protein/restrained/plumed/residence_*.dat | awk 'BEGIN{n=200;max=1000000;min=100;width=(max-min)/n;for(i=0;i<=n;i++)a[i]=0.1}{c=int($1/width+0.5);a[c]++;}END{for(i=0;i<=n;i++) print width*(i),a[i]}'" u ($1/1000):2 smooth freq w boxes lc rgb "gray" notitle, "" u ($1/1000):2 smooth freq w histeps lw 0.5 lc rgb "black" title '$\bf{100}$',\
"<cat ../../../90_10_protein/restrained/plumed/residence_*.dat | awk 'BEGIN{n=200;max=1000000;min=100;width=(max-min)/n;for(i=0;i<=n;i++)a[i]=0.1}{c=int($1/width+0.5);a[c]++;}END{for(i=0;i<=n;i++) print width*(i),a[i]}'" u ($1/1000):2 smooth freq w boxes lc rgb "pink" notitle, "" u ($1/1000):2 smooth freq w histeps lw 0.5 lc rgb "red" title '$\bf{90}$',\
"<cat ../../../70_30_protein/restrained/plumed/residence_*.dat | awk 'BEGIN{n=200;max=1000000;min=100;width=(max-min)/n;for(i=0;i<=n;i++)a[i]=0.1}{c=int($1/width+0.5);a[c]++;}END{for(i=0;i<=n;i++) print width*(i),a[i]}'" u ($1/1000):2 smooth freq w boxes lc rgb "cyan" notitle, "" u ($1/1000):2 smooth freq w histeps lw 0.5 lc rgb "blue" title '$\bf{70}$',\
"<cat ../../../50_50_protein/restrained/plumed/residence_*.dat | awk 'BEGIN{n=200;max=1000000;min=100;width=(max-min)/n;for(i=0;i<=n;i++)a[i]=0.1}{c=int($1/width+0.5);a[c]++;}END{for(i=0;i<=n;i++) print width*(i),a[i]}'" u ($1/1000):2 smooth freq w boxes lc rgb "green" notitle, "" u ($1/1000):2 smooth freq w histeps lw 0.5 lc rgb "green" title '$\bf{50}$'

set xtics 2,2,4 mirror scale 0.5
set x2tics 1,2,4 mirror scale 0.5

unset logscale y
set mytics 2
unset ytics
set y2tics 0,1,2 mirror scale 0.5

set lmargin at screen 0.72; set rmargin at screen 0.92

plot[0:5][0:2.5] "<cat ../../../100_0_protein/restrained/plumed/residence_*.dat | awk 'BEGIN{c=1;for(i=0;i<11;i++)count[i]=0.0}{if($1>=500000){count[c]++};if($1~/#1000/){c++}}END{for(i=1;i<11;i++){a+=count[i];b+=(count[i])*(count[i])}; print 1,a/10,sqrt(b/10-(a/10)*(a/10))}'" u 1:2:3 w yerrorbars lc rgb "black" lw 0.7 pt 1 ps 0.7 notitle, "" u 1:2:(0.7) w boxes lw 0.5 lc rgb "black" notitle,\
"<cat ../../../90_10_protein/restrained/plumed/residence_*.dat | awk 'BEGIN{c=1;for(i=0;i<11;i++)count[i]=0.0}{if($1>=500000){count[c]++};if($1~/#1000/){c++}}END{for(i=1;i<11;i++){a+=count[i];b+=(count[i])*(count[i])}; print 2,a/10,sqrt(b/10-(a/10)*(a/10))}'" u 1:2:3 w yerrorbars lc rgb "red" lw 0.7 pt 1 ps 0.7 notitle, "" u 1:2:(0.7) w boxes lw 0.5 lc rgb "red" notitle,\
"<cat ../../../70_30_protein/restrained/plumed/residence_*.dat | awk 'BEGIN{c=1;for(i=0;i<11;i++)count[i]=0.0}{if($1>=500000){count[c]++};if($1~/#1000/){c++}}END{for(i=1;i<11;i++){a+=count[i];b+=(count[i])*(count[i])}; print 3,a/10,sqrt(b/10-(a/10)*(a/10))}'" u 1:2:3 w yerrorbars lc rgb "blue" lw 0.7 pt 1 ps 0.7 notitle, "" u 1:2:(0.7) w boxes lw 0.5 lc rgb "blue" notitle,\
"<cat ../../../50_50_protein/restrained/plumed/residence_*.dat | awk 'BEGIN{c=1;for(i=0;i<11;i++)count[i]=0.0}{if($1>=500000){count[c]++};if($1~/#1000/){c++}}END{for(i=1;i<11;i++){a+=count[i];b+=(count[i])*(count[i])}; print 4,a/10,sqrt(b/10-(a/10)*(a/10))}'" u 1:2:3 w yerrorbars lc rgb "green" lw 0.7 pt 1 ps 0.7 notitle, "" u 1:2:(0.7) w boxes lw 0.5 lc rgb "green" notitle

