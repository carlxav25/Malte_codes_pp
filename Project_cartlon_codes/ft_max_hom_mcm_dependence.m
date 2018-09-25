% composition check

clc
clear all
close all

path   = '/home/local/carltonx/Work/Malte_box/Project_runs/Final_Results/Results/';

comp_ch = load([path,'max_yield.dat']);
comp_ft = load([path,'ft_max_yield.dat']);

oz    = [1,2,3];

ncomp_ch = sortrows(comp_ch,1);
ncomp_ft = sortrows(comp_ft,1);

hom_1_ch = ncomp_ch(find(ncomp_ch(:,1)==1),4);
mcm_1_ch = ncomp_ch(find(ncomp_ch(:,1)==1),5);
cc_1_ch = ncomp_ch(find(ncomp_ch(:,1)==1),2);


hom_2_ch = ncomp_ch(find(ncomp_ch(:,1)==2),4);
mcm_2_ch = ncomp_ch(find(ncomp_ch(:,1)==2),5);
cc_2_ch = ncomp_ch(find(ncomp_ch(:,1)==2),2);


hom_3_ch = ncomp_ch(find(ncomp_ch(:,1)==3),4);
mcm_3_ch = ncomp_ch(find(ncomp_ch(:,1)==3),5);
cc_3_ch = ncomp_ch(find(ncomp_ch(:,1)==3),2);

hom_1_ft = ncomp_ft(find(ncomp_ft(:,1)==1),4);
mcm_1_ft = ncomp_ft(find(ncomp_ft(:,1)==1),5);
cc_1_ft  = ncomp_ft(find(ncomp_ft(:,1)==1),2);


hom_2_ft = ncomp_ft(find(ncomp_ft(:,1)==2),4);
mcm_2_ft = ncomp_ft(find(ncomp_ft(:,1)==2),5);
cc_2_ft = ncomp_ft(find(ncomp_ft(:,1)==2),2);


hom_3_ft = ncomp_ft(find(ncomp_ft(:,1)==3),4);
mcm_3_ft = ncomp_ft(find(ncomp_ft(:,1)==3),5);
cc_3_ft = ncomp_ft(find(ncomp_ft(:,1)==3),2);



%% OH
ydata_ch1 = [hom_1_ch, mcm_1_ch]';
ydata_ft1 = [hom_1_ft, mcm_1_ft]';

c_oh = categorical({'Apinene','Bpinene','Limonene'});

xdata1 = reordercats(c_oh,{'Apinene','Bpinene','Limonene'});
%xdata = cc_1;

main = [ydata_ch1(:,1:3); ydata_ft1(:,1:3)]';
 figure('Position',[1 1 1200 1200]);
 clf
 box on
 set(gca, 'fontsize', [20], 'linewidth', [2])
 hold all
 
 subplot(2,1,1)
 b = bar(xdata1,main);hold on %ydata_ch1(:,1:3)');hold on
 grid on
 xlabel('Compounds','fontsize',15)
 ylabel('Contribution to SOA mass yield (%)','fontsize',15)
 title('OH')
 
%  b(1).FaceColor = 'r';
 b(1).FaceColor = 'r';
 b(2).FaceColor = 'b';
 b(3).FaceColor = 'g';
 b(4).FaceColor = 'c';
 
 ylim([0,110])
%  lh = legend()

