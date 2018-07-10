close all
clear all

gas_fig = 1;
par_fig = 1;
setup   = 0;

dpar = 1;
run  = 'A2';
day  = 1;
date = 'Me130618' %'Me130618';


if gas_fig == 1

  % Pontus_gas = load(['/home/carlton/Ph.D/malte_trail/malte-box/Malte_in/Box/',date,'/Pontus_gas.dat']);
   
   OH     = load(['/home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Me130618/A4/gas_OH.dat']);
   HO2    = load(['/home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Me130618/A4/gas_HO2.dat']);
   H2SO4  = load(['/home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Me130618/A4/gas_H2SO4.dat']);
   HNO3   = load(['/home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Me130618/A4/gas_HNO3.dat']);
   NO3    = load(['/home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Me130618/A4/gas_NO3.dat']);
   Mono   = load(['/home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Me130618/A4/gas_Mon_sum.dat']);

   ELVOC_10  = load(['/home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Me130618/A4/gas_ELVOC_10.dat']);
   ELVOC_20  = load(['/home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Me130618/A4/gas_ELVOC_20.dat']);
   ELVOC_NO  = load(['/home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Me130618/A4/gas_ELVOC_NO.dat']);
   ELVOC_CBN = load(['/home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Me130618/A4/gas_ELVOC_CBN.dat']);
   

   Lfile = length(OH);
   
   for j = 1:Lfile
       time(j) = (j/288 - 1/288) + day;
   end
   for j = 1:1441
       time_P(j) = (j/1441 - 1/1441) + day;
   end
    
   
   
   figure(1)
   S = subplot(211);
   box on
   P = semilogy(time, H2SO4, 'r-');
   hold on
%    set(P, 'linewidth', 3);
%    P = semilogy(time_P, Pontus_gas(:,3), 'b-');
%    set(P, 'linewidth', 3);
%    set(S, 'fontsize',20, 'linewidth', 2) 
   Y = ylabel('Conc. [# cm^-^3]'); set(Y, 'Fontname','helvetica','fontsize',20)
   legend('H_2SO_4 - MALTE-BOX', 'H_2SO_4 - ADCHAM');
   %axis([1 2 1E2 1E8])
   
   S = subplot(212);
   box on
   P = semilogy(time, HNO3, 'r-');
   hold on
%    set(P, 'linewidth', 3);
%    P = semilogy(time_P, Pontus_gas(:,3465), 'b-');
%    set(P, 'linewidth', 3);
%    set(S, 'fontsize',20, 'linewidth', 2) 
   Y = ylabel('Conc. [# cm^-^3]'); set(Y, 'Fontname','helvetica','fontsize',20)
   legend('HNO_3 - MALTE-BOX', 'HNO_3 - ADCHAM');
   X = xlabel('Date and time'); set(Y, 'Fontname','helvetica','fontsize',20)
%   axis([1 2 1E4 2E11])


   
   figure(2)
   S = subplot(211);
   box on
   P = semilogy(time, OH, 'r-');
   hold on
   set(P, 'linewidth', 3);
% %    P = semilogy(time_P, Pontus_gas(:,3532), 'b-');
% %    set(P, 'linewidth', 3);
% %    set(S, 'fontsize',20, 'linewidth', 2) 
   Y = ylabel('Conc. [# cm^-^3]'); set(Y, 'Fontname','helvetica','fontsize',20)
   legend('OH - MALTE-BOX', 'OH - ADCHAM .');
 %  axis([1 2 1E3 1E8])

   S = subplot(212);
   box on
   P = semilogy(time, NO3, 'r-');
   hold on
   set(P, 'linewidth', 3);
