clear; close all; clc;
data=csvread('power_on_c6.txt');
%voltage=data*lsb;
%k0=find(voltage==0);
%voltage(k0)=[];
%hist(voltage);
hist(data);
grid on;

d1=data;
k1=find(d1>165);
d1(k1)=[];
k2=find(d1<145);
d1(k2)=[];
hist(d1);
grid on;