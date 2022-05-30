open = 0;
short = 0;
for i=1:199
    for j=1:49
        if (os(i,j) > -0.25)
            short=short+1;
            
        end
        if (os(i,j) < -0.85)
            open=open+1;
        end
    end
end

% pass=data;
% k1=find(pass>100);
% pass(k1)=[];
% k2=find(pass<25);
% pass(k2)=[];
% hist(pass);
% grid on;