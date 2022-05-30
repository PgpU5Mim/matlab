clear; clc; close all;

vref_nom = 3.3;
r1_nom = 10e3;
r2 = 10e3;

vref_mc = 3:0.1:3.3;
r1_mc = r1_nom*0.99;
vts_mc = vref_mc*r2/(r1_mc+r2);
r1_trim = (vref_mc./vts_mc -1)*r2