%% clear
clear; close all; clc;

%% read data
csv_file_name = 'OS-CN.txt';
dcsv=readmatrix(csv_file_name);
[chip_num, cnum] = size(dcsv);

%% total yield calculation

%% yield per channel
for j=1:1:cnum
    channel = dcsv(:,j);
    k1 = find(channel>-0.25);
    channel(k1)=[];
    k2 = find(channel<-0.85);
    channel(k2)=[];
    yield = (1-(length(k1)+length(k2))/chip_num)*100;
    pd = fitdist(channel,'Normal');
    x_values = min(channel):1e-3:max(channel);
    y_values = pdf(pd, x_values);
    subplot(1, cnum, j);
    h = histogram(channel,'Normalization','pdf');
    txt = {['mu=' num2str(pd.mu) 'V'],['sigma=' num2str(pd.sigma*1e3) 'mV'],['max=' num2str(max(x_values)) 'V'],['min=' num2str(min(x_values)) 'V'],['yield=' num2str(yield) '%']};
    x_coord = max(x_values)-(max(x_values)-min(x_values))/4;
    y_coord = max(y_values)-(max(y_values)+min(y_values))/2;
%     y_coord = 500;
    text(x_coord,y_coord,txt);
    grid on;
    % title('OV C5 H33V49-12');
    title_name = ['C', num2str(j)];
    title(title_name);
end