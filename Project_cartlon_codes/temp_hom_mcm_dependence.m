% composition check

clc
clear all
close all

path   = '/home/local/carltonx/Work/Malte_box/Project_runs/Final_Results/Results/';

comp = load([path,'temp_final_yields.dat']);


oz = [4,20,40,50,100];
temp = [258,278,293,303,313];

% indicies for O3 depedence
for ii = 1:length(oz)
    
i_258  = find(comp(:,1)==258 &  comp(:,2)==oz(ii));
i_278  = find(comp(:,1)==278 &  comp(:,2)==oz(ii));
i_293  = find(comp(:,1)==293 &  comp(:,2)==oz(ii));
i_303  = find(comp(:,1)==303 &  comp(:,2)==oz(ii));
i_313  = find(comp(:,1)==313 &  comp(:,2)==oz(ii));

% contr_258(ii) = comp(i_258,3);
% contr_278(ii) = comp(i_278,3);
% contr_293(ii) = comp(i_293,3);
% contr_303(ii) = comp(i_303,3);
% contr_313(ii) = comp(i_313,3);

hom_258(ii) = comp(i_258,3);
hom_278(ii) = comp(i_278,3);
hom_293(ii) = comp(i_293,3);
hom_303(ii) = comp(i_303,3);
hom_313(ii) = comp(i_313,3);

mcm_258(ii) = comp(i_258,4);
mcm_278(ii) = comp(i_278,4);
mcm_293(ii) = comp(i_293,4);
mcm_303(ii) = comp(i_303,4);
mcm_313(ii) = comp(i_313,4);

end

% indices for temp dependence

for ii = 1:length(temp)
    
i_4   = find(comp(:,1)==temp(ii) &  comp(:,2)==oz(1));
i_20  = find(comp(:,1)==temp(ii) &  comp(:,2)==oz(2));
i_40  = find(comp(:,1)==temp(ii) &  comp(:,2)==oz(3));
i_50  = find(comp(:,1)==temp(ii) &  comp(:,2)==oz(4));
i_100 = find(comp(:,1)==temp(ii) &  comp(:,2)==oz(5));

% contr_4(ii)   = comp(i_4,3);
% contr_20(ii)  = comp(i_20,3);
% contr_40(ii)  = comp(i_40,3);
% contr_50(ii)  = comp(i_50,3);
% contr_100(ii) = comp(i_100,3);

hom_4(ii)   = comp(i_4,3);
hom_20(ii)  = comp(i_20,3);
hom_40(ii)  = comp(i_40,3);
hom_50(ii)  = comp(i_50,3);
hom_100(ii) = comp(i_100,3);

mcm_4(ii)   = comp(i_4,4);
mcm_20(ii)  = comp(i_20,4);
mcm_40(ii)  = comp(i_40,4);
mcm_50(ii)  = comp(i_50,4);
mcm_100(ii) = comp(i_100,4);

end

%O3 dependence
% plot_o3_dependence(contr_258, hom_258, mcm_258, 258)
% plot_o3_dependence(contr_278, hom_278, mcm_278, 278)
% plot_o3_dependence(contr_293, hom_293, mcm_293, 293)
% plot_o3_dependence(contr_303, hom_303, mcm_303, 303)
% plot_o3_dependence(contr_313, hom_313, mcm_313, 313)

% temperature dependence
plot_temp_dependence(hom_4, mcm_4, 4, hom_100, mcm_100, 100 )
% plot_temp_dependence(contr_20, hom_20, mcm_20, 20)
% plot_temp_dependence(contr_40, hom_40, mcm_40, 40)
% plot_temp_dependence(contr_50, hom_50, mcm_50, 50)
% plot_temp_dependence(contr_100, hom_100, mcm_100, 100)



function plot_o3_dependence(contribution, hom, mcm, temp)

% edges=[10:10:70];

