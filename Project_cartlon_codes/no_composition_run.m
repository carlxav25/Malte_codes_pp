% use nc_read.m 
% 
close all
% clear all
clc

% % for 4 ppb O3
% f4_293 =  /home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Test1234/A200/hom_api_51.nc';
% f4_278 =  /home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Test1234/A200/278_api_51.nc';
% f4_303 =  /home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Test1234/A200/303_api_51.nc';
% f4_258 =  /home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Test1234/A200/258_api_51.nc';
% f4_313 =  /home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Test1234/A200/313_api_51.nc';
% 
% % for 40 ppb O3
% f20_293 =  /home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Test1234/A200/hom_api_52.nc';
% f20_278 =  /home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Test1234/A200/278_api_52.nc';
% f20_303 =  /home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Test1234/A200/303_api_52.nc';
% f20_258 =  /home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Test1234/A200/258_api_52.nc';
% f20_313 =  /home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Test1234/A200/313_api_52.nc';
% 
% % for 40 ppb O3
% f40_293 =  /home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Test1234/A200/hom_api_53.nc';
% f40_278 =  /home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Test1234/A200/278_api_53.nc';
% f40_303 =  /home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Test1234/A200/303_api_53.nc';
% f40_258 =  /home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Test1234/A200/258_api_53.nc';
% f40_313 =  /home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Test1234/A200/313_api_53.nc';
% 
% % for 40 ppb O3
% f40_293 =  /home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Test1234/A200/hom_api_53.nc';
% f40_278 =  /home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Test1234/A200/278_api_53.nc';
% f40_303 =  /home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Test1234/A200/303_api_53.nc';
% f10_258 =  /home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Test1234/A200/258_api_53.nc';
% f40_313 =  /home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Test1234/A200/313_api_53.nc';
% 
% % for 50 ppb O3
% f50_293 =  /home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Test1234/A200/hom_api_54.nc';
% f50_278 =  /home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Test1234/A200/278_api_54.nc';
% f50_303 =  /home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Test1234/A200/303_api_54.nc';
% f50_258 =  /home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Test1234/A200/258_api_54.nc';
% f50_313 =  /home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Test1234/A200/313_api_54.nc';
% 
% % for 100 ppb O3
% f100_293 =  /home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Test1234/A200/hom_api_55.nc';
% f100_278 =  /home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Test1234/A200/278_api_55.nc';
% f100_303 =  /home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Test1234/A200/303_api_55.nc';
% f100_258 =  /home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Test1234/A200/258_api_55.nc';
% f100_313 =  /home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Test1234/A200/313_api_55.nc';


% for NOx = 2.5 ppb
f25_51 =  '/home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Test1234/A200/hom_api_51.nc';
f25_52 =  '/home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Test1234/A200/hom_api_55.nc';
% f25_53 =  '/home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Test1234/A200/hom_api_53.nc';
% f25_54 =  '/home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Test1234/A200/hom_api_54.nc';
% f25_55 =  '/home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Test1234/A200/hom_api_55.nc';

% for NOx = 7.5 ppb
f75_51 =  '/home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Test1234/A200/75_api_51.nc';
f75_52 =  '/home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Test1234/A200/75_api_55.nc';
% f75_53 =  '/home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Test1234/A200/75_api_53.nc';
% f75_54 =  '/home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Test1234/A200/75_api_54.nc';
% f75_55 =  '/home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Test1234/A200/75_api_55.nc';

% for NOx = 7.5 ppb
f125_51 =  '/home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Test1234/A200/125_api_51.nc';
f125_52 =  '/home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Test1234/A200/125_api_55.nc';
% f125_53 =  '/home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Test1234/A200/125_api_53.nc';
% f125_54 =  '/home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Test1234/A200/125_api_54.nc';
% f125_55 =  '/home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Test1234/A200/125_api_55.nc';

% for OH
% f_oh  =  /home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Test1234/A200/oh_api_48.nc';

vap_path  = '/home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_in/';
vap_prop = load([vap_path,'Vapour_properties.dat']);
vap_name = importdata([vap_path,'Vapour_names.dat']); % for ascii file

