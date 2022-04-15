clear all
close all
clc

set(groot,'DefaultAxesFontSize', 20)
set(groot,'DefaultLineLineWidth', 2)
set(groot,'DefaultAxesLineWidth', 2)

%% problem 4

data = readmatrix('Hwk5Prob4.csv');
t = data(:,1);
ping = data(:,2);
echo = data(:,3);
h = 6.19e-3;

%plot of the data to get some intuition
figure(1)
plot(t,ping/max(ping))
hold on
plot(t,echo/max(echo))
xlim([-2e-5,2e-5])
xlabel('$t$ [s]','interpreter','latex'); 
ylabel('normalized amplitude','interpreter','latex'); 
legend('ping','echo','Interpreter','latex');

%calculate the sampling frequency, 1/Ts (not really necessary because clock is uniformly ticking)
diff = 0; %initialize difference
for i = 1:(length(t)-1)
    diff = diff + t(i+1)-t(i);
    i = i+1;
end
Ts = diff/length(t); %should be almost or exactly 1.0000e-08

%% part a

%% TOF1
%obtain extrema info
[p,r] = max(ping);
[pe,re] = max(echo);
[q,s] = min(ping);
[qe,se] = min(echo);

TOF1 = 0.5*(t(re)-t(r) + t(se)-t(s)); %average travel time
SOS1 = 2*h/TOF1 %sound speed 1

%% TOF2
%obtain zeros info (I did this visually)

TOF2 = 0.5*(1.54e-6+9.2e-7 + 2.13e-6+3.3e-7); %average travel time
SOS2 = 2*h/TOF2 %sound speed 2

%{ 
% More robust approach, can develop this later if needed in the future
zci = @(v) find(v(:).*circshift(v(:), [-1 0]) <= 0); 
m = zci(ping);
me = zci(echo);
%}

%% TOF3 cross correlation 
%compute the correlation
figure(2)
[c,lags] = xcorr(ping,echo);
plot(-lags*Ts,c)
xlabel('$t$ [s]','interpreter','latex'); 
title('Cross-correlation','interpreter','latex')

%find the max
[p,r]=max(c);
TOF3 = -lags(r)*Ts;
SOS3 = 2*h/TOF3 %sound speed 3


%% TOF4 cross correlation of envelopes
%use Hilbert transforms of signals

%compute the correlation
figure(3)
[d,dags] = xcorr(hilbert(ping),hilbert(echo));
plot(-dags*Ts,d)
xlabel('$t$ [s]','interpreter','latex'); 
title('Cross-correlation','interpreter','latex')

%find the max
[pd,rd]=max(d);

TOF4 = -lags(rd)*Ts;
SOS4 = 2*h/TOF4 %sound speed 4


%% part b 

pingy = fft(ping);
echoy = fft(echo);
L = length(t);

P2 = abs(pingy/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);

Q2 = abs(echoy/L);
Q1 = Q2(1:L/2+1);
Q1(2:end-1) = 2*Q1(2:end-1);

fs = 1/Ts;
%f = (0:length(pingy)-1) * fs/length(pingy);

f = fs*(0:(L/2))/L;
figure(4)
plot(f,P1/max(P1))
hold on
plot(f,Q1/max(Q1))
%plot(f,abs(echoy)/max(abs(echoy)))
xlim([0,1e7])
xlabel('$f$ [Hz]','interpreter','latex');
legend('ping','echo','Interpreter','latex');



