%% Clear 
clear; close all; clc;
addpath('C:\Users\eric\Documents\GitHub\matlab\delsig');
%% Set Parameters
fs = 256e3;             % over-sampling clock frequency
% amp = 0.9;
osr = 2^8;              % over-sampling rate
fin = fs*7/128/osr;     % ideal input frequency
M     = 1;              % quantization order
vos   = 10e-3;           % quantization offset
sdm_order=2;            % sdm adc order

cic_order=sdm_order+1;  % cic filter order
samples = 2^2;
den = 2^(cic_order*log(osr)/log(2));
StopTime=samples*osr/fs;

%% cic decimation filter bit width
width_int1 = cic_order*log(osr)/log(2)+(M+1)-1;
width_int2 = width_int1;
width_int3 = width_int1;
width_comb1 = width_int1;
width_comb2 = width_int1;
width_comb3 = width_int1;

%% create a second-order NTF
% order = 2;
% osr   = 500;
% M     = 1;
ntf = synthesizeNTF(sdm_order, osr);
% [sqnr, amp] = simulateSNR(ntf, osr, [], [], M+1);

% plot(amp, sqnr, '-o', 'Linewidth', 1);
% grid on

%% realizeNTF
vref = 2.445;   % reference voltage
vcm  = vref;    % common mode feedback voltage
vdd  = 4.8;     % supply voltage(min)
vds  = 1.0;     % cascode op vds headroom

form = 'CIFB';
swing = (vdd-vds-vcm)/(vref/2);
% swing = 0.9;
% umax = 0.9*M;
[a, g, b, c] = realizeNTF(ntf, form);
b(2:end)=0;

ABCD = stuffABCD(a,g,b,c,form);
[ABCD,umax] = scaleABCD(ABCD,M+1,[],swing,[], (1*M));
[a,g,b,c] = mapABCD(ABCD,form);

amp = umax;

a1 = a(1);
a2 = a(2);
b1 = b(1);
c1 = c(1);


uc2 = 32.9e-15;
% uc1 = 39.3e-15;
uc1 = uc2;
ucb1 = 8;
uca2 = 2;

cb1 = ucb1*uc1;
ca1 = cb1;

ca2 = uca2*uc2;

cf1 = cb1 / b1;
cf2 = ca2 / a2;

cc1 = cf2 * c1;

ucf1 = cf1 / uc2;
ucf2 = cf2 / uc2;
ucc1 = cc1 / uc2;
% ucf1 = ceil(cf1 / uc2);
% ucf2 = ceil(cf2 / uc2);
% ucc1 = ceil(cc1 / uc2);

%% Run Simulink
target_enob = 16;
tolerance = 1/(2^(target_enob));
% tolerance = 0;

sim('limited_bit_width_sum', StopTime);
while 1    
    dout_delta = abs(dout_real.Data(samples+1)-dout_ideal.Data(samples+1));
    if (dout_delta > tolerance)
        width_int1 = width_int1 + 1;
        break;
    else
        width_int1 = width_int1 - 1;
    end
    sim('limited_bit_width_sum', StopTime);
end
sim('limited_bit_width_sum', StopTime);
while 1    
    dout_delta = abs(dout_real.Data(samples+1)-dout_ideal.Data(samples+1));
    if (dout_delta > tolerance)
        width_int2 = width_int2 + 1;
        break;
    else
        width_int2 = width_int2 - 1;
    end
    sim('limited_bit_width_sum', StopTime);
end
sim('limited_bit_width_sum', StopTime);
while 1    
    dout_delta = abs(dout_real.Data(samples+1)-dout_ideal.Data(samples+1));
    if (dout_delta > tolerance)
        width_int3 = width_int3 + 1;
        break;
    else
        width_int3 = width_int3 - 1;
    end
    sim('limited_bit_width_sum', StopTime);
end
sim('limited_bit_width_sum', StopTime);
while 1    
    dout_delta = abs(dout_real.Data(samples+1)-dout_ideal.Data(samples+1));
    if (dout_delta > tolerance)
        width_comb1 = width_comb1 + 1;
        break;
    else
        width_comb1 = width_comb1 - 1;
    end
    sim('limited_bit_width_sum', StopTime);
end
sim('limited_bit_width_sum', StopTime);
while 1    
    dout_delta = abs(dout_real.Data(samples+1)-dout_ideal.Data(samples+1));
    if (dout_delta > tolerance)
        width_comb2 = width_comb2 + 1;
        break;
    else
        width_comb2 = width_comb2 - 1;
    end
    sim('limited_bit_width_sum', StopTime);
end
sim('limited_bit_width_sum', StopTime);
while 1   
    dout_delta = abs(dout_real.Data(samples+1)-dout_ideal.Data(samples+1));
    if (dout_delta > tolerance)
        width_comb3 = width_comb3 + 1;
        break;
    else
        width_comb3 = width_comb3 - 1;
    end
    sim('limited_bit_width_sum', StopTime);    
end
sim('limited_bit_width_sum', StopTime);    