%  subplot(2,1,2)
%  c = bar(xdata1,ydata_ft1(:,1:3)');hold on
%  grid on 
%  ylim([0,110])
%  c(1).FaceColor = 'r';
%  c(2).FaceColor = 'c';
%  
 hL=legend({'Total HOM contribution(%)-chamber','Total MCM contribution(%)-chamber',...
              'Total HOM contribution(%)-flow-tube','Total MCM contribution(%)-flow-tube'});
 newPosition = [0.8 0.45 0.075 0.075];
 newUnits = 'normalized';
 set(hL,'Position', newPosition,'Units', newUnits);
% 
%  xlabel('Compounds','fontsize',15)
%  ylabel('Contribution to SOA mass yield (%)','fontsize',15)
%  title('Flowtube runs')
%  
%  suptitle(['OH dependence for maximum mass yields'])
 
 
%  
%  filename = ['FT-OH-dep.png'];
%  
%  saveas(gcf,filename)

 %%%% O3
ydata_ch2 = [hom_2_ch, mcm_2_ch]';
ydata_ft2 = [hom_2_ft, mcm_2_ft]';

main_o3 = [ydata_ch2(:,1:3); ydata_ft2(:,1:3)]'
c_o3 = categorical({'Apinene','Bpinene','Limonene'});

xdata2 = reordercats(c_o3,{'Apinene','Bpinene','Limonene'});
%xdata = cc_1;
% 
%  figure('Position',[1 1 1200 1200]);
%  clf
%  box on
%  set(gca, 'fontsize', [20], 'linewidth', [2])
%  hold all
 
 subplot(2,1,2)
 b = bar(xdata2,main_o3);hold on%   ydata_ch2(:,1:3)');hold on
 grid on
 xlabel('Compounds','fontsize',15)
 ylabel('Contribution to SOA mass yield (%)','fontsize',15)
 title('Chamber runs')
 

b(1).FaceColor = 'r';
 b(2).FaceColor = 'b';
 b(3).FaceColor = 'g';
 b(4).FaceColor = 'c';
 
 ylim([0,110])

%  subplot(2,1,2)
%  c = bar(xdata2,ydata_ft2(:,1:3)');hold on
%  grid on 
 
%  c(1).FaceColor = 'r';
%  c(2).FaceColor = 'c';
%  ylim([0,110])
%  hL=legend({'Total HOM contribution(%)','Total MCM contribution(%)'});
%  newPosition = [0.8 0.45 0.075 0.075];
%  newUnits = 'normalized';
%  set(hL,'Position', newPosition,'Units', newUnits);
 
 xlabel('Compounds','fontsize',18)
 ylabel('Contribution to SOA mass yield (%)','fontsize',15)
 title('O_3')
 
 
 suptitle(['Relative contribution by HOM and MCM compunds to maximum mass yields'])
 
 
%  filename = ['FT-O3-dep.png'];
%  
%  saveas(gcf,filename)
 
 %% No3
ydata_ch3 = [hom_3_ch, mcm_3_ch]';
ydata_ft3 = [hom_3_ft, mcm_3_ft]';

c_o3 = categorical({'Apinene','Bcary','Limonene'});

xdata3 = reordercats(c_o3,{'Apinene','Bcary','Limonene'});
%xdata = cc_1;

 figure('Position',[1 1 1200 1200]);
 clf
 box on
 set(gca, 'fontsize', [20], 'linewidth', [2])
 hold all
 
 subplot(2,1,1)
 b = bar(xdata3,ydata_ch3');hold on
 grid on
xlabel('Compounds','fontsize',15)
 ylabel('Contribution to SOA mass yield (%)','fontsize',15)
 title('Chamber runs')
 
%  b(1).FaceColor = 'r';
 b(1).FaceColor = 'r';
 b(2).FaceColor = 'c';
 
 ylim([0,110])

 subplot(2,1,2)
 c = bar(xdata3,ydata_ft3');hold on
 grid on 
 
 c(1).FaceColor = 'r';
 c(2).FaceColor = 'c';
 ylim([0,110])
 hL=legend({'Total HOM contribution(%)','Total MCM contribution(%)'});
 newPosition = [0.8 0.45 0.075 0.075];
 newUnits = 'normalized';
 set(hL,'Position', newPosition,'Units', newUnits);
 
 xlabel('Compounds','fontsize',15)
 ylabel('Contribution to SOA mass yield (%)','fontsize',15)
 title('Flowtube runs')
 
 
 suptitle(['NO_3 dependence for maximum mass yields'])
 
 
%  filename = ['FT-NO3-dep.png'];
%  
%  saveas(gcf,filename)
 