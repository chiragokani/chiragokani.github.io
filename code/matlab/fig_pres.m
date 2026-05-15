
% This m-file configures all open figures for presentation quality,
% consistent with MRH startup style ('screen') figures

figure_handle = findobj('Type','figure');

% For each open figure, find all axes, lines, and test and change the
% properties accordingly

for i = 1:length(figure_handle)
    figure(figure_handle(i));
    axis_handle = findobj(gcf,'type','axes','-not','Tag','legend',...
        '-not','Tag','Colorbar');
    text_handle = findobj(gcf,'-depth', inf,'type','text','-not','Tag',...
        'legend','-not','Tag','Colorbar');
    line_handle = findobj(gcf,'type','line','-not','Tag','legend',...
        '-not','Tag','Colorbar');
    
    % set figure properties
    set(gcf,'Color','w')
    
    % for axes
    for j = 1:length(axis_handle)
        set(axis_handle(j),'XGrid','on')
        set(axis_handle(j),'YGrid','on')
        set(axis_handle(j),'LineWidth',3)
        set(axis_handle(j),'FontSize',28)
        set(axis_handle(j),'FontName','Arial')
        
        % set labels and titles
        set(get(axis_handle(j),'title'),'fontname','Arial','fontsize',28)
        set(get(axis_handle(j),'xlabel'),'fontname','Arial','fontsize',28)
        set(get(axis_handle(j),'ylabel'),'fontname','Arial','fontsize',28)
        set(get(axis_handle(j),'zlabel'),'fontname','Arial','fontsize',28)
    end
    
    % for line
    for j = 1:length(line_handle)
        set(line_handle(j),'MarkerSize',28) %30 if want to write inside
        set(line_handle(j),'LineWidth',3)
    end
    
    % for text
    for j = 1:length(text_handle)
        set(text_handle(j),'FontSize',28,'fontname','Arial')
    end
    
end
clear figure_handle axis_handle line_handle text_handle