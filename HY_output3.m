%run the day twice and only use the second day
clear;
clc;
close all;
input_index=1;
output_index=1;
output_par=1;


%ccase='HY130516';
ccase='Me130618';
type='A1';
if strcmp(ccase,'HY130423')==1
    day=113;
end
if strcmp(ccase,'HY130501')==1
    day=121;
end
if strcmp(ccase,'HY130522')==1
    day=142;
end
if strcmp(ccase,'HY130615')==1
    day=166;
end
if strcmp(ccase,'HY130506')==1
    day=126;
end
if strcmp(ccase,'HY130515')==1
    day=135;
end
if strcmp(ccase,'HY130516')==1
    day=136;
end
if strcmp(ccase,'Me130618')==1
    day=167;
end
par_dN=load(['/Users/boy/Documents/Michael/New_Malte_box_v2/Malte_out/Box/' ccase '/' type '/par_num.dat']);
par_r=load(['/Users/boy/Documents/Michael/New_Malte_box_v2/Malte_out/Box/' ccase '/' type '/par_rad.dat']);
H2SO4=load(['/Users/boy/Documents/Michael/New_Malte_box_v2/Malte_out/Box/' ccase '/' type '/gas_H2SO4.dat']);
OH=load(['/Users/boy/Documents/Michael/New_Malte_box_v2/Malte_out/Box/' ccase '/' type '/gas_OH.dat']);
uv_model=load(['/Users/boy/Documents/Michael/New_Malte_box_v2/Malte_out/Box/' ccase '/' type '/UV_model.dat']);
NO=load(['/Users/boy/Documents/Michael/New_Malte_box_v2/Malte_out/Box/' ccase '/' type '/gas_NO.dat']);
NO2=load(['/Users/boy/Documents/Michael/New_Malte_box_v2/Malte_out/Box/' ccase '/' type '/gas_NO2.dat']);
HONO=load(['/Users/boy/Documents/Michael/New_Malte_box_v2/Malte_out/Box/' ccase '/' type '/gas_HONO.dat']);
NO3=load(['/Users/boy/Documents/Michael/New_Malte_box_v2/Malte_out/Box/' ccase '/' type '/gas_NO3.dat']);

%BLH=load(['/home/qiximeng/New_Malte_box_v2/Malte_in/BLH20' ccase(3:end) '.txt']);
BLH=load(['/Users/boy/Documents/Michael/New_Malte_box_v2/Malte_in/BLH20130522.txt']);
ELVOC10=load(['/Users/boy/Documents/Michael/New_Malte_box_v2/Malte_out/Box/' ccase '/' type '/gas_ELVOC10.dat']);
ELVOC20=load(['/Users/boy/Documents/Michael/New_Malte_box_v2/Malte_out/Box/' ccase '/' type '/gas_ELVOC20.dat']);
ELVOC_NO=load(['/Users/boy/Documents/Michael/New_Malte_box_v2/Malte_out/Box/' ccase '/' type '/gas_ELVOC_NO.dat']);
R_ELVOC=load(['/Users/boy/Documents/Michael/New_Malte_box_v2/Malte_out/Box/' ccase '/' type '/gas_R_ELVOC.dat']);

ELVOC20_O16=load(['/Users/boy/Documents/Michael/New_Malte_box_v2/Malte_out/Box/' ccase '/' type '/gas_ELVOC20_O16.dat']);
ELVOC20_O14=load(['/Users/boy/Documents/Michael/New_Malte_box_v2/Malte_out/Box/' ccase '/' type '/gas_ELVOC20_O14.dat']);
ELVOC20_O12=load(['/Users/boy/Documents/Michael/New_Malte_box_v2/Malte_out/Box/' ccase '/' type '/gas_ELVOC20_O12.dat']);
ELVOC20_O10=load(['/Users/boy/Documents/Michael/New_Malte_box_v2/Malte_out/Box/' ccase '/' type '/gas_ELVOC20_O10.dat']);
ELVOC20_O8=load(['/Users/boy/Documents/Michael/New_Malte_box_v2/Malte_out/Box/' ccase '/' type '/gas_ELVOC20_O8.dat']);
gas_vap=load(['/Users/boy/Documents/Michael/New_Malte_box_v2/Malte_out/Box/' ccase '/' type '/gas_vap.dat']);

