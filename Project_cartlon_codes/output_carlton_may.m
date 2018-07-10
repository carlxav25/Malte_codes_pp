close all
clear all

clc

apin_10s   = load(['/home/local/carltonx/Work/Malte_box/Project_runs/New_results/Correct_runs/hom_cham_runs/main_data_hom/final_api.txt']);
bcar_10s   = load(['/home/local/carltonx/Work/Malte_box/Project_runs/New_results/Correct_runs/hom_cham_runs/main_data_hom/final_bcar.txt']);
lim_10s   = load(['/home/local/carltonx/Work/Malte_box/Project_runs/New_results/Correct_runs/hom_cham_runs/main_data_hom/final_lim.txt']);
iso_10s   = load(['/home/local/carltonx/Work/Malte_box/Project_runs/New_results/Correct_runs/hom_cham_runs/main_data_hom/final_iso.txt']);
bpi_10s   = load(['/home/local/carltonx/Work/Malte_box/Project_runs/New_results/Correct_runs/hom_cham_runs/main_data_hom/final_bpi.txt']);

% apin_10s   = load(['/home/local/carltonx/Work/Malte_box/Project_runs/New_results/Correct_runs/mcm_cham_runs/main_data/api_mcm.dat']);
% bcar_10s   = load(['/home/local/carltonx/Work/Malte_box/Project_runs/New_results/Correct_runs/mcm_cham_runs/main_data/bca_mcm.dat']);
% lim_10s   = load(['/home/local/carltonx/Work/Malte_box/Project_runs/New_results/Correct_runs/mcm_cham_runs/main_data/lim_mcm.dat']);
% iso_10s   = load(['/home/local/carltonx/Work/Malte_box/Project_runs/New_results/Correct_runs/mcm_cham_runs/main_data/iso_mcm.dat']);
% bpi_10s   = load(['/home/local/carltonx/Work/Malte_box/Project_runs/New_results/Correct_runs/mcm_cham_runs/main_data/bpi_mcm.dat']);

numero = 2 ;% 1= apin, 2=iso,3=bcar, 4=lim

markers = {'*';'o';'s'};
sz  = linspace(80,400,5);
cls = {'r';'b';'k'};
sz1 = linspace(80,400,5);

%%

if numero==1;
    
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

MW         = 136.23;
Na         = 6.022E23; % [#/mol] 
ch_air     = 2.47E19 ;

Soa  = (apin_10s(:,6)./100).*(apin_10s(:,5)*MW*12.187./293.15) ; %ug/m3 mass conc of organic aerosol in condensed phase
C_oa = apin_10s(:,5)*MW*12.187./293.15;  %ug/m3 reacted VOC
yield = Soa./C_oa; %ug/m3
initial_conc = apin_10s(:,1)*MW*12.187./293.15;
oh_net  = apin_10s(:,2)*1e6 ;%.* (apin_10s(:,7)).^2.*360 *1e6;
o3_net  = apin_10s(:,3)*1e11;% .* (apin_10s(:,7)).^2.*360 *1e11;
no3_net = apin_10s(:,4)*1e7 ;% .* (apin_10s(:,7)).^2.*360 *1e7;

%% O_3 oxidant based plot
figure('Position',[1 1 1200 1200]); %( x,y)
clf
box on
set(gca, 'fontsize', [20], 'linewidth', [2])
hold all


h   = scatter(C_oa(ind_o3_1), yield(ind_o3_1), 'filled','c','MarkerFaceColor','r');hold on;
h   = scatter(C_oa(ind_o3_5), yield(ind_o3_5), 'filled','c','MarkerFaceColor','b');hold on;
h   = scatter(C_oa(ind_o3_10), yield(ind_o3_10), 'filled','c','MarkerFaceColor','k');hold on;
h   = scatter(C_oa(ind_o3_50), yield(ind_o3_50), 'filled','c','MarkerFaceColor','m');hold on;
h   = scatter(C_oa(ind_o3_100), yield(ind_o3_100), 'filled','c','MarkerFaceColor','c');hold on;


% h   = scatter(apin_10s(ind_o3,5), apin_10s(ind_o3,6),  'filled','s' ,'MarkerFaceColor','b');hold on;
% h   = scatter(apin_10s(ind_no3,5), apin_10s(ind_no3,6),  'filled','d' ,'MarkerFaceColor','m');hold on

lh = legend('1 * 1E11','5 * 1E11','10 * 1E11','50 * 1E11','100 * 1E11')% * 1E6)%, 'O_3','NO_3') %,....
         %'24 hr(OH: 2,5,10,50,100 * 1E6)','24 hr(O3: 1,5,10,50,100 * E11)', '24 hr(NO3: 1,5,10,50,100 *E7)')
set(lh,'Location','NorthWest', 'FontWeight', 'bold') 

set(gca,'xscale','log')
grid on


