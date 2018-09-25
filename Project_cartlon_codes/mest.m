close all
clear all
clc


% for 50 ppb O3
f50_293 =  '/home/carltonx/Work/Malte_box/Project_runs/netcdf_input/hom_api_54.nc';
f50_278 =  '/home/carltonx/Work/Malte_box/Project_runs/netcdf_input/278_api_54.nc';
f50_303 =  '/home/carltonx/Work/Malte_box/Project_runs/netcdf_input/303_api_54.nc';
f50_258 =  '/home/carltonx/Work/Malte_box/Project_runs/netcdf_input/258_api_54.nc';
f50_313 =  '/home/carltonx/Work/Malte_box/Project_runs/netcdf_input/313_api_54.nc';


vap_path  = '/home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_in/';
vap_prop = load([vap_path,'Vapour_properties.dat']);
vap_name = importdata([vap_path,'Vapour_names.dat']); % for ascii file
vap_oc = load('/home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_in/vap_new/Vapour_O_C_ratio_Carlton.dat');


[c50_293,n50_293] = nc_read(f50_293);
[c50_278,n50_278] = nc_read(f50_278);
[c50_303,n50_303] = nc_read(f50_303);
[c50_258,n50_258] = nc_read(f50_258);
[c50_313,n50_313] = nc_read(f50_313);

% ind_258 = find(c50_258'>=0.25); 
% ind_293 = find(c50_293'>=0.25); 
% ind_313 = find(c50_313'>=0.25); 



path  = '/home/local/carltonx/Work/Malte_box/Project_runs/Final_Results/Results/newoc/';


mw258 = load([path,'258_mw.dat']); 
mw293 = load([path,'293_mw.dat']); 
mw313 = load([path,'313_mw.dat']); 

names258 = importdata([path,'258_names.dat']); 
names293 = importdata([path,'293_names.dat']); 
names313 = importdata([path,'313_names.dat']); 

dataoc258 = load([path,'258_oc.dat']); 
dataoc293 = load([path,'293_oc.dat']); 
dataoc313 = load([path,'313_oc.dat']); 

c258 = load([path,'258_c.dat']); 
c293 = load([path,'293_c.dat']); 
c313 = load([path,'313_c.dat']); 

o258 = load([path,'258_o.dat']); 
o293 = load([path,'293_o.dat']); 
o313 = load([path,'313_o.dat']); 

n258 = load([path,'258_n.dat']); 
n293 = load([path,'293_n.dat']); 
n313 = load([path,'313_n.dat']); 


par258 = load([path,'258_par_cont.dat']); 
par293 = load([path,'293_par_cont.dat']); 
par313 = load([path,'313_par_cont.dat']); 


i258name = find(ismember(vap_name,names258)==1);
i293name = find(ismember(vap_name,names293)==1);
i313name = find(ismember(vap_name,names313)==1);


oc258 = (n50_258(i258name).*vap_oc(i258name,1))./sum(n50_258(i258name));
oc293 = (n50_293(i293name).*vap_oc(i293name,1))./sum(n50_293(i293name));
oc313 = (n50_313(i313name).*vap_oc(i313name,1))./sum(n50_313(i313name));

s258 = sum(oc258);
s293 = sum(oc293);
s313 = sum(oc313);

h258 = mw258 - (c258.*12 + o258.*16 + n258.*14);
h293 = mw293 - (c293.*12 + o293.*16 + n293.*14);
h313 = mw313 - (c313.*12 + o313.*16 + n313.*14);



m_n293 = names293(1:20);
m_n258 = names258(1:27);
m_n313 = names313(1:8);

h_c293 = c293(21:end);
h_c258 = c258(28:end);
h_c313 = c313(9:end);


h_n293 = n293(21:end);
h_n258 = n258(28:end);
h_n313 = n313(9:end);


h_o293 = o293(21:end);
h_o258 = o258(28:end);
h_o313 = o313(9:end);


h_h293 = h293(21:end);
h_h258 = h258(28:end);
h_h313 = h313(9:end);



mainc = 'C';
mainh = 'H';
maino = 'O';
mainn = 'N';

for k = 1 : length(h_c293)
     if h_n293(k) == 1
comp293{k} = sprintf('%s%d%s%d%s%d%s%d', 'C', h_c293(k),'H',round(h_h293(k)), ...
                       'O',h_o293(k),'N' ,h_n293(k));        % Ch
   else
comp293{k} = sprintf('%s%d%s%d%s%d%s%d', 'C', h_c293(k),'H',round(h_h293(k)), ...
                       'O',h_o293(k));      
     end
end

for k = 1 : length(h_c258)
     if h_n258(k) == 1
comp258{k} = sprintf('%s%d%s%d%s%d%s%d', 'C', h_c258(k),'H',round(h_h258(k)), ...
                       'O',h_o258(k),'N' ,h_n258(k));        % Ch
   else
comp258{k} = sprintf('%s%d%s%d%s%d%s%d', 'C', h_c258(k),'H',round(h_h258(k)), ...
                       'O',h_o258(k));      
     end
end

for k = 1 : length(c313(9:end))
     if h_n313(k) == 1
comp313{k} = sprintf('%s%d%s%d%s%d%s%d', 'C', h_c313(k),'H',round(h_h313(k)), ...
                       'O',h_o313(k),'N' ,h_n313(k));        % Ch
   else
comp313{k} = sprintf('%s%d%s%d%s%d%s%d', 'C', h_c313(k),'H',round(h_h313(k)), ...
                       'O',h_o313(k));      
     end
end


c2d258 = cell2dataset(comp258);
str258 = string(c2d258.Properties.VarNames);

c2d293 = cell2dataset(comp293);
str293 = string(c2d293.Properties.VarNames);

c2d313 = cell2dataset(comp313);
str313 = string(c2d313.Properties.VarNames);

total_n258=[string(m_n258); str258'];
total_n293=[string(m_n293); str293'];
total_n313=[string(m_n313); str313'];

table258 = [c258, round(h258), o258, n258, total_n258,mw258,oc258,par258];
table293 = [c293, round(h293), o293, n293, total_n293,mw293,oc293,par293];
table313 = [c313, round(h313), o313, n313, total_n313,mw313,oc313,par313];

% figure('Position',[1 1 1200 1200]); %( x,y)
% clf
% box on
% set(gca, 'fontsize', [10], 'linewidth', [2])
% hold all
% % 
% plot(1:length(c293),c293)
% yticks([1:length(c293)])
% set(gca,'yticklabel',comp293)
% xtickangle(0)
% subplot(2,1,1)
% plot(n50_258,'r');hold on
% plot(n50_293,'k');hold on
% plot(n50_313,'b')
% 
% xlabel('Compounds')
% ylabel('Number concentration #m^-^3')
% legend('258 K','293 K','313 K')
% 
% subplot(2,1,2)
% plot(oc258,'r');hold on
% plot(oc293,'k');hold on
% plot(oc313,'b')
% 
% 
% xlabel('Compounds')
% ylabel('O:C')
% % 
% 
