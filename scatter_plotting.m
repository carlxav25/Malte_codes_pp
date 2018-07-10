close all 
clear all
clc

is = 0 ;
ap = 0 ;
li = 0 ;
bc = 1;

isop   = load(['/home/local/carltonx/Work/Malte_box/Project_runs/New_results/isoprene_data.dat']);
apin   = load(['/home/local/carltonx/Work/Malte_box/Project_runs/New_results/apinene_data.dat']);
lime   = load(['/home/local/carltonx/Work/Malte_box/Project_runs/New_results/limonene_data.dat']);
bcar   = load(['/home/local/carltonx/Work/Malte_box/Project_runs/New_results/bcary_data.dat']);

clrs = ['rbk'];
Mrkr = '>os.<';
sz  = linspace(80,400,5);
sz1 = linspace(80,400,5);

if is == 1;
    

figure(1) % 5 PPB
clf
box on
set(gca, 'fontsize', [20], 'linewidth', [2])
hold all

h  = scatter(isop(1:5,5), isop(1:5,6), sz, 'filled','c' ,'MarkerFaceColor','r');hold on;
h  = scatter(isop(6:10,5), isop(6:10,6), sz, 'filled','s' ,'MarkerFaceColor','b');hold on;
h  = scatter(isop(11:15,5), isop(11:15,6), sz, 'filled','d' ,'MarkerFaceColor','k');hold on


xlim([0 5.5])
% ylim([-1 300])
legend('OH(E6)', 'O3(E11)', 'NO3(E7)') 
title('5 ppb')
xlabel('Isoprene concentrations reacted (ppb)')
ylabel('Mass yields (%)')

handaxes2 = axes('position', [0.5 0.6 0.3 0.2]);
% set(gca, 'fontsize', [20], 'linewidth', [2])
hold all

s1 = scatter(isop(1:5,5),isop(1:5,10),sz1, 'filled','c' ,'MarkerFaceColor','r'); hold on;
s2 = scatter(isop(6:10,5),isop(6:10,10),sz1, 'filled','s' ,'MarkerFaceColor','b'); hold on;
s3 = scatter(isop(11:15,5),isop(11:15,10),sz1, 'filled','d' ,'MarkerFaceColor','k'); hold on;


set(handaxes2, 'box', 'on');
xlim([0 5.5]); % ylim([-10 170])
xlabel('Isoprene concentrations reacted (ppb)')
ylabel('Mass change (\mug/ m^3)')

figure(2) % 50 PPB
clf
box on
set(gca, 'fontsize', [20], 'linewidth', [2])
hold all

h  = scatter(isop(16:20,5), isop(16:20,6), sz, 'filled','c' ,'MarkerFaceColor','r');hold on;
h  = scatter(isop(21:25,5), isop(21:25,6), sz, 'filled','s' ,'MarkerFaceColor','b');hold on;
h  = scatter(isop(26:30,5), isop(26:30,6), sz, 'filled','d' ,'MarkerFaceColor','k');hold on

xlim([0 51])
%ylim([-1 300])
 
legend('OH(E6)-2,5,10,50,100 ', 'O3(E11)-1,5,10,50,100', 'NO3(E7)-1,5,10,50,100 ')
       
title('50 ppb')
xlabel('Isoprene concentrations reacted (ppb)')
ylabel('Mass yields(%)')

handaxes2 = axes('position', [0.5 0.6 0.3 0.2]);
% set(gca, 'fontsize', [20], 'linewidth', [2])
hold all

s1 = scatter(isop(16:20,5),isop(16:20,10),sz1, 'filled','c' ,'MarkerFaceColor','r'); hold on;
s2 = scatter(isop(21:25,5),isop(21:25,10),sz1, 'filled','s' ,'MarkerFaceColor','b'); hold on;
s3 = scatter(isop(26:30,5),isop(26:30,10),sz1, 'filled','d' ,'MarkerFaceColor','k'); hold on;


set(handaxes2, 'box', 'on');
xlim([0 51]); %ylim([-10 170])
xlabel('Isoprene concentrations reacted (ppb)')
ylabel('Mass change (\mug/ m^3)')



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(3) % 100 PPB
clf
box on
set(gca, 'fontsize', [20], 'linewidth', [2])
hold all

