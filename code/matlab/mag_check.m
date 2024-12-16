clear; clc;
load('colormap');

W = [0.0027    0.6614    0.0403    0.1109    0.0003    0.0015    0.0001;... 
     0.0143    0.0195    1.2272    0.3114    0.0109    0.0181    0.0026;...
     0.0073    0.0354    0.0101    0.0692    0.0109    0.0098    0.0033;...
     0.0055    0.0375    0.0031    0.1076    0.3596    0.0154    0.0074;...
     0.0105    0.0215    0.0052    0.0401    0.0520    0.2788    0.0284;...
     0.0045    0.0009    0.0046    0.0350    0.0160    0.0530    0.0260;...
     0.0008    0.0006    0.0035    0.0036    0.0056    0.0083    0.0110];
W = 20*log10(W/max(max(W)));
W = max(W, -35);
W = flip(W')
figure('units', 'normalized', 'outerposition', [.2 .2 .4*.7 .5*.7]);
ha = tight_subplot(1,2,.04,.01,.01);
axes(ha(1));
    imagesc(W);colormap(gca,CustomColormap)
    xticks([0.5,1.5,2.5,3.5,4.5,5.5,6.5,7.5]);xticklabels("");
    yticks([0.5,1.5,2.5,3.5,4.5,5.5,6.5,7.5]);yticklabels("");grid on; 
    set(gca,'gridcolor','w','GridLineWidth',1.5,'gridalpha',1)
    set(gcf,'color','w');set(gca,'XColor', 'none','YColor','none')
axes(ha(2)); 
    imagesc(W);colormap(gca,CustomColormap)   
    xticks([0.5,1.5,2.5,3.5,4.5,5.5,6.5,7.5]);xticklabels("");
    yticks([0.5,1.5,2.5,3.5,4.5,5.5,6.5,7.5]);yticklabels("");grid on; 
    set(gca,'gridcolor','w','GridLineWidth',1.5,'gridalpha',1)
    set(gcf,'color','w');set(gca,'XColor', 'none','YColor','none')