%    P = semilogy(time_P, Pontus_gas(:,3545), 'b-');
%    set(P, 'linewidth', 3);
%    set(S, 'fontsize',20, 'linewidth', 2) 
   X = xlabel('Date and time'); set(Y, 'Fontname','helvetica','fontsize',20)
   Y = ylabel('Conc. [# cm^-^3]'); set(Y, 'Fontname','helvetica','fontsize',20)
   legend('NO_3 - MALTE-BOX', 'NO_3 - ADCHAM');
  % axis([1 2 1E4 1E9])

   
% %   for j = 1:1441
%          ELVOC_10_P(j)  = sum(Pontus_gas(j,9:19));
%          ELVOC_CBN_P(j) = sum(Pontus_gas(j,20:31));
%          ELVOC_NO_P(j)  = sum(Pontus_gas(j,32:41));
%          ELVOC_20_P(j)  = sum(Pontus_gas(j,42:51));
%    end
         
%    figure(3)
%    S = subplot(211);
%    box on
%    P = semilogy(time, ELVOC_10, 'b-');
%    hold on
%    set(P, 'linewidth', 3);
%    P = semilogy(time, ELVOC_20, 'r-');
%    set(P, 'linewidth', 3);
% %    P = semilogy(time_P, ELVOC_10_P, 'b--');
% %    set(P, 'linewidth', 3);
% %    P = semilogy(time_P, ELVOC_20_P, 'r--');
% %    set(P, 'linewidth', 3);
% %    set(S, 'fontsize',20, 'linewidth', 2) 
%    Y = ylabel('Conc. [# cm^-^3]'); set(Y, 'Fontname','helvetica','fontsize',20)
%    legend('ELVOC-10 - MALTE-BOX', 'ELVOC-20 - MALTE-BOX', 'ELVOC-10 - ADCHAM', 'ELVOC-20 - ADCHAM');
% %   axis([167 171 1E1 1E9])
% 
%    S = subplot(212);
%    box on
%    P = semilogy(time, ELVOC_NO, 'b-');
%    hold on
%    set(P, 'linewidth', 3);
%    P = semilogy(time, ELVOC_CBN, 'r-');
%    set(P, 'linewidth', 3);
% %    P = semilogy(time_P, ELVOC_NO_P, 'b--');
% %    set(P, 'linewidth', 3);
% %    P = semilogy(time_P, ELVOC_CBN_P, 'r--');
% %    set(P, 'linewidth', 3);
% %    set(S, 'fontsize',20, 'linewidth', 2) 
%    Y = ylabel('Conc. [# cm^-^3]'); set(Y, 'Fontname','helvetica','fontsize',20)
%    legend('ELVOC-NO - MALTE-BOX', 'ELVOC-CBN - MALTE-BOX', 'ELVOC-NO - ADCHAM', 'ELVOC-CBN - ADCHAM');
%  %  axis([167 171 1E4 1E8])
%    
end


