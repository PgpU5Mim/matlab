%% clear
clear; close all; clc;

%% create a second-order NTF
order = 2;
osr   = 256;
M     = 1;
ntf = synthesizeNTF(order, osr);
[sqnr, amp] = simulateSNR(ntf, osr, [], [], M+1);
plot(amp, sqnr, '-o', 'Linewidth', 1);
grid on

%% realizeNTF
form = 'CIFB';
swing = 2;




umax = 0.9*M;
[a, g, b, c] = realizeNTF(ntf, form);
b(2:end)=0;
ABCD = stuffABCD(a,g,b,c,form);
ABCD = scaleABCD(ABCD,M+1,[],swing,[],umax);

[a,g,b,c] = mapABCD(ABCD,form);

%% Compute capacitor sizes
Vdd = 1.8;
Vref = Vdd;
FullScale = Vdd;

DR = 90 + 3; % Dynamic range in dB, plus 3-dB margin
k = 1.38e-23; T = 300; kT = k*T;
% First stage values based on kT/C noise
v_n2 = (FullScale/2)^2/2 / undbp(DR); % = kT / (osr*C1)
Cb1 = kT / (osr*v_n2);
Cf1 = Cb1/b(1)*FullScale/M;
% Second-stage values based on C4 = 10f
Ca2 = 10e-15;
Cf2 = Ca2 * Vref / a(2);
Cc1 = Cf2 * c(1);