h  = scatter(isop(31:35,5), isop(31:35,6), sz, 'filled','c' ,'MarkerFaceColor','r');hold on;
h  = scatter(isop(36:40,5), isop(36:40,6), sz, 'filled','s' ,'MarkerFaceColor','b');hold on;
h  = scatter(isop(41:45,5), isop(41:45,6), sz, 'filled','d' ,'MarkerFaceColor','k');hold on

legend('OH', 'O3', 'NO3')
       

xlim([0 101])
 
title('100 ppb')
xlabel('Isoprene concentrations reacted (ppb)')
ylabel('Mass yields(%)')

handaxes2 = axes('position', [0.4 0.6 0.2 0.2]);
% set(gca, 'fontsize', [20], 'linewidth', [2])
hold all

s1 = scatter(isop(31:35,5),isop(31:35,10),sz1, 'filled','c' ,'MarkerFaceColor','r'); hold on;
s2 = scatter(isop(36:40,5),isop(36:40,10),sz1, 'filled','s' ,'MarkerFaceColor','b'); hold on;
s3 = scatter(isop(41:45,5),isop(41:45,10),sz1, 'filled','d' ,'MarkerFaceColor','k'); hold on;


set(handaxes2, 'box', 'on');
xlim([0 101]); %ylim([-10 170])
xlabel('Isoprene concentrations reacted (ppb)')
ylabel('Mass change (\mug/ m^3)')

%%%%%%%%%%%%%%%%%%%%%%%%%
figure(4) % 50 PPB
clf
box on
set(gca, 'fontsize', [20], 'linewidth', [2])
hold all

h  = scatter(isop(46:50,5), isop(46:50,6), sz, 'filled','c' ,'MarkerFaceColor','r');hold on;
h  = scatter(isop(51:55,5), isop(51:55,6), sz, 'filled','s' ,'MarkerFaceColor','b');hold on;
h  = scatter(isop(56:60,5), isop(56:60,6), sz, 'filled','d' ,'MarkerFaceColor','k');hold on

legend('OH', 'O3', 'NO3')
xlim([0 201])

 
title('200 ppb')
xlabel('Isoprene concentrations reacted (ppb)')
ylabel('Mass yields(%)')

handaxes2 = axes('position', [0.4 0.6 0.2 0.2]);
% set(gca, 'fontsize', [20], 'linewidth', [2])
hold all

s1 = scatter(isop(46:50,5),isop(46:50,10),sz1, 'filled','c' ,'MarkerFaceColor','r'); hold on;
s2 = scatter(isop(51:55,5),isop(51:55,10),sz1, 'filled','s' ,'MarkerFaceColor','b'); hold on;
s3 = scatter(isop(56:60,5),isop(56:60,10),sz1, 'filled','d' ,'MarkerFaceColor','k'); hold on;


set(handaxes2, 'box', 'on');
xlim([0 201]); %ylim([-10 170])
xlabel('Isoprene concentrations reacted (ppb)')
ylabel('Mass change (\mug/ m^3)')

end
   
if ap == 1
    
figure(1) % 0.5 PPB
clf
box on
set(gca, 'fontsize', [20], 'linewidth', [2])
hold all

h  = scatter(apin(1:5,5), apin(1:5,6), sz, 'filled','c' ,'MarkerFaceColor','r');hold on;

h  = scatter(apin(6:10,5), apin(6:10,6), sz, 'filled','s' ,'MarkerFaceColor','b');hold on;

h  = scatter(apin(11:15,5), apin(11:15,6), sz, 'filled','d' ,'MarkerFaceColor','k');hold on


xlim([0 0.6])
% ylim([-1 300])
 
title('0.5 ppb')
xlabel('apinene concentrations reacted (ppb)')
ylabel('Mass yields (%)')

handaxes2 = axes('position', [0.5 0.6 0.3 0.2]);
% set(gca, 'fontsize', [20], 'linewidth', [2])
hold all

