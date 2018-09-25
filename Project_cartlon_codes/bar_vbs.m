close all
clear all
clc

path = '/home/carltonx/Work/Malte_box/Project_runs/netcdf_input';

vap_path  = '/home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_in/';
vap_prop = load([vap_path,'Vapour_properties.dat']);
vap_name = importdata([vap_path,'Vapour_names.dat']); % for ascii file

a258    = [path,'/258_api_54.nc'];
a278    = [path,'/278_api_54.nc'];
a293    = [path,'/hom_api_54.nc'];
a303    = [path,'/303_api_54.nc'];
a313    = [path,'/313_api_54.nc'];

[c258,v258,s258] = nc_read_vbs(a258);
[c278,v278,s278] = nc_read_vbs(a278);
[c293,v293,s293] = nc_read_vbs(a293);
[c303,v303,s303] = nc_read_vbs(a303);
[c313,v313,s313] = nc_read_vbs(a313);

bas = [1e-5;1e-4;1e-3;1e-2;1e-1;1e0;1e1;1e2;1e3];

[b258,con258] =  io_vbs(s258, v258, c258);
[b278,con278] =  io_vbs(s278, v278, c278);
[b293,con293] =  io_vbs(s293, v293, c293);
[b303,con303] =  io_vbs(s303, v303, c303);
[b313,con313] =  io_vbs(s313, v313, c313);

% ind_data(con258,con278,con293,con303,con313,vap_prop, vap_name,'\alpha-pinene(50 ppb) + O_3', 50)

%%
h = figure('Position',[1 1 1200 1200]);
% axis tight manual



ydata   = [b258,b278,b293,b303,b313];
condata = [con258,con278,con293,con303,con313];

[rr cc]=size(ydata); 
% 
% c_temp = categorical({'258K','278K','293K','303K','313K'}); 
% xdata = reordercats(c_temp,{'258K','278K','293K','303K','313K'});
c_temp = ({'258K','278K','293K','303K','313K','258K','278K','293K','303K','313K',...
           '258K','278K','293K','303K','313K','258K','278K','293K','303K','313K',...
           '258K','278K','293K','303K','313K','258K','278K','293K','303K','313K',...
           '258K','278K','293K','303K','313K','258K','278K','293K','303K','313K'});
% 

xbar1=[log10(1E-6) log10(1E-6) log10(0.0003) log10(0.0003)];
xbar2=[log10(0.00031) log10(0.00031) log10(0.3) log10(0.3)]; %lvoc
xbar3=[log10(0.31) log10(0.31) log10(300) log10(300)];%svoc
xbar4=[log10(301)   log10(301) log10(1e4) log10(1e4)]; %ivoc


subplot(2,3,1)
b=bar(log10(bas),b258./sum(b258),0.5,'r');hold on; % total
b=bar(log10(bas),con258./sum(b258),0.5,'g');hold on; % condensed

%patch([min(ylim) max(ylim) max(ylim) min(ylim)], [xbar1(1) xbar1(1), xbar1(2) xbar1(2)], [0.8 0.8 0.8])
h = fill(xbar1,[0 0.6 0.6 0],[0.6 0.6 0.6]);
set(h,'facealpha',.2)

h = fill(xbar2,[0 0.6 0.6 0],'r');
set(h,'facealpha',.2)

h = fill(xbar3,[0 0.6 0.6 0],'g');
set(h,'facealpha',.2)

h = fill(xbar4,[0 0.6 0.6 0],'c');
set(h,'facealpha',.2)


ylabel('Mass fraction','FontSize',12,'FontWeight','bold','Color','k')
xlabel('log_1_0 C','FontSize',12,'FontWeight','bold','Color','k')
%xlabel(a,'Temperature (K)','FontSize',16,'FontWeight','bold','Color','k')
% set(b, 'XTickLabel',{'258K','278K','293K','303K','313K'});
set(gca,'FontSize',12,'FontWeight','bold')
title('258K')
ylim([0 0.6])
% ax1 = gca;
% ax2 = axes('Position', get(ax1, 'Position'),'Color', 'none');
% set(ax2, 'XAxisLocation', 'top');
% set(ax2, 'XLim', [0 length(c_temp)]);
% xticks([1:length(c_temp)])
% set(ax2, 'XTick', get(ax2, 'XTick'),'YTick', []);
% set(ax2, 'XTickLabel',(c_temp));
% xtickangle(90)
% 
% lh=legend('Total gas + particle','Condensed phase');
% lh.FontSize=8;
% set(lh,'Location','NorthWest', 'FontWeight', 'bold') 
% grid on

