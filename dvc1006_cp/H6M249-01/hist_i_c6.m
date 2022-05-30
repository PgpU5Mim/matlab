clear; close all; clc;
data=csvread('I_Sleep.txt');

pass=data;
k1=find(pass>15);
pass(k1)=[];
k2=find(pass>12);
pass(k2)=[];
hist(data);
grid on;