title('Alpha-pinene vs O_3')
xlabel('Reacted(ug/m^3)','FontSize',20,'FontWeight','bold','Color','k')
ylabel('Mass yields','FontSize',20,'FontWeight','bold','Color','k')
set(gca,'FontSize',20,'FontWeight','bold')

%% NO3 oxidant based plot
figure('Position',[1 1 1200 1200]); %( x,y)
clf
box on
set(gca, 'fontsize', [20], 'linewidth', [2])
hold all


h   = scatter(C_oa(ind_no_1), yield(ind_no_1), 'filled','c','MarkerFaceColor','r');hold on;
h   = scatter(C_oa(ind_no_5), yield(ind_no_5), 'filled','c','MarkerFaceColor','b');hold on;
h   = scatter(C_oa(ind_no_10), yield(ind_no_10), 'filled','c','MarkerFaceColor','k');hold on;
h   = scatter(C_oa(ind_no_50), yield(ind_no_50), 'filled','c','MarkerFaceColor','m');hold on;
h   = scatter(C_oa(ind_no_100), yield(ind_no_100), 'filled','c','MarkerFaceColor','c');hold on

% h   = scatter(apin_10s(ind_o3,5), apin_10s(ind_o3,6),  'filled','s' ,'MarkerFaceColor','b');hold on;
% h   = scatter(apin_10s(ind_no3,5), apin_10s(ind_no3,6),  'filled','d' ,'MarkerFaceColor','m');hold on

lh = legend('1 * 1E7','5 * 1E7','10 * 1E7','50 * 1E7 ','100 * 1E7')% * 1E6)%, 'O_3','NO_3') %,....
         %'24 hr(OH: 2,5,10,50,100 * 1E6)','24 hr(O3: 1,5,10,50,100 * E11)', '24 hr(NO3: 1,5,10,50,100 *E7)')
set(lh,'Location','NorthWest', 'FontWeight', 'bold') 

set(gca,'xscale','log')
grid on


title('Alpha-pinene vs NO_3')
xlabel('Reacted(ug/m^3)','FontSize',20,'FontWeight','bold','Color','k')
ylabel('Mass yields','FontSize',20,'FontWeight','bold','Color','k')
set(gca,'FontSize',20,'FontWeight','bold')


%% OH oxidant based plot
figure('Position',[1 1 1200 1200]); %( x,y)
clf
box on
set(gca, 'fontsize', [20], 'linewidth', [2])
hold all



h   = scatter(C_oa(ind_oh_2), yield(ind_oh_2), 'filled','c','MarkerFaceColor','r');hold on;
h   = scatter(C_oa(ind_oh_5), yield(ind_oh_5), 'filled','c','MarkerFaceColor','b');hold on;
h   = scatter(C_oa(ind_oh_10), yield(ind_oh_10), 'filled','c','MarkerFaceColor','k');hold on;
h   = scatter(C_oa(ind_oh_50), yield(ind_oh_50), 'filled','c','MarkerFaceColor','m');hold on;
h   = scatter(C_oa(ind_oh_100), yield(ind_oh_100), 'filled','c','MarkerFaceColor','c');hold on;

% h   = scatter(apin_10s(ind_o3,5), apin_10s(ind_o3,6),  'filled','s' ,'MarkerFaceColor','b');hold on;
% h   = scatter(apin_10s(ind_no3,5), apin_10s(ind_no3,6),  'filled','d' ,'MarkerFaceColor','m');hold on

lh = legend('2 * 1E6','5 * 1E6','10 * 1E6','50 * 1E6 ','100 * 1E6');% * 1E6)%, 'O_3','NO_3') %,....
         %'24 hr(OH: 2,5,10,50,100 * 1E6)','24 hr(O3: 1,5,10,50,100 * E11)', '24 hr(NO3: 1,5,10,50,100 *E7)')
set(lh,'Location','NorthWest', 'FontWeight', 'bold') ;
%xticks([0.01 0.10 1 10 100 1000]);
% plot(bas_set,jn,'r-')
set(gca,'xscale','log')
grid on

% xticks([0.01 0.10 1 10 100 1000]);

% [pp,sp]=polyfit(log10(C_oa(ind_oh_5)),yield(ind_oh_5),1);
% vall = polyval(pp,log10(C_oa)); 
% plot((C_oa),vall,'r', 'linewidth',2)
        
title('Alpha-pinene vs OH')
xlabel('Reacted(ug/m^3)','FontSize',20,'FontWeight','bold','Color','k')
ylabel('Mass yields','FontSize',20,'FontWeight','bold','Color','k')
set(gca,'FontSize',20,'FontWeight','bold')



 X  = C_oa(ind_oh_2);
 Y  = yield(ind_oh_2);
 ox = [2;5;10;50;100];
 xx = initial_conc(ind_oh_2);
% 
 a0 = 0.1;
 t0 = 100;
