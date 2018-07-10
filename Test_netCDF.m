clear all
close all

%run  = 'A1';
%date = 'Test1234';

jj = 0 ;
%run = 'iso_run_1';

%filepath = (['/Users/boy/Documents/Michael/New_Malte_Box_v2/Malte_out/Box/',date,'/',run,]);
%num_con = ncread(['filepath/particle.nc', 'number_concentration'])
%num_con = ncread('/home/local/carltonx/Work/Malte_box/Bitbucket_Malte_repo/malte_v2_hyy/Project/malte_box/Malte_out/Box/Test1234/A1/particle.nc', 'number_concentration');

ncdisp('/home/local/carltonx/Work/Malte_box/Bitbucket_Malte_repo/malte_v2_hyy/Project/malte_box/Malte_out/Box/Test1234/A1/particle.nc');

num_con = ncread('/home/local/carltonx/Work/Malte_box/Bitbucket_Malte_repo/malte_v2_hyy/Project/malte_box/Malte_out/Box/Test1234/A1/particle.nc', 'number_concentration');
% Dimension: Sections,time
% Units = '1/m^3'

rad = ncread('/home/local/carltonx/Work/Malte_box/Bitbucket_Malte_repo/malte_v2_hyy/Project/malte_box/Malte_out/Box/Test1234/A1/particle.nc', 'radius');
% Dimensions:  Sections,time
% Units = 'm'

dry_rad = ncread('/home/local/carltonx/Work/Malte_box/Bitbucket_Malte_repo/malte_v2_hyy/Project/malte_box/Malte_out/Box/Test1234/A1/particle.nc', 'dry_radius');
% Dimensions:  Sections,time
% Units = 'm'

or_dry_rad = ncread('/home/local/carltonx/Work/Malte_box/Bitbucket_Malte_repo/malte_v2_hyy/Project/malte_box/Malte_out/Box/Test1234/A1/particle.nc', 'original_dry_radius');
% Dimensions:  Sections,time
% Units = 'm'

growth = ncread('/home/local/carltonx/Work/Malte_box/Bitbucket_Malte_repo/malte_v2_hyy/Project/malte_box/Malte_out/Box/Test1234/A1/particle.nc', 'growth_rate');
% Dimensions:  Sections,time
% Units = 'm/s'

core_vol = ncread('/home/local/carltonx/Work/Malte_box/Bitbucket_Malte_repo/malte_v2_hyy/Project/malte_box/Malte_out/Box/Test1234/A1/particle.nc', 'core_volume');
% Dimensions:  Sections,time
% Units = 'm^3'

mass = ncread('/home/local/carltonx/Work/Malte_box/Bitbucket_Malte_repo/malte_v2_hyy/Project/malte_box/Malte_out/Box/Test1234/A1/particle.nc', 'mass');
% Dimensions:  Sections,time
% Units = 'kg'

time_in_units = ncread('/home/local/carltonx/Work/Malte_box/Bitbucket_Malte_repo/malte_v2_hyy/Project/malte_box/Malte_out/Box/Test1234/A1/particle.nc', 'time_in_units');
% Dimensions:  time
% Units = 's'

vol_con = ncread('/home/local/carltonx/Work/Malte_box/Bitbucket_Malte_repo/malte_v2_hyy/Project/malte_box/Malte_out/Box/Test1234/A1/particle.nc', 'volume_concentration');
% Dimensions:  Sections,Composition,time
% Units = 'um^3/m^3'

bin_order= ncread('/home/local/carltonx/Work/Malte_box/Bitbucket_Malte_repo/malte_v2_hyy/Project/malte_box/Malte_out/Box/Test1234/A1/particle.nc', 'Bin order');
% Dimensions:  Sections,time
% Units = ''

vap_conc = ncread('/home/local/carltonx/Work/Malte_box/Bitbucket_Malte_repo/malte_v2_hyy/Project/malte_box/Malte_out/Box/Test1234/A1/particle.nc', 'vapor_concentration');
% Dimensions:  Condensable,time
% Units = '1/m^3'

temp = ncread('/home/local/carltonx/Work/Malte_box/Bitbucket_Malte_repo/malte_v2_hyy/Project/malte_box/Malte_out/Box/Test1234/A1/particle.nc', 'temperature');
% Dimensions:  time
% Units = 'K'

