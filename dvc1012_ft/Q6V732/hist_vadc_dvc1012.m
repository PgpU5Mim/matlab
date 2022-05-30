%% clear
clear; close all; clc;

%% set name
chip_id = 'DVC1012';
lot_id  = 'Q6V732';
chip_lot_id   = [chip_id, '-', lot_id];
csv_file_name = [chip_lot_id, '.txt'];
die_num = 2;
channel_num = die_num * 6;

%% read data
dcsv=readmatrix(csv_file_name);
[chip_num, cnum] = size(dcsv);
data = zeros(chip_num, channel_num);
group_i = 0;
cell_i  = 1;
die_i  = 1;
for col_i=1:cnum
    if (col_i == die_num * 3 + 1)
        continue;
    end
    data_i = (die_i-1)*6 + cell_i;
    data(:, data_i) = dcsv(:, col_i);
    if (group_i == 0)
        if (cell_i == 3)
            if (die_i == die_num)
                die_i   = 1;
                group_i = 1;
                cell_i  = 4;
            else
                die_i  = die_i + 1;
                cell_i = 1; 
            end
        else
            cell_i = cell_i + 1;
        end
    elseif (cell_i == 5)
        if (die_i == die_num)
            break;
        else
            die_i  = die_i + 1;
            cell_i = 4;
        end
    else
        cell_i = cell_i + 1;
    end        
end

%% set parameter
vin_avg = [2.0, 2.5, 3.0, 3.5, 4.0, 0];
yield_delta = 0.0035; % V
vin_max = vin_avg + yield_delta;
vin_min = vin_avg - yield_delta;

%% total yield calculation
total_pass = 0;
for i=1:1:chip_num
    k = 1;
    for j=1:1:channel_num
        cell_i = mod(j,6);
        if (cell_i == 0)
            continue;
        end
        if ( (data(i,j) > vin_max(cell_i)) || (data(i,j) < vin_min(cell_i)) )
            k = 0;
            continue;
        end        
    end
    if (k == 1)
        total_pass=total_pass+1;
    end
end
total_yield = total_pass / chip_num;

%% yield per channel
yield = zeros(1,channel_num);
i = 1;
for j=1:1:channel_num
    die_i  = ceil(j/6);
    cell_i = mod(j,6);
    if (cell_i == 0)
        continue;
    end
    channel = data(:,j);
    k1 = find(channel > vin_max(cell_i));
    channel(k1) = [];
    k2 = find(channel < vin_min(cell_i));
    channel(k2) = [];
    yield(j) = length(channel)/chip_num;
    
    pd = fitdist(channel,'Normal');
    x_values = min(channel):1e-6:max(channel);
    y_values = pdf(pd, x_values);
    subplot(die_num, 5, i);
    h = histogram(channel,'Normalization','pdf');
    txt = {['mu=' num2str(pd.mu) 'V'],['sigma=' num2str(pd.sigma*1e3) 'mV'],['max=' num2str(max(x_values)) 'V'],['min=' num2str(min(x_values)) 'V'],['delta=' num2str(yield_delta*1000) 'mV'],['yield=' num2str(yield(j)*100) '%']};
    x_coord = max(x_values)-(max(x_values)-min(x_values))/4;
    % y_coord = max(y_values)-(max(y_values)+min(y_values))/2;
    y_coord = 1000;
    text(x_coord,y_coord,txt);
    grid on;
    % title('OV C5 H33V49-12');
    title_name = ['C', num2str(j)];
    title(title_name);
    i = i+1;
end

sgtitle_name = strcat(chip_lot_id,' Total Yield=', num2str(total_yield*100), '%');
sgtitle(sgtitle_name);

