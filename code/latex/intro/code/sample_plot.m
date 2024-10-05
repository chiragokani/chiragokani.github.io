x = linspace(0,1);
plot(x,x.^2,'color','b');
set(gcf,'Position',[0 25 400 200]) %first number = left-right position
                                  %second number= up-down position
                                  %third number = figure width
                                  %fourth number= figure height
fig_pres
f = gcf;
exportgraphics(f,'../fig/test.pdf','ContentType','vector', 'BackgroundColor','none')