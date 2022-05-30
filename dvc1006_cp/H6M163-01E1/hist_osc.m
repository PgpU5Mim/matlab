clear; close all; clc;
data=csvread('trim_osc.txt');
osc=data;
k = find(osc<200);
osc(k) = [];
hist(osc);
grid on;