vol=load(['/Users/boy/Documents/Michael/New_Malte_box_v2/Malte_out/Box/' ccase '/' type '/par_vol.dat']);
%dmps_obs=load(['/Users/boy/Documents/Michael/New_Malte_box_v2/Malte_in/Box/' ccase '/HY_input_dmps.txt']);
dmps_obs=load(['/Users/boy/Documents/Michael/New_Malte_box_v2/Malte_in/Box/' ccase '/dmps.txt']);
%v=load(['/Users/boy/Documents/Michael/New_Malte_box_v2/Malte_in/Box/' ccase '/HY_input_v2.txt']); 
par_dia=par_r(2,:)'.*2;
numN=par_dN'./1E6;
par_dNdlogDp=par_back_conversion(numN,par_dia);
timew=[0:1:576]'./288+day;


if output_index==1
%surface plot of the size distribution
figure(1)
subplot(2,1,2);

pcolor(timew',par_dia,log10(par_dNdlogDp(:,1:577)+1e-6));
set(gca,'yscale','log');
set(gca,'ylim',[3e-9 1e-6]);
set(gca,'xlim',[day day+1.02])
caxis([1,5]);
colormap('jet')
shading flat
gcc=colorbar('vertic');
set(gcc,'ytickmode','manual')
set(gcc,'ylim',[1 5],'ytick',[1 2 3 4 5])
set(gcc,'yticklabel',[10,100,1000,10000,100000]', 'fontsize', 10)
xlabel('Julian day');ylabel('Dp(nm)');
set(gca,'fontsize',10),
set(gca,'fontweight','b');

subplot(2,1,1);
pcolor(dmps_obs(2:145,1)',dmps_obs(1,3:end)',log10(abs(dmps_obs(2:145,3:end)')+1e-6));
set(gca,'yscale','log');
set(gca,'xlim',[day day+1.02])
set(gca,'ylim',[3e-9 1e-6]);
caxis([1,5]);
colormap('jet')
shading flat
gcc=colorbar('vertic');
set(gcc,'ytickmode','manual')
set(gcc,'ylim',[1 5],'ytick',[1 2 3 4 5])
set(gcc,'yticklabel',[10,100,1000,10000,100000]', 'fontsize', 10)
ylabel('Dp(nm)');
set(gca,'fontsize',10),
set(gca,'fontweight','b');
%plot the simulation and the observation number, volume

figure(2)
st=8; %start bin of the simulation for calculating the number/volume concentration
se=43; 
num_simu=sum(numN(st:se,:)',2);
numN_obs=par_conversion(dmps_obs(2:end,3:end)',dmps_obs(1,3:end));
num_obs=sum(numN_obs',2);
aa=numN';
bb=numN_obs';
[maa, naa]=size(aa);
for i=1:1:maa
    vol_simu(i,1)=sum((1/6.0).*pi.*par_dia(st:se)'.^3.*aa(i,st:se),2);
end
[mbb, nbb]=size(bb);
for i=1:1:mbb
    vol_obs(i,1)=sum((1/6.0).*pi.*dmps_obs(1,3:end).^3.*bb(i,:),2);
end
subplot(2,1,1);
P=plot(timew,num_simu(289:577,1),'r-');
set(P,'linewidth',2)
hold on
P=plot(dmps_obs(2:145,1),num_obs(1:144,1),'b-');
set(P,'linewidth',2)
legend('Simulation','Observation');
set(gca,'Xlim',[day day+1]);
title('Total number concentration');
ylabel('#/cm3');xlabel('time');
hold off

subplot(2,1,2)
P=plot(timew,vol_simu(289:577,1),'r-');
set(P,'linewidth',2)
hold on
P=plot(dmps_obs(2:145,1),vol_obs(1:144,1),'b-');
set(P,'linewidth',2)
legend('Simulation','Observation');
set(gca,'Xlim',[day day+1]);
title('Total volume concentration');
ylabel('m3/cm3');xlabel('time');
hold off

%plot the H2SO4
 h2so4=load('/Users/boy/Documents/Michael/New_Malte_box_v2/Malte_in/Box/2013/Hyde2013_spring_campaign_CI_APiTOF.txt');
 h2so4(:,1)=h2so4(:,1)-datenum(2013,1,1)+1;
 
 figure(3)
 P=plot(timew,H2SO4(289:577,1),'r');
 set(P,'linewidth',2);
 set(gca,'xlim',[day day+1])
 hold on
 P=plot(h2so4(:,1),h2so4(:,2),'b');
 legend('Simulation','Observation');
 set(gca,'Xlim',[day day+1]);
 set(P,'linewidth',2);
 title('H2SO4');
 ylabel('#/cm3');xlabel('time');
 hold off

%plot the OH
figure(4)
P=plot(timew,OH(289:577,1),'r');
set(P,'linewidth',2);
set(gca,'Xlim',[day day+1]);
set(gca,'Ylim',[0 3.5e6]);
title('OH');
ylabel('#/cm3');xlabel('time');



%plot the model UV and the observation UV


figure(5)
P=plot(timew,uv_model(289:577,1),'r');
set(P,'linewidth',2);
%uva_obs=v(:,8);
set(gca,'xlim',[day day+1])
hold on
%P=plot(v(:,1),uva_obs,'bo');
%set(P,'linewidth',2);
hold off
set(gca,'Xlim',[day day+1]);
title('UV');
ylabel('W/m3');xlabel('time');
legend('model','observation');
%plot simulation ELVOCs and measurement ELVOCs

elvoc=load('/Users/boy/Documents/Michael/New_Malte_box_v2/Malte_in/Box/2013/Hyde2013_ELVOC_separated.txt');
elvoc(:,1)=elvoc(:,1)-datenum(2013,1,1)+1;
 figure(6)
 subplot(2,2,1);
 P=plot(timew,ELVOC10(289:577,1),'r');
 set(P,'linewidth',2);
 set(gca,'Xlim',[day day+1]);
 set(gca,'yscale','log');
 hold on
 P=plot(elvoc(:,1),elvoc(:,5),'b');
 set(P,'linewidth',2);
 set(gca,'Xlim',[day day+1]);
 hold off
 title('ELVOC10');
 ylabel('#/cm3');xlabel('time');
 legend('model','observation');
% 
% 
 subplot(2,2,2);
 P=plot(timew,ELVOC20(289:577,1),'r');
 set(P,'linewidth',2);
 set(gca,'Xlim',[day day+1]);
 set(gca,'yscale','log');
 hold on
 P=plot(elvoc(:,1),elvoc(:,6),'b');
 set(P,'linewidth',2);
 set(gca,'Xlim',[day day+1]);
 hold off
 title('ELVOC20');
 ylabel('#/cm3');xlabel('time');
% 
% 
 subplot(2,2,3);
 P=plot(timew,ELVOC_NO(289:577,1),'r');
 set(P,'linewidth',2);
 set(gca,'Xlim',[day day+1]);
 set(gca,'yscale','log');
 hold on
 P=plot(elvoc(:,1),elvoc(:,4),'b');
 set(P,'linewidth',2);
 set(gca,'Xlim',[day day+1]);
 hold off
 title('ELVOC\_NO3');
 ylabel('#/cm3');%xlabel('time');
subplot(2,2,4)
 P=plot(timew,sum(gas_vap(289:577,1:613)*1e-6,2),'r-');
 set(P,'linewidth',2);
 set(gca,'Xlim',[day day+1]);
 set(gca,'yscale','log');
 set(gca,'ylim',[1e8 1e11])
 set(gca,'ytick',[1e4 1e6 1e8 1e10 1e12])
 hold on
 P=plot(timew,sum(gas_vap(289:577,643:652)*1e-6,2),'r:');
 set(P,'linewidth',2);
 hold off
 title('SVOC');% & ELVOC\_CBN');
 legend('SVOCs','ELVOC\_CBN')
 ylabel('#/cm3');xlabel('time');
%subplot(2,2,4)
% P=plot(timew,R_ELVOC(289:577,1),'r-');
% set(P,'linewidth',2);
% set(gca,'Xlim',[day day+1]);
% set(gca,'yscale','log');
 %set(gca,'ylim',[1e9 1e11])
 %set(gca,'ytick',[1e4 1e6 1e8 1e10 1e12])
% hold on
% P=plot(elvoc(:,1),elvoc(:,3),'b');
% set(P,'linewidth',2);
% set(gca,'Xlim',[day day+1]);
% hold off
% title('R\_ELVOC');
% ylabel('#/cm3');%xlabel('time');




end


if input_index==1
 %  v=load('/home/qiximeng/New_Malte_box/Malte_in/Box/HY140429/HY_input.txt'); 
%1= date
%2=WD
%3=WS
%4=TEMP
%5=RH
%6=Pressure
%7=Rad
%8=UVA
%9=UVB
%10=O3
%11=SO2
%12=CO
%13=NO
%14=NO2
%15=CH4
%.............PTR-MS.................
%16=Formaldehyde
%17=Methanol
%18=Acetonitrile
%19=Acetaldehyde
%20=Acetone
%21=Acetic acid
%22=Isoprene, methylbutenol fragment
%23=Methacrolein, methyl vinyl ketone
%24=MEK
%25=Benzene
%26=Monoterpene fragments, hexenal fragment
%27=Cis-3-hexenol fragment, hexanal fragment, methylfuran
%28=Unknown, maybe some hexanol fragments?
%29=Hexenal
%30=Hexanol
%31=Who knows...Oxidation products of monoterpenes?
%32=Monoterpenes
%33=AIR  calculated
v(:,1)=v(:,1);
[m_v n_v]=size(v);

figure(11)
subplot(3,1,1);
P=plot(v(:,1),v(:,10),'bo');
set(P,'linewidth',2);
set(gca,'Xlim',[day day+1]);
title('O3');
ylabel('#/cm3')%;xlabel('time');

subplot(3,1,2);
P=plot(v(:,1),v(:,11),'bo');
set(P,'linewidth',2);
set(gca,'Xlim',[day day+1]);
title('SO2');
ylabel('#/cm3')%;xlabel('time');

subplot(3,1,3);
P=plot(v(:,1),v(:,13)+v(:,14),'bo');
set(P,'linewidth',2);
set(gca,'Xlim',[day day+1]);
title('NOx');
ylabel('#/cm3');xlabel('time');

figure(1112)
subplot(3,1,1)
P=plot(timew,NO(289:577,1),'r:');
set(P,'linewidth',2);
set(gca,'Xlim',[day day+1]);
ylabel('#/cm3');xlabel('time');
title('NO');
hold on

P=plot(v(:,1),v(:,13),'bo');
set(P,'linewidth',2);
hold off
subplot(3,1,2)
P=plot(timew,NO2(289:577,1),'r');
set(P,'linewidth',2);
set(gca,'Xlim',[day day+1]);
ylabel('#/cm3');xlabel('time');
title('NO2')
hold on
P=plot(v(:,1),v(:,14),'bo');
set(P,'linewidth',2);
hold off
subplot(3,1,3)
P=plot(timew,NO(289:577,1)+NO2(289:577,1),'r');
set(P,'linewidth',2);
set(gca,'Xlim',[day day+1]);
ylabel('#/cm3');xlabel('time');
title('NOx')
hold on
P=plot(v(:,1),v(:,13)+v(:,14),'bo');
set(P,'linewidth',2);
hold off


%BLH
tttt=[0:49]./24;
figure(12)
P=plot(tttt,BLH(:,1),'bo');
set(P,'linewidth',2);
%set(gca,'Xlim',[1 2]);
title('BLH');
ylabel('m')%;xlabel('time');



  
    
end

if output_par==1
  prop=load(['/Users/boy/Documents/Michael/New_Malte_in/mcm33_bvoc_compound_prop.dat']);
  Na=6.02*1e23;
    for t=1:1:577
        par_elvoc(t)=0;
 
        
        
        
        for j=1:1:656
            for i=1:1:60
                rr(t).vol_conc(i,j)=vol(t,i+(j-1)*60);
                if j==656
                 rr(t).nc_conc(i,j)=vol(t,i+(j-1)*60)/(98.0/Na);
                else
                 rr(t).nc_conc(i,j)=vol(t,i+(j-1)*60)/(prop(j,1)/Na);   
                end
            end
        end

        
    end
 for t=1:1:577
   for j=1:1:60
     rrh2so4(t,j)= sum(rr(t).nc_conc(j,656),2);
     rrsvoc(t,j)=sum(rr(t).nc_conc(j,1:613),2);
     rrelvoc10(t,j)=sum(rr(t).nc_conc(j,614:622),2);
     rrelvoc20(t,j)=sum(rr(t).nc_conc(j,633:642),2);
     rrelvocno(t,j)=sum(rr(t).nc_conc(j,623:632),2);
     %rrelvoccbn(t,j)=sum(rr(t).mass_conc(j,931:940),2);
   end
 end
figure(112)
subplot(1,2,1)
 P=plot(timew,sum(rrelvoc10(289:577,:),2),'b');
 set(gca,'fontsize',15);
 %set(gca,'ylim',[0 0.15]);
 set(P,'linewidth',2);
 ylabel('number concentration(ug/cm3)');
title('ELVOC10 in particle phase')
subplot(1,2,2)
 P=plot(timew,sum(rrelvoc20(289:577,:),2),'b');
 set(gca,'fontsize',15);
 %set(gca,'ylim',[0 0.15]);
 set(P,'linewidth',2);
 ylabel('number concentration(ug/cm3)');
title('ELVOC20 in particle phase')
figure(113)
subplot(2,3,1)
 pcolor(timew,par_dia,log10(rrelvoc10(289:577,:)+1e-6)');
 set(gca,'yscale','log');
 shading flat
 colorbar;
 colormap('jet');
subplot(2,3,2)
 pcolor(timew,par_dia,log10(rrelvoc20(289:577,:)+1e-6)');
 set(gca,'yscale','log');
 shading flat
 colorbar;
 colormap('jet'); 
 subplot(2,3,3)
 pcolor(timew,par_dia,log10(rrelvocno(289:577,:)+1e-6)');
 set(gca,'yscale','log');
 shading flat
 colorbar;
 colormap('jet');
  subplot(2,3,4)
 pcolor(timew,par_dia,log10(rrsvoc(289:577,:)+1e-6)');
 set(gca,'yscale','log');
 shading flat
 colorbar;
 colormap('jet');
  subplot(2,3,5)
 pcolor(timew,par_dia,log10(rrh2so4(289:577,:)+1e-6)');
 set(gca,'yscale','log');
 shading flat
 colorbar;
 colormap('jet');
 


% Start and end time for surface plot (Similar figure with Ehn's nature paper )
%...................................  
  start_time1= 9  ;  %in hour  
  end_time1= 15  ;  %in hour    
%...................................
start_time=(start_time1+24)*12+1;
end_time=(end_time1+24)*12+1;
rpar=zeros(60,656);
for t=start_time:1:end_time
    rpar=rpar+rr(t).vol_conc;
end
rpar=rpar./(end_time-start_time+1);
%colume#1:H2SO4 #2:ELVOC10+ELVOC_CBN #3:ELVOC20 #4:ELVOC_NO #5:SVOC
par_column(:,1)=sum(rpar(:,656).*1.82.*1e-18.*1e9*1e3,2);% unit=ug
par_column(:,2)=sum(rpar(:,614:622).*1.4.*1e-18.*1e9*1e3,2)+sum(rpar(:,643:652).*1.4.*1e-18.*1e9*1e3,2);% unit=ug
par_column(:,3)=sum(rpar(:,633:642).*1.4.*1e-18.*1e9*1e3,2);% unit=ug
par_column(:,4)=sum(rpar(:,623:632).*1.4.*1e-18.*1e9*1e3,2);% unit=ug
par_column(:,5)=sum(rpar(:,1:613).*1.4.*1e-18.*1e9*1e3,2);% unit=ug
par_all(:,1)=sum(par_column,2);
for j=1:1:5
    par_column(:,j)=par_column(:,j)./par_all;
end




  figure(33)
area(par_dia*1e9,par_column);
set(gca,'xlim',[1 100]); 
set(gca,'ylim',[0 1]);  
set(gca,'tickdir','out');
%set(gca,'xtick',[1e0 2e0 4e0 7e0 1e1 2e1 4e1 7e1 1e2 ])
set(gca,'xscale','log');
set(gca,'linewidth',1.5);

xlabel('dp(nm)');
ylabel('Growth contribution(%)');
legend('H2SO4','ELVOC10','ELVOC20','ELVOC\_NO3','LVOC');
title(['Vapors inside particle (' num2str(start_time1) ':00-' num2str(end_time1) ':00)']);
set(gca,'fontsize',10);
set(gca,'fontweight','b');
end  
   
   

