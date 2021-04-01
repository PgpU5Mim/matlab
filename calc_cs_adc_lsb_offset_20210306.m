clear; close all; clc

y = [-76.2	-50.8	-25.5		25.5	50.8	76.1];
x = [-78.5	-53.0	-27.7	23.4	48.8	74.2];
x = x .* 0.02;
y = y .* 0.02;

p = polyfit(x, y, 1);
a = x .* p(1) + p(2);
b = y - a;

plot(y, b);
grid on

gain=183.105;
lsb = gain * p(1);
offset = p(2)*1000;

CFRG3B4 = round((lsb - gain) / 0.045);
CFRG3B5 = round(offset / 1.46485);

if (CFRG3B4 < 0)
    CFRG3B4 = 128 + abs(CFRG3B4);
end
if (CFRG3B5 < 0)
    CFRG3B5 = 256 + CFRG3B5;
end
CFRG3B4=dec2hex(CFRG3B4)
CFRG3B5=dec2hex(CFRG3B5)