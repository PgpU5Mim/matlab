clear; close all; clc

y = [2.000  2.500   3.000   3.500   4.000   4.500];
x = [2.000	2.506	3.007	3.510	4.012	4.515];
p = polyfit(x, y, 1);
a = x .* p(1) + p(2);
b = y - a;

plot(y, b)
grid on

gain=183.105;
lsb = gain * p(1);
offset = p(2)*1000;

CFRG3B2 = round((lsb - gain) / 0.045);
CFRG3B3 = round(offset / 1.46485);

if (CFRG3B2 < 0)
    CFRG3B2 = 128 + abs(CFRG3B2);
end
if (CFRG3B3 < 0)
    CFRG3B3 = 256 + CFRG3B3;
end
CFRG3B2=dec2hex(CFRG3B2)
CFRG3B3=dec2hex(CFRG3B3)