close all
clear all

gas_fig = 1;
par_fig = 0;

dpar = 1;
run  = 'A1';
day  = 167;
date = 'Me130618';


if gas_fig == 1
   
   OH     = load(['/home/local/carltonx/Work/Malte_box/Bitbucket_Malte_repo/malte_v1/Malte_out/Box/Me130618/A4/gas_OH.dat']);
   HO2    = load(['/home/local/carltonx/Work/Malte_box/Bitbucket_Malte_repo/malte_v1/Malte_out/Box/Me130618/A4/gas_HO2.dat']);
   H2SO4  = load(['/home/local/carltonx/Work/Malte_box/Bitbucket_Malte_repo/malte_v1/Malte_out/Box/Me130618/A4/gas_H2SO4.dat']);
   HNO3   = load(['/home/local/carltonx/Work/Malte_box/Bitbucket_Malte_repo/malte_v1/Malte_out/Box/Me130618/A4/gas_HNO3.dat']);
  % CH4    = load(['/home/local/carltonx/Work/Malte_box/Bitbucket_Malte_repo/malte_v1/Malte_out/Box/Me130618/A4/gas_CH4.dat']);
   NO3    = load(['/home/local/carltonx/Work/Malte_box/Bitbucket_Malte_repo/malte_v1/Malte_out/Box/Me130618/A4/gas_NO3.dat']);

   SO3    = load(['/home/local/carltonx/Work/Malte_box/Bitbucket_Malte_repo/malte_v1/Malte_out/Box/Me130618/A4/gas_SO3.dat']);
   HSO3   = load(['/home/local/carltonx/Work/Malte_box/Bitbucket_Malte_repo/malte_v1/Malte_out/Box/Me130618/A4/gas_HSO3.dat']);
   
   SO2    = load(['/home/local/carltonx/Work/Malte_box/Bitbucket_Malte_repo/malte_v1/Malte_out/Box/Me130618/A4/gas_SO2.dat']);
   NO     = load(['/home/local/carltonx/Work/Malte_box/Bitbucket_Malte_repo/malte_v1/Malte_out/Box/Me130618/A4/gas_NO.dat']);
   CO     = load(['/home/local/carltonx/Work/Malte_box/Bitbucket_Malte_repo/malte_v1/Malte_out/Box/Me130618/A4/gas_CO.dat']);
   O3     = load(['/home/local/carltonx/Work/Malte_box/Bitbucket_Malte_repo/malte_v1/Malte_out/Box/Me130618/A4/gas_o3.dat']);
   %CS_SA  = load(['/home/local/carltonx/Work/Malte_box/Bitbucket_Malte_repo/malte_v1/Malte_out/Box/Me130618/A4/CS_H2SO4.dat']);
   %CS_NA  = load(['/home/local/carltonx/Work/Malte_box/Bitbucket_Malte_repo/malte_v1/Malte_out/Box/Me130618/A4/CS_HNO3.dat']);
   Mono   = load(['/home/local/carltonx/Work/Malte_box/Bitbucket_Malte_repo/malte_v1/Malte_out/Box/Me130618/A4/gas_Mon_sum.dat']);

   ELVOC_10  = load(['/home/local/carltonx/Work/Malte_box/Bitbucket_Malte_repo/malte_v1/Malte_out/Box/Me130618/A4/gas_ELVOC_10.dat']);
   ELVOC_20  = load(['/home/local/carltonx/Work/Malte_box/Bitbucket_Malte_repo/malte_v1/Malte_out/Box/Me130618/A4/gas_ELVOC_20.dat']);
   ELVOC_NO  = load(['/home/local/carltonx/Work/Malte_box/Bitbucket_Malte_repo/malte_v1/Malte_out/Box/Me130618/A4/gas_ELVOC_NO.dat']);
   ELVOC_CBN = load(['/home/local/carltonx/Work/Malte_box/Bitbucket_Malte_repo/malte_v1/Malte_out/Box/Me130618/A4/gas_ELVOC_CBN.dat']);
   %SVOC_1    = load(['/home/local/carltonx/Work/Malte_box/Bitbucket_Malte_repo/malte_v1/Malte_out/Box/Me130618/A4/gas_SVOC_1.dat']);
   %SVOC_2    = load(['/home/local/carltonx/Work/Malte_box/Bitbucket_Malte_repo/malte_v1/Malte_out/Box/Me130618/A4/gas_SVOC_2.dat']);
   
   OH_RM     = load(['/home/local/carltonx/Work/Malte_box/Bitbucket_Malte_repo/malte_v1/Malte_in/Box/Me130618/Me_gas.txt']);
   OH_RMN    = load(['/home/local/carltonx/Work/Malte_box/Bitbucket_Malte_repo/malte_v1/Malte_in/Box/Me130618/Me_gas_new.txt']);
   Lfile = length(OH);
   
   for j = 1:Lfile
       time(j) = (j/288 - 1/288) + day;
   end
    
   
   
   figure(1)
   S = subplot(211);
   box on
   P = semilogy(time, H2SO4, 'r-');
   set(P, 'linewidth', 3);
   hold on
   P = semilogy(OH_RM(1:481,1), OH_RMN(1:481,23), 'b-');
   set(P, 'linewidth', 3);
   P = semilogy(OH_RM(1:481,1), OH_RM(1:481,23), 'b--');
   set(P, 'linewidth', 3);
   set(S, 'fontsize',20, 'linewidth', 2) 
   Y = ylabel('Conc. [# cm^-^3]'); set(Y, 'Fontname','helvetica','fontsize',20)
   legend('H_2SO_4 - MALTE-BOX', 'H_2SO_4, SO_4 = respectively - COSMO-MUSCAT');
   axis([167 171 1E2 1E8])
   
   S = subplot(212);
   box on
   P = semilogy(time, HNO3, 'r-');
   hold on
   set(P, 'linewidth', 3);
   P = semilogy(OH_RM(1:481,1), OH_RMN(1:481,20), 'b-');
   set(P, 'linewidth', 3);
   P = semilogy(OH_RM(1:481,1), OH_RM(1:481,20), 'b--');
   set(P, 'linewidth', 3);
   set(S, 'fontsize',20, 'linewidth', 2) 
   Y = ylabel('Conc. [# cm^-^3]'); set(Y, 'Fontname','helvetica','fontsize',20)
   legend('HNO_3 - MALTE-BOX', 'HNO_3 - COSMO-MUSCAT');
   X = xlabel('Date and time'); set(Y, 'Fontname','helvetica','fontsize',20)
   axis([167 171 1E4 2E11])

   
   
   figure(2)
   S = subplot(211);
   box on
   P = semilogy(time, OH, 'r-');
   hold on
   set(P, 'linewidth', 3);
   P = semilogy(OH_RM(1:481,1), OH_RMN(1:481,17), 'b-');
   set(P, 'linewidth', 3);
   P = semilogy(OH_RM(1:481,1), OH_RM(1:481,17), 'b--');
   set(P, 'linewidth', 3);
   set(S, 'fontsize',20, 'linewidth', 2) 
   Y = ylabel('Conc. [# cm^-^3]'); set(Y, 'Fontname','helvetica','fontsize',20)
   legend('OH - Model: MALTE-BOX', 'OH - Model: COSMO-MUSCAT .');
   axis([167 171 1E3 1E8])

   S = subplot(212);
   box on
   P = semilogy(time, NO3, 'r-');
   hold on
   set(P, 'linewidth', 3);
   P = semilogy(OH_RM(1:481,1), OH_RMN(1:481,21), 'b-');
   set(P, 'linewidth', 3);
   P = semilogy(OH_RM(1:481,1), OH_RM(1:481,21), 'b--');
   set(P, 'linewidth', 3);
   set(S, 'fontsize',20, 'linewidth', 2) 
   X = xlabel('Date and time'); set(Y, 'Fontname','helvetica','fontsize',20)
   Y = ylabel('Conc. [# cm^-^3]'); set(Y, 'Fontname','helvetica','fontsize',20)
   legend('NO_3 - Model: MALTE-BOX', 'NO_3 - Model: COSMO-MUSCAT .');
   axis([167 171 1E4 1E9])

   
   
