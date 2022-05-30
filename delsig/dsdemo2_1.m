% Demonstrate simulateDSM and simulateSNR
clc
fprintf(1,'\t\t\tDiscrete-Time Simulation\n');
if exist('LiveDemo','var') == 0
    LiveDemo=0;
end
Do7thOrderOnly = 0;

fig1pos1 = [0 630 300 200];
fig1pos2 = [0 372 777 355];
fig1pos3 = [8 562 300 250];
fig1pos4 = [0 200 777 600];
fig2pos1 = [336 562 450 250];
fig2pos2 = [185 372 662 355];
fig3pos1 = [815 565 254 247];
fig3pos2 = [275 365 520 362];

if ~Do7thOrderOnly
echo on
OSR = 32;
H = synthesizeNTF(5,OSR,1);
N = 8192;
fB = ceil(N/(2*OSR)); ftest=floor(2/3*fB);
u = 0.5*sin(2*pi*ftest/N*[0:N-1]);	% half-scale sine-wave input
v = simulateDSM(u,H); 
echo off;

figure(1); clf;
t = 0:100;
stairs(t, u(t+1),'r');
hold on;
stairs(t,v(t+1),'g');
axis([0 100 -1.2 1.2]);
xlabel('Sample Number');
ylabel('u, v');
set(gcf,'NumberTitle','off'); 
set(gcf,'Name','Modulator Input & Output');
if LiveDemo
    set(1,'position',fig1pos2);
    changeFig(18,2,12);
else
	fprintf(1,'paused\n');
end
end