pres = ncread('/home/local/carltonx/Work/Malte_box/Bitbucket_Malte_repo/malte_v2_hyy/Project/malte_box/Malte_out/Box/Test1234/A1/particle.nc', 'pressure');
% Dimensions:  time
% Units = 'Pa'

nucl_cof = ncread('/home/local/carltonx/Work/Malte_box/Bitbucket_Malte_repo/malte_v2_hyy/Project/malte_box/Malte_out/Box/Test1234/A1/particle.nc', 'nucleation_coefficent');
% Dimensions:  Constant
% Units = 'Si units'

blh = ncread('/home/local/carltonx/Work/Malte_box/Bitbucket_Malte_repo/malte_v2_hyy/Project/malte_box/Malte_out/Box/Test1234/A1/particle.nc', 'boundary_layer_height');
% Dimensions:  Constant
% Units = 'm?'

vap_dens = ncread('/home/local/carltonx/Work/Malte_box/Bitbucket_Malte_repo/malte_v2_hyy/Project/malte_box/Malte_out/Box/Test1234/A1/particle.nc', 'vapor_density');
% Dimensions:  Condensable
% Units = 'kg/m^3'

molar_mass= ncread('/home/local/carltonx/Work/Malte_box/Bitbucket_Malte_repo/malte_v2_hyy/Project/malte_box/Malte_out/Box/Test1234/A1/particle.nc', 'molarmass');
% Dimensions:  Condensable
% Units = 'g/mol'

sat_conc= ncread('/home/local/carltonx/Work/Malte_box/Bitbucket_Malte_repo/malte_v2_hyy/Project/malte_box/Malte_out/Box/Test1234/A1/particle.nc', 'saturation_concentration');
% Dimensions:  Condensable,time
% Units = '#/m^3'

surf_ten = ncread('/home/local/carltonx/Work/Malte_box/Bitbucket_Malte_repo/malte_v2_hyy/Project/malte_box/Malte_out/Box/Test1234/A1/particle.nc', 'surface_tension');
% Dimensions:  Condensable
% Units = 'N/m'

dif_vol = ncread('/home/local/carltonx/Work/Malte_box/Bitbucket_Malte_repo/malte_v2_hyy/Project/malte_box/Malte_out/Box/Test1234/A1/particle.nc', 'diffusion_volume');
% Dimensions:  Condensable
% Units = '????'

mass_acom_cof = ncread('/home/local/carltonx/Work/Malte_box/Bitbucket_Malte_repo/malte_v2_hyy/Project/malte_box/Malte_out/Box/Test1234/A1/particle.nc', 'mass_accomondation_coefficient');
% Dimensions:  Condensable
% Units = '1/1'


time       = load(['/home/local/carltonx/Work/Malte_box/Bitbucket_Malte_repo/malte_v2_hyy/Project/malte_box/Malte_out/Box/Test1234/A1/Time_main.dat']);
gas_isop   = load(['/home/local/carltonx/Work/Malte_box/Bitbucket_Malte_repo/malte_v2_hyy/Project/malte_box/Malte_out/Box/Test1234/A1/gas_Isop.dat']);
% gas_h2so4  = load(['/home/local/carltonx/Work/Malte_box/Bitbucket_Malte_repo/malte_v2_hyy/Project/malte_box/Malte_out/Box/Test1234/A1/gas_H2SO4.dat']);
% gas_OH     = load(['/home/local/carltonx/Work/Malte_box/Bitbucket_Malte_repo/malte_v2_hyy/Project/malte_box/Malte_out/Box/Test1234/A1/gas_OH.dat']);
% par_dN     = load(['/home/local/carltonx/Work/Malte_box/Bitbucket_Malte_repo/malte_v2_hyy/Project/malte_box/Malte_out/Box/Test1234/A1/par_num.dat']);
% par_r      = load(['/home/local/carltonx/Work/Malte_box/Bitbucket_Malte_repo/malte_v2_hyy/Project/malte_box/Malte_out/Box/Test1234/A1/par_rad.dat']);
% par_v      = load(['/home/local/carltonx/Work/Malte_box/Bitbucket_Malte_repo/malte_v2_hyy/Project/malte_box/Malte_out/Box/Test1234/A1/par_vol.dat']);