ydata = [contribution; hom; mcm]';
c_temp = categorical({'258K','278K','293K','303K','313K'}); 
c_o3 = categorical({'4ppb','20ppb','40ppb','50ppb','100ppb'});

xdata = reordercats(c_o3,{'4ppb','20ppb','40ppb','50ppb','100ppb'});


 figure('Position',[1 1 1200 1200]);
 clf
 box on
 set(gca, 'fontsize', [15], 'linewidth', [2])
 hold all
 b = bar(xdata,ydata);hold on
 grid on 
 
 b(1).FaceColor = 'r';
 b(2).FaceColor = 'b';
 b(3).FaceColor = 'g';
 
 ylim([0,120])

 legend('Total contribution of selected compounds(%)','HOM contribution(%)','MCM contribution(%)')
 xlabel('O_3 concentrations (ppb)')
 ylabel('Contribution to SOA mass yield (%)')
 title(['\alpha-pinene - O_3 dependence at ', num2str(temp),'K'])
 
 
    
end


% function plot_temp_dependence(contribution, hom, mcm, oz)
% 
% % edges=[10:10:70];
% 
% ydata = [contribution; hom; mcm]';
% c_temp = categorical({'258K','278K','293K','303K','313K'}); 
% 
% 
% xdata = reordercats(c_temp,{'258K','278K','293K','303K','313K'});
% 
% 
%  figure('Position',[1 1 1200 1200]);
%  clf
%  box on
%  set(gca, 'fontsize', [15], 'linewidth', [2])
%  hold all
%  b = bar(xdata,ydata);hold on
%  grid on 
%  
%  b(1).FaceColor = 'r';
%  b(2).FaceColor = 'b';
%  b(3).FaceColor = 'g';
%  
%  ylim([0,120])
% 
%  legend('Total contribution of selected compounds(%)','HOM contribution(%)','MCM contribution(%)')
%  xlabel('Temeprature(K)')
%  ylabel('Contribution to SOA mass yield (%)')
%  title(['\alpha-pinene - Temeprature dependence at O_3 ', '(', num2str(oz),' ppb) concentration'])
% 
% 
% end

function plot_temp_dependence(hom1, mcm1, oz1, hom2, mcm2, oz2)

% edges=[10:10:70];
%  fH = gcf; colormap(jet(4));
 
ydata_4   = [hom1;hom2;mcm1;mcm2]'
%ydata_100 = [hom2;mcm2]';

c_temp = categorical({'258K','278K','293K','303K','313K'}); 
% 
% 
 xdata = reordercats(c_temp,{'258K','278K','293K','303K','313K'});

yt = 0:10:150;
 figure('Position',[1 1 1200 1200]);
 clf
 box on
 set(gca, 'fontsize', [15], 'linewidth', [2])
 hold all
 b  = bar(xdata,ydata_4);hold on 
%  c  = bar(xdata,ydata_100);hold on
 
 grid on 

% yticks([1:length(yt)])
% set(gca,'yticklabel',yt)
% ytickangle(0)
yticks([0 10 20 30 40 50 60 70 80 90 100 110 120 130 140 150])

  b(1).FaceColor = 'r';
  b(2).FaceColor = 'b';
%  b(2).FaceColor = 'g';
%  
  b(3).FaceColor = 'g';
  b(4).FaceColor = 'c';
 
 
  
ylim([0,150])

 legend('Total HOM contribution at 4ppb O_3','Total HOM contribution at 100 ppb O_3',...
       'Total MCM contribution at 4 ppb O_3','Total MCM contribution at 100 ppb O_3',...
         'Location', 'NorthEast')
 xlabel('Temperature (K)')
 ylabel('SOA mass loadings (\mug/m^3)')
 title(['\alpha-pinene(50 ppb) - Temperature - O_3 dependence '])

  filename = ['/home/carltonx/Work/Paper 1/Plots/apine-o3-temp_bar.png'];
  saveas(gcf,filename)



end