% [p,ErrorEst] = polyfit(X,Y,2);
% fit = polyval(p,X);
% %b0 = [0; 0.01; 0.01; 0.01;0.01;0.01];
% plot(X,fit,'k')

k=1.2d-11*exp(440/293.15);


  for ii = 1:length(X) 

    % fun1 = @(t) exp(-k*t*ox(1)*1e6 + log(xx(ii))) - X(ii);
     fun = @(a) exp(-log(X(ii)*ox(1))-log(a))- Y(ii);

% inital guess

options = optimoptions(@lsqnonlin,'Algorithm','trust-region-reflective');
%options.Algorithm = 'levenberg-marquardt';
 b(ii)  = lsqnonlin(fun,a0,[],[],options);
%ti(ii) = lsqnonlin(fun1,t0,[],[],options);
%[a,resnorm,~,exitflag,output] = lsqcurvefit(fun,a0,X,Y)
 end

fun_val  = exp(-log(X.*ox(1))- log(b)');
% fun_val1 = exp(-k.*ti.*ox(1)*1e6 + log(xx)');


plot(X,fun_val,'b')

%%
elseif numero==2
    
ind_oh_2   =find(iso_10s(:,2)==2);
ind_oh_5   =find(iso_10s(:,2)==5);
ind_oh_10  =find(iso_10s(:,2)==10);
ind_oh_50  =find(iso_10s(:,2)==50);
ind_oh_100 =find(iso_10s(:,2)==100);

ind_o3_1   =find(iso_10s(:,3)==1);
ind_o3_5   =find(iso_10s(:,3)==5);
ind_o3_10  =find(iso_10s(:,3)==10);
ind_o3_50  =find(iso_10s(:,3)==50);
ind_o3_100 =find(iso_10s(:,3)==100);

ind_no_1   =find(iso_10s(:,4)==1);
ind_no_5   =find(iso_10s(:,4)==5);
ind_no_10  =find(iso_10s(:,4)==10);
ind_no_50  =find(iso_10s(:,4)==50);
ind_no_100 =find(iso_10s(:,4)==100);

MW         = 68.12;
Na         = 6.022E23; % [#/mol] 
ch_air     = 2.47E19 ;

Soa  = (iso_10s(:,6)./100).*(iso_10s(:,5)*MW*12.187./298.15) ; %ug/m3 mass conc of organic aerosol in condensed phase
C_oa = iso_10s(:,5)*MW*12.187./298.15;  %ug/m3 reacted VOC
yield = Soa./C_oa; %ug/m3



%% O_3 oxidant based plot
figure('Position',[1 1 1200 1200]); %( x,y)
clf
box on
set(gca, 'fontsize', [20], 'linewidth', [2])
hold all


h   = scatter(C_oa(ind_o3_1), yield(ind_o3_1), 'filled','c','MarkerFaceColor','r');hold on;
h   = scatter(C_oa(ind_o3_5), yield(ind_o3_5), 'filled','c','MarkerFaceColor','b');hold on;
h   = scatter(C_oa(ind_o3_10), yield(ind_o3_10), 'filled','c','MarkerFaceColor','k');hold on;
h   = scatter(C_oa(ind_o3_50), yield(ind_o3_50), 'filled','c','MarkerFaceColor','m');hold on;
h   = scatter(C_oa(ind_o3_100), yield(ind_o3_100), 'filled','c','MarkerFaceColor','c');hold on;


lh = legend('1 * 1E11','5 * 1E11','10 * 1E11','50 * 1E11','100 * 1E11')% * 1E6)%, 'O_3','NO_3') %,....
         %'24 hr(OH: 2,5,10,50,100 * 1E6)','24 hr(O3: 1,5,10,50,100 * E11)', '24 hr(NO3: 1,5,10,50,100 *E7)')
set(lh,'Location','NorthWest', 'FontWeight', 'bold') 

set(gca,'xscale','log')
grid on

title('Isoprene vs O_3')
xlabel('Reacted(ug/m^3)','FontSize',20,'FontWeight','bold','Color','k')
ylabel('Mass yields','FontSize',20,'FontWeight','bold','Color','k')
set(gca,'FontSize',20,'FontWeight','bold')

%% NO3 oxidant based plot
figure('Position',[1 1 1200 1200]); %( x,y)
clf
box on
set(gca, 'fontsize', [20], 'linewidth', [2])
hold all


h   = scatter(C_oa(ind_no_1), yield(ind_no_1), 'filled','c','MarkerFaceColor','r');hold on;
h   = scatter(C_oa(ind_no_5), yield(ind_no_5), 'filled','c','MarkerFaceColor','b');hold on;
h   = scatter(C_oa(ind_no_10), yield(ind_no_10), 'filled','c','MarkerFaceColor','k');hold on;
h   = scatter(C_oa(ind_no_50), yield(ind_no_50), 'filled','c','MarkerFaceColor','m');hold on;
h   = scatter(C_oa(ind_no_100), yield(ind_no_100), 'filled','c','MarkerFaceColor','c');hold on;


