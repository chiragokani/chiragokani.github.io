%% This is a graphical demo of the Laguerre polynomials in MATLAB
clear all; close all; clc 
set(groot,'DefaultAxesFontSize', 15); set(groot,'DefaultLineLineWidth', 2); set(groot,'DefaultAxesLineWidth', 2)

%% Laguerre polynomials: recovers https://en.wikipedia.org/wiki/Laguerre_polynomials#The_first_few_polynomials
figure 
x = linspace(-2,10);
for n = 1:4
plot(x,laguerreL(n,x));
hold on
end
xlim([-2 10]); ylim([-10 10]);
grid on
xlabel('$x$','interpreter','latex'); ylabel('$L_n(x)$','interpreter','latex')
title('Laguerre polynomials')
legend('$n=1$','$2$','$3$','$4$','Location','eastoutside','interpreter','latex')

%% Generalized Laguerre polynomials: recovers https://en.wikipedia.org/wiki/Laguerre_polynomials#Generalized_Laguerre_polynomials
clear all; clc

x = linspace(-2, 10);
colors = ['r', 'g', 'b', 'c', 'm']; %define colors
linestyles = {'-', '--', ':', '-.'}; %define line styles

figure;
hold on
for n = 0:3 % lower index
    for k = 0:n % upper index
        color = colors(mod(n, numel(colors)) + 1); %color based on index n
        linestyle = linestyles{mod(k, numel(linestyles)) + 1}; %line style based on index k
        
        plot(x, laguerreL(n, k, x), 'Color', color, 'LineStyle', linestyle);
    end
end

legendStrings = cell(1, (2*3)/2);

count = 1;
for n = 0:3
    for k = 0:n
        legendStrings{count} = sprintf('$n=%d$, $k=%d$', n, k);
        count = count + 1;
    end
end

legend(legendStrings,'interpreter','latex');
legend('Location','eastoutside')
xlim([-2 10]); ylim([-4 10]);
grid on
xlabel('$x$','interpreter','latex'); ylabel('$L_n^{|k|}(x)$','interpreter','latex')
title('Generalized Laguerre polynomials')


