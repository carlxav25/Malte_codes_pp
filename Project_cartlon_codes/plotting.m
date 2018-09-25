% In use the following function
% data_read_plot, apinene_plot.m

 
close all
clear all 
clc

nn = 1;
cc = 1;

if cc ==1 ; % chamber runs

path_hom_cham   = '/home/local/carltonx/Work/Malte_box/Project_runs/Final_Results/Results/Chamber_runs/Hom_res/main_res' ;
path_mcm_cham   = '/home/local/carltonx/Work/Malte_box/Project_runs/Final_Results/Results/Chamber_runs/Mcm_res/main_res_mcm' ;
path_no_runs    = '/home/local/carltonx/Work/Malte_box/Project_runs/Final_Results/Results/Chamber_runs/NO_runs/no_hom' ;
path_temp_runs  = '/home/local/carltonx/Work/Malte_box/Project_runs/Final_Results/Results/Chamber_runs/Temp_runs/temp_hom' ;

apin_hom    = load([path_hom_cham,'/ch_hom_apin.dat']);
bcar_hom    = load([path_hom_cham,'/ch_hom_bcar.dat']);
lim_hom     = load([path_hom_cham,'/ch_hom_lim.dat']);
iso_hom     = load([path_hom_cham,'/ch_hom_iso.dat']);
bpin_hom    = load([path_hom_cham,'/ch_hom_bpin.dat']);

apin_mcm    = load([path_mcm_cham,'/ch_mcm_apin.dat']);
bcar_mcm    = load([path_mcm_cham,'/ch_mcm_bcar.dat']);
lim_mcm     = load([path_mcm_cham,'/ch_mcm_lim.dat']);
iso_mcm     = load([path_mcm_cham,'/ch_mcm_iso.dat']);
bpin_mcm    = load([path_mcm_cham,'/ch_mcm_bpin.dat']);

apin_5      = load([path_no_runs,'/ch_no_5ppb.dat']);  
apin_10     = load([path_no_runs,'/ch_no_10ppb.dat']);  

apin_278    = load([path_temp_runs,'/ch_temp_278.dat']);  
apin_303    = load([path_temp_runs,'/ch_temp_303.dat']); 
apin_258    = load([path_temp_runs,'/ch_temp_258.dat']);
apin_313    = load([path_temp_runs,'/ch_temp_313.dat']);

if nn == 1
    display('Apinene case')
    apinene_plot(apin_5,apin_10,apin_278,apin_303,apin_258,apin_313,apin_hom,apin_mcm,136.23,'\alpha-pinene')
elseif nn == 2
    display('Bpinene case')
    data_read_plot(bpin_hom,bpin_mcm,136.23,'\beta-pinene')
elseif nn == 3
    display('Bcary case')
    data_read_plot(bcar_hom,bcar_mcm,204.36,'\beta-cary')
elseif nn == 4
    display('Limonene case')
    data_read_plot(lim_hom,lim_mcm,136.24,'Limonene')
else
    display('Isoprene case')
    data_read_plot(iso_hom,iso_mcm,68.12,'Isoprene')
end


else % flow tube runs
    
path_hom_ft   = '/home/local/carltonx/Work/Malte_box/Project_runs/Final_Results/Results/Flow_tube_runs/Hom_runs/ft_hom' ;
path_mcm_ft   = '/home/local/carltonx/Work/Malte_box/Project_runs/Final_Results/Results/Flow_tube_runs/Mcm_runs/ft_mcm' ;


apin_hom    = load([path_hom_ft,'/ft_apin.dat']);
bcar_hom    = load([path_hom_ft,'/ft_bcar.dat']);
lim_hom     = load([path_hom_ft,'/ft_lim.dat']);
iso_hom     = load([path_hom_ft,'/ft_iso.dat']);
bpin_hom    = load([path_hom_ft,'/ft_bpin.dat']);

apin_mcm    = load([path_mcm_ft,'/ft_apin.dat']);
bcar_mcm    = load([path_mcm_ft,'/ft_bcar.dat']);
lim_mcm     = load([path_mcm_ft,'/ft_lim.dat']);
iso_mcm     = load([path_mcm_ft,'/ft_iso.dat']);
bpin_mcm    = load([path_mcm_ft,'/ft_bpin.dat']);

if nn == 1
    display('Apinene case')
    data_read_plot(apin_hom,apin_mcm,136.23,'Apinene')
elseif nn == 2
    display('Bpinene case')
    data_read_plot(bpin_hom,bpin_mcm,136.23,'B-pinene')
elseif nn == 3
    display('Bcary case')
    data_read_plot(bcar_hom,bcar_mcm,204.36,'B-cary')
elseif nn == 4
    display('Limonene case')
    data_read_plot(lim_hom,lim_mcm,136.24,'Limonene')
else
    display('Isoprene case')
    data_read_plot(iso_hom,iso_mcm,68.12,'Isoprene')
end



end
