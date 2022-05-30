clear; close all; clc;

vin = 0:1:5;
vadc = [1.4219e-3 0.99832 1.9962 2.9939 3.9916 4.9890];

vado = vadc - vadc(1);

p = polyfit(vado, vin, 1);

vout = p(1)*vado + p(2);

vdelta = vout-vin;

plot(vin, vdelta);
grid on