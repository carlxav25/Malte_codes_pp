% composition check

clc
clear all
close all

path   = '/home/local/carltonx/Work/Malte_box/Project_runs/Final_Results/Results/';

comp  = load([path,'no.dat']);
comp1 = load([path,'no_50ppb.dat']);

oz   = [4,20,40,50,100];
nox  = [2.5000,7.5000,12.5000];

% indicies for O3 depedence
for ii = 1:length(oz)
    
i_25   = find(comp(:,1)==2.5000 &  comp(:,2)==oz(ii));
i_75   = find(comp(:,1)==7.5000 &  comp(:,2)==oz(ii));
i_125  = find(comp(:,1)==12.5000 &  comp(:,2)==oz(ii));

contr_25(ii)  = comp(i_25,3);
contr_75(ii)  = comp(i_75,3);
contr_125(ii) = comp(i_125,3);

hom_25(ii)  = comp(i_25,4);
hom_75(ii)  = comp(i_75,4);
hom_125(ii) = comp(i_125,4);

mcm_25(ii)  = comp(i_25,5);
mcm_75(ii)  = comp(i_75,5);
mcm_125(ii) = comp(i_125,5);

i1_25   = find(comp1(:,1)==2.5000 &  comp1(:,2)==oz(ii));
i1_75   = find(comp1(:,1)==7.5000 &  comp1(:,2)==oz(ii));
i1_125  = find(comp1(:,1)==12.5000 &  comp1(:,2)==oz(ii));

end

% indices for temp dependence

for ii = 1:length(nox)
    
i_4   = find(comp(:,1)==nox(ii) &  comp(:,2)==oz(1));
i_20  = find(comp(:,1)==nox(ii) &  comp(:,2)==oz(2));
i_40  = find(comp(:,1)==nox(ii) &  comp(:,2)==oz(3));
i_50  = find(comp(:,1)==nox(ii) &  comp(:,2)==oz(4));
i_100 = find(comp(:,1)==nox(ii) &  comp(:,2)==oz(5));

contr_4(ii)   = comp(i_4,3);
contr_20(ii)  = comp(i_20,3);
contr_40(ii)  = comp(i_40,3);
contr_50(ii)  = comp(i_50,3);
contr_100(ii) = comp(i_100,3);

hom_4(ii)   = comp(i_4,4);
hom_20(ii)  = comp(i_20,4);
hom_40(ii)  = comp(i_40,4);
hom_50(ii)  = comp(i_50,4);
hom_100(ii) = comp(i_100,4);

mcm_4(ii)   = comp(i_4,5);
mcm_20(ii)  = comp(i_20,5);
mcm_40(ii)  = comp(i_40,5);
mcm_50(ii)  = comp(i_50,5);
mcm_100(ii) = comp(i_100,5);

 end
% 
 for ii = 1:length(nox)
    
i1_4   = find(comp1(:,1)==nox(ii) &  comp1(:,2)==oz(1));
i1_100 = find(comp1(:,1)==nox(ii) &  comp1(:,2)==oz(5));

hom4_abs(ii)  = comp1(i1_4,3);
mcm4_abs(ii)  = comp1(i1_4,4);

hom100_abs(ii)  = comp1(i1_100,3);
mcm100_abs(ii)  = comp1(i1_100,4);


hom1_4(ii)   = comp1(i1_4,5);
hom1_100(ii) = comp1(i1_100,5);

mcm1_4(ii)   = comp1(i1_4,6);
mcm1_100(ii) = comp1(i1_100,6);

end

%O3 dependence
% plot_o3_dependence(contr_25, hom_25, mcm_25, 2.5)
% plot_o3_dependence(contr_75, hom_75, mcm_75, 7.5)
% plot_o3_dependence(contr_125, hom_125, mcm_125,12.5)

% temperature dependence
plot_temp_dependence(contr_4, hom_4, mcm_4, 4,contr_100, hom_100, mcm_100, 100,....
                        hom1_4, mcm1_4, hom1_100, mcm1_100, hom4_abs, mcm4_abs,hom100_abs, mcm100_abs)
% plot_temp_dependence(contr_20, hom_20, mcm_20, 20)
% plot_temp_dependence(contr_40, hom_40, mcm_40, 40)
% plot_temp_dependence(contr_50, hom_50, mcm_50, 50)
% plot_temp_dependence(contr_100, hom_100, mcm_100, 100)



function plot_o3_dependence(contribution, hom, mcm, nox)

% edges=[10:10:70];

ydata = [hom; mcm]';

c_o3 = categorical({'4ppb','20ppb','40ppb','50ppb','100ppb'});

