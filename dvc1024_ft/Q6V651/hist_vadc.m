clear; close all; clc;
% data=readmatrix('DIE2_C5.txt');
data=readmatrix('DIE4_C2.txt');
% data=csvread('OV_C5_H33V49_12.txt');

input = 2.5;
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

pd = fitdist(data,'Normal');
x_values = min(data):1e-6:max(data);
y_values = pdf(pd, x_values);
h = histogram(data,'Normalization','pdf');
hold on
plot(x_values, y_values, 'LineWidth',2);
txt = {['mu=' num2str(pd.mu)],['sigma=' num2str(pd.sigma)],['max=' num2str(max(x_values))],['min=' num2str(min(x_values))]};
x_coord = max(x_values)-(max(x_values)-min(x_values))/4;
y_coord = max(y_values)-(max(y_values)+min(y_values))/4;
text(x_coord,y_coord,txt);
hold off
grid on;
% title('OV C5 H33V49-12');
title('UV C5 Q6V651-17');

