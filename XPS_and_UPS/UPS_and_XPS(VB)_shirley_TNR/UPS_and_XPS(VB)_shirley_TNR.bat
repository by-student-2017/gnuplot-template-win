@echo off
rem gnuplot version 5.2

rem setting gnuplot address (default)
 set gplot="C:\Program Files\gnuplot\bin"
 rem set font=Arial
 set font=Times-New-Roman

rem use wilde card
 copy *.dat1 data.dat1

if not exist env.txt (goto nofile) else (goto file_exsit)

:nofile
rem graph environment 
 echo ########################				> env.txt
 echo #graph setting 					>> env.txt
 echo set size 0.70,1.0					>> env.txt
 echo set terminal wxt font "%font%,14"			>> env.txt
 echo set mxtics 2					>> env.txt
 echo set xtics 1 offset 0.0,0.25			>> env.txt
 echo set xlabel "Binding Energy / eV" offset 0.0,0.70	>> env.txt
 echo set xrange[*:*] reverse				>> env.txt
 echo set mytics 2					>> env.txt
 echo set ytics 50 offset 0.3,0.0			>> env.txt
 echo set ylabel "Intensity / arb. units" offset 1.5,0.0	>> env.txt
 echo plot "data.dat1" u 1:2 t "" w lp lt 7 lw 2 pt 7 ps 2 lc "black", ^
  "data.dat1" u 1:3 t "" w lp lt 2 lw 7 pt -1 ps 2 lc "gray",^
  "data.dat1" u 1:($2-$3) t "" w lp lt 7 lw 7 pt -1 ps 2 lc "black"	>> env.txt

 echo ########################	>> env.txt
 echo #another setting and info	>> env.txt
 echo # w=with, lp=linespoints,lt=linetypeClw=linewidthCpt=pointtypeCps=pointsize	>> env.txt
 echo # plot "data.dat1" every 2 using 1:2 smooth csplines t "" w lp lt 7 lw 2 pt 7 ps 2 lc "black" 	>> env.txt

rem output (png)
rem echo ########################	>> env.txt
rem echo #png setting 		>> env.txt
rem echo set terminal pngcairo enhanced  		>> env.txt
rem echo set output "kappa_vs_com_1f_JIM_Arial.png"	>> env.txt
rem echo replot			>> env.txt
rem echo set output		>> env.txt
rem echo set terminal wxt		>> env.txt

rem output (EPS)
rem echo ########################	>> env.txt
rem echo #EPS setting 		>> env.txt
rem echo set size 0.7,1.0		>> env.txt
rem echo set terminal postscript eps color enhanced font "%font%" 22	>> env.txt
rem echo set output "kappa_vs_com_1f_JIM_Arial.eps"	>> env.txt
rem echo replot			>> env.txt
rem echo set output		>> env.txt
rem echo set terminal wxt		>> env.txt

rem aip latex template
 echo ########################	>> env.txt
 echo #AIP latex setting	>> env.txt
 echo # latex template: aipsamp.tex	>> env.txt
 echo # \includegraphics[width=17cm, bb=0 5 520 185]{graph.eps}% Here is how to import EPS art	>> env.txt

:file_exsit

rem plot
 %gplot%\wgnuplot.exe -persist "env.txt"

rem delet
 del data.dat1
 del env.txt
