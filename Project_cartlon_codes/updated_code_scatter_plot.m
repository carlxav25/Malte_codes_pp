close all
clc

apin_10s   = load(['/home/local/carltonx/Work/Malte_box/Project_runs/New_results/hom_24hr_runs/apin_10_hom_new.dat']);
apin_24   = load(['/home/local/carltonx/Work/Malte_box/Project_runs/New_results/hom_24hr_runs/apin_24_hom_new.dat']);

markers = {'*';'o';'s'};
sz  = linspace(80,400,5);
cls = {'r';'b';'k'};
sz1 = linspace(80,400,5);

ind_oh_2   =find(apin_10s(:,2)==2);
ind_oh_5   =find(apin_10s(:,2)==5);
ind_oh_10  =find(apin_10s(:,2)==10);
ind_oh_50  =find(apin_10s(:,2)==50);
ind_oh_100 =find(apin_10s(:,2)==100);

ind_o3_1   =find(apin_10s(:,3)==1);
ind_o3_5   =find(apin_10s(:,3)==5);
ind_o3_10  =find(apin_10s(:,3)==10);
ind_o3_50  =find(apin_10s(:,3)==50);
ind_o3_100 =find(apin_10s(:,3)==100);

ind_no_1   =find(apin_10s(:,4)==1);
ind_no_5   =find(apin_10s(:,4)==5);
ind_no_10  =find(apin_10s(:,4)==10);
ind_no_50  =find(apin_10s(:,4)==50);
ind_no_100 =find(apin_10s(:,4)==100);
% 
% ind_o3=find(apin_10s(:,3)>0);
% ind_no3=find(apin_10s(:,4)>0);


%% OH oxidant based plot
figure('Position',[1 1 1200 1200]); %( x,y)
clf
box on
set(gca, 'fontsize', [20], 'linewidth', [2])
hold all


h   = scatter(apin_10s(ind_oh_2,5), apin_10s(ind_oh_2,6), 'filled','c','MarkerFaceColor','r');hold on;
h   = scatter(apin_10s(ind_oh_5,5), apin_10s(ind_oh_5,6), 'filled','c','MarkerFaceColor','b');hold on;
h   = scatter(apin_10s(ind_oh_10,5), apin_10s(ind_oh_10,6), 'filled','c','MarkerFaceColor','k');hold on;
h   = scatter(apin_10s(ind_oh_50,5), apin_10s(ind_oh_50,6), 'filled','c','MarkerFaceColor','m');hold on;
h   = scatter(apin_10s(ind_oh_100,5), apin_10s(ind_oh_100,6), 'filled','c','MarkerFaceColor','c');hold on;


% h   = scatter(apin_10s(ind_o3,5), apin_10s(ind_o3,6),  'filled','s' ,'MarkerFaceColor','b');hold on;
% h   = scatter(apin_10s(ind_no3,5), apin_10s(ind_no3,6),  'filled','d' ,'MarkerFaceColor','m');hold on

lh = legend('2 * 1E6','5 * 1E6','10 * 1E6','50 * 1E6 ','100 * 1E6')% * 1E6)%, 'O_3','NO_3') %,....
         %'24 hr(OH: 2,5,10,50,100 * 1E6)','24 hr(O3: 1,5,10,50,100 * E11)', '24 hr(NO3: 1,5,10,50,100 *E7)')
set(lh,'Location','NorthWest', 'FontWeight', 'bold') 

set(gca,'xscale','log')
grid on
xlim([0 250])

title('Alpha-pinene vs OH')
xlabel('Reacted(ppb)','FontSize',20,'FontWeight','bold','Color','k')
ylabel('Mass yields(%)','FontSize',20,'FontWeight','bold','Color','k')
set(gca,'FontSize',20,'FontWeight','bold')

%% O_3 oxidant based plot
figure('Position',[1 1 1200 1200]); %( x,y)
clf
box on
set(gca, 'fontsize', [20], 'linewidth', [2])
hold all