% Avog = 6.022E23; % [#/mol] 
% 
% % iso_initial = 
% isop_left = ((68611109.170656368- gas_isop)) ;% ./ ch_air) * 1E9 * 3600;
% 
% 
% 
% isop_soa = (vap_dens ./ molar_mass * Avog ) ;
% mass_yield = sum(isop_soa) ./ isop_left *100 ;
% 
% 
% figure(111)
% 
% subplot(2,1,1)
% plot(time, isop_left)
% xlabel('Time')
% ylabel('Isoprene concentration (#/cm^3)')
% 
% 
% subplot(2,1,2)
% plot(time, mass_yield)
% xlabel('Time')
% ylabel('Mass yield')

[com tim] = size(vap_conc);
[sec tim]  = size(rad);
time = time_in_units/43200; %12 hr run   %86400;

sum_sec_com(1:sec,1:com) = 0.; 
sum_tim_com(1:tim,1:com) = 0.;

for j = 1:com
    for i = 1:sec
        for t = 1:tim
            sum_sec_com(i,j) = sum_sec_com(i,j) + vol_con(i,j,t);
        end
    end
    for t = 1:tim %141
        for i = 1:sec
            sum_tim_com(t,j) = sum_tim_com(t,j) + vol_con(i,j,t);
        end
    end
end

for i = 1:sec
    sum_sec_com(i,com-1) = 0.;
end
for t = 141:tim
    sum_tim_com(t,com-1) = 0.;
end

% 
% % Number of ElVOCs in the output file for Pontus chemistry
% % NE_10      = 9;   % ELVOC_10
% % NE_NO      = 10;  % ELVOC_NO
% % NE_20      = 10;  % ELVOC_20
% % NE_CBN     = 10;  % ELVOC_CBN
% % NE_RELVOC  = 10;  % R-ELVOC
% % NE_HOM     = 9;   % HOM_10
% % NE_HOM_NO  = 10;  % HOM_NO
% % NE_R_HOM   = 10;  % R-HOM
% % Rest       = 3;   % ELVOC_nuc1, HOA, H2SO4

% NE_total = NE_10 + NE_NO + NE_20 + NE_CBN + NE_RELVOC + NE_HOM + NE_HOM_NO + NE_R_HOM + Rest;
SV_total = com %- NE_total;



% Numbers should be the same as the position of the compounds in the
% vapour-input files used in MALTE-BOX - it is good to check this ones when
% using a new input file

% 'NE_10_Start = ',  com-NE_10-NE_NO-NE_20-NE_CBN-Rest+1, 'NE_10_End = ', com-NE_NO-NE_20-NE_CBN--Rest,
% 'NE_NO_Start = ',  com-NE_NO-NE_20-NE_CBN-Rest+1, 'NE_NO_End = ', com-NE_20-NE_CBN-Rest,
% 'NE_20_Start = ',  com-NE_20-NE_CBN-Rest+1, 'NE_20_End = ', com-NE_CBN-Rest,
% 'NE_CBN_Start = ', com-NE_CBN-Rest+1, 'NE_20_End = ', com-Rest,
% 'BK = ', com-1
% 'H2SO4 = ', com

% Summing up the ELVOC and other compositions over time

 Mep_SVOC      = sum(sum_sec_com(:,(com-1))) ./sum(sum_sec_com,2); % - NE_10 - NE_NO - NE_20 - NE_CBN - NE_RELVOC - NE_HOM - NE_HOM_NO - NE_R_HOM - Rest),2)                                                                                      ./sum(sum_sec_com,2);
