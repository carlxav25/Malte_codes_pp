close all
clear all


run_fold = 'bca10_run_75';

% fid1 = fopen('/home/local/carltonx/Work/Malte_box/Project_runs/Isop_ms/iso100_run_5.dat','w');

ncdisp(['/home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Test1234/A4/Bca_10/' run_fold  '/particle.nc']);


num_con = ncread(['/home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Test1234/A4/Bca_10/' run_fold '/particle.nc'], 'number_concentration');
% Dimension: Sections,time
% Units = '1/m^3'

rad = ncread(['/home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Test1234/A4/Bca_10/' run_fold '/particle.nc'], 'radius');
% Dimensions:  Sections,time
% Units = 'm'

dry_rad = ncread(['/home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Test1234/A4/Bca_10/' run_fold '/particle.nc'], 'dry_radius');
% Dimensions:  Sections,time
% Units = 'm'

or_dry_rad = ncread(['/home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Test1234/A4/Bca_10/' run_fold '/particle.nc'], 'original_dry_radius');
% Dimensions:  Sections,time
% Units = 'm'

growth = ncread(['/home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Test1234/A4/Bca_10/' run_fold '/particle.nc'], 'growth_rate');
% Dimensions:  Sections,time
% Units = 'm/s'

core_vol = ncread(['/home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Test1234/A4/Bca_10/' run_fold '/particle.nc'], 'core_volume');
% Dimensions:  Sections,time
% Units = 'm^3'

mass = ncread(['/home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Test1234/A4/Bca_10/' run_fold '/particle.nc'], 'mass');
% Dimensions:  Sections,time
% Units = 'kg'

time_in_units = ncread(['/home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Test1234/A4/Bca_10/' run_fold '/particle.nc'], 'time_in_units');
% Dimensions:  time
% Units = 's'

vol_con = ncread(['/home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Test1234/A4/Bca_10/' run_fold '/particle.nc'], 'volume_concentration');
% Dimensions:  Sections,Composition,time
% Units = 'um^3/m^3'

bin_order= ncread(['/home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Test1234/A4/Bca_10/' run_fold '/particle.nc'], 'Bin order');
% Dimensions:  Sections,time
% Units = ''

vap_conc = ncread(['/home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Test1234/A4/Bca_10/' run_fold '//particle.nc'], 'vapor_concentration');
% Dimensions:  Condensable,time
% Units = '1/m^3'

temp = ncread(['/home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Test1234/A4/Bca_10/' run_fold '/particle.nc'], 'temperature');
% Dimensions:  time
% Units = 'K'

pres = ncread(['/home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Test1234/A4/Bca_10/' run_fold '/particle.nc'], 'pressure');
% Dimensions:  time
% Units = 'Pa'

nucl_cof = ncread(['/home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Test1234/A4/Bca_10/' run_fold '/particle.nc'], 'nucleation_coefficent');
% Dimensions:  Constant
% Units = 'Si units'

blh = ncread(['/home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Test1234/A4/Bca_10/' run_fold '/particle.nc'], 'boundary_layer_height');
% Dimensions:  Constant
% Units = 'm?'

vap_dens = ncread(['/home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Test1234/A4/Bca_10/' run_fold '/particle.nc'], 'vapor_density');
% Dimensions:  Condensable
% Units = 'kg/m^3'

molar_mass= ncread(['/home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Test1234/A4/Bca_10/' run_fold '/particle.nc'], 'molarmass');
% Dimensions:  Condensable
% Units = 'g/mol'

sat_conc= ncread(['/home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Test1234/A4/Bca_10/' run_fold '/particle.nc'], 'saturation_concentration');
% Dimensions:  Condensable,time
% Units = '#/m^3'

surf_ten = ncread(['/home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Test1234/A4/Bca_10/' run_fold '/particle.nc'], 'surface_tension');
% Dimensions:  Condensable
% Units = 'N/m'

dif_vol = ncread(['/home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Test1234/A4/Bca_10/' run_fold '/particle.nc'], 'diffusion_volume');
% Dimensions:  Condensable
% Units = '????'

mass_acom_cof = ncread(['/home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Test1234/A4/Bca_10/' run_fold '/particle.nc'], 'mass_accomondation_coefficient');
% Dimensions:  Condensable
% Units = '1/1'

[com tim]  = size(vap_conc);
[sec tim]  = size(rad);
% time = time_in_units/43200;


time       = load(['/home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Test1234/A4/Bca_10/' run_fold '/Time_main.dat']);
c5h8       = load(['/home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Test1234/A4/Bca_10/' run_fold '/gas_BCary.dat']);
gas_OH     = load(['/home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Test1234/A4/Bca_10/' run_fold '/gas_o3.dat']);
par_num       = load(['/home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Test1234/A4/Bca_10/' run_fold '/par_num.dat']);
par_num_num = sum(par_num(:,1:sec),2);
par_rad       = load(['/home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Test1234/A4/Bca_10/' run_fold '/par_rad.dat']);
par_rad_rad = sum(par_rad(:,1:sec),2);

