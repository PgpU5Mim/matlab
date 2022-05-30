clear; close all; clc

s = [0.28 0.40 0.60];
v = [10   60   100];

p = polyfit(s, v, 2);

s1 = 0.28:0.01:0.6;
v1 = p(1)*s1.^2 + p(2)*s1 + p(3);

plot(s, v, 'r', s1, v1, 'b');
grid on
