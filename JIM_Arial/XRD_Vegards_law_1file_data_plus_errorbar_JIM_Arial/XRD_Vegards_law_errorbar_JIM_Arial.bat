@echo off
rem gnuplot version 5.2

rem setting gnuplot address (default)
 set gplot="C:\Program Files\gnuplot\bin"
 set int_offset=0
 set int_base=0
 set font=Arial
 rem set font=Times-New-Roman

rem composition
 set compsition=""
 set label1_compsition="Fe_{1.97}V_{1.03+{/%font%:Italic x}}Al_{1-{/%font%:Italic x}}"
 set label2_notation="L2_{1} structure"

rem plot number of column for x and y axis
 set x=1
 set y=2
 set y_errorbar=3

rem line wide and point size
 set line_wide=2
 set point_size=2
rem gnuplot# reccommend 2
rem eps# recommend line_wide=8
rem eps# recommend point_size=3

rem line type
 set line_type_data1=0
rem gnuplot#I recommend 7, 0
rem eps#I recommend -1 to 5

rem setting notation
 set name_data1=""

rem number of marker type
 set marker_data1=7

rem marker type info for gnuplot
rem gnuplot#circle  : 7
rem gnuplot#square  : 5
rem gnuplot#upper triangular: 9
rem gnuplot#lower triangular: 11
rem gnuplot#pentagon: 15
rem gnuplot#diamond : 13
rem gnuplot#cross: 2

rem marker type info for eps
rem eps#close circle  : 31, open circle : 65
rem eps#close square  : 47, open square : 64
rem eps#close upper triangular:9  ,open upper triangular: 66
rem eps#close lower triangular:11 ,open lower triangular: 67
rem eps#close pentagon: 15, open pentagon: 75
rem eps#close diamond : 13, open diamond: 68
rem eps#cross: 2
rem eps#open maker: 64-75

rem number of color type
 set color_data1=red
rem red, dark-goldenrod, dark-green, blue, dark-violet, black, grey
rem grey, black, blue, dark-green, dark-goldenrod, red, dark-violet

copy *.dat1 data.dat1

if not exist env.txt (goto nofile) else (goto file_exsit)

:nofile
rem graph environment 
 echo ########################				> env.txt
 echo #graph setting 					>> env.txt
 echo set size 0.58,0.88				>> env.txt
 echo set key title %compsition%			>> env.txt
 echo set key left bottom				>> env.txt
 echo set label 1 at graph 0.05,0.1 %label1_compsition%	>> env.txt
 echo set label 2 at graph 0.45,0.9 %label2_notation%	>> env.txt
 echo set terminal wxt font "%font%,14"			>> env.txt
 rem echo set mxtics 2					>> env.txt
 echo set xtics 0.01 offset 0.0,0.25			>> env.txt
 echo set xlabel "Composition, {/%font%:Italic x}" offset 0.0,0.70	>> env.txt
 rem echo set xrange[300:750]				>> env.txt
 echo set mytics 2					>> env.txt
 echo set ytics 0.001 offset 0.3,0.0			>> env.txt
 echo set yrange[*:*]					>> env.txt
 echo set ylabel "Lattice Constatnt, {/%font%:Italic a} (nm)" offset 1.5,0.0	>> env.txt

rem #search number of row in file 
rem for /f "delims=:" %%A in ('findstr /n "^" "data.dat1"') do set LINE=%%A-1
rem echo set sample %LINE%					>> env.txt

 echo plot "data.dat1" u %x%:($%y%+%int_base%):%y_errorbar% t %name_data1% w yerrorbars pt %marker_data1% ps %point_size% lc "%color_data1%"  	>> env.txt

 echo ########################	>> env.txt
 echo #another setting and info	>> env.txt
 echo # w=with, lp=linespoints,lt=linetype�Clw=linewidth�Cpt=pointtype�Cps=pointsize	>> env.txt
 echo #				>> env.txt
 echo # offset 1000		>> env.txt
 echo # echo plot "data.dat1" u 1:($2+1000) t "" w l lt 7 lw 2 lc "black" 	>> env.txt
 echo #				>> env.txt
 echo # plot "data.dat1" every 20 using 1:2 smooth csplines t "" w lp lt 7 lw 2 pt 7 ps 2 lc "black" 	>> env.txt

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