s1 = scatter(apin(1:5,5),apin(1:5,10),sz1, 'filled','c' ,'MarkerFaceColor','r'); hold on;
s2 = scatter(apin(6:10,5),apin(6:10,10),sz1, 'filled','s' ,'MarkerFaceColor','b'); hold on;
s3 = scatter(apin(11:15,5),apin(11:15,10),sz1, 'filled','d' ,'MarkerFaceColor','k'); hold on;


set(handaxes2, 'box', 'off');
xlim([0 0.6]); % ylim([-10 170])
xlabel('apinene concentrations reacted (ppb)')
ylabel('Mass change (\mug/ m^3)')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(2) % 1 PPB
clf
box on
set(gca, 'fontsize', [20], 'linewidth', [2])
hold all

h  = scatter(apin(16:20,5), apin(16:20,6),  sz, 'filled','c' ,'MarkerFaceColor','r');hold on;

h  = scatter(apin(21:25,5), apin(21:25,6), sz, 'filled','s' ,'MarkerFaceColor','b');hold on;

h  = scatter(apin(26:30,5), apin(26:30,6), sz, 'filled','d' ,'MarkerFaceColor','k');hold on

xlim([0 1.05])
%ylim([-1 300])
 
legend('OH(E6)-2,5,10,50,100 ', 'O3(E11)-1,5,10,50,100', 'NO3(E7)-1,5,10,50,100 ')
       
title('1 ppb')
xlabel('apinene concentrations reacted (ppb)')
ylabel('Mass yields(%)')

handaxes2 = axes('position', [0.5 0.6 0.3 0.2]);
% set(gca, 'fontsize', [20], 'linewidth', [2])
hold all

s1 = scatter(apin(16:20,5),apin(1:5,10),sz1, 'filled','c' ,'MarkerFaceColor','r'); hold on;
s2 = scatter(apin(21:25,5),apin(6:10,10),sz1, 'filled','s' ,'MarkerFaceColor','b'); hold on;
s3 = scatter(apin(26:30,5),apin(11:15,10),sz1, 'filled','d' ,'MarkerFaceColor','k'); hold on;


set(handaxes2, 'box', 'off');
xlim([0 1.05]); %ylim([-10 170])
xlabel('apinene concentrations reacted (ppb)')
ylabel('Mass change (\mug/ m^3)')



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(3) % 5 PPB
clf
box on
set(gca, 'fontsize', [20], 'linewidth', [2])
hold all

h  = scatter(apin(31:35,5), apin(31:35,6),  sz, 'filled','c' ,'MarkerFaceColor','r');hold on;

h  = scatter(apin(36:40,5), apin(36:40,6), sz, 'filled','s' ,'MarkerFaceColor','b');hold on;

h  = scatter(apin(41:45,5), apin(41:45,6), sz, 'filled','d' ,'MarkerFaceColor','k');hold on

legend('OH', 'O3', 'NO3')


xlim([0 5.1])
 
title('5 ppb')
xlabel('apinene concentrations reacted (ppb)')
ylabel('Mass yields(%)')

handaxes2 = axes('position', [0.5 0.6 0.3 0.2]);
% set(gca, 'fontsize', [20], 'linewidth', [2])
hold all

s1 = scatter(apin(31:35,5),apin(31:35,10),sz1, 'filled','c' ,'MarkerFaceColor','r'); hold on;
s2 = scatter(apin(36:40,5),apin(36:40,10),sz1, 'filled','s' ,'MarkerFaceColor','b'); hold on;
s3 = scatter(apin(41:45,5),apin(41:45,10),sz1, 'filled','d' ,'MarkerFaceColor','k'); hold on;


set(handaxes2, 'box', 'off');
xlim([0 5.1]); %ylim([-10 170])
xlabel('apinene concentrations reacted (ppb)')
ylabel('Mass change (\mug/ m^3)')

%%%%%%%%%%%%%%%%%%%%%%%%%
figure(4) % 50 PPB
clf
box on
set(gca, 'fontsize', [20], 'linewidth', [2])
hold all

h  = scatter(apin(46:50,5), apin(46:50,6), sz, 'filled','c' ,'MarkerFaceColor','r');hold on;
h  = scatter(apin(51:55,5), apin(51:55,6), sz, 'filled','s' ,'MarkerFaceColor','b');hold on;
h  = scatter(apin(56:60,5), apin(56:60,6), sz, 'filled','d' ,'MarkerFaceColor','k');hold on