% 
% c4_293 = nc_read(f4_293);
% c4_278 = nc_read(f4_278);
% c4_303 = nc_read(f4_303);
% c4_258 = nc_read(f4_258);
% c4_313 = nc_read(f4_313);
% 
% c20_293 = nc_read(f20_293);
% c20_278 = nc_read(f20_278);
% c20_303 = nc_read(f20_303);
% c20_258 = nc_read(f20_258);
% c20_313 = nc_read(f20_313);
% 
% c40_293 = nc_read(f40_293);
% c40_278 = nc_read(f40_278);
% c40_303 = nc_read(f40_303);
% c40_258 = nc_read(f40_258);
% c40_313 = nc_read(f40_313);
% 
% c50_293 = nc_read(f50_293);
% c50_278 = nc_read(f50_278);
% c50_303 = nc_read(f50_303);
% c50_258 = nc_read(f50_258);
% c50_313 = nc_read(f50_313);
% 
% c100_293 = nc_read(f100_293);
% c100_278 = nc_read(f100_278);
% c100_303 = nc_read(f100_303);
% c100_258 = nc_read(f100_258);
% c100_313 = nc_read(f100_313);


c25_51 = nc_read(f25_51);
c25_52 = nc_read(f25_52);
% c25_53 = nc_read(f25_53);
% c25_54 = nc_read(f25_54);
% c25_55 = nc_read(f25_55);

c75_51 = nc_read(f75_51);
c75_52 = nc_read(f75_52);
% c75_53 = nc_read(f75_53);
% c75_54 = nc_read(f75_54);
% c75_55 = nc_read(f75_55);

c125_51 = nc_read(f125_51);
c125_52 = nc_read(f125_52);
% c125_53 = nc_read(f125_53);
% c125_54 = nc_read(f125_54);
% c125_55 = nc_read(f125_55);


% c_oh  = nc_read(f_oh);


% using 1 ug/m3 as the threshold

% ind_data(c4_258,c4_278,c4_293,c4_303,c4_313,vap_prop, vap_name,'Alpha-pinene + O_3', 4)
% ind_data(c20_258,c20_278,c20_293,c20_303,c20_313,vap_prop, vap_name,'Alpha-pinene + O_3', 20)
% ind_data(c40_258,c40_278,c40_293,c40_303,c40_313,vap_prop, vap_name,'Alpha-pinene + O_3', 40)
% ind_data(c50_258,c50_278,c50_293,c50_303,c50_313,vap_prop, vap_name,'Alpha-pinene + O_3', 50)
% ind_data(c100_258,c100_278,c100_293,c100_303,c100_313,vap_prop, vap_name,'Alpha-pinene + O_3',100)


ind_data(c25_51,c75_51,c125_51,vap_prop, vap_name,'Alpha-pinene + O_3 ', 4)
ind_data(c25_52,c75_52,c125_52,vap_prop, vap_name,'Alpha-pinene + O_3 ', 100)
% ind_data(c25_53,c75_53,c125_53,vap_prop, vap_name,'Alpha-pinene + O_3 ', 40)
% ind_data(c25_54,c75_54,c125_54,vap_prop, vap_name,'Alpha-pinene + O_3 ', 50)
% ind_data(c25_55,c75_55,c125_55,vap_prop, vap_name,'Alpha-pinene + O_3 ', 100)

%%


clear all 
%%
% function ind_data(cp_258, cp_278, cp_293, cp_303,cp_313, vap_prop, vap_name, fig_name,ppb)
function ind_data(cp_258, cp_278, cp_293, vap_prop, vap_name, fig_name,ppb)

ind_258 = find(cp_258>=0.15);  % 2.5
ind_278 = find(cp_278>=0.15);  % 7.5
ind_293 = find(cp_293>=0.15);  % 12.5
% ind_303 = find(cp_303>=0.5);  %54
% ind_313 = find(cp_313>=0.25); %55


%258
% [hom_258,mcm_258,contri_258,par_258,mw_258,names_h_258,names_m_258,...
%          mw_h_258,mw_m_258,h_c_258, m_c_258,names_258] = hm_contribution(ind_258,...
%                                                      cp_258,vap_prop,vap_name,fig_name,258,ppb);

%278
% [hom_278,mcm_278,contri_278,par_278,mw_278,names_h_278,names_m_278,...
%           mw_h_278,mw_m_278,h_c_278, m_c_278,names_278] = hm_contribution(ind_278,...
%                                                        cp_278,vap_prop,vap_name,fig_name,278,ppb);                                           
% 
% %293
% [hom_293,mcm_293,contri_293,par_293,mw_293,names_h_293,names_m_293,...
%           mw_h_293,mw_m_293,h_c_293, m_c_293,names_293] = hm_contribution(ind_293,...
%                                   cp_293,vap_prop,vap_name,fig_name,293,ppb);
% 
% %303
% [hom_303,mcm_303,contri_303,par_303,mw_303,names_h_303,names_m_303,...
%           mw_h_303,mw_m_303,h_c_303, m_c_303,names_303] = hm_contribution(ind_303,...
%                                                        cp_303,vap_prop,vap_name,fig_name,303,ppb);
% 
% %313
% [hom_313,mcm_313,contri_313,par_313,mw_313,names_h_313,names_m_313,...
%           mw_h_313,mw_m_313,h_c_313,m_c_313,names_313] = hm_contribution(ind_313,...
%                                                        cp_313,vap_prop,vap_name,fig_name,313,ppb);


