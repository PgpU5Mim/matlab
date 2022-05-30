clear; close all; clc;
pass=readmatrix('H6M444-01-IC6.txt');
data=pass;
% data=readmatrix('Q6V651-01-IC6.txt');

% data=csvread('OV_C5_H33V49_12.txt');

DownLimit = 140;
UpLimint  = 180;

k1 = find(pass<DownLimit);
pass(k1)=[];
k2 = find(pass>UpLimint);
pass(k2)=[];

pd = fitdist(pass,'Normal');
x_values = min(pass):1:max(pass);
y_values = pdf(pd, x_values);
h = histogram(pass,'Normalization','pdf');
hold on
plot(x_values, y_values, 'LineWidth',2);
txt = {['mu=' num2str(pd.mu)],['sigma=' num2str(pd.sigma)],['max=' num2str(max(x_values))],['min=' num2str(min(x_values))]};
x_coord = max(x_values)-(max(x_values)-min(x_values))/4;
y_coord = max(y_values)-(max(y_values)+min(y_values))/4;
text(x_coord,y_coord,txt);
hold off
grid on;
% title('OV C5 H33V49-12');
title('Q6V444-01-IC6');
% title('Q6V651-01-IC6');