%    figure(3)
%    S = subplot(211);
%    box on
%    P = semilogy(time, ELVOC_10, 'b-');
%    hold on
%    set(P, 'linewidth', 3);
%    P = semilogy(time, ELVOC_20, 'r-');
%    set(P, 'linewidth', 3);
%    set(S, 'fontsize',20, 'linewidth', 2) 
%    Y = ylabel('Conc. [# cm^-^3]'); set(Y, 'Fontname','helvetica','fontsize',20)
%    legend('ELVOC-10', 'ELVOC-20');
%    axis([167 171 1E1 1E9])
% 
%    S = subplot(212);
%    box on
%    P = semilogy(time, ELVOC_NO, 'b-');
%    hold on
%    set(P, 'linewidth', 3);
%    P = semilogy(time, ELVOC_CBN, 'r-');
%    set(P, 'linewidth', 3);
%    set(S, 'fontsize',20, 'linewidth', 2) 
%    Y = ylabel('Conc. [# cm^-^3]'); set(Y, 'Fontname','helvetica','fontsize',20)
%    legend('ELVOC-NO', 'ELVOC-carbonyl');
%    axis([167 171 1E4 1E8])
   
%    S = subplot(313);
%    box on
%    P = semilogy(time, SVOC_1, 'b-');
%    hold on
%    set(P, 'linewidth', 3);
%    P = semilogy(time, SVOC_2, 'r-');
%    set(P, 'linewidth', 3);
%    set(S, 'fontsize',20, 'linewidth', 2) 
%    Y = ylabel('Conc. [# cm^-^3]'); set(Y, 'Fontname','helvetica','fontsize',20)
%    X = xlabel('Date and time'); set(Y, 'Fontname','helvetica','fontsize',20)
%    legend('SVOC-1', 'SVOC-2');
%    axis([167 171 1E2 1E10])

   
   figure(4)
   %S = subplot(311);
   box on
   P = semilogy(time, Mono, 'b-');
   hold on
   set(P, 'linewidth', 3);
   P = semilogy(OH_RM(1:481,1), OH_RMN(1:481,29), 'r-');
   set(P, 'linewidth', 3);
   P = semilogy(OH_RM(1:481,1), OH_RMN(1:481,30), 'c-');
   set(P, 'linewidth', 3);
   P = semilogy(OH_RM(1:481,1), OH_RM(1:481,29), 'r--');
   set(P, 'linewidth', 3);
   P = semilogy(OH_RM(1:481,1), OH_RM(1:481,30), 'c--');
   set(P, 'linewidth', 3);
   set(S, 'fontsize',20, 'linewidth', 2) 
   Y = ylabel('Conc. [# cm^-^3]'); set(Y, 'Fontname','helvetica','fontsize',20)
   legend('Sum of Monoterpenes from model', 'a-pinene from input', 'limonene from input');
   axis([167 171 5E7 1E10])


   
   %S = subplot(312);
   %box on
   %semilogy(time, HO2, 'r-')
   %hold on
   %set(S, 'fontsize',20, 'linewidth', 2) 
   %Y = ylabel('Conc. [# cm^-^3]'); set(Y, 'Fontname','helvetica','fontsize',20)
   %legend('HO_2 - MALTE-BOX');

   figure(10)
   S = subplot(211);
   box on
   semilogy(time, SO2, 'b-')
   hold on
   semilogy(OH_RM(1:481,1), OH_RMN(1:481,13), 'b--')
   semilogy(OH_RM(1:481,1), OH_RM(1:481,13), 'b-.')
   semilogy(time, NO, 'r-')
   semilogy(OH_RM(1:481,1), OH_RMN(1:481,15), 'r--')
   semilogy(OH_RM(1:481,1), OH_RM(1:481,15), 'r-.')
   set(S, 'fontsize',20, 'linewidth', 2) 
   Y = ylabel('Conc. [#/cm^-^3]'); set(Y, 'Fontname','helvetica','fontsize',20)
   legend('SO_2 - Measured', 'SO_2 - COSMO-MUSCAT - new', 'SO_2 - COSMO-MUSCAT - original', ...
          'NO - Measured',   'NO - COSMO-MUSCAT_new',     'NO - COSMO-MUSCAT_original');
   
   S = subplot(212);
   box on
   semilogy(time, CO, 'b-')
   hold on
   semilogy(time, O3*10, 'g-')
   set(S, 'fontsize',20, 'linewidth', 2) 
   Y = ylabel('Conc. [#/cm^-^3]'); set(Y, 'Fontname','helvetica','fontsize',20)
   legend('CO', 'O3 x 10')