% h   = scatter(iso_10s(ind_o3,5), iso_10s(ind_o3,6),  'filled','s' ,'MarkerFaceColor','b');hold on;
% h   = scatter(iso_10s(ind_no3,5), iso_10s(ind_no3,6),  'filled','d' ,'MarkerFaceColor','m');hold on

lh = legend('1 * 1E7','5 * 1E7','10 * 1E7','50 * 1E7 ','100 * 1E7')% * 1E6)%, 'O_3','NO_3') %,....
         %'24 hr(OH: 2,5,10,50,100 * 1E6)','24 hr(O3: 1,5,10,50,100 * E11)', '24 hr(NO3: 1,5,10,50,100 *E7)')
set(lh,'Location','NorthWest', 'FontWeight', 'bold') 

set(gca,'xscale','log')
grid on
ylim([0 1])

title('Isoprene vs NO_3')
xlabel('Reacted(ug/m^3)','FontSize',20,'FontWeight','bold','Color','k')
ylabel('Mass yields','FontSize',20,'FontWeight','bold','Color','k')
set(gca,'FontSize',20,'FontWeight','bold')






%% OH oxidant based plot
figure('Position',[1 1 1200 1200]); %( x,y)
clf
box on
set(gca, 'fontsize', [20], 'linewidth', [2])
hold all


h   = scatter(C_oa(ind_oh_2), yield(ind_oh_2), 'filled','c','MarkerFaceColor','r');hold on;
h   = scatter(C_oa(ind_oh_5), yield(ind_oh_5), 'filled','c','MarkerFaceColor','b');hold on;
h   = scatter(C_oa(ind_oh_10), yield(ind_oh_10), 'filled','c','MarkerFaceColor','k');hold on;
h   = scatter(C_oa(ind_oh_50), yield(ind_oh_50), 'filled','c','MarkerFaceColor','m');hold on;
h   = scatter(C_oa(ind_oh_100), yield(ind_oh_100), 'filled','c','MarkerFaceColor','c');hold on;

lh = legend('2 * 1E6','5 * 1E6','10 * 1E6','50 * 1E6 ','100 * 1E6');% * 1E6)%, 'O_3','NO_3') %,....
         %'24 hr(OH: 2,5,10,50,100 * 1E6)','24 hr(O3: 1,5,10,50,100 * E11)', '24 hr(NO3: 1,5,10,50,100 *E7)')
set(lh,'Location','NorthWest', 'FontWeight', 'bold') ;
%xticks([0.01 0.10 1 10 100 1000]);
% plot(bas_set,jn,'r-')
set(gca,'xscale','log')
grid on

% xticks([0.01 0.10 1 10 100 1000]);

% [pp,sp]=polyfit((C_oa),yield,1);
% vall = polyval(pp,log10(C_oa)); 
% plot(log10(C_oa),vall,'r', 'linewidth',2)
        
title('Isoprene vs OH')
xlabel('Reacted(ug/m^3)','FontSize',20,'FontWeight','bold','Color','k')
ylabel('Mass yields','FontSize',20,'FontWeight','bold','Color','k')
set(gca,'FontSize',20,'FontWeight','bold')

elseif numero==3
ind_oh_2   =find(bcar_10s(:,2)==2);
ind_oh_5   =find(bcar_10s(:,2)==5);
ind_oh_10  =find(bcar_10s(:,2)==10);
ind_oh_50  =find(bcar_10s(:,2)==50);
ind_oh_100 =find(bcar_10s(:,2)==100);

ind_o3_1   =find(bcar_10s(:,3)==1);
ind_o3_5   =find(bcar_10s(:,3)==5);
ind_o3_10  =find(bcar_10s(:,3)==10);
ind_o3_50  =find(bcar_10s(:,3)==50);
ind_o3_100 =find(bcar_10s(:,3)==100);

ind_no_1   =find(bcar_10s(:,4)==1);
ind_no_5   =find(bcar_10s(:,4)==5);
ind_no_10  =find(bcar_10s(:,4)==10);
ind_no_50  =find(bcar_10s(:,4)==50);
ind_no_100 =find(bcar_10s(:,4)==100);

