clear all; close all; clc
set(groot,'DefaultAxesFontSize', 20); set(groot,'DefaultLineLineWidth', 2); set(groot,'DefaultAxesLineWidth', 2)

%% Problem 1

Ts = 1/1e9; 
t = (-5e-6):Ts:(5e-6-Ts); 

%t = linspace(-20e-6,20e-6,1/Ts); %time window
fc = 5e6; %center frequency
BW1 = 0.2; %bandwidth
BW2 = 0.5; %bandwidth

YI1 = gauspuls(t,fc,BW1); %signal 1
YI2 = gauspuls(t,fc,BW2); %signal 2

subplot(2,1,1);
plot(t,YI1)
hold on
plot(t,YI2)
xlim([-4e-6,4e-6])
xlabel('$t$ [s]','interpreter','latex'); 
legend('BW $= 0.2$','BW $=0.5$','Interpreter','latex');

yi1 = fft(YI1);
yi2 = fft(YI2);

fs = 1/Ts;
f = (0:length(yi1)-1) * fs/length(yi1);

subplot(2,1,2);
plot(f,abs(yi1)/max(abs(yi1)))
hold on
plot(f,abs(yi2)/max(abs(yi2)))
xlim([1e6,9e6])
xlabel('$f$ [Hz]','interpreter','latex');
legend('BW $= 0.2$','BW = $0.5$','Interpreter','latex');