% Mep_ELVOC_10  = sum(sum_sec_com(:,com   - NE_10 - NE_NO - NE_20 - NE_CBN - NE_RELVOC - NE_HOM - NE_HOM_NO - NE_R_HOM - Rest+1 : com - NE_NO - NE_20 - NE_CBN - NE_RELVOC - NE_HOM - NE_HOM_NO - NE_R_HOM - Rest),2)  ./sum(sum_sec_com,2);
% Mep_ELVOC_NO  = sum(sum_sec_com(:,com   - NE_NO - NE_20 - NE_CBN - NE_RELVOC - NE_HOM - NE_HOM_NO - NE_R_HOM - Rest+1 : com - NE_20 - NE_CBN - NE_RELVOC - NE_HOM - NE_HOM_NO - NE_R_HOM - Rest),2)                  ./sum(sum_sec_com,2);
% Mep_ELVOC_20  = sum(sum_sec_com(:,com   - NE_20 - NE_CBN - NE_RELVOC - NE_HOM - NE_HOM_NO - NE_R_HOM - Rest+1 : com - NE_CBN - NE_RELVOC - NE_HOM - NE_HOM_NO - NE_R_HOM - Rest),2)                                  ./sum(sum_sec_com,2);
% Mep_ELVOC_CBN = sum(sum_sec_com(:,com   - NE_CBN - NE_RELVOC - NE_HOM - NE_HOM_NO - NE_R_HOM - Rest+1 : com - NE_RELVOC - NE_HOM - NE_HOM_NO - NE_R_HOM - Rest),2)                                                   ./sum(sum_sec_com,2);
% Mep_RELVOC    = sum(sum_sec_com(:,com   - NE_RELVOC - NE_HOM - NE_HOM_NO - NE_R_HOM - Rest+1 : com - NE_HOM - NE_HOM_NO - NE_R_HOM - Rest),2)                                                                        ./sum(sum_sec_com,2);
% Mep_HOM       = sum(sum_sec_com(:,com   - NE_HOM - NE_HOM_NO - NE_R_HOM - Rest+1 : com - NE_HOM_NO - NE_R_HOM - Rest+1),2)                                                                                           ./sum(sum_sec_com,2);
% Mep_HOM_NO    = sum(sum_sec_com(:,com   - NE_HOM_NO - NE_R_HOM - Rest+1 : com - NE_R_HOM - Rest+1),2)                                                                                                                ./sum(sum_sec_com,2);
% Mep_R_HOM     = sum(sum_sec_com(:,com   - NE_R_HOM - Rest+1 : com - Rest+1),2)                                                                                                                                       ./sum(sum_sec_com,2);
% Mep_BK        = sum_sec_com(:,com-1)                                                                                                                                                                                 ./sum(sum_sec_com,2); %background composition
 Mep_H2SO4     = sum_sec_com(:,com)                                                                                                                                                                                    ./sum(sum_sec_com,2);


% Summing up the ELVOC and other compositions for the whole volume
MepV_SVOC      = sum (sum_tim_com(:,(com-1))) ./sum(sum_tim_com,2); % - NE_10 - NE_NO - NE_20 - NE_CBN - NE_RELVOC - NE_HOM - NE_HOM_NO - NE_R_HOM - Rest),2)                                                                                      ./sum(sum_tim_com,2);
% MepV_ELVOC_10  = sum(sum_tim_com(:,com   - NE_10 - NE_NO - NE_20 - NE_CBN - NE_RELVOC - NE_HOM - NE_HOM_NO - NE_R_HOM - Rest+1 : com - NE_NO - NE_20 - NE_CBN - NE_RELVOC - NE_HOM - NE_HOM_NO - NE_R_HOM - Rest),2)  ./sum(sum_tim_com,2);
% MepV_ELVOC_NO  = sum(sum_tim_com(:,com   - NE_NO - NE_20 - NE_CBN - NE_RELVOC - NE_HOM - NE_HOM_NO - NE_R_HOM - Rest+1 : com - NE_20 - NE_CBN - NE_RELVOC - NE_HOM - NE_HOM_NO - NE_R_HOM - Rest),2)                  ./sum(sum_tim_com,2);
% MepV_ELVOC_20  = sum(sum_tim_com(:,com   - NE_20 - NE_CBN - NE_RELVOC - NE_HOM - NE_HOM_NO - NE_R_HOM - Rest+1 : com - NE_CBN - NE_RELVOC - NE_HOM - NE_HOM_NO - NE_R_HOM - Rest),2)                                  ./sum(sum_tim_com,2);
% MepV_ELVOC_CBN = sum(sum_tim_com(:,com   - NE_CBN - NE_RELVOC - NE_HOM - NE_HOM_NO - NE_R_HOM - Rest+1 : com - NE_RELVOC - NE_HOM - NE_HOM_NO - NE_R_HOM - Rest),2)                                                   ./sum(sum_tim_com,2);
% MepV_RELVOC    = sum(sum_tim_com(:,com   - NE_RELVOC - NE_HOM - NE_HOM_NO - NE_R_HOM - Rest+1 : com - NE_HOM - NE_HOM_NO - NE_R_HOM - Rest),2)                                                                        ./sum(sum_tim_com,2);
% MepV_HOM       = sum(sum_tim_com(:,com   - NE_HOM - NE_HOM_NO - NE_R_HOM - Rest+1 : com - NE_HOM_NO - NE_R_HOM - Rest+1),2)                                                                                           ./sum(sum_tim_com,2);
% MepV_HOM_NO    = sum(sum_tim_com(:,com   - NE_HOM_NO - NE_R_HOM - Rest+1 : com - NE_R_HOM - Rest+1),2)                                                                                                                ./sum(sum_tim_com,2);
% MepV_R_HOM     = sum(sum_tim_com(:,com   - NE_R_HOM - Rest+1 : com - Rest+1),2)                                                                                                                                       ./sum(sum_tim_com,2);
% MepV_BK        = sum_tim_com(:,com-1)                                                                                                                                                                                 ./sum(sum_tim_com,2); %background composition
 MepV_H2SO4     = sum_tim_com(:,com)                                                                                                                                                                                   ./sum(sum_tim_com,2);