subplot(2,3,2)
b=bar(log10(bas),b278./sum(b278),0.5,'r');hold on; % total
b=bar(log10(bas),con278./sum(b278),0.5,'g');hold on; % condensed

h = fill(xbar1,[0 0.6 0.6 0],[0.6 0.6 0.6]);
set(h,'facealpha',.2)

h = fill(xbar2,[0 0.6 0.6 0],'r');
set(h,'facealpha',.2)

h = fill(xbar3,[0 0.6 0.6 0],'g');
set(h,'facealpha',.2)

h = fill(xbar4,[0 0.6 0.6 0],'c');
set(h,'facealpha',.2)

ylabel('Mass fraction','FontSize',12,'FontWeight','bold','Color','k')
xlabel('log_1_0 C','FontSize',12,'FontWeight','bold','Color','k')
%xlabel(a,'Temperature (K)','FontSize',16,'FontWeight','bold','Color','k')
% set(b, 'XTickLabel',{'258K','278K','293K','303K','313K'});
set(gca,'FontSize',12,'FontWeight','bold')
title('278K')
ylim([0 0.6])

subplot(2,3,3)
b=bar(log10(bas),b293./sum(b293),0.5,'r');hold on; % total
b=bar(log10(bas),con293./sum(b293),0.5,'g');hold on; % condensed
ylim([0 0.6])
h = fill(xbar1,[0 0.6 0.6 0],[0.6 0.6 0.6]);
set(h,'facealpha',.2)

h = fill(xbar2,[0 0.6 0.6 0],'r');
set(h,'facealpha',.2)

h = fill(xbar3,[0 0.6 0.6 0],'g');
set(h,'facealpha',.2)

h = fill(xbar4,[0 0.6 0.6 0],'c');
set(h,'facealpha',.2)

ylabel('Mass fraction','FontSize',12,'FontWeight','bold','Color','k')
xlabel('log_1_0 C','FontSize',12,'FontWeight','bold','Color','k')
%xlabel(a,'Temperature (K)','FontSize',16,'FontWeight','bold','Color','k')
% set(b, 'XTickLabel',{'258K','278K','293K','303K','313K'});
set(gca,'FontSize',12,'FontWeight','bold')
title('293K')

subplot(2,3,4)
b=bar(log10(bas),b303./sum(b303),0.5,'r');hold on; % total
b=bar(log10(bas),con303./sum(b303),0.5,'g');hold on; % condensed
ylim([0 0.6])
h = fill(xbar1,[0 0.6 0.6 0],[0.6 0.6 0.6]);
set(h,'facealpha',.2)

h = fill(xbar2,[0 0.6 0.6 0],'r');
set(h,'facealpha',.2)

h = fill(xbar3,[0 0.6 0.6 0],'g');
set(h,'facealpha',.2)

h = fill(xbar4,[0 0.6 0.6 0],'c');
set(h,'facealpha',.1)

ylabel('Mass fraction','FontSize',12,'FontWeight','bold','Color','k')
xlabel('log_1_0 C','FontSize',12,'FontWeight','bold','Color','k')
%xlabel(a,'Temperature (K)','FontSize',16,'FontWeight','bold','Color','k')
% set(b, 'XTickLabel',{'258K','278K','293K','303K','313K'});
set(gca,'FontSize',12,'FontWeight','bold')
title('303K')

subplot(2,3,5)
b=bar(log10(bas),b313./sum(b313),0.5,'r');hold on; % total
b=bar(log10(bas),con313./sum(b313),0.5,'g');hold on; % condensed
ylim([0 0.6])
h = fill(xbar1,[0 0.6 0.6 0],[0.6 0.6 0.6]);
set(h,'facealpha',.2)

