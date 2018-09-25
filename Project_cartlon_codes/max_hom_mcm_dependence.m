% composition check

clc
clear all
close all

path   = '/home/local/carltonx/Work/Malte_box/Project_runs/Final_Results/Results/';

comp = load([path,'max_yield.dat']);


oz    = [1,2,3];
co    = [1,2,3,4,5];

ncomp = sortrows(comp,1);


hom_1 = ncomp(find(ncomp(:,1)==1),4);
mcm_1 = ncomp(find(ncomp(:,1)==1),5);
cc_1 = ncomp(find(ncomp(:,1)==1),2);


hom_2 = ncomp(find(ncomp(:,1)==2),4);
mcm_2 = ncomp(find(ncomp(:,1)==2),5);
cc_2 = ncomp(find(ncomp(:,1)==2),2);


hom_3 = ncomp(find(ncomp(:,1)==3),4);
mcm_3 = ncomp(find(ncomp(:,1)==3),5);
cc_3 = ncomp(find(ncomp(:,1)==3),2);



%% OH
ydata1 = [hom_1, mcm_1]';

c_oh = categorical({'Apinene','Bpinene','Limonene','Bcary','Isoprene'});

xdata1 = reordercats(c_oh,{'Apinene','Bpinene','Limonene','Bcary','Isoprene'});
%xdata = cc_1;

 figure('Position',[1 1 1200 1200]);
 clf
 box on
 set(gca, 'fontsize', [15], 'linewidth', [2])
 hold all
 b = bar(xdata1,ydata1');hold on
 grid on 
 
%  b(1).FaceColor = 'r';
 b(1).FaceColor = 'b';
 b(2).FaceColor = 'g';
 
 ylim([0,110])

 legend('Total HOM contribution(%)','Total MCM contribution(%)')
 xlabel('Compounds')
 ylabel('Contribution to SOA mass yield (%)')
 title(['OH dependence for maximum mass yields'])
 
 
%  filename = ['OH-dep.jpg'];
%  
%  saveas(gcf,filename)

 %% O3
ydata2 = [hom_2, mcm_2]';

c_o3 = categorical({'Apinene','Bpinene','Limonene','Bcary'});

xdata2 = reordercats(c_o3,{'Apinene','Bpinene','Limonene','Bcary'});
%xdata = cc_1;

 figure('Position',[1 1 1200 1200]);
 clf
 box on
 set(gca, 'fontsize', [15], 'linewidth', [2])
 hold all
 b = bar(xdata2,ydata2');hold on
 grid on 
 
%  b(1).FaceColor = 'r';
 b(1).FaceColor = 'b';
 b(2).FaceColor = 'g';
 
 ylim([0,110])

 legend('Total HOM contribution(%)','Total MCM contribution(%)')
 xlabel('Compounds')
 ylabel('Contribution to SOA mass yield (%)')
 title(['O_3 dependence for maximum mass yields'])
 
%  
%  filename = ['O3-dep.jpg'];
%  
%  saveas(gcf,filename)
 
 %% No3
 ydata3 = [hom_3, mcm_3]';

c_no3 = categorical({'Apinene','Bcary'});

xdata3 = reordercats(c_no3,{'Apinene','Bcary'});
%xdata = cc_1;

 figure('Position',[1 1 1200 1200]);
 clf
 box on
 set(gca, 'fontsize', [15], 'linewidth', [2])
 hold all
 b = bar(xdata3,ydata3');hold on
 grid on 
 
%  b(1).FaceColor = 'r';
 b(1).FaceColor = 'b';
 b(2).FaceColor = 'g';
 
 ylim([0,110])

 legend('Total HOM contribution(%)','Total MCM contribution(%)')
 xlabel('Compounds')
 ylabel('Contribution to SOA mass yield (%)')
 title(['NO_3 dependence for maximum mass yields'])
 
 
%  filename = ['NO3-dep.jpg'];
%  
%  saveas(gcf,filename)
 