Vap_conc = vap_conc'/1E6;
% Summing up the ELVOC and other gas-concentrations over time
Gas_SVOC      = sum (Vap_conc(:,com-1)) % - NE_10 - NE_NO - NE_20 - NE_CBN - NE_RELVOC - NE_HOM - NE_HOM_NO - NE_R_HOM - Rest),2);
% Gas_ELVOC_10  = sum(Vap_conc(:,com   - NE_10 - NE_NO - NE_20 - NE_CBN - NE_RELVOC - NE_HOM - NE_HOM_NO - NE_R_HOM - Rest+1 : com - NE_NO - NE_20 - NE_CBN - NE_RELVOC - NE_HOM - NE_HOM_NO - NE_R_HOM - Rest),2);
% Gas_ELVOC_NO  = sum(Vap_conc(:,com   - NE_NO - NE_20 - NE_CBN - NE_RELVOC - NE_HOM - NE_HOM_NO - NE_R_HOM - Rest+1 : com - NE_20 - NE_CBN - NE_RELVOC - NE_HOM - NE_HOM_NO - NE_R_HOM - Rest),2);
% Gas_ELVOC_20  = sum(Vap_conc(:,com   - NE_20 - NE_CBN - NE_RELVOC - NE_HOM - NE_HOM_NO - NE_R_HOM - Rest+1 : com - NE_CBN - NE_RELVOC - NE_HOM - NE_HOM_NO - NE_R_HOM - Rest),2);
% Gas_ELVOC_CBN = sum(Vap_conc(:,com   - NE_CBN - NE_RELVOC - NE_HOM - NE_HOM_NO - NE_R_HOM - Rest+1 : com - NE_RELVOC - NE_HOM - NE_HOM_NO - NE_R_HOM - Rest),2);
% Gas_RELVOC    = sum(Vap_conc(:,com   - NE_RELVOC - NE_HOM - NE_HOM_NO - NE_R_HOM - Rest+1 : com - NE_HOM - NE_HOM_NO - NE_R_HOM - Rest),2);
% Gas_HOM       = sum(Vap_conc(:,com   - NE_HOM - NE_HOM_NO - NE_R_HOM - Rest+1 : com - NE_HOM_NO - NE_R_HOM - Rest+1),2);
% Gas_HOM_NO    = sum(Vap_conc(:,com   - NE_HOM_NO - NE_R_HOM - Rest+1 : com - NE_R_HOM - Rest+1),2);
% Gas_R_HOM     = sum(Vap_conc(:,com   - NE_R_HOM - Rest+1 : com - Rest+1),2);
% Gas_BK        = Vap_conc(:,com-1); %background composition
% Gas_H2SO4     = Vap_conc(:,com);
% 
% Plot the figure
% Mep_sec_com = [Mep_H2SO4  Mep_ELVOC_10  Mep_ELVOC_CBN  Mep_ELVOC_NO  Mep_ELVOC_20  Mep_RELVOC  Mep_HOM  Mep_HOM_NO  Mep_R_HOM  Mep_SVOC  Mep_BK];
% Mep_tim_com = [MepV_H2SO4 MepV_ELVOC_10 MepV_ELVOC_CBN MepV_ELVOC_NO MepV_ELVOC_20 MepV_RELVOC MepV_HOM MepV_HOM_NO MepV_R_HOM MepV_SVOC MepV_BK];
Mep_sec_com = [Mep_H2SO4  Mep_SVOC];
Mep_tim_com = [MepV_H2SO4  MepV_SVOC];


par_dia=rad(:,2)*2;

