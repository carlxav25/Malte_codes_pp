
%% function
function data_read_plot(comp_hom,comp_mcm,MW,name_fig)

index_o3      =find(comp_hom(:,3) ~= 0);
index_oh      =find(comp_hom(:,2) ~= 0);
index_no3     =find(comp_hom(:,4) ~= 0);

Na         = 6.022E23; % [#/mol] 
ch_air     = 2.47E19 ;

Coa_h   = (comp_hom(:,6)./100).*(comp_hom(:,5)*MW*12.187./293.15) ; %ug/m3 mass conc of organic aerosol in condensed phase
dcoa_h  = comp_hom(:,5)*MW*12.187./293.15;  %ug/m3 reacted VOC
amf_h   = Coa_h./dcoa_h; % in percentage 

Coa_m   = (comp_mcm(:,6)./100).*(comp_mcm(:,5)*MW*12.187./293.15) ; %ug/m3 mass conc of organic aerosol in condensed phase
dcoa_m  = comp_mcm(:,5)*MW*12.187./293.15;  %ug/m3 reacted VOC
amf_m   = Coa_m./dcoa_m; % in percentage 


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
set(gca, 'fontsize', [20], 'linewidth', [2])
hold all


h   = scatter(coah_o3, y_h_o3,  '','s' ,'MarkerFaceColor','b');hold on;
h   = scatter(coam_o3, y_m_o3,  'filled','o' ,'MarkerFaceColor','r');hold on;
% h   = fplot(coah_o3, res, 'k')

lh = legend('HOM','MCM');
set(lh,'Location','NorthWest', 'FontWeight', 'bold') ;

set(gca,'xscale','log')
grid on

title(sprintf('%s vs O_3' ,name_fig))
xlabel('SOA mass loading (ug/m^3)','FontSize',20,'FontWeight','bold','Color','k')
ylabel('AMF','FontSize',20,'FontWeight','bold','Color','k')
set(gca,'FontSize',20,'FontWeight','bold')

    %% OH oxidant based plot
figure('Position',[1 1 1200 1200]); %( x,y)
clf
box on
set(gca, 'fontsize', [20], 'linewidth', [2])
hold all


h   = scatter(coah_oh, y_h_oh,  '','s' ,'MarkerFaceColor','b');hold on;
h   = scatter(coam_oh, y_m_oh,  'filled','o' ,'MarkerFaceColor','r');hold on;
% h   = fplot(coah_o3, res, 'k')

lh = legend('HOM','MCM');
set(lh,'Location','NorthWest', 'FontWeight', 'bold') ;

set(gca,'xscale','log')
grid on

title(sprintf('%s vs OH' ,name_fig))
xlabel('SOA mass loading (ug/m^3)','FontSize',20,'FontWeight','bold','Color','k')
ylabel('AMF','FontSize',20,'FontWeight','bold','Color','k')
set(gca,'FontSize',20,'FontWeight','bold')

    %% no3 oxidant based plot
figure('Position',[1 1 1200 1200]); %( x,y)
clf
box on
set(gca, 'fontsize', [20], 'linewidth', [2])
hold all


h   = scatter(coah_no3, y_h_no3,  '','s' ,'MarkerFaceColor','b');hold on;
h   = scatter(coam_no3, y_m_no3,  'filled','o' ,'MarkerFaceColor','r');hold on;
% h   = fplot(coah_o3, res, 'k')

lh = legend('HOM','MCM');
set(lh,'Location','NorthWest', 'FontWeight', 'bold') ;

set(gca,'xscale','log')
grid on

title(sprintf('%s vs NO_3' ,name_fig))
xlabel('SOA mass loading (ug/m^3)','FontSize',20,'FontWeight','bold','Color','k')
ylabel('AMF','FontSize',20,'FontWeight','bold','Color','k')
set(gca,'FontSize',20,'FontWeight','bold')

end