end


if par_fig == 1
   
   rad    = load(['/home/local/carltonx/Work/Malte_box/Bitbucket_Malte_repo/malte_v1/Malte_out/Box/Me130618/A4/par_rad.dat']);
   num    = load(['/home/local/carltonx/Work/Malte_box/Bitbucket_Malte_repo/malte_v1/Malte_out/Box/Me130618/A4/par_num.dat']);
   cs_Mo  = load(['/home/local/carltonx/Work/Malte_box/Bitbucket_Malte_repo/malte_v1/Malte_out/Box/Me130618/A4/cs_d_model.dat']);
   cs_Me  = load(['/home/local/carltonx/Work/Malte_box/Bitbucket_Malte_repo/malte_v1/Malte_out/Box/Me130618/A4/cs_H2SO4.dat']);
   dmps   = load(['/home/local/carltonx/Work/Malte_box/Bitbucket_Malte_repo/malte_v1/Malte_in/Box/',date,'/dmps.txt']);
   
   Lfile = length(num);
   
   for j = 1:Lfile
       time(j) = (j/288 - 1/288) *24;
   end
   
   [x y] = size(num);
   dia = rad*2;
   numN = num'/1E6;
   yL = y;
   numBC = par_back_conversion(numN, dia(300,:));
   
   figure(5)
   clf
   subplot(211)
   box on
   hold on
   set(gcf,'papertype','a4','paperorientation','portrait','units','normal')
   set(gca,'linewidth',1)
   set(gca,'Fontname','helvetica','fontsize',20)
   zdata=log10(abs(numBC+10));
   gcs=pcolor((time/24+167), dia(300,:), zdata);
   caxis([1 5])
   cdata=get(gcs,'cdata');
   colormap(jet);    
   set(gcs,'cdata',max(1,cdata))
   set(gcs,'cdata',min(256,cdata))
   shading('interp')
   set(gca,'yscale','log')
   %set(gca,'xlim', [(time(1)/24+168) (time(x)/24+168)])
   set(gca,'xlim', [168 171])
   set(gca,'xtick',[168 168.5 169 169.5 170 170.5 171])
   set(gca,'ylim',[dia(300,24) dia(300,80)])
   set(gca,'ytick',[1E-9 1E-7])
   set(gca,'ytick',[1E-9 1E-8 1E-7])
   %X = xlabel('Julian day and time'); set(X, 'fontsize', [20])
   Y = ylabel('Dp [nm]'); set(Y, 'Fontname','helvetica','fontsize',20)
   T = title(['Melpitz: 17-20 of June 2013 - dN/dlogDp [# cm^-^3]']); 
   set(T, 'fontsize', [28])
   gcc=colorbar('vertic');
   set(gcc,'ytickmode','manual')
   set(gcc,'ylim',[1 5],'ytick',[1 2 3 4 5])
   set(gcc,'yticklabel',[10,100,1000,10000,100000]', 'fontsize', 20)
   W=get(gcc,'position');
   limx = [time(1) time(x)];
   limy = [dmps(1,2) dmps(1,2)];
   P = plot(limx, limy, 'k-'); set(P, 'linewidth', 4)

   [x y] = size(dmps);
   dmpsx = dmps';

   % Change dmps data from dN/dlogDp to N/cm3
   numI(:,:) = dmps(2:x,3:y)';
   numC = par_conversion(numI, dmps(1,3:y));

   % Test that the back conversion works well - yes it works well
   %for i = 1:385
   %    for j = 1:46
   %        if numC(j,i) <0., numC(j,i) = 0.; end
   %    end
   %end
   %numAC = par_back_conversion(numC, dmps(1,3:y));
   
   
   subplot(212)
   box on
   hold on
   set(gcf,'papertype','a4','paperorientation','portrait','units','normal')
   set(gca,'linewidth',1)
   set(gca,'Fontname','helvetica','fontsize',20)
   zdata=log10(abs(numI+10));
   gcs=pcolor(dmps(2:x,1), dmps(1,3:y), zdata);
   caxis([1 5])
   cdata=get(gcs,'cdata');
   colormap(jet);
   set(gcs,'cdata',max(1,cdata))
   set(gcs,'cdata',min(256,cdata))
   shading('interp')
   set(gca,'yscale','log')
   %set(gca,'xlim',[dmps(2,1) dmps(x,1)])
   set(gca,'xlim',[dmps(2,1) dmps(291,1)])
   set(gca,'xtick',[168 168.5 169 169.5 170 170.5 171])
   set(gca,'ylim',[dmps(1,3) dmps(1,y)])   
   set(gca,'ytick',[1E-8 1E-7])
   X = xlabel('Julian day and time'); set(X, 'fontsize', [20])
   Y = ylabel('Dp [nm]'); set(Y, 'Fontname','helvetica','fontsize',20)
   %T = title('SORPES: 2013-07-14'); set(T, 'fontsize', [20])
   gcc=colorbar('vertic');
   set(gcc,'ytickmode','manual')
   set(gcc,'ylim',[1 5],'ytick',[1 2 3 4 5])
   set(gcc,'yticklabel',[10,100,1000,10000, 100000]', 'fontsize', 20)
   W=get(gcc,'position');

   
   % volume of measurements
   for i = 1:length(numC)
       for j = 1:y-2
           Vol(i,j) = numC(j,i) * 4/3 * pi * (dmps(1,j+1)/2)^3;
       end
       Num_sum(i) = sum(numC(:,i));
       Vol_sum(i) = sum(Vol(i,:))*1E18;
   end
   % volume of Malte_box run
   for i = 1:Lfile
       for j = 1:yL
           vol(i,j) = numN(j,i) * 4/3 * pi * (dia(300,j)/2)^3;
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
   P = plot(dmps(2:290,1), Num_sum(1:289), 'b-');
   set(P, 'linewidth', 3);
   P = plot(time/24+167, num_sum, 'r-');
   set(P, 'linewidth', 3);
   %P = plot(time/24+168, num_nuc, 'g-')
   %set(P, 'linewidth', 3);
   axis([168 171 0 60000])
   Y = ylabel('N_t_o_t [# cm^-^3]'); set(Y, 'Fontname','helvetica','fontsize',20)
   set(S, 'fontsize',20, 'linewidth', 2) 
   legend('Measurements', 'Model: same size as measurements');

   S = subplot(212);
   box on
   hold on
   P = plot(dmps(2:290,1), Vol_sum(1:289), 'b-');
   set(P, 'linewidth', 3);
   P = plot(time/24+167, vol_sum, 'r-');
   set(P, 'linewidth', 3);
   axis([168 171 0 25])
   Y = ylabel('V_t_o_t [microm^3 cm^-^3]'); set(Y, 'Fontname','helvetica','fontsize',20)
   set(Y, 'fontsize',20, 'linewidth', 2) 
   set(S, 'fontsize',20, 'linewidth', 2) 
   legend('Measurements', 'Model');

   %S = subplot(313);
   %box on
   %hold on
   %P = plot(time/24+168, cs_Me, 'b-');
   %set(P, 'linewidth', 3);
   %P = plot(time/24+168, cs_Mo, 'r-');
   %set(P, 'linewidth', 3);
   %Y = ylabel('CS [s ^-^1]'); set(Y, 'Fontname','helvetica','fontsize',20)
   %X =xlabel('Day and time'); set(X, 'Fontname','helvetica','fontsize',20)
   %set(S, 'fontsize',20, 'linewidth', 2) 
   %legend('Measurements', 'Model');
   
   
   figure(7)
   clf
   S = subplot(211);
   box on
   hold on
   plot(dmps(1,3:48), numC(:,2),'r-')
   plot(dia(2,:), numN(:,2),'b-')
   plot(dmps(1,3:48), numC(:,60),'r--')
   plot(dia(2,:), numN(:,60),'g--')
   legend('DMPS', 'Model')

   S = subplot(212);
   box on
   hold on
   plot(dmps(1,3:48), Vol(2,:),'r-')
   plot(dia(2,:), vol(2,:),'b-')
   plot(dmps(1,3:48), Vol(60,:),'r--')
   plot(dia(2,:), vol(60,:),'g--')
   legend('DMPS', 'Model')
end












