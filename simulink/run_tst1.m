%% Clear 
clear; close all; clc;
addpath('C:\Users\eric\Documents\GitHub\matlab\delsig');
%% Set Parameters
fs = 256e3;
amp = 0.01;

osr1 = 2^16;

osr = 256;
fin = fs*7/128/osr;
M     = 1;
sdm_order=2;
cic_order=sdm_order+1;
samples = (2^17)/osr;
den = 2^(cic_order*log(osr)/log(2));
StopTime=samples*osr/fs;



%% create a second-order NTF
% order = 2;
% osr   = 500;
% M     = 1;
ntf = synthesizeNTF(sdm_order, osr);
% [sqnr, amp] = simulateSNR(ntf, osr, [], [], M+1);

% plot(amp, sqnr, '-o', 'Linewidth', 1);
% grid on

%% realizeNTF

form = 'CIFB';
swing = 2/3;
% umax = 0.9*M;
[a, g, b, c] = realizeNTF(ntf, form);
b(2:end)=0;

ABCD = stuffABCD(a,g,b,c,form);
[ABCD,umax] = scaleABCD(ABCD,M+1,[],swing,[], (1*M));
[a,g,b,c] = mapABCD(ABCD,form);

a1 = a(1);
a2 = a(2);
b1 = b(1);
c1 = c(1);

% uc1 = 39.3e-15;
uc2 = 32.9e-15;
uc1 = uc2;

cb1 = 6*uc1;
ca1 = cb1;


ca2 = 2*uc2;
cf1 = cb1 / b1;
cf2 = ca2 / a2;

cc1 = cf2 * c1;

ucf1 = cf1 / uc1;
ucf2 = cf2 / uc2;
ucc1 = cc1 / uc2;

%% Run Simulink
% sim('tst1', StopTime);