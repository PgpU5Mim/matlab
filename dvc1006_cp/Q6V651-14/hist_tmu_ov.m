clear; close all; clc;
data=csvread('UV_DET_STRG2_C5V.txt');
% data=csvread('OV_C5_H33V49_12.txt');
lsb = 183.1e-6;
vc5 = data * lsb;

UpLimit = 13508;
DownLimit = 12714;

pass=data;
k1=find(pass>UpLimit);
pass(k1)=[];
k2=find(pass<DownLimit);
low=pass(k2);
pass(k2)=[];

k3=find(vc5<=4.2);
vc5_mean=mean(vc5);
vc5_std=std(vc5);

vc5_min=vc5_mean-min(vc5);
vc5_max=max(vc5)-vc5_mean;

hist(data);
grid on;
% title('OV C5 H33V49-12');
title('OV C5 Q6V651-08');

