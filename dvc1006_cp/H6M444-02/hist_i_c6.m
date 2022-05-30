clear; close all; clc;
data=csvread('OCC.txt');

pass=data;
k1=find(pass<-8766);
pass(k1)=[];
k2=find(pass>-7946);
pass(k2)=[];
hist(data);
grid on;