xlim([0 51])
legend('OH(E6)-2,5,10,50,100 ', 'O3(E11)-1,5,10,50,100', 'NO3(E7)-1,5,10,50,100 ')
 
title('50 ppb')
xlabel('apinene concentrations reacted (ppb)')
ylabel('Mass yields(%)')

handaxes2 = axes('position', [0.3 0.4 0.3 0.3]);
set(gca, 'fontsize', [14], 'linewidth', [1])
hold all

s1 = scatter(apin(46:50,5),apin(46:50,10),sz1, 'filled','c' ,'MarkerFaceColor','r'); hold on;
s2 = scatter(apin(51:55,5),apin(51:55,10),sz1, 'filled','s' ,'MarkerFaceColor','b'); hold on;
s3 = scatter(apin(56:60,5),apin(56:60,10),sz1, 'filled','d' ,'MarkerFaceColor','k'); hold on;


set(handaxes2, 'box', 'on');
xlim([0 51]); %ylim([-10 170])
xlabel('apinene concentrations reacted (ppb)')
ylabel('Mass change (\mug/ m^3)')

%%%%%%%%%%%%%%%%%%%%%%%%
figure(5); % 100 PPB
clf
box on
set(gca, 'fontsize', [20], 'linewidth', [2])
hold all

h  = scatter(apin(61:65,5), apin(61:65,6),   sz, 'filled','c' ,'MarkerFaceColor','r');hold on;
h  = scatter(apin(66:70,5), apin(66:70,6),  sz, 'filled', 's' ,'MarkerFaceColor','b');hold on;
h  = scatter(apin(71:75,5), apin(71:75,6),  sz, 'filled', 'd' ,'MarkerFaceColor','k');hold on

legend('OH', 'O3', 'NO3')

xlim([0 101])
% ylim([-1 300])
 
title('100 ppb')
xlabel('apinene concentrations reacted (ppb)')
ylabel('Mass yields(%)')

handaxes2 = axes('position', [0.6 0.6 0.2 0.2]);
set(gca, 'fontsize', [10], 'linewidth', [1])
hold all

s1 = scatter(apin(61:65,5),apin(61:65,10),sz1, 'filled','c' ,'MarkerFaceColor','r'); hold on;
s2 = scatter(apin(66:70,5),apin(66:70,10),sz1, 'filled','s' ,'MarkerFaceColor','b'); hold on;
s3 = scatter(apin(71:75,5),apin(71:75,10),sz1, 'filled','d' ,'MarkerFaceColor','k'); hold on;


set(handaxes2, 'box', 'off');
xlim([0 101]); %ylim([-0.05 1])
xlabel('apinene concentrations reacted (ppb)')
ylabel('Mass change(\mug/ m^3)')



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(6) % 200 PPB
clf
box on
set(gca, 'fontsize', [20], 'linewidth', [2])
hold all

h  = scatter(apin(76:80,5), apin(76:80,6),   sz, 'filled','c' ,'MarkerFaceColor','r');hold on;
h  = scatter(apin(81:85,5), apin(81:85,6),  sz, 'filled','s' ,'MarkerFaceColor','b');hold on;
h  = scatter(apin(86:90,5), apin(86:90,6),  sz, 'filled','d' ,'MarkerFaceColor','k');hold on

legend('OH', 'O3', 'NO3')
      

xlim([0 201])
%ylim([-1 300])
 
title('200 ppb')
xlabel('apinene concentrations reacted (ppb)')
ylabel('Mass yields(%)')

handaxes2 = axes('position', [0.6 0.6 0.2 0.2]);
set(gca, 'fontsize', [10], 'linewidth', [1])
hold all

s1 = scatter(apin(76:80,5),apin(76:80,10),sz1, 'filled','c' ,'MarkerFaceColor','r'); hold on;
s2 = scatter(apin(81:85,5),apin(81:85,10),sz1, 'filled','s' ,'MarkerFaceColor','b'); hold on;
s3 = scatter(apin(86:90,5),apin(86:90,10),sz1, 'filled','d' ,'MarkerFaceColor','k'); hold on;