MW         = 204.36;
Na         = 6.022E23; % [#/mol] 
ch_air     = 2.47E19 ;

Soa  = (bcar_10s(:,6)./100).*(bcar_10s(:,5)*MW*12.187./293.15) ; %ug/m3 mass conc of organic aerosol in condensed phase
C_oa = bcar_10s(:,5)*MW*12.187./293.15;  %ug/m3 reacted VOC
yield = Soa./C_oa; %ug/m3



%% O_3 oxidant based plot
figure('Position',[1 1 1200 1200]); %( x,y)
clf
box on
set(gca, 'fontsize', [20], 'linewidth', [2])
hold all


h   = scatter(C_oa(ind_o3_1), yield(ind_o3_1), 'filled','c','MarkerFaceColor','r');hold on;
h   = scatter(C_oa(ind_o3_5), yield(ind_o3_5), 'filled','c','MarkerFaceColor','b');hold on;
h   = scatter(C_oa(ind_o3_10), yield(ind_o3_10), 'filled','c','MarkerFaceColor','k');hold on;
h   = scatter(C_oa(ind_o3_50), yield(ind_o3_50), 'filled','c','MarkerFaceColor','m');hold on;
h   = scatter(C_oa(ind_o3_100), yield(ind_o3_100), 'filled','c','MarkerFaceColor','c');hold on;


lh = legend('1 * 1E11','5 * 1E11','10 * 1E11','50 * 1E11','100 * 1E11')% * 1E6)%, 'O_3','NO_3') %,....
         %'24 hr(OH: 2,5,10,50,100 * 1E6)','24 hr(O3: 1,5,10,50,100 * E11)', '24 hr(NO3: 1,5,10,50,100 *E7)')
set(lh,'Location','NorthWest', 'FontWeight', 'bold') 

set(gca,'xscale','log')
grid on


title('Bcarp vs O_3')
xlabel('Reacted(ug/m^3)','FontSize',20,'FontWeight','bold','Color','k')
ylabel('Mass yields','FontSize',20,'FontWeight','bold','Color','k')
set(gca,'FontSize',20,'FontWeight','bold')

%% NO3 oxidant based plot
figure('Position',[1 1 1200 1200]); %( x,y)
clf
box on
set(gca, 'fontsize', [20], 'linewidth', [2])
hold all


h   = scatter(C_oa(ind_no_1), yield(ind_no_1), 'filled','c','MarkerFaceColor','r');hold on;
h   = scatter(C_oa(ind_no_5), yield(ind_no_5), 'filled','c','MarkerFaceColor','b');hold on;
h   = scatter(C_oa(ind_no_10), yield(ind_no_10), 'filled','c','MarkerFaceColor','k');hold on;
h   = scatter(C_oa(ind_no_50), yield(ind_no_50), 'filled','c','MarkerFaceColor','m');hold on;
h   = scatter(C_oa(ind_no_100), yield(ind_no_100), 'filled','c','MarkerFaceColor','c');hold on;


% h   = scatter(bcar_10s(ind_o3,5), bcar_10s(ind_o3,6),  'filled','s' ,'MarkerFaceColor','b');hold on;
% h   = scatter(bcar_10s(ind_no3,5), bcar_10s(ind_no3,6),  'filled','d' ,'MarkerFaceColor','m');hold on

lh = legend('1 * 1E7','5 * 1E7','10 * 1E7','50 * 1E7 ','100 * 1E7')% * 1E6)%, 'O_3','NO_3') %,....
         %'24 hr(OH: 2,5,10,50,100 * 1E6)','24 hr(O3: 1,5,10,50,100 * E11)', '24 hr(NO3: 1,5,10,50,100 *E7)')
set(lh,'Location','NorthWest', 'FontWeight', 'bold') 

set(gca,'xscale','log')
grid on


title('Bcarp vs NO_3')
xlabel('Reacted(ug/m^3)','FontSize',20,'FontWeight','bold','Color','k')
ylabel('Mass yields','FontSize',20,'FontWeight','bold','Color','k')
set(gca,'FontSize',20,'FontWeight','bold')






%% OH oxidant based plot
figure('Position',[1 1 1200 1200]); %( x,y)
clf
box on
set(gca, 'fontsize', [20], 'linewidth', [2])
hold all


h   = scatter(C_oa(ind_oh_2), yield(ind_oh_2), 'filled','c','MarkerFaceColor','r');hold on;
h   = scatter(C_oa(ind_oh_5), yield(ind_oh_5), 'filled','c','MarkerFaceColor','b');hold on;
h   = scatter(C_oa(ind_oh_10), yield(ind_oh_10), 'filled','c','MarkerFaceColor','k');hold on;
h   = scatter(C_oa(ind_oh_50), yield(ind_oh_50), 'filled','c','MarkerFaceColor','m');hold on;
h   = scatter(C_oa(ind_oh_100), yield(ind_oh_100), 'filled','c','MarkerFaceColor','c');hold on;

lh = legend('2 * 1E6','5 * 1E6','10 * 1E6','50 * 1E6 ','100 * 1E6');% * 1E6)%, 'O_3','NO_3') %,....
         %'24 hr(OH: 2,5,10,50,100 * 1E6)','24 hr(O3: 1,5,10,50,100 * E11)', '24 hr(NO3: 1,5,10,50,100 *E7)')
set(lh,'Location','NorthWest', 'FontWeight', 'bold') ;
%xticks([0.01 0.10 1 10 100 1000]);
% plot(bas_set,jn,'r-')
set(gca,'xscale','log')
grid on

% xticks([0.01 0.10 1 10 100 1000]);

