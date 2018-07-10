close all
clear all

%filename = 'testAnimated1.gif';

for k = 1:75
 
     if (k >=1) && (k <=15)
%         
      BaseName='lim1_run_';
      Apin = 'Lime_1';
      run_fold=[Apin,'/',BaseName,num2str(k)]
      conc =  1.0 ;
%    
     elseif (k >=16) && (k <=30)
%         
         BaseName='lim5_run_';
        Apin = 'Lime_5';
       run_fold=[Apin,'/',BaseName,num2str(k)]
       conc =  5.0 ;
%      
     elseif (k >=31) && (k <=45) %else
%   
%
     BaseName='lim50_run_';
      Apin = 'Lime_50';
      run_fold=[Apin,'/',BaseName,num2str(k)]
      conc =  50.0 ;
%         
    elseif (k >=46) && (k <=60)
%   
     BaseName='lim100_run_';
      Apin = 'Lime_100';
      run_fold=[Apin,'/',BaseName,num2str(k)]
      conc =  100.0 ;
%      
%     elseif (k >=61) && (k <=75)
%       
%       BaseName='bpi100_run_';
%       Apin = 'Bpin_100';
%       run_fold=[Apin,'/',BaseName,num2str(k)]
%       conc =  100 ;
%      
     else
%         
       BaseName='lim200_run_';
       Apin = 'Lime_200';
       run_fold=[Apin,'/',BaseName,num2str(k)]
      conc =  200 ;
%      
     end
     
%  run_fold = 'api10_run_63';
%BaseName='iso200_run_';
% for k=46:60
% run_fold=[BaseName,num2str(k)]

MW_isop    = 136.24; %136.24;%68.12 ;%204.36; % g/mol
%conc =  5.0 ;

%num_con = ncread(['/home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Test1234/A3/A3//' run_fold '//particle.nc'], 'number_concentration');

% ncdisp(['/home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Test1234/A3/A3/' run_fold  '/particle.nc']);

num_con = ncread(['/home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Test1234/A3/A3/' run_fold '/particle.nc'], 'number_concentration');
% Dimension: Sections,time
% Units = '1/m^3'

rad = ncread(['/home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Test1234/A3/A3/' run_fold '/particle.nc'], 'radius');
% Dimensions:  Sections,time
% Units = 'm'

dry_rad = ncread(['/home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Test1234/A3/A3/' run_fold '/particle.nc'], 'dry_radius');
% Dimensions:  Sections,time
% Units = 'm'

or_dry_rad = ncread(['/home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Test1234/A3/A3/' run_fold '/particle.nc'], 'original_dry_radius');
% Dimensions:  Sections,time
% Units = 'm'

growth = ncread(['/home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Test1234/A3/A3/' run_fold '/particle.nc'], 'growth_rate');
% Dimensions:  Sections,time
% Units = 'm/s'

core_vol = ncread(['/home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Test1234/A3/A3/' run_fold '/particle.nc'], 'core_volume');
% Dimensions:  Sections,time
% Units = 'm^3'

mass = ncread(['/home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Test1234/A3/A3/' run_fold '/particle.nc'], 'mass');
% Dimensions:  Sections,time
% Units = 'kg'

time_in_units = ncread(['/home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Test1234/A3/A3/' run_fold '/particle.nc'], 'time_in_units');
% Dimensions:  time
% Units = 's'

vol_con = ncread(['/home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Test1234/A3/A3/' run_fold '/particle.nc'], 'volume_concentration');
% Dimensions:  Sections,Composition,time
% Units = 'um^3/m^3'

bin_order= ncread(['/home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Test1234/A3/A3/' run_fold '/particle.nc'], 'Bin order');
% Dimensions:  Sections,time
% Units = ''

vap_conc = ncread(['/home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Test1234/A3/A3/' run_fold '//particle.nc'], 'vapor_concentration');
% Dimensions:  Condensable,time
% Units = '1/m^3'

temp = ncread(['/home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Test1234/A3/A3/' run_fold '/particle.nc'], 'temperature');
% Dimensions:  time
% Units = 'K'

pres = ncread(['/home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Test1234/A3/A3/' run_fold '/particle.nc'], 'pressure');
% Dimensions:  time
% Units = 'Pa'

nucl_cof = ncread(['/home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Test1234/A3/A3/' run_fold '/particle.nc'], 'nucleation_coefficent');
% Dimensions:  Constant
% Units = 'Si units'