%smooth the column
for j=1:2 %1:1:11
  Mep_sec_com(:,j)    = smooth(Mep_sec_com(:,j),10);
  Mep_tim_com(:,j)    = smooth(Mep_tim_com(:,j),10);
end


figure(1)
clf
area(par_dia*1e9, Mep_sec_com);
set(gca,'xlim',[1 1000]);
set(gca,'ylim',[0 1]);
set(gca,'xscale','log');
set(gca,'fontsize',18);
set(gca,'fontweight','bold');
set(gca,'fontname','Times New Roman');
set(gca,'linewidth',1);
xlabel('Dp(nm)');
ylabel('Contribution to growth(%)');
title('Melpitz');
set(gca,'tickdir','out');

% P=legend('H_2SO_4','HOMs_1_0-O_5_-_1_3','HOMs_1_0-O_5_-_1_3(CBN)','HOMs_1_0-NO_5_-_1_4','HOMs_2_0-O_8_-_1_7',...
%     'HOMs-R-ELVOC', 'New-HOM', 'New-HOM-NO', 'New-R-HOM', 'SVOCs','Background');
% set(P,'fontsize',15);


figure(2)
clf
area(time, Mep_tim_com);
set(gca,'xlim',[0 1]);
%set(gca,'xlim',[1.457 2]);
set(gca,'ylim',[0 1]);
set(gca,'xscale','linear');
set(gca,'fontsize',18);
set(gca,'fontweight','bold');
set(gca,'fontname','Times New Roman');
set(gca,'linewidth',1);
xlabel('Time (hour)');
ylabel('Contribution to growth(%)');
title('Melpitz');
set(gca,'tickdir','out');

% P=legend('H_2SO_4','HOMs_1_0-O_5_-_1_3','HOMs_1_0-O_5_-_1_3(CBN)','HOMs_1_0-NO_5_-_1_4','HOMs_2_0-O_8_-_1_7',...
%     'HOMs-R-ELVOC', 'New-HOM', 'New-HOM-NO', 'New-R-HOM', 'SVOCs','Background');
% set(P,'fontsize',15);
% 


 figure(3)
 clf
 P = semilogy(time, Gas_SVOC,   'r-');    set(P, 'linewidth', 3);
% hold on
% P = plot(time, Gas_ELVOC_NO,       'k-');    set(P, 'linewidth', 3);
% P = plot(time, Gas_ELVOC_20,       'm-');    set(P, 'linewidth', 3);
% P = plot(time, Gas_ELVOC_CBN,      'y-');    set(P, 'linewidth', 3);
% P = plot(time, Gas_RELVOC,         'g-');    set(P, 'linewidth', 3);
% P = plot(time, Gas_SVOC,           'b-');    set(P, 'linewidth', 3);
% P = plot(time, Gas_H2SO4,          'c--');    set(P, 'linewidth', 3);
% P = plot(time, Gas_HOM,            'r--');   set(P, 'linewidth', 3);
% P = plot(time, Gas_HOM_NO,         'k--');   set(P, 'linewidth', 3);
% P = plot(time, Gas_R_HOM,          'g--');   set(P, 'linewidth', 3);
 H = gca;
% set(H, 'fontsize',20, 'linewidth', 2) 
% L = legend('Gas-ELVOC-10', 'Gas-ELVOC-NO','Gas-ELVOC-20','Gas-ELVOC-CBN','Gas-R-ELVOC', 'Gas-SVOC', 'Gas-H2SO4', 'HOM', 'HOM-NO', 'R-HOM'); 
% 

% Checkin the vapour pressure of the compounds in UHMA
[xC yT] = size(vap_conc);
for i = 1:xC-2
    vap_conc_M(i) = mean(vap_conc(i,100:yT));
    sat_conc_M(i) = mean(sat_conc(i,100:yT));
    if i<xC-42
       sat_conc_M(i) = sat_conc_M(i);
    end
    vap_mix(i) = vap_conc_M(i) / sat_conc_M(i);
end

boltzmann = 1.38064852E-23;

% Check sat-vap for all compounds
Vap_prop_all = load(['/home/local/carltonx/Work/Malte_box/Bitbucket_Malte_repo/malte_v2_hyy/Project/test_malte/Malte_in/Vapour_properties.txt']);
for j = 1:xC-2
    vap_pres(j) = 10^(Vap_prop_all(j,2)-(Vap_prop_all(j,3)/300)); % in atm
    vap_con(j) = (vap_pres(j)*101325) / boltzmann / 300; % in # / m3
