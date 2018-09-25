close all
clear all

clc

path_hom_cham = '/home/local/carltonx/Work/Malte_box/Project_runs/Final_Results/Results/Chamber_runs/Hom_res/main_res' ;
path_mcm_cham = '/home/local/carltonx/Work/Malte_box/Project_runs/Final_Results/Results/Chamber_runs/Mcm_res/main_res_mcm' ;


apin_hom    = load([path_hom_cham,'/ch_hom_apin.dat']);
bcar_hom    = load([path_hom_cham,'/ch_hom_bcar.dat']);
lim_hom     = load([path_hom_cham,'/ch_hom_lim.dat']);
iso_hom     = load([path_hom_cham,'/ch_hom_iso.dat']);
bpin_hom    = load([path_hom_cham,'/ch_hom_bpin.dat']);

apin_mcm   = load([path_mcm_cham,'/ch_mcm_apin.dat']);
bcar_mcm   = load([path_mcm_cham,'/ch_mcm_bcar.dat']);
lim_mcm    = load([path_mcm_cham,'/ch_mcm_lim.dat']);
iso_mcm    = load([path_mcm_cham,'/ch_mcm_iso.dat']);
bpin_mcm   = load([path_mcm_cham,'/ch_mcm_bpin.dat']);



numero = 1 ;% 1= apin, 2=iso,3=bcar, 4=lim 5 = bpin

markers = {'*';'o';'s'};
sz  = linspace(80,400,5);
cls = {'r';'b';'k'};
sz1 = linspace(80,400,5);

%%

if numero==1;
    
ind_oh_2   =find(apin_hom(:,2)==2);
ind_oh_5   =find(apin_hom(:,2)==5);
ind_oh_10  =find(apin_hom(:,2)==10);
ind_oh_50  =find(apin_hom(:,2)==50);
ind_oh_100 =find(apin_hom(:,2)==100);

ind_o3_1   =find(apin_hom(:,3)==1);
ind_o3_5   =find(apin_hom(:,3)==5);
ind_o3_10  =find(apin_hom(:,3)==10);
ind_o3_50  =find(apin_hom(:,3)==50);
ind_o3_100 =find(apin_hom(:,3)==100);

ind_no_1   =find(apin_hom(:,4)==1);
ind_no_5   =find(apin_hom(:,4)==5);
ind_no_10  =find(apin_hom(:,4)==10);
ind_no_50  =find(apin_hom(:,4)==50);
ind_no_100 =find(apin_hom(:,4)==100);


index      =find(apin_hom(:,3) ~= 0);

MW         = 136.23;
Na         = 6.022E23; % [#/mol] 
ch_air     = 2.47E19 ;

Soa  = (apin_hom(:,6)./100).*(apin_hom(:,5)*MW*12.187./293.15) ; %ug/m3 mass conc of organic aerosol in condensed phase
C_oa = apin_hom(:,5)*MW*12.187./293.15;  %ug/m3 reacted VOC
yield = Soa./C_oa; % in percentage 
initial_conc = apin_hom(:,1)*MW*12.187./293.15;
oh_net  = apin_hom(:,2)*1e6 ;%.* (apin_hom(:,7)).^2.*360 *1e6;
o3_net  = apin_hom(:,3)*1e11;% .* (apin_hom(:,7)).^2.*360 *1e11;
no3_net = apin_hom(:,4)*1e7 ;% .* (apin_hom(:,7)).^2.*360 *1e7;


Soa_o3 = Soa(index);
Coa_o3 = C_oa(index);
y   = yield(index);
 
%% O_3 oxidant based plot
figure('Position',[1 1 1200 1200]); %( x,y)
clf
box on
set(gca, 'fontsize', [20], 'linewidth', [2])
hold all


% h   = scatter(Soa(ind_o3_1), yield(ind_o3_1), 'filled','c','MarkerFaceColor','r');hold on;
% h   = scatter(Soa(ind_o3_5), yield(ind_o3_5), 'filled','c','MarkerFaceColor','b');hold on;
% h   = scatter(Soa(ind_o3_10), yield(ind_o3_10), 'filled','c','MarkerFaceColor','k');hold on;
% h   = scatter(Soa(ind_o3_50), yield(ind_o3_50), 'filled','c','MarkerFaceColor','m');hold on;
% h   = scatter(Soa(ind_o3_100), yield(ind_o3_100), 'filled','c','MarkerFaceColor','c');hold on;


 h   = plot((Soa_o3), (y), 's' ,'MarkerFaceColor','b');hold on;

x =(Soa_o3);

cc = [0.1,1,10,100,1000];

%   yfit =  @(a,x)((a(1)./(1+0.1./x)) + (a(2)./(1+1./x)) + (a(3)./(1+10./x))+ .... 
%             (a(4)./(1+100./x))+ (a(5)./(1+1000./x))) - y;
 
  lb = [0, 0, 0, 0,0];
%  
  ub = [0.8, 0.8, 0.8, 0.8,0.8];


for j = 1:5
 yfit = @(a,x)sum(a(i)./(1+cc(i)./x));
end
 % options = optimoptions(@lsqnonlin,'Algorithm','trust-region-reflective')
a0 =  [0.07,0.1,0.13,0.2,0.4];
a =   lsqcurvefit(yfit,a0,x,y,lb,ub)

 %a = fminsearch (fun,a0)% [0.001,0.001,0.01,0.3,0.4])
  %fplot(@(Soa_o3)fun)
  
   mm = a(1)./(1+0.1./x) + a(2)./(1+1./x) + a(3)./(1+10./x)+ .... 
         a(4)./(1+100./x)+ a(5)./(1+1000./x) ;
