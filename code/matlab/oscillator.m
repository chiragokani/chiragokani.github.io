%% Plot of simple harmonic oscillator with damping
clear all; close all; clc

% parameters
theta = linspace(0,10,500); %= \omega t;  dimensionless time 
Om = 1.1; % = \omega/\omega_0 (1 = resonance) 
D1 = 1; % = C_1/(F_0/k) initial conditions determine D1 and D2
D2 = 20; % = C_2/(F_0/k)

%No damping:  Q = Quality factor = # of oscillations to return to steady state =  \infty
B = 0; % b\omega_0/k damping parameter:
X1 = D1*exp(-B*theta/(2*Om) + theta*sqrt(B^2/(4*Om^2) - 1/(Om^2))) + ...
    D2*exp(-B*theta/(2*Om) - theta*sqrt(B^2/(4*Om^2) - 1/(Om^2))) +...
    1/(1-Om^2-1i*Om*B); 

%Critical damping: Q = 1
B = 0.7; % b\omega_0/k damping parameter:
X2 = D1*exp(-B*theta/(2*Om) + theta*sqrt(B^2/(4*Om^2) - 1/(Om^2))) + ...
    D2*exp(-B*theta/(2*Om) - theta*sqrt(B^2/(4*Om^2) - 1/(Om^2))) +...
    1/(1-Om^2-1i*Om*B); 

%Fully damped: Q = 0
B = 2; % b\omega_0/k damping parameter:
X3 = D1*exp(-B*theta/(2*Om) + theta*sqrt(B^2/(4*Om^2) - 1/(Om^2))) + ...
    D2*exp(-B*theta/(2*Om) - theta*sqrt(B^2/(4*Om^2) - 1/(Om^2))) +...
    1/(1-Om^2-1i*Om*B); 

% plotting 
figure('Position', [0 0  700 300]);
bat = plot(theta,real(X1)); hold on; plot(theta,real(X2)); hold on; plot(theta,real(X3)); hold on 
legend('$X_1(\theta)$ (no damping)','$X_2(\theta)$ (critical damping)','$X_3(\theta)$ (full damping)','interpreter','latex')
legend('Location','best')
saveas(bat,'oscillator.png')


%% Dimensionful code (less useful because more input parameters)
%{
% parameters
t = linspace(0,10,500); %time in seconds
m = 1; %mass in kilograms
b = 1; %damping constant in Newton seconds per meter 
k = 1; %stiffness constant in Newtons per meter
omeg0 = sqrt(k/m); %resonance in per second
omeg = 4; %drive frequency in per second
Fo = 10; %amplitude of drive functions in Newtons
C1 = 1; %arbitrary constants based on initial conditions in meters
C2 = 1; 

x = C1*exp((-b+sqrt(b^2-4*m*k))/(2*m)*t)+C2*exp((-b-sqrt(b^2-4*m*k))/(2*m)*t) + ...
    (Fo/k)/(1-(omeg/omeg0)^2-1i*b*omeg/k)*exp(-1i*omeg*t);

% plotting 
figure 
plot(t,real(x))
fig_Gara
%}

