close all
clear all
clc

path  = '/home/local/carltonx/Work/Malte_box/Project_runs/Final_Results/Results/oc_ratios/';


mw258 = load([path,'258_mw.dat']); 
mw293 = load([path,'293_mw.dat']); 
mw313 = load([path,'313_mw.dat']); 

names258 = importdata([path,'258_names.dat']); 
names293 = importdata([path,'293_names.dat']); 
names313 = importdata([path,'313_names.dat']); 

oc258 = load([path,'258_oc.dat']); 
oc293 = load([path,'293_oc.dat']); 
oc313 = load([path,'313_oc.dat']); 

c258 = load([path,'258_c.dat']); 
c293 = load([path,'293_c.dat']); 
c313 = load([path,'313_c.dat']); 

o258 = load([path,'258_o.dat']); 
o293 = load([path,'293_o.dat']); 
o313 = load([path,'313_o.dat']); 

n258 = load([path,'258_n.dat']); 
n293 = load([path,'293_n.dat']); 
n313 = load([path,'313_n.dat']); 



% hom_in_258    = find(contains(names258, 'HOM'));
% mcm_in_258    = find(~contains(names258,'HOM'));