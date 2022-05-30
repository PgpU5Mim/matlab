clear; close all; clc;
data=csvread('POWER_ON_C6.txt');

pass=data;
k1=find(pass>165);
pass(k1)=[];
k2=find(pass<145);
pass(k2)=[];
hist(pass);
grid on;