end

figure(4)
clf
%P = plot(vap_mix(:), 'bo');

%P = plot(sat_conc_M(:), 'ro');
%P = plot(vap_pres, 'ko');   
%P = plot(vap_conc_M, 'go');
P = plot(vap_con, 'mo');

if jj == 1
   

% Checking the different SVOC-contributions
SVOC_numS1 = 1001; SVOC_numE1 = 1100;
SVOC_numS2 = 1101; SVOC_numE2 = 1200;
SVOC_numS3 = 1201; SVOC_numE3 = 1248;
SVOC_numS4 = 1249; SVOC_numE4 = 1289;
SVOC_numS5 = 1249; SVOC_numE5 = 1289;

% Mep_SVOC_1      = sum(sum_sec_com(:,SVOC_numS1:SVOC_numE1),2)     ./sum(sum_sec_com,2);
% Mep_SVOC_2      = sum(sum_sec_com(:,SVOC_numS2:SVOC_numE2),2)     ./sum(sum_sec_com,2);
% Mep_SVOC_3      = sum(sum_sec_com(:,SVOC_numS3:SVOC_numE3),2)     ./sum(sum_sec_com,2);
% Mep_SVOC_4      = sum(sum_sec_com(:,SVOC_numS4:SVOC_numE4),2)     ./sum(sum_sec_com,2);
% Mep_SVOC_5      = sum(sum_sec_com(:,SVOC_numS5:SVOC_numE5),2)     ./sum(sum_sec_com,2);
% 
% MepV_SVOC_1      = sum(sum_tim_com(:,SVOC_numS1:SVOC_numE1),2)    ./ sum(sum_tim_com,2);
% MepV_SVOC_2      = sum(sum_tim_com(:,SVOC_numS2:SVOC_numE2),2)    ./ sum(sum_tim_com,2);
% MepV_SVOC_3      = sum(sum_tim_com(:,SVOC_numS3:SVOC_numE3),2)    ./ sum(sum_tim_com,2);
% MepV_SVOC_4      = sum(sum_tim_com(:,SVOC_numS4:SVOC_numE4),2)    ./ sum(sum_tim_com,2);
% MepV_SVOC_5      = sum(sum_tim_com(:,SVOC_numS5:SVOC_numE5),2)    ./ sum(sum_tim_com,2);

Mep_sec_com_SV = sum (sum_sec_com(:,800:1027),2);  % ./sum(sum_sec_com,2);
Mep_tim_com_SV = sum (sum_tim_com(:,800:1027),2);  % ./sum(sum_tim_com,2);

% Plot for the different SVOCs
% Mep_sec_com_SV = [Mep_SVOC_1  Mep_SVOC_2  Mep_SVOC_3  Mep_SVOC_4  Mep_SVOC_5];
% Mep_tim_com_SV = [MepV_SVOC_1 MepV_SVOC_2 MepV_SVOC_3 MepV_SVOC_4 MepV_SVOC_5];
% 
% %smooth the column
% for j=1:1:5
%   Mep_sec_com_SV(:,j) = smooth(Mep_sec_com_SV(:,j),10);
%   Mep_tim_com_SV(:,j) = smooth(Mep_tim_com_SV(:,j),10);
% end

figure(11)
clf
area(par_dia*1e9, Mep_sec_com_SV);
set(gca,'xlim',[1 100]);
set(gca,'ylim',[0 1]);
set(gca,'xscale','log');
set(gca,'fontsize',18);
set(gca,'fontweight','bold');
set(gca,'fontname','Times New Roman');
set(gca,'linewidth',1);
xlabel('Dp(nm)');
ylabel('Contribution to growth(%)');
title('Test1234');
set(gca,'tickdir','out');


figure(12)
clf
area(time, Mep_tim_com_SV);
% set(gca,'xlim',[1.457 4]);
set(gca,'ylim',[0 1]);
set(gca,'xscale','linear');
set(gca,'fontsize',18);
set(gca,'fontweight','bold');
set(gca,'fontname','Times New Roman');
set(gca,'linewidth',1);
xlabel('Time (hour)');
ylabel('Contribution to growth(%)');
title('Test1234');
set(gca,'tickdir','out');

% P=legend('SVOC_1', 'SVOC_2', 'SVOC_3', 'SVOC_4', 'SVOC_5');
% set(P,'fontsize',15);

end 


