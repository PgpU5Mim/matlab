clear; close all; clc;
lsb=183.1e-6;
data=csvread('vbg.txt');
%voltage=data*lsb;
%k0=find(voltage==0);
%voltage(k0)=[];
%hist(voltage);
hist(data);
grid on;