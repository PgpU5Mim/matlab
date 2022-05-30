clear; clc; close all;
data=csvread('Ivreg.txt');

pass=data;
k1=find(pass>100);
pass(k1)=[];
k2=find(pass<25);
pass(k2)=[];
hist(pass);
grid on;