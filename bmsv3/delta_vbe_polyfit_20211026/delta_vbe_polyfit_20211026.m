%% Clear
clear; close all; clc;

%% delta vbe
temp = -40:10:150;
delta_vbe = [94.47e-3, 98.54e-3, 102.6e-3, 106.7e-3, 110.8e-3, 114.8e-3, 118.9e-3, 123.0e-3, 127.1e-3, 131.2e-3, 135.3e-3, 139.4e-3, 143.5e-3, 147.6e-3, 151.7e-3, 155.7e-3, 159.8e-3, 163.9e-3, 168.0e-3, 172.1e-3];
% plot(temp, delta_vbe);
% grid on;
p = polyfit(delta_vbe, temp, 1);

temp1 = delta_vbe*2446.7-271.03