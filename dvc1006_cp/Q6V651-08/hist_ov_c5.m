clear; close all; clc;
data=csvread('TMU_OV.txt');

pass=data;
k1=find(pass>300);
pass(k1)=[];
k2=find(pass<32);
low=pass(k2);
pass(k2)=[];
hist(data);
grid on;