blh = ncread(['/home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Test1234/A3/A3/' run_fold '/particle.nc'], 'boundary_layer_height');
% Dimensions:  Constant
% Units = 'm?'

vap_dens = ncread(['/home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Test1234/A3/A3/' run_fold '/particle.nc'], 'vapor_density');
% Dimensions:  Condensable
% Units = 'kg/m^3'

molar_mass= ncread(['/home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Test1234/A3/A3/' run_fold '/particle.nc'], 'molarmass');
% Dimensions:  Condensable
% Units = 'g/mol'

sat_conc= ncread(['/home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Test1234/A3/A3/' run_fold '/particle.nc'], 'saturation_concentration');
% Dimensions:  Condensable,time
% Units = '#/m^3'

surf_ten = ncread(['/home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Test1234/A3/A3/' run_fold '/particle.nc'], 'surface_tension');
% Dimensions:  Condensable
% Units = 'N/m'

dif_vol = ncread(['/home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Test1234/A3/A3/' run_fold '/particle.nc'], 'diffusion_volume');
% Dimensions:  Condensable
% Units = '????'

mass_acom_cof = ncread(['/home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Test1234/A3/A3/' run_fold '/particle.nc'], 'mass_accomondation_coefficient');
% Dimensions:  Condensable
% Units = '1/1'

[com tim]  = size(vap_conc);
[sec tim]  = size(rad);



time       = load(['/home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Test1234/A3/A3/' run_fold '/Time_main.dat']);
c5h8       = load(['/home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Test1234/A3/A3/' run_fold '/gas_Limo.dat']);
gas_no3     = load(['/home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Test1234/A3/A3/' run_fold '/gas_NO3.dat']);
gas_OH     = load(['/home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Test1234/A3/A3/' run_fold '/gas_OH.dat']);
gas_o3     = load(['/home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Test1234/A3/A3/' run_fold '/gas_o3.dat']);
par_num       = load(['/home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Test1234/A3/A3/' run_fold '/par_num.dat']);
par_num_num = sum(par_num(:,1:sec),2);
par_rad       = load(['/home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Test1234/A3/A3/' run_fold '/par_rad.dat']);
par_rad_rad = sum(par_rad(:,1:sec),2);

