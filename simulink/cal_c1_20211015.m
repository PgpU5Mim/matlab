%% Clear 
clear; close all; clc;
addpath('C:\Users\eric\Documents\GitHub\matlab\delsig');

%% Parameters
osr = 2^16;
ENOB = 19;
SNR = 6.02*ENOB+1.76;
FullScale = 2.4;
DR = SNR+3;
k = 1.38e-23;
T = 300;
kT = k*T;
v_n2 = (FullScale/2)^2/2./undbp(DR);
C1 = kT./(osr*v_n2)/1e-15;