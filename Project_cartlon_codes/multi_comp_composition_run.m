% use nc_read.m 
% 
close all
% clear all
clc

%apin
% fapi_no3   =  '/home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Test1234/A200/hom_api_90.nc';
% fapi_o3    =  '/home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Test1234/A200/hom_api_85.nc';
% fapi_oh    =  '/home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Test1234/A200/hom_api_78.nc';

%bpin
% fbpi_oh    =  '/home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Test1234/A200/hom_bpi_77.nc';
% fbpi_o3    =  '/home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Test1234/A200/hom_bpi_84.nc';
% 
% %isop
% fiso_oh    =  '/home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Test1234/A200/hom_iso_48.nc';
% 
% %bca
% fbca_oh    =  '/home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Test1234/A200/hom_bca_63.nc';
% fbca_o3    =  '/home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Test1234/A200/hom_bca_69.nc';
% fbca_no    =  '/home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Test1234/A200/hom_bca_75.nc';

%lim
% flim_oh    =  '/home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Test1234/A200/hom_lim_63.nc';
% flim_o3    =  '/home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Test1234/A200/hom_lim_70.nc';
flim_no3    =  '/home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Test1234/A200/ch_hom_lim_75.nc';

vap_path  = '/home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_in/';
vap_prop = load([vap_path,'Vapour_properties.dat']);
vap_name = importdata([vap_path,'Vapour_names.dat']); % for ascii file

% 

% cap_oh  = nc_read(fapi_oh);
% cap_o3  = nc_read(fapi_o3);
% cap_no  = nc_read(fapi_no3);
% 
% cbp_oh  = nc_read(fbpi_oh);
% cbp_o3  = nc_read(fbpi_o3);
% 
% cli_oh  = nc_read(flim_oh);
% cli_o3  = nc_read(flim_o3);
cli_no  = nc_read(flim_no3);

% cbc_oh  = nc_read(fbca_oh);
% cbc_o3  = nc_read(fbca_o3);
% cbc_no  = nc_read(fbca_no);
% 
% cis_oh  = nc_read(fiso_oh);

% oh = 1; o3=2; no3 =3

% ind_data(cap_oh,vap_prop, vap_name,'Alpha-pinene + OH',2,1)
% ind_data(cap_o3,vap_prop, vap_name,'Alpha-pinene + O_3',2,2)
% ind_data(cap_no,vap_prop, vap_name,'Alpha-pinene + NO_3',2,3)
%  ind_data(cbp_oh,vap_prop, vap_name,'Beta-pinene  + OH',5,1)
%  ind_data(cbp_o3,vap_prop, vap_name,'Beta-pinene + O_3',5,2)
%  ind_data(cli_oh,vap_prop, vap_name,'Limonene + OH',3,1)
%  ind_data(cli_o3,vap_prop, vap_name,'Limonene + O_3',3,2)
 ind_data(cli_no,vap_prop, vap_name,'Limonene + NO_3',3,3)
%   ind_data(cbc_no,vap_prop, vap_name,'Beta-carp + NO_3',4,3)
%  ind_data(cbc_oh,vap_prop, vap_name,'Beta-Carp + OH',4,1)
%  ind_data(cbc_o3,vap_prop, vap_name,'Beta-carp + O_3',4,2)
%  ind_data(cis_oh,vap_prop, vap_name,'Isoprene  + OH',1,1)

%%

function ind_data(cp_comp, vap_prop, vap_name, fig_name,cc,nn)

ind = find(cp_comp>=0.25);  

%12.5 ppb
[hom_comp,mcm_comp,contri_comp,par_comp,mw_comp,names_h_comp,names_m_comp,...
          mw_h_comp,mw_m_comp,h_c_comp, m_c_comp,names_comp] = hm_contribution(ind,...
                                  cp_comp,vap_prop,vap_name,fig_name,nn,cc);
                                                

end


function [hom,mcm,cont,par,mw,names_h,names_m,...
          mw_h,mw_m,hom_cont, mcm_cont, names] = hm_contribution(ind,cp,...
                                                 vap_prop, vap_name,fig_name,nn,cc)

