close all
clc
clear all


jj = 1 ;
%run = 'iso_run_1';

%filepath = (['/Users/boy/Documents/Michael/New_Malte_Box_v2/Malte_out/Box/',date,'/',run,]);
%num_con = ncread(['filepath/particle.nc', 'number_concentration'])
%num_con = ncread('/home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Test1234/A1/Isoprene_50/iso50_run_6/particle.nc', 'number_concentration');

ncdisp('/home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Test1234/A1/Isoprene_50/iso50_run_6/particle.nc');

num_con = ncread('/home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Test1234/A1/Isoprene_50/iso50_run_6/particle.nc', 'number_concentration');
% Dimension: Sections,time
% Units = '1/m^3'

rad = ncread('/home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Test1234/A1/Isoprene_50/iso50_run_6/particle.nc', 'radius');
% Dimensions:  Sections,time
% Units = 'm'

dry_rad = ncread('/home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Test1234/A1/Isoprene_50/iso50_run_6/particle.nc', 'dry_radius');
% Dimensions:  Sections,time
% Units = 'm'

or_dry_rad = ncread('/home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Test1234/A1/Isoprene_50/iso50_run_6/particle.nc', 'original_dry_radius');
% Dimensions:  Sections,time
% Units = 'm'

growth = ncread('/home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Test1234/A1/Isoprene_50/iso50_run_6/particle.nc', 'growth_rate');
% Dimensions:  Sections,time
% Units = 'm/s'

core_vol = ncread('/home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Test1234/A1/Isoprene_50/iso50_run_6/particle.nc', 'core_volume');
% Dimensions:  Sections,time
% Units = 'm^3'

mass = ncread('/home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Test1234/A1/Isoprene_50/iso50_run_6/particle.nc', 'mass');
% Dimensions:  Sections,time
% Units = 'kg'

time_in_units = ncread('/home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Test1234/A1/Isoprene_50/iso50_run_6/particle.nc', 'time_in_units');
% Dimensions:  time
% Units = 's'

vol_con = ncread('/home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Test1234/A1/Isoprene_50/iso50_run_6/particle.nc', 'volume_concentration');
% Dimensions:  Sections,Composition,time
% Units = 'um^3/m^3'

bin_order= ncread('/home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Test1234/A1/Isoprene_50/iso50_run_6/particle.nc', 'Bin order');
% Dimensions:  Sections,time
% Units = ''

vap_conc = ncread('/home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Test1234/A1/Isoprene_50/iso50_run_6/particle.nc', 'vapor_concentration');
% Dimensions:  Condensable,time
% Units = '1/m^3'

temp = ncread('/home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Test1234/A1/Isoprene_50/iso50_run_6/particle.nc', 'temperature');
% Dimensions:  time
% Units = 'K'

pres = ncread('/home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Test1234/A1/Isoprene_50/iso50_run_6/particle.nc', 'pressure');
% Dimensions:  time
% Units = 'Pa'

nucl_cof = ncread('/home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Test1234/A1/Isoprene_50/iso50_run_6/particle.nc', 'nucleation_coefficent');
% Dimensions:  Constant
% Units = 'Si units'

blh = ncread('/home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Test1234/A1/Isoprene_50/iso50_run_6/particle.nc', 'boundary_layer_height');
% Dimensions:  Constant
% Units = 'm?'

vap_dens = ncread('/home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Test1234/A1/Isoprene_50/iso50_run_6/particle.nc', 'vapor_density');
% Dimensions:  Condensable
% Units = 'kg/m^3'

molar_mass= ncread('/home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Test1234/A1/Isoprene_50/iso50_run_6/particle.nc', 'molarmass');
% Dimensions:  Condensable
% Units = 'g/mol'

sat_conc= ncread('/home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Test1234/A1/Isoprene_50/iso50_run_6/particle.nc', 'saturation_concentration');
% Dimensions:  Condensable,time
% Units = '#/m^3'

surf_ten = ncread('/home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Test1234/A1/Isoprene_50/iso50_run_6/particle.nc', 'surface_tension');
% Dimensions:  Condensable
% Units = 'N/m'

dif_vol = ncread('/home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Test1234/A1/Isoprene_50/iso50_run_6/particle.nc', 'diffusion_volume');
% Dimensions:  Condensable
% Units = '????'

mass_acom_cof = ncread('/home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Test1234/A1/Isoprene_50/iso50_run_6/particle.nc', 'mass_accomondation_coefficient');
% Dimensions:  Condensable
% Units = '1/1'

[com tim]  = size(vap_conc);
[sec tim]  = size(rad);
time = time_in_units/43200;


time       = load(['/home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Test1234/A1/Isoprene_50/iso50_run_6/Time_main.dat']);
c5h8       = load(['/home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Test1234/A1/Isoprene_50/iso50_run_6/gas_Isop.dat']);
emi1       = load(['/home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Test1234/A1/Isoprene_50/iso50_run_6/gas_Emi.dat']);
gas_OH     = load(['/home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Test1234/A1/Isoprene_50/iso50_run_6/gas_OH.dat']);

