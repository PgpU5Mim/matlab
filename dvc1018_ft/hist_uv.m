clear; close all; clc;
data=readmatrix('DIE3_C5V_4P0.txt');

CellVoltage = 4.0;
CellDelta   = 0.003;
UpLimit = CellVoltage + CellDelta;
DownLimit = CellVoltage - CellDelta;

pass=data;
k1=find(pass>UpLimit);
high=pass(k1);
pass(k1)=[];
k2=find(pass<DownLimit);
low=pass(k2);
pass(k2)=[];

% k3=find(vc5<=4.2);
% vc5_mean=mean(vc5);
% vc5_std=std(vc5);
% 
% vc5_min=vc5_mean-min(vc5);
% vc5_max=max(vc5)-vc5_mean;

pd = fitdist(pass,'Normal');
x_values = min(pass):0.001:max(pass);
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
title('DVC1018-H6M444-DIE3-C5V');