par              = cp(ind);
mw               = vap_prop(ind,1); % molcular weight of compounds who contribute > 1ug/m3
names            = string(vap_name(ind));
mf               = par./sum(cp);
cont             = sum(par)/sum(cp) * 100 ; % output
hom_ind          = find(contains(names, 'HOM'));
mcm_ind          = find(~contains(names,'HOM'));
hom_cont         = sum(par(hom_ind))/sum(par)* 100; % output
hom              = par(hom_ind);
mcm_cont         = sum(par(mcm_ind))/sum(par)* 100; % output
mcm              = par(mcm_ind);
mw_h             = mw(hom_ind);
mw_m             = mw(mcm_ind);
names_h          = names(hom_ind);
names_m          = names(mcm_ind);

% all HOMs and MCM compounds contribution

hom_ind_all      = find(contains(vap_name(1:end-1), 'HOM'));
mcm_ind_all      = find(~contains(vap_name(1:end-1),'HOM'));
hm_all_cont      = sum(cp(hom_ind_all))/sum(cp) * 100;
mcm_all_cont     = sum(cp(mcm_ind_all))/sum(cp) * 100;


% writing into the file
% re_write(tp,ppb, cont,hom_cont,mcm_cont)
% if (size(hom_ind) ~= 0 & size(mcm_ind) ~=0 )
    
% re_write(nn, cc, cont,hm_all_cont,mcm_all_cont) % for NOx runs tp = conc. of NOx 


figure('Position',[1 1 1200 1200]); %( x,y)
clf
box on
set(gca, 'fontsize', [10], 'linewidth', [2])
hold all

subplot(2,1,1)

b = barh(mcm,0.25,'g');hold on
yticks([1:length(mw_m)])
set(gca,'yticklabel',names_m)
xtickangle(0)
% str1 = {strcat('total contribution of listed compounds (%) = ', num2str(contri_293))};
% str2 = {strcat('total contribution of HOM compounds (%) = ' , num2str(h_c_293))};
str3 = {strcat('Contribution of MCM compounds to total SOA mass(%) = ' , num2str(mcm_cont))};

legend(str3{:});
xlabel('SOA mass (\mug/m^3) by MCM contribution ')
ax1 = gca;
ax2 = axes('Position', get(ax1, 'Position'),'Color', 'none');
set(ax2, 'XAxisLocation', 'top','YAxisLocation','Right');
set(ax2, 'XLim', get(ax1, 'XLim'),'YLim', get(ax1, 'YLim'));
set(ax2, 'YTick', get(ax1, 'YTick'),'XTick', []);
set(ax2, 'YTickLabel',mw_m);
xtickangle(0)



subplot(2,1,2)
 
b = barh(hom,0.25,'r');hold on
yticks([1:length(mw_h)])
set(gca,'yticklabel',names_h)
xtickangle(0)
%   str1 = {strcat('total contribution of listed compounds (%) = ', num2str(contri_293))};
  str2 = {strcat('Contribution of HOM compounds to total SOA mass(%) = ' , num2str(hom_cont))};
%  str3 = {strcat('total contribution of MCM compounds (%) = ' , num2str(m_c_293))};

% dim = [.2 .5 .3 .3];
% annotation('textbox',dim,'String',str1)
legend(str2{:});
xlabel('SOA mass (\mug/m^3) by HOM contribution ')
ax1 = gca;
ax2 = axes('Position', get(ax1, 'Position'),'Color', 'none');
set(ax2, 'XAxisLocation', 'top','YAxisLocation','Right');
set(ax2, 'XLim', get(ax1, 'XLim'),'YLim', get(ax1, 'YLim'));
set(ax2, 'YTick', get(ax1, 'YTick'),'XTick', []);
set(ax2, 'YTickLabel',mw_h);
xtickangle(0)
 
 
suptitle([fig_name])


filename = [fig_name '.jpg'];
 saveas(gcf,filename)
 
end

% end

function re_write(nn,cc, cont,hom_cont,mcm_cont) % replace no with tp

fid1 = fopen('/home/local/carltonx/Work/Malte_box/Project_runs/Final_Results/Results/max_yield.dat','a+');

fprintf (fid1, '%22.3f',  nn);
fprintf (fid1, '%22.3f',  cc);
fprintf (fid1, '%22.3f',  cont);
fprintf (fid1, '%22.3f',  hom_cont);
fprintf (fid1, '%22.3f',  mcm_cont);

fprintf (fid1, '\n');

end
