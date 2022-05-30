clear; close all; clc;
data=csvread('OS_C6_GND.txt');

k=find(data>0);
pass=data;
pass(k)=[];
fail=data(k);
hist(fail);
grid on;