set(handaxes2, 'box', 'off');
xlim([0 201]); %ylim([-0.05 1])
xlabel('apinene concentrations reacted (ppb)')
ylabel('Mass change(\mug/ m^3)')
end
 
%%%%%% limonene case    

if li == 1
    
figure(1) % 1 PPB
clf
box on
set(gca, 'fontsize', [20], 'linewidth', [2])
hold all

h  = scatter(lime(1:5,5), lime(1:5,6), sz, 'filled','c' ,'MarkerFaceColor','r');hold on;
h  = scatter(lime(6:10,5), lime(6:10,6), sz, 'filled','s' ,'MarkerFaceColor','b');hold on;
h  = scatter(lime(11:15,5), lime(11:15,6), sz, 'filled','d' ,'MarkerFaceColor','k');hold on


xlim([0 1.1])
legend('OH(E6)-2,5,10,50,100 ', 'O3(E11)-1,5,10,50,100', 'NO3(E7)-1,5,10,50,100 ')
title('1 ppb')
xlabel('Limonene concentrations reacted (ppb)')
ylabel('Mass yields')

handaxes2 = axes('position', [0.5 0.6 0.3 0.2]);
% set(gca, 'fontsize', [20], 'linewidth', [2])
hold all

s1 = scatter(lime(1:5,5),  lime(1:5,10),  sz1, 'filled','c' ,'MarkerFaceColor','r'); hold on;
s2 = scatter(lime(6:10,5), lime(6:10,10), sz1, 'filled','s' ,'MarkerFaceColor','b'); hold on;
s3 = scatter(lime(11:15,5),lime(11:15,10),sz1, 'filled','d' ,'MarkerFaceColor','k'); hold on;


set(handaxes2, 'box', 'on');
xlim([0 1.1]); %ylim([-10 170])
xlabel('Limonene concentrations reacted (ppb)')
ylabel('Mass change (\mug/ m^3)')


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(2) % 5 PPB
clf
box on
set(gca, 'fontsize', [20], 'linewidth', [2])
hold all

h  = scatter(lime(16:20,5), lime(16:20,6), sz, 'filled','c' ,'MarkerFaceColor','r');hold on;
h  = scatter(lime(21:25,5), lime(21:25,6), sz, 'filled','s' ,'MarkerFaceColor','b');hold on;
h  = scatter(lime(26:30,5), lime(26:30,6), sz, 'filled','d' ,'MarkerFaceColor','k');hold on

xlim([0 5.1])
%ylim([-1 300])
 
legend('OH(E6)-2,5,10,50,100 ', 'O3(E11)-1,5,10,50,100', 'NO3(E7)-1,5,10,50,100 ')
       
title('5 ppb')
xlabel('Limonene concentrations reacted (ppb)')
ylabel('Mass yields')

handaxes2 = axes('position', [0.5 0.6 0.3 0.2]);
% set(gca, 'fontsize', [20], 'linewidth', [2])
hold all

s1 = scatter(lime(16:20,5),lime(16:20,10),sz1, 'filled','c' ,'MarkerFaceColor','r'); hold on;
s2 = scatter(lime(21:25,5),lime(21:25,10),sz1, 'filled','s' ,'MarkerFaceColor','b'); hold on;
s3 = scatter(lime(26:30,5),lime(26:30,10),sz1, 'filled','d' ,'MarkerFaceColor','k'); hold on;


set(handaxes2, 'box', 'on');
xlim([0 5.1]); %ylim([-10 170])
xlabel('Limonene concentrations reacted (ppb)')
ylabel('Mass change (\mug/ m^3)')






%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(3) % 50 PPB
clf
box on
set(gca, 'fontsize', [20], 'linewidth', [2])
hold all

h  = scatter(lime(31:35,5), lime(31:35,6), sz, 'filled','c' ,'MarkerFaceColor','r');hold on;
h  = scatter(lime(36:40,5), lime(36:40,6), sz, 'filled','s' ,'MarkerFaceColor','b');hold on;
h  = scatter(lime(41:45,5), lime(41:45,6), sz, 'filled','d' ,'MarkerFaceColor','k');hold on

