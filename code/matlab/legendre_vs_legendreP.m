%% Demonstration of legendre vs legendreP and how to obtain legendreP from legendre

% This code plots the first four Legendre polynomials in two ways:
% (a) Using the MATLAB function legendre
% (b) Using the MATLAB function legendreP

%% Graph properties
set(groot,'DefaultAxesFontSize', 21) 
set(groot,'DefaultLineLineWidth', 2)
set(groot,'DefaultAxesLineWidth', 2)

clear all
close all

%% Define the domain

r = linspace(-1,1,100); %input for legendre and legendreP (replaced by \cos(\theta) in spherical applications)

%% (a) Using the MATLAB function legendre

for n = 0:4 %n denotes the degree of legendre and legendreP
y = legendre(n,r) ; %y is an array, where the rows correspond to m = 0, 1, 2,...n and the columns are the values of legendre at r
%We are interested only in m = 0, because this corresponds to the Legendre polynomials
plot(r,y(1,:),'-b'); %y(1,:) picks off the 1st (m = 0) row of the array y, which is the Legende polynomials
hold on

%% (b) Using the MATLAB function legendreP

y1 = legendreP(n,r); %y1 is a vector, where the row corresponds to n and the columns correspond to the values of legendreP at r
plot(r,y1,'--r');
hold on    
end 

%% The lines below modify the plot

legend('Created using \texttt{legendre}','Created using \texttt{legendreP}','Interpreter','latex') % creates legend
legend('Location','eastoutside')

xlim([-1,1]);
ylim([-1,1]);