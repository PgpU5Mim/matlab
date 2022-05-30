clear; close all; clc;
data=csvread('OV_C5_Q6V651_08.txt');
% data=csvread('OV_C5_H33V49_12.txt');
lsb = 183.1e-6;
vc5 = data * lsb;
pass=data;
k1=find(pass>300);
pass(k1)=[];
k2=find(pass<32);
low=pass(k2);
pass(k2)=[];

k3=find(vc5<=4.2);
vc5_mean=mean(vc5);
vc5_std=std(vc5);

vc5_min=vc5_mean-min(vc5);
vc5_max=max(vc5)-vc5_mean;

hist(vc5);
grid on;
% title('OV C5 H33V49-12');
title('OV C5 Q6V651-08');