legend('OH(E6)-2,5,10,50,100 ', 'O3(E11)-1,5,10,50,100', 'NO3(E7)-1,5,10,50,100 ') 
xlim([0 51])
 
title('50 ppb')
xlabel('Limonene concentrations reacted (ppb)')
ylabel('Mass yields')

handaxes2 = axes('position', [0.5 0.6 0.3 0.2]);
% set(gca, 'fontsize', [20], 'linewidth', [2])
hold all

s1 = scatter(lime(31:35,5),lime(31:35,10),sz1, 'filled','c' ,'MarkerFaceColor','r'); hold on;
s2 = scatter(lime(36:40,5),lime(36:40,10),sz1, 'filled','s' ,'MarkerFaceColor','b'); hold on;
s3 = scatter(lime(41:45,5),lime(41:45,10),sz1, 'filled','d' ,'MarkerFaceColor','k'); hold on;


set(handaxes2, 'box', 'on');
xlim([0 51]); %ylim([-10 170])
xlabel('Limonene concentrations reacted (ppb)')
ylabel('Mass change (\mug/ m^3)')



figure(4) % 100 PPB
clf
box on
set(gca, 'fontsize', [20], 'linewidth', [2])
hold all

h  = scatter(lime(46:50,5), lime(46:50,6), sz, 'filled','c' ,'MarkerFaceColor','r');hold on;
h  = scatter(lime(51:55,5), lime(51:55,6), sz, 'filled','s' ,'MarkerFaceColor','b');hold on;
h  = scatter(lime(56:60,5), lime(56:60,6), sz, 'filled','d' ,'MarkerFaceColor','k');hold on;

legend('OH(E6)-2,5,10,50,100 ', 'O3(E11)-1,5,10,50,100', 'NO3(E7)-1,5,10,50,100 ')    
xlim([0 105])
title('100 ppb')
xlabel('Limonene concentrations reacted (ppb)')
ylabel('Mass yields')

handaxes2 = axes('position', [0.5 0.6 0.3 0.2]);
% set(gca, 'fontsize', [20], 'linewidth', [2])
hold all

s1 = scatter(lime(46:50,5),lime(46:50,10),sz1, 'filled','c' ,'MarkerFaceColor','r'); hold on;
s2 = scatter(lime(51:55,5),lime(51:55,10),sz1, 'filled','s' ,'MarkerFaceColor','b'); hold on;
s3 = scatter(lime(56:60,5),lime(56:60,10),sz1, 'filled','d' ,'MarkerFaceColor','k'); hold on;


set(handaxes2, 'box', 'on');
xlim([0 105]); %ylim([-10 170])
xlabel('Limonene concentrations reacted (ppb)')
ylabel('Mass change (\mug/ m^3)')


figure(5); % 200 PPB
clf
box on
set(gca, 'fontsize', [20], 'linewidth', [2])
hold all

h  = scatter(lime(61:65,5), lime(61:65,6),  sz, 'filled', 'c' ,'MarkerFaceColor','r');hold on;
h  = scatter(lime(66:70,5), lime(66:70,6),  sz, 'filled', 's' ,'MarkerFaceColor','b');hold on;
h  = scatter(lime(71:75,5), lime(71:75,6),  sz, 'filled', 'd' ,'MarkerFaceColor','k');hold on;

legend('OH(E6)-2,5,10,50,100 ', 'O3(E11)-1,5,10,50,100', 'NO3(E7)-1,5,10,50,100 ') 

xlim([0 205])
% ylim([-1 300])
 
title('200 ppb')
xlabel('Limonene concentrations reacted (ppb)')
ylabel('Mass yields')

handaxes2 = axes('position', [0.6 0.6 0.2 0.2]);
%set(gca, 'fontsize', [10], 'linewidth', [1])
hold all

 s1 = scatter(lime(61:65,5),lime(61:65,10),sz1, 'filled','c' ,'MarkerFaceColor','r'); hold on;
 s2 = scatter(lime(66:70,5),lime(66:70,10),sz1, 'filled','s' ,'MarkerFaceColor','b'); hold on;
 s3 = scatter(lime(71:75,5),lime(71:75,10),sz1, 'filled','d' ,'MarkerFaceColor','k'); hold on;


 set(handaxes2, 'box', 'on');
 xlim([0 205]); %ylim([-0.05 1])