%2.5 ppb
[hom_258,mcm_258,contri_258,par_258,mw_258,names_h_258,names_m_258,...
         mw_h_258,mw_m_258,h_c_258, m_c_258,names_258] = hm_contribution(ind_258,...
                                                     cp_258,vap_prop,vap_name,fig_name,2.5,ppb);

%7.5 ppb
[hom_278,mcm_278,contri_278,par_278,mw_278,names_h_278,names_m_278,...
          mw_h_278,mw_m_278,h_c_278, m_c_278,names_278] = hm_contribution(ind_278,...
                                                       cp_278,vap_prop,vap_name,fig_name,7.5,ppb);                                           

%12.5 ppb
[hom_293,mcm_293,contri_293,par_293,mw_293,names_h_293,names_m_293,...
          mw_h_293,mw_m_293,h_c_293, m_c_293,names_293] = hm_contribution(ind_293,...
                                  cp_293,vap_prop,vap_name,fig_name,12.5,ppb);

                                                 

end


function [hom,mcm,cont,par,mw,names_h,names_m,...
          mw_h,mw_m,hom_cont, mcm_cont, names] = hm_contribution(ind,cp,...
                                                 vap_prop, vap_name,fig_name,tp,ppb)

par              = cp(ind);
mw               = vap_prop(ind,1); % molcular weight of compounds who contribute > 1ug/m3
names            = string(vap_name(ind));
mf               = par./sum(cp);
cont             = sum(par)/sum(cp) * 100 ; % output
hom_ind          = find(contains(names, 'HOM') | contains(names,'DiEst'));
mcm_ind          = find(~contains(names,'HOM') & ~contains(names,'DiEst') );
hom_cont         = sum(par(hom_ind))/sum(par)* 100; % output
hom              = par(hom_ind);
mcm_cont         = sum(par(mcm_ind))/sum(par)* 100; % output
mcm              = par(mcm_ind);
mw_h             = mw(hom_ind);
mw_m             = mw(mcm_ind);
names_h          = names(hom_ind);
names_m          = names(mcm_ind);

% all HOMs and MCM compounds contribution

hom_ind_all      = find(contains(vap_name(1:end-1), 'HOM') | contains(vap_name(1:end-1),'DiEst') );
mcm_ind_all      = find(~contains(vap_name(1:end-1),'HOM') & ~contains(vap_name(1:end-1),'DiEst'));
% hom_ind_all      = find(~contains(vap_name(mcm_ind_all)));
size(mcm_ind_all);
size(hom_ind_all);
hm_all_cont      = sum(cp(hom_ind_all))/sum(cp) * 100;
mcm_all_cont     = sum(cp(mcm_ind_all))/sum(cp) * 100;
% diest_all        = sum(cp) - (sum(cp(hom_ind_all)) + sum(cp(mcm_ind_all))); 
hom_abs          = sum(cp(hom_ind_all));
mcm_abs          = sum(cp(mcm_ind_all));
% di_cont          = 100 -(hm_all_cont + mcm_all_cont);
% writing into the file
% re_write(tp,ppb, cont,hom_cont,mcm_cont)
re_write(tp,ppb,hom_abs,mcm_abs,hm_all_cont,mcm_all_cont) % for NOx runs tp = conc. of NOx 

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
 
 
suptitle([fig_name,'(' ,num2str(ppb),')', ' at NO_x concentration of ' ,num2str(tp)])

end

function re_write(tp,ppb, hom_abs, mcm_abs, hom_cont,mcm_cont) % replace no with tp

fid1 = fopen('/home/local/carltonx/Work/Malte_box/Project_runs/Final_Results/Results/no_50ppb.dat','a+');

fprintf (fid1, '%22.3f',  tp);
fprintf (fid1, '%22.3f',  ppb);
fprintf (fid1, '%22.3f',  hom_abs);
fprintf (fid1, '%22.3f',  mcm_abs);
fprintf (fid1, '%22.3f',  hom_cont);
fprintf (fid1, '%22.3f',  mcm_cont);


fprintf (fid1, '\n');

end