xdata = reordercats(c_o3,{'4ppb','20ppb','40ppb','50ppb','100ppb'});


 figure('Position',[1 1 1200 1200]);
 clf
 box on
 set(gca, 'fontsize', [15], 'linewidth', [2])
 hold all
 b = bar(xdata,ydata);hold on
 grid on 
 
%  b(1).FaceColor = 'r';
 b(1).FaceColor = 'b';
 b(2).FaceColor = 'g';
 
 ylim([0,105])

 legend('Total HOM contribution(%)','Total MCM contribution(%)')
 xlabel('O_3 concentrations (ppb)')
 ylabel('Contribution to SOA mass yield (%)')
 title(['A-pinene - O_3 dependence at ', num2str(nox),'ppb'])
 
%  
%  filename = ['a-o3-nox-dep' num2str(nox) '.jpg'];
%  
%  saveas(gcf,filename)
    
end


function plot_temp_dependence(contribution1, hom1, mcm1, oz1,contribution2, hom2, mcm2, oz2,....
                             hom1_4, mcm1_4, hom1_100, mcm1_100,hom4_abs, mcm4_abs,hom100_abs, mcm100_abs)

% edges=[10:10:70];
 
fH = gcf; colormap(jet(4));
 
% ydata_4    = [hom1;hom2;mcm1;mcm2]';
ydata1_4   = [hom1_4;hom1_100;mcm1_4;mcm1_100]';
ydata_abs   = [hom4_abs;hom100_abs;mcm4_abs;mcm100_abs]';
%ydata_100 = [hom2;mcm2]';

c_no = categorical({'2.5 ppb','7.5 ppb','12.5 ppb'}); 
 
xdata = reordercats(c_no,{'2.5 ppb','7.5 ppb','12.5 ppb'});


 figure('Position',[1 1 1200 1200]);
 clf
 box on
 set(gca, 'fontsize', [18], 'linewidth', [2])
 hold all
%  
%   subplot(2,1,1)
 b  = bar(xdata,ydata_abs);hold on 
%  c  = bar(xdata,ydata_100);hold on
 
 grid on 

 

  b(1).FaceColor = 'r';
  b(2).FaceColor = 'b';
%  b(2).FaceColor = 'g';
%  
  b(3).FaceColor = 'g';
  b(4).FaceColor = 'c';
 
 
  
 ylim([0,35])

%  legend('Total HOM contribution at 4ppb O_3(%)','Total HOM contribution at 100 ppb O_3(%)',...
%        'Total MCM contribution at 4 ppb O_3(%)','Total MCM contribution at 100 ppb O_3(%)',...
%          'Location', 'NorthEastOutside')
 xlabel('NO_x (ppb)')
 ylabel('SOA mass loadings (\mug/m^3)')
 
 
%  title(['\alpha-pinene(50ppb) - NO_x - O_3 dependence '])
%  
%    subplot(2,1,2)
%   b  = bar(xdata,ydata1_4);hold on 
% 
% grid on 
% 
%  
% 
%   b(1).FaceColor = 'r';
%   b(2).FaceColor = 'b';
% %  b(2).FaceColor = 'g';
% %  
%   b(3).FaceColor = 'g';
%   b(4).FaceColor = 'c';
%  
% % ax1 = gca;
% ax2 = axes('Position', get(ax1, 'Position'),'Color', 'none');
% set(ax2, 'XAxisLocation', 'top','YAxisLocation','Right');
% set('YLim', get(ax1, 'YLim'));
% set(ax2, 'YTick', get(ax1, 'YTick'),'XTick', []);
% set(ax2, 'YTickLabel',ydata_abs);
% xtickangle(0)


 
  
% ylim([0,105])

 hL = legend('Total HOM contribution at 4ppb O_3','Total HOM contribution at 100 ppb O_3',...
       'Total MCM contribution at 4 ppb O_3','Total MCM contribution at 100 ppb O_3')

 newPosition = [0.8 0.45 0.075 0.075];
 newUnits = 'normalized';
 set(hL,'Position', newPosition,'Units', newUnits);
     
%      xlabel('NO_x (ppb)')
%  ylabel('Contribution to SOA mass yield (%)')
%  title('\alpha-pinene concentration 1 ppb')
 
%  title(['\alpha-pinene(50ppb) - NO_x - O_3 dependence '])
title(['\alpha-pinene(50ppb) - NO_x - O_3 dependence '])
%   filename = ['/home/carltonx/Work/Paper 1/Plots/apine-o3-nox.png'];
%   saveas(gcf,filename)



end