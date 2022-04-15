clear all
close all
clc

%% problem 5

data = readmatrix('Hwk5Prob5.csv');
t = data(:,1);
signal1 = data(:,2);
signal2 = data(:,3);
h = 1.3e-2;

%plot of the data to get some intuition
figure(1)
plot(t,signal1/max(signal1))
hold on
plot(t,signal2/max(signal2))
xlabel('$t$ [s]','interpreter','latex'); 
ylabel('normalized amplitude','interpreter','latex'); 
legend('$S_1$','$S_2$','Interpreter','latex');

%calculate the sampling frequency, 1/Ts
diff = 0; %initialize difference
for i = 1:(length(t)-1)
    diff = diff + t(i+1)-t(i);
    i = i+1;
end
Ts = diff/length(t); %should be almost or exactly 1.0000e-08

%% TOF; cross correlation of envelopes
%use Hilbert transforms of signals

%compute the correlation
figure(2)
[d,dags] = xcorr(hilbert(signal1),hilbert(signal2));
plot(-dags*Ts,d)
xlabel('$t$ [s]','interpreter','latex'); 
title('Cross-correlation','interpreter','latex')

%find the max
[pd,rd]=max(d);

TOF = -dags(rd)*Ts;
SOS = h/TOF %sound speed d