time_taken=time(end)

ch_air     = 2.47E19 ;
Na         = 6.022E23; % [#/mol] 
MW_isop    = 204.36; %136.24;%68.12 ;%204.36; % g/mol

% Isoprene input and final concentration
c5h8_final =  c5h8(end);
conc       =  10.0 ;
initial    =  conc * ch_air * 1e-9 / 3600; % #/cm3/10sec


% Summing particle volume up over time or sections
sum_sec_com(1:sec,1:com) = 0.; 
sum_tim_com(1:tim,1:com) = 0.;

for j = 1:com
    for i = 1:sec
        for t = 1:tim
            sum_sec_com(i,j) = sum_sec_com(i,j) + vol_con(i,j,t); %summmation over time
        end
    end
    for t = 1:tim
        for i = 1:sec
            sum_tim_com(t,j) = sum_tim_com(t,j) + vol_con(i,j,t); %summation over sections
        end
    end
end

%HOA and sulfuric acid are set to zero (only looking at organics)
for i = 1:sec
    sum_sec_com(i,com-1) = 0.;
    sum_sec_com(i,com) = 0.;
end
for t = 1:tim
    sum_tim_com(t,com-1) = 0.;
    sum_tim_com(t,com) = 0.;
end
 

% Isoprene amount reacting 
iso_reacted       = (initial*3600 - c5h8_final); % in #/cm3
iso_reacted_ppb   = iso_reacted * 1E9 / ch_air % in ppb
iso_left_ppb      = conc - iso_reacted_ppb;

% Calcualtion of the mass yield from g/cm3
% We should use this version to get gamma!!!
A = sum(sum(((vol_con(:,1:com-2,end)) .* vap_dens(1:com-2)'))) * 1E-21; % g/cm3
B = (iso_reacted * MW_isop / Na ); % g/cm3
gamma = (A/B) * 100  % mass_yield in %

% Mass yields calculation for each time step
for i = 1:length(c5h8)-1 %  i = 1:length(c5h8)-1 for input at t = 10s, for other cases i.e t=3600s i = 1:length(c5h8)
  
%input only for 10 hours

 if i < 3600 %make sure i = 1:length(c5h8) in first for loop
%   

  
  isop(i)          =  c5h8(i+1)-c5h8(i); %left
  isop_react(i)    =  initial + c5h8(i) - c5h8(i+1) ;
  isop_ppb(i)      =  isop_react(i) * 1E9*3600 /ch_air ;% *3600  /ch_air ;
  isop_left(i)     =  isop(i) * 1E9*3600  /ch_air;  %3600 /ch_air  ;
  
elseif i == 3600
  
  isop(i)          =  c5h8(i)-c5h8(i+1); %left i - i+1
  isop_react(i)    =  isop(i);% initial + c5h8(i+1) - c5h8(i) ;
  isop_ppb(i)      =  isop_react(i) * 1E9*3600 /ch_air ; %* 3600
  isop_left(i)     =  isop(i) * 1E9 /ch_air ;% 3600 /ch_air  ;

 else
    
  isop(i)          = c5h8(i); %left c5h8(i)
  isop_react(i)    = c5h8(i-1) - c5h8(i) ; 
  isop_ppb(i)      = isop_ppb(i-1)- isop_react(i) * 1E9 /ch_air ;
  isop_left(i)     = isop(i) * 1E9 /ch_air ;
  
end

end


% time evolution of mass yields
for i = 1:length(c5h8)-1 
A_evo(i) = 0.;
    for j = 1:com
        A_evo(i) = A_evo(i) + (sum_tim_com(i,j) * vap_dens(j)) *  1E-9 ; % ug/m3 % 1E-18; % in kg/m3
    end
    B_evo(i) = isop_react(i) * MW_isop / Na * 1E12 ;% ug/m3 %1E3; % in kg/m3
    gamma_evo(i) = A_evo(i) / B_evo(i) ;
end
 
%SUMMING UP OVER TIME.. volume concentration summation over compounds and
%time as it varies only with sections 100x1.
Par_sum_tim = sum (sum_sec_com(:,1:com), 2);
 
%SUMMING UP COMPOSITIONS OVER VOLUME.. volume concentation summation over
%sections and compunds as it shows the vol_con in the end over time 4320x1.
Par_sum_com = sum (sum_tim_com(:,1:com),2)  ; 

% mass change
Mass_change = (A_evo(end-1)) - A_evo(1)

figure(1)
clf
box on
set(gca, 'fontsize', [16], 'linewidth', [2])
hold on
plot(time, Par_sum_com)
xlabel('Time')
ylabel('Concentration particle phase (um3/m^3)')
% xlim([0,12])

% figure(12) % this plot shows the size bins for the highest particle concentration 
% plot(Par_sum_tim)
% xlabel('Bins')
% ylabel('concentration (um3/m^3)')

% figure(51)
% plot(time,vap_conc(341,:))

[kk,index] = sort(molar_mass);


pp = sum(sum_tim_com',2);
mm = pp(index);

% 
% for j = 1:com
%     fprintf (fid1, '%22.3f',  kk(j));
%     fprintf (fid1, '%22.3f',  mm(j));
%     fprintf (fid1, '\n');  
% end

% figure(80)
% plot(kk,mm)
% %plot(sum(sum_tim_com',2))
% xlabel('Mass') % vapor number
% ylabel('volume concentration of vapors in particle phase(um3/m3)')
% xlim([90 450])

% zz = (sum(sum_tim_com',2) .* vap_dens) *1E-9;
% % tt= Mass_change./zz;
% 
% figure(100)
% % subplot(2,1,1)
% plot(zz)
% xlabel('vapor number')
% ylabel('mass  of vapors(um3/m3)')

% subplot(2,1,2)
% plot(tt)
% xlabel('vapor number')
% ylabel('mass  of vapors(um3/m3)')

aa = sum(vap_conc,2);
% figure(50)
% plot(aa)
% xlabel('vapor number')
% ylabel('vapour concentration (1/m3)')

% figure(20)
% plot(time ,sum(vap_conc(:,:)))
% title('Vapour concentration')

par_dia=par_rad(5,:)'.*2; %doesnt matter which time period is used .. it is the size of the bins
numN=par_num'./1E6;
par_dNdlogDp=par_back_conversion(numN,par_dia);

figure(30)

pcolor(time',par_dia,log10(par_dNdlogDp+1e-6))
set(gca,'yscale','log');
set(gca,'ylim',[3e-9 1e-5]);
% set(gca,'xlim',[day day+1.02])
caxis([1,5]);
colormap('jet')
shading flat
gcc=colorbar('vertic');
set(gcc,'ytickmode','manual')
set(gcc,'ylim',[1 5],'ytick',[1 2 3 4 5])
set(gcc,'yticklabel',[10,100,500,1000, 5000]', 'fontsize', 10)
%set(gcc,'ylim',[1 5],'ytick',[1 2 3 4 5]) 
%set(gcc,'yticklabel',[10,100, 1000, 10000,100000]', 'fontsize', 10)
xlabel('Time');ylabel('Dp(nm)');
set(gca,'fontsize',10),
set(gca,'fontweight','b');

boltzmann = 1.38064852E-23;

Vap_prop_all = load(['/home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_in/Vapour_properties.dat']);
%Vap_prop_all = load(['/home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_in/without_him_vp/Vapour_properties_new.txt']);
for j = 1:com-1
    vap_pres(j) = 10^(Vap_prop_all(j,2)-(Vap_prop_all(j,3)/293.15)); % in atm
    vap_con(j) = (vap_pres(j)*101325) / boltzmann / 298.15; % in # / m3
end

% figure(4)
% P = plot((vap_pres), 'mo');
% ylabel('Saturation vapor pressure')

% 
% % % figure(2)
% % % clf
% % % semilogx(rad(:,2), Par_sum_tim)
% % % hold on
% % % xlabel('size')
% % % ylabel('Concentration particle phase (um3/m^3)')
% % % box on
% % % set(gca, 'fontsize', [16], 'linewidth', [2])
% 
% 
% figure(3)
% clf
% plot(time(1:end-1), isop_left, 'b')
% hold on
% plot(time(1:end-1), isop_ppb , 'r')
% xlabel('Time')
% ylabel('Isoprene concentration (ppb)')
% legend('Isoprene left', 'Isoprene reacted')
% box on
% set(gca, 'fontsize', [16], 'linewidth', [4])
 
% figure(4) 
% clf
% semilogy(A_evo, gamma_evo)
% hold on
% xlabel('Aerosol mass concentration in ug/m3')
% ylabel('Mass yield in %')
% box on
% set(gca, 'fontsize', [16], 'linewidth', [2])
%   

% figure(6) 
% clf
% plot(time, c5h8 ,'k')
% hold on
% ylabel('Isoprene concentration (#/cm^3)')
% xlabel('Time')
% box on
% set(gca, 'fontsize', [16], 'linewidth', [2])

% 
% 
% figure(7)
% clf
% subplot(2,1,1)
% semilogy(time, A_evo,'r')
% hold on
% ylabel('Aerosol mass loadings in ug/m3')
% xlabel('Time')
% box on
% set(gca, 'fontsize', [16], 'linewidth', [2])
% 
% subplot(2,1,2)
% semilogy(time, gamma_evo,'k')
% hold on
% ylabel('Yield')
% xlabel('Time')
% box on
% set(gca, 'fontsize', [16], 'linewidth', [2])
% 
% 
