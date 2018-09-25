
%% function
function apinene_plot(comp_5,comp_10,comp_278,comp_303,comp_258,comp_313,comp_hom,comp_mcm,MW,name_fig)

index_o3      =find(comp_hom(:,3) ~= 0);
index_oh      =find(comp_hom(:,2) ~= 0);
index_no3     =find(comp_hom(:,4) ~= 0);


i4        =find(comp_hom(:,3) == 1);
i5        =find(comp_hom(:,3) == 5);
i10       =find(comp_hom(:,3) == 10);
i50       =find(comp_hom(:,3) == 50);
i100      =find(comp_hom(:,3) == 100);

apin_comp_val = [0.5,1,5,50,100,200];

% r25      = comp_hom(:,5)./2.5; %voc/nox
% r75      = comp_5(:,5)./7.5;
% r125     = comp_10(:,5)./12.5;

r25      = apin_comp_val./2.5; %voc/nox
r75      = apin_comp_val./7.5;
r125     = apin_comp_val./12.5;

Na         = 6.022E23; % [#/mol] 
ch_air     = 2.47E19 ;

Coa_h   = (comp_hom(:,6)./100).*(comp_hom(:,5)*MW*12.187./293.15) ; %ug/m3 mass conc of organic aerosol in condensed phase
dcoa_h  = comp_hom(:,5)*MW*12.187./293.15;  %ug/m3 reacted VOC
amf_h   = Coa_h./dcoa_h; % in percentage 

Coa_m   = (comp_mcm(:,6)./100).*(comp_mcm(:,5)*MW*12.187./293.15) ; %ug/m3 mass conc of organic aerosol in condensed phase
dcoa_m  = comp_mcm(:,5)*MW*12.187./293.15;  %ug/m3 reacted VOC
amf_m   = Coa_m./dcoa_m; % in percentage 

 %NO and tempereature runs
% 5 ppb ~7.5 ppb
Coa_5   = (comp_5(:,6)./100).*(comp_5(:,5)*MW*12.187./293.15) ; %ug/m3 mass conc of organic aerosol in condensed phase
dcoa_5  = comp_5(:,5)*MW*12.187./293.15;  %ug/m3 reacted VOC
amf_5   = Coa_5./dcoa_5; % in percentage 

% 10 ppb ~12.5 ppb
Coa_10   = (comp_10(:,6)./100).*(comp_10(:,5)*MW*12.187./293.15) ; %ug/m3 mass conc of organic aerosol in condensed phase
dcoa_10  = comp_10(:,5)*MW*12.187./293.15;  %ug/m3 reacted VOC
amf_10   = Coa_10./dcoa_10; % in percentage 

% 278 K
Coa_278    = (comp_278(:,6)./100).*(comp_278(:,5)*MW*12.187./278.15) ; %ug/m3 mass conc of organic aerosol in condensed phase
dcoa_278   = comp_278(:,5)*MW*12.187./278.15;  %ug/m3 reacted VOC
amf_278    = Coa_278./dcoa_278; % in percentage 

% 258 K
Coa_258    = (comp_258(:,6)./100).*(comp_258(:,5)*MW*12.187./258.15) ; %ug/m3 mass conc of organic aerosol in condensed phase
dcoa_258   = comp_258(:,5)*MW*12.187./258.15;  %ug/m3 reacted VOC
amf_258    = Coa_258./dcoa_258; % in percentage 

% 303 K
Coa_303   = (comp_303(:,6)./100).*(comp_303(:,5)*MW*12.187./303.15) ; %ug/m3 mass conc of organic aerosol in condensed phase
dcoa_303  = comp_303(:,5)*MW*12.187./303.15;  %ug/m3 reacted VOC
amf_303   = Coa_303./dcoa_303; % in percentage 

% 313 K
Coa_313   = (comp_313(:,6)./100).*(comp_313(:,5)*MW*12.187./313.15) ; %ug/m3 mass conc of organic aerosol in condensed phase
dcoa_313  = comp_313(:,5)*MW*12.187./313.15;  %ug/m3 reacted VOC
amf_313   = Coa_313./dcoa_313; % in percentage 

coah_5    = (Coa_5(index_o3));
y_5       = (amf_5(index_o3));

coah_10    = (Coa_10(index_o3));
y_10       = (amf_10(index_o3));

coah_278    = (Coa_278(index_o3));
y_278       = (amf_278(index_o3));

coah_303    = (Coa_303(index_o3));
y_303       = (amf_303(index_o3));

coah_258    = (Coa_258(index_o3));
y_258       = (amf_258(index_o3));

coah_313    = (Coa_313(index_o3));
y_313       = (amf_313(index_o3));
    
    
initial_conc = comp_hom(:,1)*MW*12.187./293.15;

oh_net  = comp_hom(:,2)*1e6 ;%.* (comp_hom(:,7)).^2.*360 *1e6;
o3_net  = comp_hom(:,3)*1e11;% .* (comp_hom(:,7)).^2.*360 *1e11;
no3_net = comp_hom(:,4)*1e7 ;% .* (comp_hom(:,7)).^2.*360 *1e7;


coah_o3    = (Coa_h(index_o3));
dcoah_o3   = (dcoa_h(index_o3));
y_h_o3     = (amf_h(index_o3));
 
coah_oh    = (Coa_h(index_oh));
dcoah_oh   = (dcoa_h(index_oh));
y_h_oh     = (amf_h(index_oh));

coah_no3   = (Coa_h(index_no3));
dcoah_no3  = (dcoa_h(index_no3));
y_h_no3    = (amf_h(index_no3));

coam_o3    = (Coa_m(index_o3));
dcoam_o3   = (dcoa_m(index_o3));
y_m_o3     = (amf_m(index_o3));

coam_oh    = (Coa_m(index_oh));
dcoam_oh   = (dcoa_m(index_oh));
y_m_oh     = (amf_m(index_oh));

coam_no3   = (Coa_m(index_no3));
dcoam_no3  = (dcoa_m(index_no3));
y_m_no3    = (amf_m(index_no3));


            
    %% O_3 oxidant based plot
figure('Position',[1 1 1200 1200]); %( x,y)
clf
box on
set(gca, 'fontsize', [15], 'linewidth', [2])
hold all

subplot(2,1,1)
h   = scatter(coah_o3, y_h_o3, 40, 'filled','s' ,'MarkerFaceColor','k');hold on;
h   = scatter(coam_o3, y_m_o3, 40,'filled','o' ,'MarkerFaceColor','r');hold on;
% h   = fplot(coah_o3, res, 'k')

% lh = legend('HOM','MCM');
% set(lh,'Location','NorthWest', 'FontWeight', 'bold') ;

 lh = legend({'HOM','MCM'});
 newPosition = [0.8 0.475 0.01 0.075];
 newUnits = 'normalized';
 set(lh,'Position', newPosition,'Units', newUnits,'Location','NorthWest');
 

set(gca,'xscale','log')
grid on
box on

title(sprintf('%s vs O_3 (Chamber runs)' ,name_fig))
xlabel('SOA mass loading (\mug/m^3) ','FontSize',15,'FontWeight','bold','Color','k')
ylabel('Yield ','FontSize',15,'FontWeight','bold','Color','k')
set(gca,'FontSize',15,'FontWeight','bold')

    %% OH oxidant based plot
% figure('Position',[1 1 1200 1200]); %( x,y)
% clf
% box on
% set(gca, 'fontsize', [20], 'linewidth', [2])
% hold all

% lh = legend({'2.5ppb','5ppb','10ppb'});
subplot(2,1,2)


h   = scatter(coah_oh, y_h_oh,40,  'filled','s' ,'MarkerFaceColor','k');hold on;
h   = scatter(coam_oh, y_m_oh,40,  'filled','o' ,'MarkerFaceColor','r');hold on;
% h   = fplot(coah_o3, res, 'k')

% lh = legend('HOM','MCM');
% set(lh,'Location','NorthWest', 'FontWeight', 'bold') ;

set(gca,'xscale','log')
grid on
box on
 lh = legend({'HOM','MCM'});
 newPosition = [0.8 0.475 0.01 0.075];
 newUnits = 'normalized';
 set(lh,'Position', newPosition,'Units', newUnits,'Location','NorthWest');
 

title(sprintf('%s vs OH (Chamber runs)' ,name_fig))
xlabel('SOA mass loading (\mug/m^3)','FontSize',15,'FontWeight','bold','Color','k')
ylabel('Yield ','FontSize',15,'FontWeight','bold','Color','k')
set(gca,'FontSize',15,'FontWeight','bold')

    %% no3 oxidant based plot
figure('Position',[1 1 1200 1200]); %( x,y)
clf
box on
set(gca, 'fontsize', [15], 'linewidth', [2])
hold all


h   = scatter(coah_no3, y_h_no3,  'filled','s' ,'MarkerFaceColor','k');hold on;
h   = scatter(coam_no3, y_m_no3,  'filled','o' ,'MarkerFaceColor','r');hold on;
% h   = fplot(coah_o3, res, 'k')

lh = legend('HOM','MCM');
set(lh,'Location','NorthWest', 'FontWeight', 'bold') ;

set(gca,'xscale','log')
grid on

title(sprintf('%s vs NO_3' ,name_fig))
xlabel('SOA mass loading (ug/m^3)','FontSize',15,'FontWeight','bold','Color','k')
ylabel('Yield ','FontSize',15,'FontWeight','bold','Color','k')
set(gca,'FontSize',15,'FontWeight','bold')

%% NO runs
figure('Position',[1 1 1200 1200]); %( x,y)
clf
box on
set(gca, 'fontsize', [20], 'linewidth', [2])
hold all

h   = scatter(coah_o3, y_h_o3,40,'filled','s' ,'MarkerFaceColor','b');hold on;
h   = scatter(coah_5, y_5,    40, 'filled','o' ,'MarkerFaceColor','r');hold on;
h   = scatter(coah_10, y_10,  40,  'filled','^' ,'MarkerFaceColor','g');hold on;

% h   = fplot(coah_o3, res, 'k')

lh = legend('2.5ppb','5ppb','10ppb');
set(lh,'Location','NorthWest', 'FontWeight', 'bold') ;
newPosition = [0.8 0.475 0.01 0.075];
 newUnits = 'normalized';
 set(lh,'Position', newPosition,'Units', newUnits,'Location','NorthWest')
set(gca,'xscale','log')
grid on

title(sprintf(' %s vs O_3 - NO_x dependence (Chamber runs)', name_fig))
xlabel('SOA mass loading(ug/m^3)','FontSize',15,'FontWeight','bold','Color','k')
ylabel('Yield ','FontSize',15,'FontWeight','bold','Color','k')
set(gca,'FontSize',15,'FontWeight','bold')


%% [VOC/NOx]
figure('Position',[1 1 1200 1200]); %( x,y)
clf
box on
set(gca, 'fontsize', [20], 'linewidth', [2])
hold all

subplot(2,1,1)
% 
h = zeros(5,1);


h(1)   = scatter(r25,amf_h(i4), 80,'filled','s' );hold on;
h(2)   = scatter(r25,amf_h(i5), 80,'filled','d' );hold on
h(3)   = scatter(r25,amf_h(i10), 80,'filled','v' );hold on;
h(4)   = scatter(r25,amf_h(i50), 80,'filled','^' );hold on;
h(5)   = scatter(r25,amf_h(i100), 80,'filled','o' );hold on;

% 
h1   = scatter(r25,amf_h(i4), 80,'filled','s' ,'MarkerFaceColor','b');hold on;
h1   = scatter(r25,amf_h(i5), 80,'filled','d' ,'MarkerFaceColor','b');hold on
h1   = scatter(r25,amf_h(i10), 80,'filled','v' ,'MarkerFaceColor','b');hold on;
h1   = scatter(r25,amf_h(i50), 80,'filled','^' ,'MarkerFaceColor','b');hold on;
h1   = scatter(r25,amf_h(i100), 80,'filled','o' ,'MarkerFaceColor','b');hold on;



h2    = scatter(r75,amf_5(i4), 80,'filled','s' ,'MarkerFaceColor','k');hold on;
h2    = scatter(r75,amf_5(i5), 80,'filled','d' ,'MarkerFaceColor','k');hold on
h2    = scatter(r75,amf_5(i10), 80,'filled','v' ,'MarkerFaceColor','k');hold on;
h2    = scatter(r75,amf_5(i50), 80,'filled','^' ,'MarkerFaceColor','k');hold on;
h2    = scatter(r75,amf_5(i100), 80,'filled','o' ,'MarkerFaceColor','k');hold on;


h3    = scatter(r125,amf_10(i4), 80,'filled','s' ,'MarkerFaceColor','r');hold on;
h3    = scatter(r125,amf_10(i5), 80,'filled','d' ,'MarkerFaceColor','r');hold on
h3    = scatter(r125,amf_10(i10), 80,'filled','v' ,'MarkerFaceColor','r');hold on;
h3    = scatter(r125,amf_10(i50), 80,'filled','^' ,'MarkerFaceColor','r');hold on;
h3    = scatter(r125,amf_10(i100), 80,'filled','o' ,'MarkerFaceColor','r');hold on;


xlim([-0.5 100])
ll = legend(h,{'4ppb','20ppb','40ppb','50ppb','100ppb'});

% legend(h,'M elements used','N elements used','P time steps','Q time steps','R time steps')
 newPosition = [0.8 0.475 0.01 0.075];
 newUnits = 'normalized';
 set(ll,'Position', newPosition,'Units', newUnits,'Location','NorthWest', 'FontWeight', 'bold') ;
 title(ll, 'O_3 concentrations')

grid on

title(sprintf(' %s vs O_3 - NO_x dependence', name_fig))
% title('O_3 dependence')
xlabel('[VOC/NO_x]','FontSize',12,'FontWeight','bold','Color','k')
ylabel('Yield ','FontSize',12,'FontWeight','bold','Color','k')
set(gca,'FontSize',12,'FontWeight','bold')
% 

%   handaxes2 = axes('position',  [0.575 0.175 0.3 0.3]);
%   set(gca, 'fontsize', [14], 'linewidth', [1])
%   hold all
 
% 
subplot(2,1,2)
set(gca, 'fontsize', [14], 'linewidth', [1])
hold all
box on
h1   = scatter(r25,amf_h(i4), 40,'filled','s' ,'MarkerFaceColor','b');hold on;
h1   = scatter(r25,amf_h(i5), 40,'filled','d' ,'MarkerFaceColor','b');hold on
h1   = scatter(r25,amf_h(i10), 40,'filled','v' ,'MarkerFaceColor','b');hold on;
h1   = scatter(r25,amf_h(i50), 40,'filled','^' ,'MarkerFaceColor','b');hold on;
h1   = scatter(r25,amf_h(i100), 40,'filled','o' ,'MarkerFaceColor','b');hold on;



h2    = scatter(r75,amf_5(i4), 40,'filled','s' ,'MarkerFaceColor','k');hold on;
h2    = scatter(r75,amf_5(i5), 40,'filled','d' ,'MarkerFaceColor','k');hold on
h2    = scatter(r75,amf_5(i10), 40,'filled','v' ,'MarkerFaceColor','k');hold on;
h2    = scatter(r75,amf_5(i50), 40,'filled','^' ,'MarkerFaceColor','k');hold on;
h2    = scatter(r75,amf_5(i100), 40,'filled','o' ,'MarkerFaceColor','k');hold on;


h3    = scatter(r125,amf_10(i4), 40,'filled','s' ,'MarkerFaceColor','r');hold on;
h3    = scatter(r125,amf_10(i5), 40,'filled','d' ,'MarkerFaceColor','r');hold on
h3    = scatter(r125,amf_10(i10), 40,'filled','v' ,'MarkerFaceColor','r');hold on;
h3    = scatter(r125,amf_10(i50), 40,'filled','^' ,'MarkerFaceColor','r');hold on;
h3    = scatter(r125,amf_10(i100), 40,'filled','o' ,'MarkerFaceColor','r');hold on;

xlim([-0.05 2.2])
ylim([0.06 0.09])
grid on 

xlabel('[VOC/NO_x]','FontSize',12,'FontWeight','bold','Color','k')
ylabel('Yield ','FontSize',12,'FontWeight','bold','Color','k')
set(gca,'FontSize',12,'FontWeight','bold')

% 
%   handaxes2 = axes('position',  [0.575 0.145 0.3 0.15]);
%   set(gca, 'fontsize', [14], 'linewidth', [1])
%   hold all
%  
% % 
% 
% % set(gca, 'fontsize', [14], 'linewidth', [1])
% % hold all
% box on
% h1   = scatter(r25,amf_h(i4), 40,'filled','s' ,'MarkerFaceColor','b');hold on;
% h1   = scatter(r25,amf_h(i5), 40,'filled','d' ,'MarkerFaceColor','b');hold on
% h1   = scatter(r25,amf_h(i10), 40,'filled','v' ,'MarkerFaceColor','b');hold on;
% h1   = scatter(r25,amf_h(i50), 40,'filled','^' ,'MarkerFaceColor','b');hold on;
% h1   = scatter(r25,amf_h(i100), 40,'filled','o' ,'MarkerFaceColor','b');hold on;
% 
% 
% 
% h2    = scatter(r75,amf_5(i4), 40,'filled','s' ,'MarkerFaceColor','k');hold on;
% h2    = scatter(r75,amf_5(i5), 40,'filled','d' ,'MarkerFaceColor','k');hold on
% h2    = scatter(r75,amf_5(i10), 40,'filled','v' ,'MarkerFaceColor','k');hold on;
% h2    = scatter(r75,amf_5(i50), 40,'filled','^' ,'MarkerFaceColor','k');hold on;
% h2    = scatter(r75,amf_5(i100), 40,'filled','o' ,'MarkerFaceColor','k');hold on;
% 
% 
% h3    = scatter(r125,amf_10(i4), 40,'filled','s' ,'MarkerFaceColor','r');hold on;
% h3    = scatter(r125,amf_10(i5), 40,'filled','d' ,'MarkerFaceColor','r');hold on
% h3    = scatter(r125,amf_10(i10), 40,'filled','v' ,'MarkerFaceColor','r');hold on;
% h3    = scatter(r125,amf_10(i50), 40,'filled','^' ,'MarkerFaceColor','r');hold on;
% h3    = scatter(r125,amf_10(i100), 40,'filled','o' ,'MarkerFaceColor','r');hold on;
% 
% xlim([-0.05 0.8])
% ylim([0.06 0.08])
% grid on 
% 
% xlabel('[VOC/NO_x]','FontSize',8,'FontWeight','bold','Color','k')
% ylabel('Yield ','FontSize',8,'FontWeight','bold','Color','k')
% set(gca,'FontSize',8,'FontWeight','bold')

%% temp runs
figure('Position',[1 1 1200 1200]); %( x,y)
clf
box on
set(gca, 'fontsize', [15], 'linewidth', [2])
hold all

h   = scatter(coah_258, y_258, 40, 'filled','^' ,'MarkerFaceColor','g');hold on;
h   = scatter(coah_278, y_278, 40, 'filled','o' ,'MarkerFaceColor','r');hold on;
h   = scatter(coah_o3, y_h_o3, 50, 'filled','s' ,'MarkerFaceColor','b');hold on;
h   = scatter(coah_303, y_303, 40, 'filled','p' ,'MarkerFaceColor','k');hold on;
h   = scatter(coah_313, y_313, 40, 'filled','h' ,'MarkerFaceColor','c');hold on;


% h   = fplot(coah_o3, res, 'k')
lh = legend('258.15 K','278.15 K','293.15 K','303.15 K','313.15 K');
%set(lh,'Location','NorthWest', 'FontWeight', 'bold') ;
newPosition = [0.8 0.475 0.01 0.075];
newUnits = 'normalized';
set(lh,'Position', newPosition,'Units', newUnits,'Location','NorthWest')
set(gca,'xscale','log')
grid on

title(sprintf(' %s vs O_3 - Temperature dependence (Chamber runs)', name_fig))
xlabel('SOA mass loading (\mug/m^3)','FontSize',15,'FontWeight','bold','Color','k')
ylabel('Yield ','FontSize',15,'FontWeight','bold','Color','k')
set(gca,'FontSize',15,'FontWeight','bold')

end