xlabel('Limonene concentrations reacted (ppb)')
ylabel('Mass change')

end

if bc == 1 
   
    figure(1) % 0.1 PPB
clf
box on
set(gca, 'fontsize', [20], 'linewidth', [2])
hold all

h  = scatter(bcar(1:5,5), bcar(1:5,6), sz, 'filled','c' ,'MarkerFaceColor','r');hold on;
h  = scatter(bcar(6:10,5), bcar(6:10,6), sz, 'filled','s' ,'MarkerFaceColor','b');hold on;
h  = scatter(bcar(11:15,5), bcar(11:15,6), sz, 'filled','d' ,'MarkerFaceColor','k');hold on


xlim([0 0.15])
% ylim([-1 300])
legend('OH', 'O3', 'NO3') 
title('0.1 ppb')
xlabel('B-Carp concentrations reacted (ppb)')
ylabel('Mass yields (%)')

handaxes2 = axes('position', [0.5 0.6 0.3 0.2]);
% set(gca, 'fontsize', [20], 'linewidth', [2])
hold all

s1 = scatter(bcar(1:5,5),bcar(1:5,10),sz1, 'filled','c' ,'MarkerFaceColor','r'); hold on;
s2 = scatter(bcar(6:10,5),bcar(6:10,10),sz1, 'filled','s' ,'MarkerFaceColor','b'); hold on;
s3 = scatter(bcar(11:15,5),bcar(11:15,10),sz1, 'filled','d' ,'MarkerFaceColor','k'); hold on;


set(handaxes2, 'box', 'on');
xlim([0 0.15]); % ylim([-10 170])
xlabel('B-Carp concentrations reacted (ppb)')
ylabel('Mass change (\mug/ m^3)')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(2) % 0.5 PPB
clf
box on
set(gca, 'fontsize', [20], 'linewidth', [2])
hold all

h  = scatter(bcar(16:20,5), bcar(16:20,6), sz, 'filled','c' ,'MarkerFaceColor','r');hold on;
h  = scatter(bcar(21:25,5), bcar(21:25,6), sz, 'filled','s' ,'MarkerFaceColor','b');hold on;
h  = scatter(bcar(26:30,5), bcar(26:30,6), sz, 'filled','d' ,'MarkerFaceColor','k');hold on

xlim([0 0.55])
%ylim([-1 300])
 
legend('OH(E6)-2,5,10,50,100 ', 'O3(E11)-1,5,10,50,100', 'NO3(E7)-1,5,10,50,100 ')
       
title('0.5 ppb')
xlabel('B-Carp concentrations reacted (ppb)')
ylabel('Mass yields(%)')

handaxes2 = axes('position', [0.5 0.6 0.3 0.2]);
% set(gca, 'fontsize', [20], 'linewidth', [2])
hold all

s1 = scatter(bcar(16:20,5),bcar(1:5,10),sz1, 'filled','c' ,'MarkerFaceColor','r'); hold on;
s2 = scatter(bcar(21:25,5),bcar(6:10,10),sz1, 'filled','s' ,'MarkerFaceColor','b'); hold on;
s3 = scatter(bcar(26:30,5),bcar(11:15,10),sz1, 'filled','d' ,'MarkerFaceColor','k'); hold on;


set(handaxes2, 'box', 'on');
xlim([0 0.55]); %ylim([-10 170])
xlabel('B-Carp concentrations reacted (ppb)')
ylabel('Mass change (\mug/ m^3)')



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(3) % 2 PPB
clf
box on
set(gca, 'fontsize', [20], 'linewidth', [2])
hold all

h  = scatter(bcar(31:35,5), bcar(31:35,6),  sz, 'filled','c' ,'MarkerFaceColor','r');hold on;
h  = scatter(bcar(36:40,5), bcar(36:40,6), sz, 'filled','s' ,'MarkerFaceColor','b');hold on;
h  = scatter(bcar(41:45,5), bcar(41:45,6), sz, 'filled','d' ,'MarkerFaceColor','k');hold on