% [pp,sp]=polyfit((C_oa),yield,1);
% vall = polyval(pp,log10(C_oa)); 
% plot(log10(C_oa),vall,'r', 'linewidth',2)
        
title('Bcarp vs OH')
xlabel('Reacted(ug/m^3)','FontSize',20,'FontWeight','bold','Color','k')
ylabel('Mass yields','FontSize',20,'FontWeight','bold','Color','k')
set(gca,'FontSize',20,'FontWeight','bold')

elseif numero == 4
    
ind_oh_2   =find(lim_10s(:,2)==2);
ind_oh_5   =find(lim_10s(:,2)==5);
ind_oh_10  =find(lim_10s(:,2)==10);
ind_oh_50  =find(lim_10s(:,2)==50);
ind_oh_100 =find(lim_10s(:,2)==100);

ind_o3_1   =find(lim_10s(:,3)==1);
ind_o3_5   =find(lim_10s(:,3)==5);
ind_o3_10  =find(lim_10s(:,3)==10);
ind_o3_50  =find(lim_10s(:,3)==50);
ind_o3_100 =find(lim_10s(:,3)==100);

ind_no_1   =find(lim_10s(:,4)==1);
ind_no_5   =find(lim_10s(:,4)==5);
ind_no_10  =find(lim_10s(:,4)==10);
ind_no_50  =find(lim_10s(:,4)==50);
ind_no_100 =find(lim_10s(:,4)==100);

MW         = 136.24;
Na         = 6.022E23; % [#/mol] 
ch_air     = 2.47E19 ;

Soa  = (lim_10s(:,6)./100).*(lim_10s(:,5)*MW*12.187./298.15) ; %ug/m3 mass conc of organic aerosol in condensed phase
C_oa = lim_10s(:,5)*MW*12.187./298.15;  %ug/m3 reacted VOC
yield = Soa./C_oa; %ug/m3



%% O_3 oxidant based plot
figure('Position',[1 1 1200 1200]); %( x,y)
clf
box on
set(gca, 'fontsize', [20], 'linewidth', [2])
hold all


h   = scatter(C_oa(ind_o3_1), yield(ind_o3_1), 'filled','c','MarkerFaceColor','r');hold on;
h   = scatter(C_oa(ind_o3_5), yield(ind_o3_5), 'filled','c','MarkerFaceColor','b');hold on;
h   = scatter(C_oa(ind_o3_10), yield(ind_o3_10), 'filled','c','MarkerFaceColor','k');hold on;
h   = scatter(C_oa(ind_o3_50), yield(ind_o3_50), 'filled','c','MarkerFaceColor','m');hold on;
h   = scatter(C_oa(ind_o3_100), yield(ind_o3_100), 'filled','c','MarkerFaceColor','c');hold on;


lh = legend('1 * 1E11','5 * 1E11','10 * 1E11','50 * 1E11','100 * 1E11')% * 1E6)%, 'O_3','NO_3') %,....
         %'24 hr(OH: 2,5,10,50,100 * 1E6)','24 hr(O3: 1,5,10,50,100 * E11)', '24 hr(NO3: 1,5,10,50,100 *E7)')
set(lh,'Location','NorthWest', 'FontWeight', 'bold') 

set(gca,'xscale','log')
grid on
% xlim([0 250])

title('Limonene vs O_3')
xlabel('Reacted(ug/m^3)','FontSize',20,'FontWeight','bold','Color','k')
ylabel('Mass yields','FontSize',20,'FontWeight','bold','Color','k')
set(gca,'FontSize',20,'FontWeight','bold')

%% NO3 oxidant based plot
figure('Position',[1 1 1200 1200]); %( x,y)
clf
box on
set(gca, 'fontsize', [20], 'linewidth', [2])
hold all


h   = scatter(C_oa(ind_no_1), yield(ind_no_1), 'filled','c','MarkerFaceColor','r');hold on;
h   = scatter(C_oa(ind_no_5), yield(ind_no_5), 'filled','c','MarkerFaceColor','b');hold on;
h   = scatter(C_oa(ind_no_10), yield(ind_no_10), 'filled','c','MarkerFaceColor','k');hold on;
h   = scatter(C_oa(ind_no_50), yield(ind_no_50), 'filled','c','MarkerFaceColor','m');hold on;
h   = scatter(C_oa(ind_no_100), yield(ind_no_100), 'filled','c','MarkerFaceColor','c');hold on;


% h   = scatter(lim_10s(ind_o3,5), lim_10s(ind_o3,6),  'filled','s' ,'MarkerFaceColor','b');hold on;
% h   = scatter(lim_10s(ind_no3,5), lim_10s(ind_no3,6),  'filled','d' ,'MarkerFaceColor','m');hold on

