%% Graph template
clear all; close all; clc
set(groot,'DefaultAxesFontSize', 25); set(groot,'DefaultLineLineWidth', 2); set(groot,'DefaultAxesLineWidth', 2)

%Inputs
x = linspace(0,3,1000); %x axis
y1 = 1./sqrt(1 + x.^2); %y axis function
y2 = 1./((1 + x.^2).^(3/2)); %something else on y axis

%plot
fig = 1;
figure(fig)
plot(x,y1,'color','b')
hold on
f = plot(x,y2,'color','r');
xlim([0,max(x)]);
l = legend('phase speed','group speed','Interpreter','latex');
legend('Location','northeast')
title('title','Interpreter','latex')
xlabel('$\beta$ [1/m]','interpreter','latex'); ylabel('$c/c_0$','interpreter','latex'); % x and y axis labels
axis square
set(gcf,'Position',[0 0 400 400]) %first number = left-right position on screen
                                  %second number= up-down position on screen
                                  %third number = figure width
                                  %fourth number= figure height
saveas(f,sprintf('sample figure for Chirag %d.png',fig))