ch_air     = 2.47E19 ;
Na         = 6.022E23; % [#/mol] 
MW_isop    = 68.12 % g/mol

c5h8_final =  c5h8(end)-c5h8(end-1)
initial    =  50 * ch_air * 1e-9 / 3600 % #/cm3

iso_reacted_ppb   = (initial - c5h8_final) * 1E9 *3600 /ch_air
iso_reacted       = (initial - c5h8_final) % #/cm3


%mass yields calculation

for i=1:length(c5h8)-1
    isop(i,1)= c5h8(i+1) - c5h8(i); 
    isop_react(i,1)=initial-isop(i,1);
    isop_ppb(i,1) = (initial - isop(i,1)) *  1E9 *3600 /ch_air ; %for each time step
end 

 A = sum(sum(((vol_con(:,:,4320)) .* vap_dens'))) * 1E-21 % g/cm3
 B = (iso_reacted_ppb * ch_air * 1E-9 * MW_isop /Na   ) %g/cm3
 gamma = (A/B) * 100  % mass_yield

 A_um = sum(sum(((vol_con(:,:,4320)) .* vap_dens'))) * 1E-9 % ug/m3
 B_um = (iso_reacted_ppb * MW_isop /24.45 ) %ug/m3
 gamma_um = (A_um / B_um) * 100 


 
 % time evolution of mass yields
%  A_evo = sum(sum(((vol_con(:,:,2:end)) .* vap_dens'))) * 1E-9;
%  B_evo = (isop_ppb * MW_isop/24.45  );
%  
%  %Mo        = reshape(A_evo, [tim-1,1]);
% 
%  
%  Mo(1:(tim-1),1) = 0;
%  
% for j = 1:1
%     for t = 1:tim-1
%         for i = 1:1
%             Mo(t,j) = Mo(t,j) + A_evo(i,j,t);
%         end
%     end
% end
% 
% gamma_evo = Mo ./B_evo *100;

sum_sec_com(1:sec,1:com) = 0.; 
sum_tim_com(1:tim,1:com) = 0.;

for j = 1:com
    for i = 1:sec
        for t = 1:tim
            sum_sec_com(i,j) = sum_sec_com(i,j) + vol_con(i,j,t);
        end
    end
    for t = 1:tim
        for i = 1:sec
            sum_tim_com(t,j) = sum_tim_com(t,j) + vol_con(i,j,t);
        end
    end
end

 % time evolution of mass yields
 A_evo = (sum_tim_com(2:end,:) * vap_dens) * 1E-9;
 B_evo = (isop_ppb * MW_isop/24.45  );
 
 %Mo        = reshape(A_evo, [tim-1,1]);

 


gamma_evo = A_evo ./B_evo *100;

%for INMAT

% INMAT and sulfuric acid are set to zero (only looking at organics)
for i = 1:sec
    sum_sec_com(i,com-1) = 0.;
    sum_sec_com(i,com) = 0.;
end
for t = 1:tim
    sum_tim_com(t,com-1) = 0.;
    sum_tim_com(t,com) = 0.;
end
%  
 SV_total = com ;
 
 %SUMMING UP OVER TIME
  Mep_SVOC       = sum (sum_sec_com(:,1:SV_total), 2);% ./sum(sum_sec_com,2);
 
  %SUMMING UP COMPOSITIONS OVER VOLUME
  MepV_SVOC      = sum (sum_tim_com(:,1:com),2)  ;  % ./sum(sum_tim_com,2);

  %SUMMING UP GAS CONCENTRATIONS OVER TIME
  Vap_conc = vap_conc'/1E6;
% Summing up the ELVOC and other gas-concentrations over time
  Gas_SVOC      = sum (Vap_conc(:,1:com),2);
% 
%   time = time *12 ; 
%   
%  figure(100)
%  plot(time, gas_OH)
%  semilogy(time, Gas_SVOC)   
%  xlabel('Time')
%  ylabel('Concentration (1/cm^3)')
%  
 figure(101)
 plot(time, MepV_SVOC)   
 xlabel('Time')
 ylabel('Concentration (1/cm^3)')

% 
 figure(1)
 plot(time(2:end), isop* 1E9 *3600 /ch_air, 'k', time(2:end), isop_react* 1E9 *3600 /ch_air, 'r')
 xlabel('Time')
 ylabel('Isoprene concentration (ppb)')
 legend('Isoprene left', 'Isoprene reacted')
% 
% 
  figure(2) 
%   subplot(2,1,1)
  semilogy(A_evo, gamma_evo)
  xlabel('Aerosol mass concentration')
  ylabel('Mass yield')
% % 
% %   subplot(2,1,2)
% %   plot(time(2:end), gamma_evo)
% %   xlabel('Time')
% %   ylabel('Mass yield')
% %   ylim([0,30])
%   
% 
figure(3)
semilogy(time, sum(num_con(:,:))')
% 
% % plot(time, sum(vap_conc(:,:)))
%  xlabel('Time')
%  ylabel('Number Concentration')

