%% Clear
clear; close all; clc;

%% Import data
ntc_data = readmatrix('ntc_mf52_10k.csv');
ntc_degC = ntc_data(:,1); % °C
ntc_kelvin = ntc_degC + 273.15; % Kelvin
ntc_res  = ntc_data(:,2);   % KΩ

%% Calculate coeff
index(1) = find(ntc_degC == -55);
index(2) = find(ntc_degC == 35);
index(3) = find(ntc_degC == 125);

L = log(ntc_res(index));
Y = 1 ./ ntc_kelvin(index);

r2 = (Y(2)-Y(1)) / (L(2)-L(1));
r3 = (Y(3)-Y(1)) / (L(3)-L(1));

C = ((r3-r2)/(L(3)-L(2))) / (L(1)+L(2)+L(3));
B = r2 - C*(L(1)^2 + L(1)*L(2) + L(2)^2);
A = Y(1) - L(1)*(B + C*L(1)^2);

%% Curve Filtting
% temp = 1 ./ (A + B*log(ntc_res) + C*log(ntc_res).^3) - 273.15;
% delta = ntc_degC - temp;
% plot(ntc_res, delta);
% grid on

x = (A - 1./ntc_kelvin)/C;
y = sqrt((B/3/C)^3 + (x./2).^2);
m = nthroot((y-x./2),3);
n = nthroot((y+x./2),3);
res = exp(nthroot((y-x./2),3)-nthroot((y+x./2),3));
delta = ntc_res - res;
subplot(3,1,1)
plot(ntc_degC, delta);
xlabel('temperature[°C]')
ylabel('delta res[KΩ]')
grid on

%% polyfit
vref = 1.8; % V, pull up voltgage
rpu  = 10; % KΩ, pull up resistor
vts = (ntc_res ./ (rpu+ntc_res)) * vref;
subplot(3,1,2)
plot(ntc_degC, vts)
xlabel('temperature[°C]')
ylabel('vts[V]')
grid on

vratio = vts ./ vref;
p = polyfit(vratio, ntc_degC,5);
p = flip(p);
temp = ...
p(1) + ...
p(2)*vratio + ...
p(3)*vratio.^2 + ...
p(4)*vratio.^3 + ...
p(5)*vratio.^4 + ...
p(6)*vratio.^5;
% p(7)*vratio.^6 + ...
% p(8)*vratio.^7 + ...
% p(9)*vratio.^8 + ...
% p(10)*vratio.^9;

temp_delta = ntc_degC-temp;
subplot(3,1,3)
plot(ntc_degC, temp_delta);
xlabel('temperature[°C]')
ylabel('delta temp[°C]')
grid on

p(1)
p(2)
p(3)
p(4)
p(5)
p(6)
% p(7)
% p(8)
% p(9)
% p(10)

