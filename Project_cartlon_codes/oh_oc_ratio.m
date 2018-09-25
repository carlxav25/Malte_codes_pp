clear all
clc
close all

vap_oc_all = load('/home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_in/vap_new/Vapour_O_C_ratio_Carlton.dat');
% column 1 = o/c ratio
% column 2 = C molecules
% column 3 = O molecules
% column 4 = N molecules
% column 5 = molecular weight


f258    =  '/home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Test1234/A100/258_api_54.nc';
f278    =  '/home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Test1234/A100/278_api_54.nc';
f293    =  '/home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Test1234/A100/hom_api_54.nc';
f303    =  '/home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Test1234/A100/303_api_54.nc';
f313    =  '/home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Test1234/A100/313_api_54.nc';


vap_path  = '/home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_in/';
vap_prop = load([vap_path,'Vapour_properties.dat']);
vap_name = importdata([vap_path,'Vapour_names.dat']); % for ascii file

c258  = nc_read(f258);
c278  = nc_read(f278);
c293  = nc_read(f293);
c303  = nc_read(f303);
c313  = nc_read(f313);

hom_ind_all      = find(contains(vap_name(1:end-1), 'HOM'));
mcm_ind_all      = find(~contains(vap_name(1:end-1),'HOM'));

hi258 = find(c258(hom_ind_all)>0);
hi278 = find(c278(hom_ind_all)>0);
hi293 = find(c293(hom_ind_all)>0);
hi303 = find(c303(hom_ind_all)>0);
hi313 = find(c313(hom_ind_all)>0);

mi258 = find(c258(mcm_ind_all)>0);
mi278 = find(c278(mcm_ind_all)>0);
mi293 = find(c293(mcm_ind_all)>0);
mi303 = find(c303(mcm_ind_all)>0);
mi313 = find(c313(mcm_ind_all)>0);


hoc_258 = mean(vap_oc_all(hi258,1));
hoc_278 = mean(vap_oc_all(hi278,1));
hoc_293 = mean(vap_oc_all(hi293,1));
hoc_303 = mean(vap_oc_all(hi303,1));
hoc_313 = mean(vap_oc_all(hi313,1));


moc_258 = mean(vap_oc_all(mi258,1));
moc_278 = mean(vap_oc_all(mi278,1));
moc_293 = mean(vap_oc_all(mi293,1));
moc_303 = mean(vap_oc_all(mi303,1));
moc_313 = mean(vap_oc_all(mi313,1));

hoc = [hoc_258,hoc_278,hoc_293,hoc_303,hoc_313];
moc = [moc_258,moc_278,moc_293,moc_303,moc_313];

xdata = [258,278,293,303,313];
% W_O = 16;
% W_C = 12;
% W_H = 1;
% W_N = 14;
% 
% num_h_at = (vap_oc(:,5) - (vap_oc(:,2).* 12 + vap_oc(:,3) .* 16  + vap_oc(:,4).*14))./W_H; % n(h) = mw -(n(c)*cw + n(o)*ow +n(n)*nw) )
% 
% pp = round(num_h_at, 1);
% hc_ratio = num_h_at./ vap_oc(:,2);
%% 
figure('Position',[1 1 1200 1200]); %( x,y)
clf
box on
set(gca, 'fontsize', [10], 'linewidth', [2])
hold all

plot(xdata,hoc,'bo',xdata, moc,'rs')
xlabel('Temperature')
ylabel('O/C')
grid on
set(gca,'FontSize',14,'FontWeight','bold')
legend('HOM O:C','MCM O:C')