ch_air     = 2.47E19 ;
Na         = 6.022E23; % [#/mol] 


% Apin input and final concentration
c5h8_final =  c5h8(end);
% conc       =  1.0 ;
initial    =  conc * ch_air * 1e-9 ; % #/cm3/10sec


% Apin amount reaacting 
iso_reacted       = (initial - c5h8_final); % in #/cm3
iso_reacted_ppb   = iso_reacted * 1E9 / ch_air % in ppb
iso_left_ppb      = conc - iso_reacted_ppb;
iso_ug = iso_reacted_ppb * MW_isop*12.187./293.15

% Calcualtion of the mass yield from g/cm3
% We should use this version to get gamma!!!
A = sum(sum(((vol_con(:,1:com-2,end)) .* vap_dens(1:com-2)'))) * 1E-21; % g/cm3
B = (iso_reacted * MW_isop / Na ); % g/cm3
gamma = (A/B) * 100  % mass_yield in %
a_ug = A*1E12; 
gamma_ug = a_ug/iso_ug;

cond_phase = sum(vol_con(:,1:com-2,end).*vap_dens(1:com-2)')*1E-9; %ug/m3
vap_phase  = vap_conc(1:com-2,end) .* molar_mass(1:com-2)./Na *1E6; %ug/m3
eff_sat_con = sat_conc(1:com-2,end) .* molar_mass(1:com-2)./Na *1E6; %ug/m3

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

%INMAT and sulfuric acid are set to zero (only looking at organics)
for i = 1:sec
    sum_sec_com(i,com-1) = 0.;
    sum_sec_com(i,com) = 0.;
end
for t = 1:tim
    sum_tim_com(t,com-1) = 0.;
    sum_tim_com(t,com) = 0.;
 end

% Mass yields calculation for each time step
for i = 1:length(c5h8)-1 %  i = 1:length(c5h8)-1 for input at t = 10s, for other cases i.e t=3600s i = 1:length(c5h8)
    isop(i) = c5h8(i) - c5h8(i+1); 
    isop_react(i) =  isop(i);
    isop_ppb(i) = (initial - c5h8(i)) *  1E9 / ch_air ; %reacted
    isop_left(i)  = c5h8(i) * 1E9 /ch_air ;
   
end

for i = 1:length(c5h8)-1 
A_evo(i) = 0.;
    for j = 1:com
        A_evo(i) = A_evo(i) + (sum_tim_com(i,j) * vap_dens(j)) *  1E-9 ; % ug/m3 % 1E-18; % in kg/m3
    end
    B_evo(i) = isop_react(i) * MW_isop / Na * 1E12 ;% ug/m3 %1E3; % in kg/m3
    gamma_evo(i) = A_evo(i) / B_evo(i) ;
end
 
%SUMMING UP OVER TIME
Par_sum_tim = sum (sum_sec_com(:,1:com), 2);
 
%SUMMING UP COMPOSITIONS OVER VOLUME
Par_sum_com = sum (sum_tim_com(:,1:com),2)  ; 

% mass change
Mass_change = max(A_evo(end-1)) - A_evo(1);
% 
% figure(1)
% clf
% box on
% set(gca, 'fontsize', [16], 'linewidth', [2])
% hold on
% plot(time, Par_sum_com)
% xlabel('Time')
% ylabel('Concentration particle phase (um3/m^3)')

% figure(1)
% clf
% box on
% set(gca, 'fontsize', [16], 'linewidth', [2])
% hold on
% plot(1:length(vap_dens), vap_conc(:,end),'r', 1:length(vap_dens),sat_conc(:,end),'b')
% xlabel('Time')
% ylabel('Vapor concentration')


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
% plot(time(1:4320-1), isop_time_taken=time(end)left, 'b')
% hold on
% plot(time(1:4320-1), isop_ppb , 'r')
% xlabel('Time')
% ylabel('Apin concentration (ppb)')
% legend('Apin left', 'Apin reacted')
% box on
% set(gca, 'fontsize', [16], 'linewidth', [4])
%  
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
% ylabel('Apin concentration (#/cm^3)')
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
time_taken=time(end)

% par_dia=par_rad(5,:)'.*2; %doesnt matter which time period is used .. it is the size of the bins
% numN=par_num'./1E6;
% par_dNdlogDp=par_back_conversion(numN,par_dia);

% 
% figure(30)
% 
% pcolor(time',par_dia,log10(par_dNdlogDp+1e-6))
% set(gca,'yscale','log');
% set(gca,'ylim',[3e-9 1e-5]);
% % set(gca,'xlim',[day day+1.02])
% caxis([1,5]);
% colormap('jet')
% shading flat
% gcc=colorbar('vertic');
% set(gcc,'ytickmode','manual')
% set(gcc,'ylim',[1 5],'ytick',[1 2 3 4 5])
% set(gcc,'yticklabel',[10,100,500,1000, 5000]', 'fontsize', 10)
% %set(gcc,'ylim',[1 5],'ytick',[1 2 3 4 5]) 
% %set(gcc,'yticklabel',[10,100, 1000, 10000,100000]', 'fontsize', 10)
% xlabel('Time');ylabel('Dp(nm)');
% set(gca,'fontsize',10),
% set(gca,'fontweight','b');

boltzmann = 1.38064852E-23;
Vap_prop_all = load(['/home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_in/Vapour_properties.dat']);
%Vap_prop_all = load(['/home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_in/without_him_vp/Vapour_properties_new.txt']);

com=length(Vap_prop_all);
for j = 1:com-2
    vap_pres(j) = 10^(Vap_prop_all(j,2)-(Vap_prop_all(j,3)/293.15)); % in atm
    vap_con(j) = (vap_pres(j)*101325) / boltzmann / 293.15; % in # / m3
end

conc_sat=sat_conc(1:com-2,end) .* molar_mass(1:com-2)./Na *1E6;
bas = [1e-4;1e-3;1e-2;1e-1;1e0;1e1;1e2;1e3];
bas2=[0.25;0.5;0.75;1];

ind_l4 = find(conc_sat <= 1e-4);
ind_g4l3 = find(conc_sat > 1e-4 & conc_sat <= 1e-3);
ind_g3l2 = find(conc_sat > 1e-3 & conc_sat <= 1e-2);
ind_g2l1 = find(conc_sat > 1e-2 & conc_sat <= 1e-1);
ind_g01l1 = find(conc_sat > 1e-1 & conc_sat <= 1);
ind_g1l10 = find(conc_sat > 1 & conc_sat <= 10);
ind_g10l100 = find(conc_sat > 10 & conc_sat <= 1e2);
ind_g100l1000 = find(conc_sat > 1e2 & conc_sat <= 1e3);

% for bas2
ind_0 = find(conc_sat > 1e0 & conc_sat <= 0.25);
ind_025 = find(conc_sat > 0.25 & conc_sat <= 0.5);
ind_05 = find(conc_sat > 0.5 & conc_sat <= 0.75);
ind_1 = find(conc_sat > 0.75 & conc_sat <= 1);

%condensed phase vbs
b1_c  = sum(cond_phase(ind_l4)); 
b2_c  = sum(cond_phase(ind_g4l3)); 
b3_c  = sum(cond_phase(ind_g3l2)); 
b4_c  = sum(cond_phase(ind_g2l1)); 
b5_c  = sum(cond_phase(ind_g01l1)); 
b6_c  = sum(cond_phase(ind_g1l10)); 
b7_c  = sum(cond_phase(ind_g10l100)); 
b8_c  = sum(cond_phase(ind_g100l1000)); 

b21_c  = sum(cond_phase(ind_0)); 
b22_c  = sum(cond_phase(ind_025)); 
b23_c  = sum(cond_phase(ind_05)); 
b24_c  = sum(cond_phase(ind_1)); 

%vapor phase
b1_v  = sum(vap_phase(ind_l4)); 
b2_v  = sum(vap_phase(ind_g4l3)); 
b3_v  = sum(vap_phase(ind_g3l2)); 
b4_v  = sum(vap_phase(ind_g2l1)); 
b5_v  = sum(vap_phase(ind_g01l1)); 
b6_v  = sum(vap_phase(ind_g1l10)); 
b7_v  = sum(vap_phase(ind_g10l100)); 
b8_v  = sum(vap_phase(ind_g100l1000)); 

b21_v  = sum(vap_phase(ind_0)); 
b22_v  = sum(vap_phase(ind_025)); 
b23_v  = sum(vap_phase(ind_05)); 
b24_v  = sum(vap_phase(ind_1)); 

con_pha2 = [b21_c;b22_c;b23_c;b24_c];
vap_pha2 = [b21_v;b22_v;b23_v;b24_v];

con_pha = [b1_c;b2_c;b3_c;b4_c;b5_c;b6_c;b7_c;b8_c];
vap_pha = [b1_v;b2_v;b3_v;b4_v;b5_v;b6_v;b7_v;b8_v];

h_b=con_pha+vap_pha; %total cond+vap
h_b2=con_pha2+vap_pha2;

% figure('Position',[1 1 1200 1200]);
% 
% b1=bar((bas2), [h_b2./sum(h_b2)],0.5,'y');hold on;
% b1=bar((bas2), [con_pha2./sum(h_b2)],0.5,'c');hold on;
% 
h = figure%('Position',[1 1 1200 1200]);
axis tight manual

b=bar(log10(bas), [h_b./sum(h_b)],0.5,'y');hold on;
b=bar(log10(bas), [con_pha./sum(h_b)],0.5,'c');hold on;
% 
title('Volatility Basis Set')
ylabel('Mass fraction','FontSize',16,'FontWeight','bold','Color','k')
xlabel('log_1_0 C','FontSize',16,'FontWeight','bold','Color','k')
set(gca,'FontSize',14,'FontWeight','bold')
% ylim([0,1.5])
lh=legend('Total gas + particle','Condensed phase');
lh.FontSize=8;
set(lh,'Location','NorthWest', 'FontWeight', 'bold') 
grid on


%Capture the plot as an image 
%       frame = getframe(h); 
%       im = frame2im(frame); 
%       [imind,cm] = rgb2ind(im,256); 
%       % Write to the GIF File 
%       if k == 1 
%           imwrite(imind,cm,filename,'gif', 'Loopcount',inf,'DelayTime',5); 
%       else 
%           imwrite(imind,cm,filename,'gif','WriteMode','append','DelayTime',10); 
%       end 
 
 fid1 = fopen('/home/carltonx/Work/Malte_box/Project_runs/Results_June/Hom_runs/limonene.dat','a+');



% else
 fprintf (fid1, '%22.3f',  conc);
 fprintf (fid1, '%22.3f',  gas_OH(10));
 fprintf (fid1, '%22.3f',  gas_o3(1));
 fprintf (fid1, '%22.3f',  gas_no3(10));
 fprintf (fid1, '%22.3f',  iso_reacted_ppb);
 fprintf (fid1, '%22.3f',  gamma);
 fprintf (fid1, '%22.3f',  time_taken);
 fprintf (fid1, '%22.3f',  iso_ug);
 
 fprintf (fid1, '\n');
 
%  end
 end