%   mm = sum(a./(1+cc./x));
plot(Soa_o3, mm, 'k-+','LineWidth',2)
 set(gca,'xscale','log')
grid on
%xlim([0, 1200])



title('Alpha-pinene vs O_3')
xlabel('C_o_a(ug/m^3)','FontSize',20,'FontWeight','bold','Color','k')
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

% h   = scatter(apin_hom(ind_o3,5), apin_hom(ind_o3,6),  'filled','s' ,'MarkerFaceColor','b');hold on;
% h   = scatter(apin_hom(ind_no3,5), apin_hom(ind_no3,6),  'filled','d' ,'MarkerFaceColor','m');hold on

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

% h   = scatter(apin_hom(ind_o3,5), apin_hom(ind_o3,6),  'filled','s' ,'MarkerFaceColor','b');hold on;
% h   = scatter(apin_hom(ind_no3,5), apin_hom(ind_no3,6),  'filled','d' ,'MarkerFaceColor','m');hold on

lh = legend('2 * 1E6','5 * 1E6','10 * 1E6','50 * 1E6 ','100 * 1E6');% * 1E6)%, 'O_3','NO_3') %,....
         %'24 hr(OH: 2,5,10,50,100 * 1E6)','24 hr(O3: 1,5,10,50,100 * E11)', '24 hr(NO3: 1,5,10,50,100 *E7)')
set(lh,'Location','NorthWest', 'FontWeight', 'bold') ;

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





%%
elseif numero==2
    
ind_oh_2   =find(iso_hom(:,2)==2);
ind_oh_5   =find(iso_hom(:,2)==5);
ind_oh_10  =find(iso_hom(:,2)==10);
ind_oh_50  =find(iso_hom(:,2)==50);
ind_oh_100 =find(iso_hom(:,2)==100);

ind_o3_1   =find(iso_hom(:,3)==1);
ind_o3_5   =find(iso_hom(:,3)==5);
ind_o3_10  =find(iso_hom(:,3)==10);
ind_o3_50  =find(iso_hom(:,3)==50);
ind_o3_100 =find(iso_hom(:,3)==100);

ind_no_1   =find(iso_hom(:,4)==1);
ind_no_5   =find(iso_hom(:,4)==5);
ind_no_10  =find(iso_hom(:,4)==10);
ind_no_50  =find(iso_hom(:,4)==50);
ind_no_100 =find(iso_hom(:,4)==100);