h = fill(xbar2,[0 0.6 0.6 0],'r');
set(h,'facealpha',.2)

h = fill(xbar3,[0 0.6 0.6 0],'g');
set(h,'facealpha',.2)

h = fill(xbar4,[0 0.6 0.6 0],'c');
set(h,'facealpha',.2)

ylabel('Mass fraction','FontSize',12,'FontWeight','bold','Color','k')
xlabel('log_1_0 C','FontSize',12,'FontWeight','bold','Color','k')
%xlabel(a,'Temperature (K)','FontSize',16,'FontWeight','bold','Color','k')
% set(b, 'XTickLabel',{'258K','278K','293K','303K','313K'});
set(gca,'FontSize',12,'FontWeight','bold')
title('313K')

lh=legend('Total gas + particle phase','Condensed phase');
lh.FontSize=14;
set(lh,'Location','SouthWestOutside', 'FontWeight', 'bold') 

hh = suptitle('Volatility Basis Set for \alpha-pinene (50 ppb) + O_3 (50 ppb)')
set(hh,'FontSize',20,'FontWeight','normal')

%% function

function [h_b,con_pha] =  io_vbs(conc_sat, vap_phase, cond_phase) 


% ind_l87     = find(conc_sat > 1e-8 & conc_sat <= 1e-7 );
% ind_l76     = find(conc_sat > 1e-7 & conc_sat <= 1e-6 );
ind_l65     = find(conc_sat > 1e-6 & conc_sat <= 1e-5 );
ind_l54     = find(conc_sat > 1e-5 & conc_sat <= 1e-4 );
% ind_l4      = find(conc_sat <= 1e-4);
ind_g4l3    = find(conc_sat > 1e-4 & conc_sat <= 1e-3);
ind_g3l2    = find(conc_sat > 1e-3 & conc_sat <= 1e-2);
ind_g2l1    = find(conc_sat > 1e-2 & conc_sat <= 1e-1);
ind_g01l1   = find(conc_sat > 1e-1 & conc_sat <= 1);
ind_g1l10   = find(conc_sat > 1 & conc_sat <= 10);
ind_g10l100 = find(conc_sat > 10 & conc_sat <= 1e2);
ind_g100l1000 = find(conc_sat > 1e2 & conc_sat <= 1e3);

b00_c = sum(cond_phase(ind_l65));
b0_c  = sum(cond_phase(ind_l54));
% b1_c  = sum(cond_phase(ind_l4)); 
b2_c  = sum(cond_phase(ind_g4l3)); 
b3_c  = sum(cond_phase(ind_g3l2)); 
b4_c  = sum(cond_phase(ind_g2l1)); 
b5_c  = sum(cond_phase(ind_g01l1)); 
b6_c  = sum(cond_phase(ind_g1l10)); 
b7_c  = sum(cond_phase(ind_g10l100)); 
b8_c  = sum(cond_phase(ind_g100l1000)); 

b00_v  = sum(vap_phase(ind_l65));
b0_v  = sum(vap_phase(ind_l54));
% b1_v  = sum(vap_phase(ind_l4)); 
b2_v  = sum(vap_phase(ind_g4l3)); 
b3_v  = sum(vap_phase(ind_g3l2)); 
b4_v  = sum(vap_phase(ind_g2l1)); 
b5_v  = sum(vap_phase(ind_g01l1)); 
b6_v  = sum(vap_phase(ind_g1l10)); 
b7_v  = sum(vap_phase(ind_g10l100)); 
b8_v  = sum(vap_phase(ind_g100l1000)); 


con_pha = [b00_c;b0_c;b2_c;b3_c;b4_c;b5_c;b6_c;b7_c;b8_c];
vap_pha = [b00_v;b0_v;b2_v;b3_v;b4_v;b5_v;b6_v;b7_v;b8_v];

h_b=con_pha+vap_pha; %total cond+vap

end