legend('OH', 'O3', 'NO3')


xlim([0 2.1])
 
title('5 ppb')
xlabel('B-Carp concentrations reacted (ppb)')
ylabel('Mass yields(%)')

handaxes2 = axes('position', [0.5 0.6 0.3 0.2]);
% set(gca, 'fontsize', [20], 'linewidth', [2])
hold all

s1 = scatter(bcar(31:35,5),bcar(31:35,10),sz1, 'filled','c' ,'MarkerFaceColor','r'); hold on;
s2 = scatter(bcar(36:40,5),bcar(36:40,10),sz1, 'filled','s' ,'MarkerFaceColor','b'); hold on;
s3 = scatter(bcar(41:45,5),bcar(41:45,10),sz1, 'filled','d' ,'MarkerFaceColor','k'); hold on;


set(handaxes2, 'box', 'on');
xlim([0 2.1]); %ylim([-10 170])
xlabel('B-Carp concentrations reacted (ppb)')
ylabel('Mass change (\mug/ m^3)')

%%%%%%%%%%%%%%%%%%%%%%%%%
figure(4) % 5 PPB
clf
box on
set(gca, 'fontsize', [20], 'linewidth', [2])
hold all

h  = scatter(bcar(46:50,5), bcar(46:50,6), sz, 'filled','c' ,'MarkerFaceColor','r');hold on;
h  = scatter(bcar(51:55,5), bcar(51:55,6), sz, 'filled','s' ,'MarkerFaceColor','b');hold on;
h  = scatter(bcar(56:60,5), bcar(56:60,6), sz, 'filled','d' ,'MarkerFaceColor','k');hold on

legend('OH', 'O3', 'NO3')
xlim([0 5.1])

 
title('5 ppb')
xlabel('B-Carp concentrations reacted (ppb)')
ylabel('Mass yields(%)')

handaxes2 = axes('position', [0.5 0.6 0.3 0.2]);
% set(gca, 'fontsize', [20], 'linewidth', [2])
hold all

s1 = scatter(bcar(46:50,5),bcar(46:50,10),sz1, 'filled','c' ,'MarkerFaceColor','r'); hold on;
s2 = scatter(bcar(51:55,5),bcar(51:55,10),sz1, 'filled','s' ,'MarkerFaceColor','b'); hold on;
s3 = scatter(bcar(56:60,5),bcar(56:60,10),sz1, 'filled','d' ,'MarkerFaceColor','k'); hold on;


%%%%%%%%%%%%%%%%%%%%%%%%
figure(5); % 10 PPB
clf
box on
set(gca, 'fontsize', [20], 'linewidth', [2])
hold all

h  = scatter(bcar(61:65,5), bcar(61:65,6),   sz, 'filled','c' ,'MarkerFaceColor','r');hold on;
h  = scatter(bcar(66:70,5), bcar(66:70,6),  sz, 'filled', 's' ,'MarkerFaceColor','b');hold on;
h  = scatter(bcar(71:75,5), bcar(71:75,6),  sz, 'filled', 'd' ,'MarkerFaceColor','k');hold on

legend('OH', 'O3', 'NO3')

xlim([0 10.1])
% ylim([-1 300])
 
title('10 ppb')
xlabel('B-Carp concentrations reacted (ppb)')
ylabel('Mass yields(%)')

handaxes2 = axes('position', [0.6 0.6 0.2 0.2]);
set(gca, 'fontsize', [10], 'linewidth', [1])
hold all

s1 = scatter(bcar(61:65,5),bcar(61:65,10),sz1, 'filled','c' ,'MarkerFaceColor','r'); hold on;
s2 = scatter(bcar(66:70,5),bcar(66:70,10),sz1, 'filled','s' ,'MarkerFaceColor','b'); hold on;
s3 = scatter(bcar(71:75,5),bcar(71:75,10),sz1, 'filled','d' ,'MarkerFaceColor','k'); hold on;


set(handaxes2, 'box', 'on');
xlim([0 10.1]); %ylim([-0.05 1])
xlabel('B-Carp concentrations reacted (ppb)')
ylabel('Mass change(\mug/ m^3)')
    
end
