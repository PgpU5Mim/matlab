clear; close all; clc

y = [2.000, 2.200, 2.400, 2.600, 2.800, 3.000, 3.200, 3.400, 3.600, 3.800, 4.000, 4.200, 4.400, 4.600, 4.800];
%x = [1.9691	2.1668	2.3635	2.5632	2.7586	2.9552	3.1510	3.3513	3.5466	3.7446	3.9401	4.1404	4.3365	4.5326	4.7311];
%x = [2.020, 2.220, 2.420, 2.620, 2.820, 3.020, 3.220, 3.420, 3.620, 3.820, 4.020, 4.220, 4.420, 4.620, 4.820];
%x = [1.9555, 2.1514, 2.3472, 2.5444, 2.7401, 2.9349, 3.1286, 3.3291, 3.5225, 3.7189, 3.9127, 4.1119, 4.3072, 4.5030, 4.6989];
x = [1.975466	2.173763	2.371145	2.569809	2.76774	2.965121	3.160672	3.362082	3.557999	3.756663	3.952397	4.153624	4.350639	4.548021	4.746684];
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
%CFRG3B2=dec2hex(CFRG3B2)
%CFRG3B3=dec2hex(CFRG3B3)
CFRG3B2
CFRG3B3