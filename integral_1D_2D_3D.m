%% This code provides the basic structure for the numerical computation of 1D, 2D, and 3D integrals
clear all
close all
clc

set(groot,'DefaultAxesFontSize', 20)
set(groot,'DefaultLineLineWidth', 2)
set(groot,'DefaultAxesLineWidth', 2)

%% 1D integrals 
%In this example, the integral of cos(x) from 0 to pi/2 is taken. The result converges to 1

%{
x = linspace(0,pi/2,100); %dependent variable; last number in linspace is the number of subdivisions; the larger, the more accurate
int = 0; %initialize the integral
dx = max(x)/length(x); %differential element, dx
for n = 1:length(x)
    int = int + cos(x(n))*dx;
end
%}

%% 2D integrals
%In this example, the integral of cos(x+y) from x = 0:pi/2, y = 0:pi/2 is taken. The result converges to 0
clear all
close all

%{
x = linspace(0,pi/2,100); %dependent variable; last number in linspace is the number of subdivisions; the larger, the more accurate
y = linspace(0,pi/2,100); %2nd dependent variable;
int = 0; %initialize the integral
dx = max(x)/length(x); %differential element, dx
dy = max(y)/length(y); %differential element, dy
for n = 1:length(x)
for m = 1:length(y)
    int = int + (cos(x(n)+ y(m)))*dx*dy;
end
end
%}


%% 3D integrals
%In this example, the integral of cos(x+y+z) from x = 0:pi/2, y = 0:pi/2, z = 0:pi/2 is taken. The result converges to 0
clear all
close all

x = linspace(0,10,100); %dependent variable; last number in linspace is the number of subdivisions; the larger, the more accurate
y = linspace(0,10,100); %2nd dependent variable;
z = linspace(0,10,100);
int = 0; %initialize the integral
dx = max(x)/length(x); %differential element, dx
dy = max(y)/length(y); %differential element, dy
dz = max(z)/length(z); %differential element, dz
for n = 1:length(x)
for m = 1:length(y)
for l = 1:length(z)
    int = int + (cos(x(n)+ y(m)+ z(l)))*dx*dy*dz;
end
end
end
