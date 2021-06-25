// 计算CADC校准值matlab示例程序 
clear; close all; clc

y = [-76.2, -50.8, -25.5, 25.5, 50.8, 76.1]; // CADC输入电压值
x = [-78.5, -53.0, -27.7, 23.4, 48.8, 74.2]; // CADC测量电压值
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

CADC_LSB = round((lsb - gain) / 0.045);
CADC_OFST = round(offset / 1.46485);

if (CADC_LSB < 0)
    CADC_LSB = 128 + abs(CADC_LSB);
end
if (CADC_OFST < 0)
    CADC_OFST = 256 + CADC_OFST;
end