h   = scatter(apin_10s(ind_o3_1,5), apin_10s(ind_o3_1,6), 'filled','c','MarkerFaceColor','r');hold on;
h   = scatter(apin_10s(ind_o3_5,5), apin_10s(ind_o3_5,6), 'filled','c','MarkerFaceColor','b');hold on;
h   = scatter(apin_10s(ind_o3_10,5), apin_10s(ind_o3_10,6), 'filled','c','MarkerFaceColor','k');hold on;
h   = scatter(apin_10s(ind_o3_50,5), apin_10s(ind_o3_50,6), 'filled','c','MarkerFaceColor','m');hold on;
h   = scatter(apin_10s(ind_o3_100,5), apin_10s(ind_o3_100,6), 'filled','c','MarkerFaceColor','c');hold on;


% h   = scatter(apin_10s(ind_o3,5), apin_10s(ind_o3,6),  'filled','s' ,'MarkerFaceColor','b');hold on;
% h   = scatter(apin_10s(ind_no3,5), apin_10s(ind_no3,6),  'filled','d' ,'MarkerFaceColor','m');hold on

lh = legend('1 * 1E11','5 * 1E11','10 * 1E11','50 * 1E11','100 * 1E11')% * 1E6)%, 'O_3','NO_3') %,....
         %'24 hr(OH: 2,5,10,50,100 * 1E6)','24 hr(O3: 1,5,10,50,100 * E11)', '24 hr(NO3: 1,5,10,50,100 *E7)')
set(lh,'Location','NorthWest', 'FontWeight', 'bold') 

set(gca,'xscale','log')
grid on
xlim([0 250])

title('Alpha-pinene vs O_3')
xlabel('Reacted(ppb)','FontSize',20,'FontWeight','bold','Color','k')
ylabel('Mass yields(%)','FontSize',20,'FontWeight','bold','Color','k')
set(gca,'FontSize',20,'FontWeight','bold')

%% NO3 oxidant based plot
figure('Position',[1 1 1200 1200]); %( x,y)
clf
box on
set(gca, 'fontsize', [20], 'linewidth', [2])
hold all


h   = scatter(apin_10s(ind_no_1,5), apin_10s(ind_no_1,6), 'filled','c','MarkerFaceColor','r');hold on;
h   = scatter(apin_10s(ind_no_5,5), apin_10s(ind_no_5,6), 'filled','c','MarkerFaceColor','b');hold on;
h   = scatter(apin_10s(ind_no_10,5), apin_10s(ind_no_10,6), 'filled','c','MarkerFaceColor','k');hold on;
h   = scatter(apin_10s(ind_no_50,5), apin_10s(ind_no_50,6), 'filled','c','MarkerFaceColor','m');hold on;
h   = scatter(apin_10s(ind_no_100,5), apin_10s(ind_no_100,6), 'filled','c','MarkerFaceColor','c');hold on;


% h   = scatter(apin_10s(ind_o3,5), apin_10s(ind_o3,6),  'filled','s' ,'MarkerFaceColor','b');hold on;
% h   = scatter(apin_10s(ind_no3,5), apin_10s(ind_no3,6),  'filled','d' ,'MarkerFaceColor','m');hold on

lh = legend('1 * 1E7','5 * 1E7','10 * 1E7','50 * 1E7 ','100 * 1E7')% * 1E6)%, 'O_3','NO_3') %,....
         %'24 hr(OH: 2,5,10,50,100 * 1E6)','24 hr(O3: 1,5,10,50,100 * E11)', '24 hr(NO3: 1,5,10,50,100 *E7)')
set(lh,'Location','NorthWest', 'FontWeight', 'bold') 

set(gca,'xscale','log')
grid on
xlim([0 250])

title('Alpha-pinene vs NO_3')
xlabel('Reacted(ppb)','FontSize',20,'FontWeight','bold','Color','k')
ylabel('Mass yields(%)','FontSize',20,'FontWeight','bold','Color','k')
set(gca,'FontSize',20,'FontWeight','bold')


 %% plots