MW         = 68.12;
Na         = 6.022E23; % [#/mol] 
ch_air     = 2.47E19 ;

Soa  = (iso_hom(:,6)./100).*(iso_hom(:,5)*MW*12.187./298.15) ; %ug/m3 mass conc of organic aerosol in condensed phase
C_oa = iso_hom(:,5)*MW*12.187./298.15;  %ug/m3 reacted VOC
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


% h   = scatter(iso_hom(ind_o3,5), iso_hom(ind_o3,6),  'filled','s' ,'MarkerFaceColor','b');hold on;
% h   = scatter(iso_hom(ind_no3,5), iso_hom(ind_no3,6),  'filled','d' ,'MarkerFaceColor','m');hold on

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
ind_oh_2   =find(bcar_hom(:,2)==2);
ind_oh_5   =find(bcar_hom(:,2)==5);
ind_oh_10  =find(bcar_hom(:,2)==10);
ind_oh_50  =find(bcar_hom(:,2)==50);
ind_oh_100 =find(bcar_hom(:,2)==100);

ind_o3_1   =find(bcar_hom(:,3)==1);
ind_o3_5   =find(bcar_hom(:,3)==5);
ind_o3_10  =find(bcar_hom(:,3)==10);
ind_o3_50  =find(bcar_hom(:,3)==50);
ind_o3_100 =find(bcar_hom(:,3)==100);

ind_no_1   =find(bcar_hom(:,4)==1);
ind_no_5   =find(bcar_hom(:,4)==5);
ind_no_10  =find(bcar_hom(:,4)==10);
ind_no_50  =find(bcar_hom(:,4)==50);
ind_no_100 =find(bcar_hom(:,4)==100);

MW         = 204.36;
Na         = 6.022E23; % [#/mol] 
ch_air     = 2.47E19 ;

Soa  = (bcar_hom(:,6)./100).*(bcar_hom(:,5)*MW*12.187./293.15) ; %ug/m3 mass conc of organic aerosol in condensed phase
C_oa = bcar_hom(:,5)*MW*12.187./293.15;  %ug/m3 reacted VOC
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


% h   = scatter(bcar_hom(ind_o3,5), bcar_hom(ind_o3,6),  'filled','s' ,'MarkerFaceColor','b');hold on;
% h   = scatter(bcar_hom(ind_no3,5), bcar_hom(ind_no3,6),  'filled','d' ,'MarkerFaceColor','m');hold on

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
    
ind_oh_2   =find(lim_hom(:,2)==2);
ind_oh_5   =find(lim_hom(:,2)==5);
ind_oh_10  =find(lim_hom(:,2)==10);
ind_oh_50  =find(lim_hom(:,2)==50);
ind_oh_100 =find(lim_hom(:,2)==100);

ind_o3_1   =find(lim_hom(:,3)==1);
ind_o3_5   =find(lim_hom(:,3)==5);
ind_o3_10  =find(lim_hom(:,3)==10);
ind_o3_50  =find(lim_hom(:,3)==50);
ind_o3_100 =find(lim_hom(:,3)==100);

ind_no_1   =find(lim_hom(:,4)==1);
ind_no_5   =find(lim_hom(:,4)==5);
ind_no_10  =find(lim_hom(:,4)==10);
ind_no_50  =find(lim_hom(:,4)==50);
ind_no_100 =find(lim_hom(:,4)==100);

MW         = 136.24;
Na         = 6.022E23; % [#/mol] 
ch_air     = 2.47E19 ;

Soa  = (lim_hom(:,6)./100).*(lim_hom(:,5)*MW*12.187./298.15) ; %ug/m3 mass conc of organic aerosol in condensed phase
C_oa = lim_hom(:,5)*MW*12.187./298.15;  %ug/m3 reacted VOC
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


% h   = scatter(lim_hom(ind_o3,5), lim_hom(ind_o3,6),  'filled','s' ,'MarkerFaceColor','b');hold on;
% h   = scatter(lim_hom(ind_no3,5), lim_hom(ind_no3,6),  'filled','d' ,'MarkerFaceColor','m');hold on

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
    
    
ind_oh_2   =find(bpin_hom(:,2)==2);
ind_oh_5   =find(bpin_hom(:,2)==5);
ind_oh_10  =find(bpin_hom(:,2)==10);
ind_oh_50  =find(bpin_hom(:,2)==50);
ind_oh_100 =find(bpin_hom(:,2)==100);

ind_o3_1   =find(bpin_hom(:,3)==1);
ind_o3_5   =find(bpin_hom(:,3)==5);
ind_o3_10  =find(bpin_hom(:,3)==10);
ind_o3_50  =find(bpin_hom(:,3)==50);
ind_o3_100 =find(bpin_hom(:,3)==100);

ind_no_1   =find(bpin_hom(:,4)==1);
ind_no_5   =find(bpin_hom(:,4)==5);
ind_no_10  =find(bpin_hom(:,4)==10);
ind_no_50  =find(bpin_hom(:,4)==50);
ind_no_100 =find(bpin_hom(:,4)==100);

MW         = 136.23;
Na         = 6.022E23; % [#/mol] 
ch_air     = 2.47E19 ;

Soa  = (bpin_hom(:,6)./100).*(bpin_hom(:,5)*MW*12.187./293.15) ; %ug/m3 mass conc of organic aerosol in condensed phase
C_oa = bpin_hom(:,5)*MW*12.187./293.15;  %ug/m3 reacted VOC
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


% h   = scatter(bpin_hom(ind_o3,5), bpin_hom(ind_o3,6),  'filled','s' ,'MarkerFaceColor','b');hold on;
% h   = scatter(bpin_hom(ind_no3,5), bpin_hom(ind_no3,6),  'filled','d' ,'MarkerFaceColor','m');hold on

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

% function F = myfun(a)
%  j = 1:5;
%  F = (a(j)./(1+cc(j)./x));
% end