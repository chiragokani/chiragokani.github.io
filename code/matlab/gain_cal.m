%% Gain calculator 
%G = ka^2/2d

%forward
%{
ka = [10 20 50 100 200];
dovera = 2;
G = 0.5*ka./dovera;
%}
%inverse
clear all; clc

G = 20; 
dovera = [2 3 3 4 5];
ka = 2*G*dovera;
plot(dovera,ka,'Marker','o'); xlabel('$d/a$','Interpreter','latex'); ylabel('$ka$','Interpreter','latex');
batty = sprintf('$G = %d$', G); title(batty,'Interpreter','latex')
fig_JASA
