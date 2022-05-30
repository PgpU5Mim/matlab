clear; close all; clc;
% data=readmatrix('DIE2_C5.txt');
data=readmatrix('Q6V732-C1.txt');
% data=csvread('OV_C5_H33V49_12.txt');

input = 2;
delta = 0.003;
UpLimit = input+delta;
DownLimit = input-delta;

pass=data;
k1=find(pass>UpLimit);
high=pass(k1);
pass(k1)=[];
k2=find(pass<DownLimit);
low=pass(k2);
pass(k2)=[];
yield = length(pass)/length(data);

data_pd = pass;

pd = fitdist(data_pd,'Normal');
x_values = min(data_pd):1e-6:max(data_pd);
y_values = pdf(pd, x_values);
h = histogram(data_pd,'Normalization','pdf');
hold on
plot(x_values, y_values, 'LineWidth',2);
txt = {['mu=' num2str(pd.mu) 'V'],['sigma=' num2str(pd.sigma*1e3) 'mV'],['max=' num2str(max(x_values)) 'V'],['min=' num2str(min(x_values)) 'V'],['delta=' num2str(delta*1000) 'mV'],['yield=' num2str(yield*100) '%']};
x_coord = max(x_values)-(max(x_values)-min(x_values))/4;
% y_coord = max(y_values)-(max(y_values)+min(y_values))/2;
y_coord = 1000;
text(x_coord,y_coord,txt);
hold off
grid on;
% title('OV C5 H33V49-12');
title('Q6V732-C1');