lh = legend('1 * 1E7','5 * 1E7','10 * 1E7','50 * 1E7 ','100 * 1E7')% * 1E6)%, 'O_3','NO_3') %,....
         %'24 hr(OH: 2,5,10,50,100 * 1E6)','24 hr(O3: 1,5,10,50,100 * E11)', '24 hr(NO3: 1,5,10,50,100 *E7)')
set(lh,'Location','NorthWest', 'FontWeight', 'bold') 

set(gca,'xscale','log')
grid on
% xlim([0 250])

title('Limonene vs NO_3')
xlabel('Reacted(ug/m^3)','FontSize',20,'FontWeight','bold','Color','k')
ylabel('Mass yields','FontSize',20,'FontWeight','bold','Color','k')
set(gca,'FontSize',20,'FontWeight','bold')






%% OH oxidant based plot
figure('Position',[1 1 1200 1200]); %( x,y)
clf
box on
set(gca, 'fontsize', [20], 'linewidth', [2])
hold all


h   = scatter(C_oa(ind_oh_2), yield(ind_oh_2), 'filled','c','MarkerFaceColor','r');hold on;
h   = scatter(C_oa(ind_oh_5), yield(ind_oh_5), 'filled','c','MarkerFaceColor','b');hold on;
h   = scatter(C_oa(ind_oh_10), yield(ind_oh_10), 'filled','c','MarkerFaceColor','k');hold on;
h   = scatter(C_oa(ind_oh_50), yield(ind_oh_50), 'filled','c','MarkerFaceColor','m');hold on;
h   = scatter(C_oa(ind_oh_100), yield(ind_oh_100), 'filled','c','MarkerFaceColor','c');hold on;

lh = legend('2 * 1E6','5 * 1E6','10 * 1E6','50 * 1E6 ','100 * 1E6');% * 1E6)%, 'O_3','NO_3') %,....
         %'24 hr(OH: 2,5,10,50,100 * 1E6)','24 hr(O3: 1,5,10,50,100 * E11)', '24 hr(NO3: 1,5,10,50,100 *E7)')
set(lh,'Location','NorthWest', 'FontWeight', 'bold') ;
%xticks([0.01 0.10 1 10 100 1000]);
% plot(bas_set,jn,'r-')
 set(gca,'xscale','log')
grid on

% xticks([0.01 0.10 1 10 100 1000]);

[pp,sp]=polyfit((log10(C_oa(ind_oh_2))),yield(ind_oh_2),1);
vall = polyval(pp,log10(C_oa(ind_oh_2))); 
semilogx(((C_oa(ind_oh_2))),vall,'k', 'linewidth',2)
        
title('Limonene vs OH')
xlabel('Reacted(ug/m^3)','FontSize',20,'FontWeight','bold','Color','k')
ylabel('Mass yields','FontSize',20,'FontWeight','bold','Color','k')
set(gca,'FontSize',20,'FontWeight','bold')

else
    
    
ind_oh_2   =find(bpi_10s(:,2)==2);
ind_oh_5   =find(bpi_10s(:,2)==5);
ind_oh_10  =find(bpi_10s(:,2)==10);
ind_oh_50  =find(bpi_10s(:,2)==50);
ind_oh_100 =find(bpi_10s(:,2)==100);

ind_o3_1   =find(bpi_10s(:,3)==1);
ind_o3_5   =find(bpi_10s(:,3)==5);
ind_o3_10  =find(bpi_10s(:,3)==10);
ind_o3_50  =find(bpi_10s(:,3)==50);
ind_o3_100 =find(bpi_10s(:,3)==100);

ind_no_1   =find(bpi_10s(:,4)==1);
ind_no_5   =find(bpi_10s(:,4)==5);
ind_no_10  =find(bpi_10s(:,4)==10);
ind_no_50  =find(bpi_10s(:,4)==50);
ind_no_100 =find(bpi_10s(:,4)==100);

MW         = 136.23;
Na         = 6.022E23; % [#/mol] 
ch_air     = 2.47E19 ;

Soa  = (bpi_10s(:,6)./100).*(bpi_10s(:,5)*MW*12.187./293.15) ; %ug/m3 mass conc of organic aerosol in condensed phase
C_oa = bpi_10s(:,5)*MW*12.187./293.15;  %ug/m3 reacted VOC
yield = Soa./C_oa; %ug/m3



%% O_3 oxidant based plot
figure('Position',[1 1 1200 1200]); %( x,y)
clf
box on
set(gca, 'fontsize', [20], 'linewidth', [2])
hold all


h   = scatter(C_oa(ind_o3_1), yield(ind_o3_1), 'filled','c','MarkerFaceColor','r');hold on;
h   = scatter(C_oa(ind_o3_5), yield(ind_o3_5), 'filled','c','MarkerFaceColor','b');hold on;
h   = scatter(C_oa(ind_o3_10), yield(ind_o3_10), 'filled','c','MarkerFaceColor','k');hold on;
h   = scatter(C_oa(ind_o3_50), yield(ind_o3_50), 'filled','c','MarkerFaceColor','m');hold on;
h   = scatter(C_oa(ind_o3_100), yield(ind_o3_100), 'filled','c','MarkerFaceColor','c');hold on;


lh = legend('1 * 1E11','5 * 1E11','10 * 1E11','50 * 1E11','100 * 1E11')% * 1E6)%, 'O_3','NO_3') %,....
         %'24 hr(OH: 2,5,10,50,100 * 1E6)','24 hr(O3: 1,5,10,50,100 * E11)', '24 hr(NO3: 1,5,10,50,100 *E7)')