% figure('Position',[1 1 1200 1200]); %( x,y)
% clf
% box on
% set(gca, 'fontsize', [20], 'linewidth', [2])
% hold all
% 
% 
% %subplot(3,1,1) %% plot for mcm chemsitry
% 
% 
% % h   = scatter(apin_10s(46:50,5), apin_10s(46:50,6), sz, 'filled','c','MarkerFaceColor','r');hold on;
% % h   = scatter(apin_10s(51:55,5), apin_10s(51:55,6), sz,  'filled','s' ,'MarkerFaceColor','b');hold on;
% % h   = scatter(apin_10s(56:60,5), apin_10s(56:60,6), sz,  'filled','d' ,'MarkerFaceColor','k');hold on
% % h1  = scatter(apin_24(46:50,5), apin_24(46:50,6), sz, 'p','MarkerFaceColor','m');hold on;
% % h2  = scatter(apin_24(51:55,5), apin_24(51:55,6), sz, 'h' ,'MarkerFaceColor','c');hold on;
% % h3  = scatter(apin_24(56:60,5), apin_24(56:60,6), sz, 'v', 'MarkerFaceColor','g');hold on
% 
% 
% 
% set(gca,'xscale','log')
% grid on
% m_t_24 = apin_24(46:60,7);%[apin_24(1:5,7)*1E6;apin_24(6:10,7)*1E11;apin_24(11:15,7)*1E7];
% bb_t_24=num2str(m_t_24);
% cc_t_24 = cellstr(bb_t_24);
% m_t_10 = apin_10s(46:60,7);%[apin_24(1:5,7)*1E6;apin_24(6:10,7)*1E11;apin_24(11:15,7)*1E7];
% bb_t_10=num2str(m_t_10);
% cc_t_10 = cellstr(bb_t_10);
% xlim([0 51])
% %legend('OH(E6)-2,5,10,50,100 ', 'O3(E11)-1,5,10,50,100', 'NO3(E7)-1,5,10,50,100','OH','O3', 'NO3')
% dx = 0.15; dy = 0.15;
% % text(apin_24(46:60,5)+dx, apin_24(46:60,6)+dy, cc_t_24,  'VerticalAlignment','bottom', 'HorizontalAlignment','right')
% % text(apin_10s(46:60,5)+dx, apin_10s(46:60,6)+dy, cc_t_10,  'VerticalAlignment','bottom', 'HorizontalAlignment','right')
% 
% % lh = legend('10 sec(OH: 2,5,10,50,100 * 1E6)', '10 sec (O3: 1,5,10,50,100 * E11)', '10 sec (NO3: 1,5,10,50,100 * E7)') %,....
% %          %'24 hr(OH: 2,5,10,50,100 * 1E6)','24 hr(O3: 1,5,10,50,100 * E11)', '24 hr(NO3: 1,5,10,50,100 *E7)')
% % set(lh,'Location','NorthWest', 'FontWeight', 'bold') 
% 
% title('Alpha-pinene 50 ppb')
% xlabel('Reacted(ppb)','FontSize',20,'FontWeight','bold','Color','k')
% ylabel('Mass yields(%)','FontSize',20,'FontWeight','bold','Color','k')
% set(gca,'FontSize',20,'FontWeight','bold')
% % 
% % cb=colorbar;
% % four_colors=jet(4);
% % four_colors=[rgb('Red');rgb('Blue');rgb('Black')];
% % colormap(jet);
% % cb.Ticks=1/4*(1:3);
% % cb.TickLabels={'OH';'O_3';'NO_3'};
% % ax_pos=get(gca,'position');
% %  ax_pos(3)=ax_pos(3)*1.0;   
% %  set(gca,'position',ax_pos);
%  
% % handaxes2 = axes('position',  [0.25 0.6 0.25 0.25]);
% % set(gca, 'fontsize', [14], 'linewidth', [1])
% % hold all
% % 
% % s1 = scatter(apin(46:50,5),apin(46:50,10),sz1, 'filled','c' ,'MarkerFaceColor','r'); hold on;
% % s2 = scatter(apin(51:55,5),apin(51:55,10),sz1, 'filled','s' ,'MarkerFaceColor','b'); hold on;
% % s3 = scatter(apin(56:60,5),apin(56:60,10),sz1, 'filled','d' ,'MarkerFaceColor','k'); hold on;
% % s4 = scatter(apin_24(1:5,5), apin_24(1:5,10),sz1,'p','MarkerFaceColor','m'); hold on;
% % s5 = scatter(apin_24(6:10,5), apin_24(6:10,10),sz1,'h','MarkerFaceColor','c'); hold on;
% % s6 = scatter(apin_24(11:15,5), apin_24(11:15,10),sz1, 'v','MarkerFaceColor','g'); hold on;
% % % 
% % 
% % set(handaxes2, 'box', 'on');
% % xlim([0 51]); 
% % xlabel('Reacted (ppb)','FontSize',12,'FontWeight','bold','Color','k')
% % ylabel('Mass change (\mug/ m^3)','FontSize',12,'FontWeight','bold','Color','k')
% % set(gca,'FontSize',14,'FontWeight','bold')
% 
% % subplot(2,1,2) % plot for mcm+homs
% % h  = scatter(apin_24(1:5,5), apin_24(1:5,6), sz, 'filled','c' ,'MarkerFaceColor','r');hold on;
% % h  = scatter(apin_24(6:10,5), apin_24(6:10,6), sz, 'filled','s' ,'MarkerFaceColor','b');hold on;
% % h  = scatter(apin_24(11:15,5), apin_24(11:15,6), sz, 'filled','d' ,'MarkerFaceColor','k');hold on
% % grid on
% % xlim([0 51])
% % % legend('OH(E6)-2,5,10,50,100 ', 'O3(E11)-1,5,10,50,100', 'NO3(E7)-1,5,10,50,100 ')
% %  
% % title('50 ppb')
% % xlabel('apinene concentrations reacted (ppb)','FontSize',16,'FontWeight','bold','Color','k')
% % ylabel('Mass yields(%)','FontSize',16,'FontWeight','bold','Color','k')
% % set(gca,'FontSize',14,'FontWeight','bold')
% % 
% % cb=colorbar;
% % four_colors=jet(4);
% % four_colors=[rgb('Red');rgb('Blue');rgb('Black')];
% % colormap(four_colors);
% % cb.Ticks=1/4*(1:3);
% % cb.TickLabels={'OH';'O_3';'NO_3'};
% % ax_pos=get(gca,'position');
% %  ax_pos(3)=ax_pos(3)*1.0;   
% %  set(gca,'position',ax_pos);
%  
% % handaxes2 = axes('position', [0.2 0.2 0.25 0.25]);
% % set(gca, 'fontsize', [14], 'linewidth', [1])
% % hold all
% % 
% % s1 = scatter(apin_24(1:5,5), apin_24(1:5,10),sz1, 'filled','c' ,'MarkerFaceColor','r'); hold on;
% % s2 = scatter(apin_24(6:10,5), apin_24(6:10,10),sz1, 'filled','s' ,'MarkerFaceColor','b'); hold on;
% % s3 = scatter(apin_24(11:15,5), apin_24(11:15,10),sz1, 'filled','d' ,'MarkerFaceColor','k'); hold on;
% % 
% % 
% % set(handaxes2, 'box', 'on');
% % xlim([0 51]); 
% % xlabel('apinene concentrations reacted (ppb)','FontSize',16,'FontWeight','bold','Color','k')
% % ylabel('Mass change (\mug/ m^3)','FontSize',16,'FontWeight','bold','Color','k')
% % set(gca,'FontSize',14,'FontWeight','bold')