if par_fig == 1
   
   rad    = load(['/home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Me130618/A4/par_rad.dat']);
   num    = load(['/home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Me130618/A4/par_num.dat']);
   
   Lfile = length(num);
   
   for j = 1:Lfile
       time(j) = (j/288 - 1/288) *24;
   end
   
   [x y] = size(num);
   dia = rad*2;
   numN = num'/1E6;
   yL = y;
   numBC = par_back_conversion(numN, dia(10,:));
   
   figure(5)
   clf
   box on
   hold on
   set(gcf,'papertype','a4','paperorientation','portrait','units','normal')
   set(gca,'linewidth',1)
   set(gca,'Fontname','helvetica','fontsize',10)
   zdata=log10(abs(numBC+10));
   gcs=pcolor(time, dia(10,:), zdata);
   caxis([1 5])
   cdata=get(gcs,'cdata');
   colormap(jet);    
   set(gcs,'cdata',max(1,cdata))
   set(gcs,'cdata',min(256,cdata))
   shading('interp')
   set(gca,'yscale','log')
   %set(gca,'xlim', [(time(1)/24+168) (time(x)/24+168)])
   set(gca,'xlim', [0 24])
   set(gca,'xtick',[0 4 8 12 16 20 24])
   set(gca,'ylim',[dia(10,24) dia(10,80)])
   set(gca,'ytick',[1E-9 1E-7])
   set(gca,'ytick',[1E-9 1E-8 1E-7])
   %X = xlabel('Julian day and time'); set(X, 'fontsize', [20])
   Y = ylabel('Dp [nm]'); set(Y, 'Fontname','helvetica','fontsize',10)
   T = title(['Melpitz: 17-20 of June 2013 - dN/dlogDp [# cm^-^3]']); 
   set(T, 'fontsize', [28])
   gcc=colorbar('vertic');
   set(gcc,'ytickmode','manual')
   set(gcc,'ylim',[1 5],'ytick',[1 2 3 4 5])
   set(gcc,'yticklabel',[10,100,1000,10000,100000]', 'fontsize', 10)
   W=get(gcc,'position');
   



   % volume of Malte_box run
   for i = 1:Lfile
       for j = 1:yL
           vol(i,j) = numN(j,i) * 4/3 * pi * (dia(10,j)/2)^3;
       end
       num_sum(i) = sum(numN(1:yL,i));
       num_nuc(i) = sum(numN(1:yL,i));
       vol_sum(i) = sum(vol(i,1:yL))*1E18;
   end

   figure(6)
   clf
   S = subplot(211);
   box on
   hold on

   P = plot(time, num_sum, 'r-');
   set(P, 'linewidth', 3);
   axis([0 24 0 15000000])
   Y = ylabel('N_t_o_t [# cm^-^3]'); set(Y, 'Fontname','helvetica','fontsize',20)
   set(S, 'fontsize',20, 'linewidth', 2) 
   legend('Measurements', 'Model: same size as measurements');

   S = subplot(212);
   box on
   hold on
   P = plot(time, vol_sum, 'r-');
   set(P, 'linewidth', 3);
   axis([0 24 0 50])
   Y = ylabel('V_t_o_t [microm^3 cm^-^3]'); set(Y, 'Fontname','helvetica','fontsize',20)
   set(Y, 'fontsize',20, 'linewidth', 2) 
   set(S, 'fontsize',20, 'linewidth', 2) 
   legend('Measurements', 'Model');

   
end


if setup == 1
   dmps_old = load(['/home/carlton/Ph.D/malte_trail/malte-box/Malte_in/Box/',date,'/dmps_old.txt']);

   dmps_new = dmps_old';
   dmps_new(2,:) = dmps_new(2,:) * 10^(-9);
   
   fid1 = fopen('/home/carlton/Ph.D/malte_trail/malte-box/Malte_in/Box/Me130618/dmps.txt','w');

   fprintf (fid1, '%22.12f',  dmps_new(2,:));
   fprintf (fid1, '\n');  
   fprintf (fid1, '%22.3f',  dmps_new(1,:));
   fprintf (fid1, '\n');  

end

if setup == 2
   wave = load(['/home/carlton/Ph.D/malte_trail/malte-box/Malte_in/Box/',date,'/wavelengths.txt']);
   actf = load(['/home/carlton/Ph.D/malte_trail/malte-box/Malte_in/Box/',date,'/actinic_flux.txt']);

   i = 1;
   actf_new(1:100) = 0.;
   for j = 1:length(wave)
       if ((wave(j) > (280 + i*5-5)) && (wave(j) < 280 + i*5))
          actf_new(i) = actf_new(i) + actf(j)/5.5;
       end
       if wave(j) == (280.5 + i*5)
          wave_new(i) = 282.5 + i*5 - 5;
          i = i+1;
       end
   end
   
   fid2 = fopen('/home/carlton/Ph.D/malte_trail/malte-box/Malte_in/Box/Me130618/act_flux_new.txt','w');

   for i = 1:75
       fprintf (fid2, '%22.3f',  actf_new(i));
       fprintf (fid2, '\n');  
   end
end

