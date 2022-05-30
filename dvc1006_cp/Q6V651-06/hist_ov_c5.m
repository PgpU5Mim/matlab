clear; close all; clc;
data=csvread('OCD_DET_CSV.txt');
% data=csvread('111.txt');

UpLimit   = 8438;
DownLimit = 7701;
spec_mean=(UpLimit+DownLimit)/2;

pass=data;
k1=find(pass>UpLimit);
pass(k1)=[];
k2=find(pass<DownLimit);
low=pass(k2);
pass(k2)=[];
hist(data);
grid on

data_mean=mean(data);
data_std=std(data);

