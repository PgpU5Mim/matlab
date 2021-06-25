// 计算VADC校准值matlab示例程序
clear; close all; clc

y = [2.000  2.500   3.000   3.500   4.000   4.500]; // ADC输入电压值
x = [2.000	2.506	3.007	3.510	4.012	4.515]; // ADC测量电压值
p = polyfit(x, y, 1);
a = x .* p(1) + p(2);
b = y - a;

plot(y, b)
grid on

gain=183.105;
lsb = gain * p(1);
offset = p(2)*1000;

VADC_LSB = round((lsb - gain) / 0.045);
VADC_OFST = round(offset / 1.46485);

if (VADC_LSB < 0)
    VADC_LSB = 128 + abs(VADC_LSB);
end
if (VADC_OFST < 0)
    VADC_OFST = 256 + VADC_OFST;
end