set(lh,'Location','NorthWest', 'FontWeight', 'bold') 

set(gca,'xscale','log')
grid on


title('Bpi vs O_3')
xlabel('Reacted(ug/m^3)','FontSize',20,'FontWeight','bold','Color','k')
ylabel('Mass yields','FontSize',20,'FontWeight','bold','Color','k')
set(gca,'FontSize',20,'FontWeight','bold')

%% NO3 oxidant based plot
figure('Position',[1 1 1200 1200]); %( x,y)
clf
box on
set(gca, 'fontsize', [20], 'linewidth', [2])
hold all


h   = scatter(C_oa(ind_no_1), yield(ind_no_1), 'filled','c','MarkerFaceColor','r');hold on;
h   = scatter(C_oa(ind_no_5), yield(ind_no_5), 'filled','c','MarkerFaceColor','b');hold on;
h   = scatter(C_oa(ind_no_10), yield(ind_no_10), 'filled','c','MarkerFaceColor','k');hold on;
h   = scatter(C_oa(ind_no_50), yield(ind_no_50), 'filled','c','MarkerFaceColor','m');hold on;
h   = scatter(C_oa(ind_no_100), yield(ind_no_100), 'filled','c','MarkerFaceColor','c');hold on;


% h   = scatter(bpi_10s(ind_o3,5), bpi_10s(ind_o3,6),  'filled','s' ,'MarkerFaceColor','b');hold on;
% h   = scatter(bpi_10s(ind_no3,5), bpi_10s(ind_no3,6),  'filled','d' ,'MarkerFaceColor','m');hold on

lh = legend('1 * 1E7','5 * 1E7','10 * 1E7','50 * 1E7 ','100 * 1E7')% * 1E6)%, 'O_3','NO_3') %,....
         %'24 hr(OH: 2,5,10,50,100 * 1E6)','24 hr(O3: 1,5,10,50,100 * E11)', '24 hr(NO3: 1,5,10,50,100 *E7)')
set(lh,'Location','NorthWest', 'FontWeight', 'bold') 

set(gca,'xscale','log')
grid on


title('Bpi vs NO_3')
xlabel('Reacted(ug/m^3)','FontSize',20,'FontWeight','bold','Color','k')
ylabel('Mass yields','FontSize',20,'FontWeight','bold','Color','k')
set(gca,'FontSize',20,'FontWeight','bold')






%% OH oxidant based plot
figure('Position',[1 1 1200 1200]); %( x,y)
clf
box on
set(gca, 'fontsize', [20], 'linewidth', [2])
hold all


h   = scatter(C_oa(ind_oh_2), yield(ind_oh_2), 'filled','c','MarkerFaceColor','r');hold on;
h   = scatter(C_oa(ind_oh_5), yield(ind_oh_5), 'filled','c','MarkerFaceColor','b');hold on;
h   = scatter(C_oa(ind_oh_10), yield(ind_oh_10), 'filled','c','MarkerFaceColor','k');hold on;
h   = scatter(C_oa(ind_oh_50), yield(ind_oh_50), 'filled','c','MarkerFaceColor','m');hold on;
h   = scatter(C_oa(ind_oh_100), yield(ind_oh_100), 'filled','c','MarkerFaceColor','c');hold on;

lh = legend('2 * 1E6','5 * 1E6','10 * 1E6','50 * 1E6 ','100 * 1E6');% * 1E6)%, 'O_3','NO_3') %,....
         %'24 hr(OH: 2,5,10,50,100 * 1E6)','24 hr(O3: 1,5,10,50,100 * E11)', '24 hr(NO3: 1,5,10,50,100 *E7)')
set(lh,'Location','NorthWest', 'FontWeight', 'bold') ;
%xticks([0.01 0.10 1 10 100 1000]);
% plot(bas_set,jn,'r-')
set(gca,'xscale','log')
grid on

% xticks([0.01 0.10 1 10 100 1000]);

% [pp,sp]=polyfit((C_oa),yield,1);
% vall = polyval(pp,log10(C_oa)); 
% plot(log10(C_oa),vall,'r', 'linewidth',2)
        
title('Bpi vs OH')
xlabel('Reacted(ug/m^3)','FontSize',20,'FontWeight','bold','Color','k')
ylabel('Mass yields','FontSize',20,'FontWeight','bold','Color','k')
set(gca,'FontSize',20,'FontWeight','bold')
    
end 