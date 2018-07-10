clear;
clc;
close all;
%this script is to plot the comparison between measurement and simulation.
%input the simulate data.
%2013,05,01
ELVOC10_1  =load(['/home/qiximeng/New_Malte_box_v2/Malte_out/Box/HY130501/A1/gas_ELVOC10.dat']);
ELVOC20_1  =load(['/home/qiximeng/New_Malte_box_v2/Malte_out/Box/HY130501/A1/gas_ELVOC20.dat']);
ELVOC_NO_1 =load(['/home/qiximeng/New_Malte_box_v2/Malte_out/Box/HY130501/A1/gas_ELVOC_NO.dat']);
R_ELVOC_1  =load(['/home/qiximeng/New_Malte_box_v2/Malte_out/Box/HY130501/A1/gas_R_ELVOC.dat']);
H2SO4_1    =load(['/home/qiximeng/New_Malte_box_v2/Malte_out/Box/HY130501/A1/gas_H2SO4.dat']);
dN_1       =load(['/home/qiximeng/New_Malte_box_v2/Malte_out/Box/HY130501/A1/par_num.dat']);
ddia       =load(['/home/qiximeng/New_Malte_box_v2/Malte_out/Box/HY130501/A1/par_rad.dat']);
dia=ddia(2,:).*2;

%2013,05,06
ELVOC10_2  =load(['/home/qiximeng/New_Malte_box_v2/Malte_out/Box/HY130506/A1/gas_ELVOC10.dat']);
ELVOC20_2  =load(['/home/qiximeng/New_Malte_box_v2/Malte_out/Box/HY130506/A1/gas_ELVOC20.dat']);
ELVOC_NO_2 =load(['/home/qiximeng/New_Malte_box_v2/Malte_out/Box/HY130506/A1/gas_ELVOC_NO.dat']);
R_ELVOC_2  =load(['/home/qiximeng/New_Malte_box_v2/Malte_out/Box/HY130506/A1/gas_R_ELVOC.dat']);
H2SO4_2    =load(['/home/qiximeng/New_Malte_box_v2/Malte_out/Box/HY130506/A1/gas_H2SO4.dat']);
dN_2       =load(['/home/qiximeng/New_Malte_box_v2/Malte_out/Box/HY130506/A1/par_num.dat']);


%2013,05,16
ELVOC10_3  =load(['/home/qiximeng/New_Malte_box_v2/Malte_out/Box/HY130516/A6/gas_ELVOC10.dat']);
ELVOC20_3  =load(['/home/qiximeng/New_Malte_box_v2/Malte_out/Box/HY130516/A6/gas_ELVOC20.dat']);
ELVOC_NO_3 =load(['/home/qiximeng/New_Malte_box_v2/Malte_out/Box/HY130516/A6/gas_ELVOC_NO.dat']);
R_ELVOC_3  =load(['/home/qiximeng/New_Malte_box_v2/Malte_out/Box/HY130516/A6/gas_R_ELVOC.dat']);
H2SO4_3    =load(['/home/qiximeng/New_Malte_box_v2/Malte_out/Box/HY130516/A6/gas_H2SO4.dat']);
dN_3       =load(['/home/qiximeng/New_Malte_box_v2/Malte_out/Box/HY130516/A6/par_num.dat']);


%2013,05,22
ELVOC10_4  =load(['/home/qiximeng/New_Malte_box_v2/Malte_out/Box/HY130522/A2/gas_ELVOC10.dat']);
ELVOC20_4  =load(['/home/qiximeng/New_Malte_box_v2/Malte_out/Box/HY130522/A2/gas_ELVOC20.dat']);
ELVOC_NO_4 =load(['/home/qiximeng/New_Malte_box_v2/Malte_out/Box/HY130522/A2/gas_ELVOC_NO.dat']);
R_ELVOC_4  =load(['/home/qiximeng/New_Malte_box_v2/Malte_out/Box/HY130522/A2/gas_R_ELVOC.dat']);
H2SO4_4    =load(['/home/qiximeng/New_Malte_box_v2/Malte_out/Box/HY130522/A2/gas_H2SO4.dat']);
dN_4       =load(['/home/qiximeng/New_Malte_box_v2/Malte_out/Box/HY130522/A2/par_num.dat']);


%2013,06,15
ELVOC10_5  =load(['/home/qiximeng/New_Malte_box_v2/Malte_out/Box/HY130615/A8/gas_ELVOC10.dat']);
ELVOC20_5  =load(['/home/qiximeng/New_Malte_box_v2/Malte_out/Box/HY130615/A8/gas_ELVOC20.dat']);
ELVOC_NO_5 =load(['/home/qiximeng/New_Malte_box_v2/Malte_out/Box/HY130615/A8/gas_ELVOC_NO.dat']);
R_ELVOC_5  =load(['/home/qiximeng/New_Malte_box_v2/Malte_out/Box/HY130615/A8/gas_R_ELVOC.dat']);
H2SO4_5    =load(['/home/qiximeng/New_Malte_box_v2/Malte_out/Box/HY130615/A8/gas_H2SO4.dat']);
dN_5       =load(['/home/qiximeng/New_Malte_box_v2/Malte_out/Box/HY130615/A8/par_num.dat']);


%2013,04,23
ELVOC10_6  =load(['/home/qiximeng/New_Malte_box_v2/Malte_out/Box/HY130423/A2/gas_ELVOC10.dat']);
ELVOC20_6  =load(['/home/qiximeng/New_Malte_box_v2/Malte_out/Box/HY130423/A2/gas_ELVOC20.dat']);
ELVOC_NO_6 =load(['/home/qiximeng/New_Malte_box_v2/Malte_out/Box/HY130423/A2/gas_ELVOC_NO.dat']);
R_ELVOC_6  =load(['/home/qiximeng/New_Malte_box_v2/Malte_out/Box/HY130423/A2/gas_R_ELVOC.dat']);
H2SO4_6    =load(['/home/qiximeng/New_Malte_box_v2/Malte_out/Box/HY130423/A2/gas_H2SO4.dat']);
dN_6       =load(['/home/qiximeng/New_Malte_box_v2/Malte_out/Box/HY130423/A2/par_num.dat']);



%...calculate the total dN/dV.....
haha1=dN_1(289:577,:)';
haha2=par_back_conversion(haha1,dia);
dN_dlogDp_1=haha2';

haha1=dN_2(289:577,:)';
haha2=par_back_conversion(haha1,dia);
dN_dlogDp_2=haha2';

haha1=dN_3(289:577,:)';
haha2=par_back_conversion(haha1,dia);
dN_dlogDp_3=haha2';

haha1=dN_4(289:577,:)';
haha2=par_back_conversion(haha1,dia);
dN_dlogDp_4=haha2';

haha1=dN_5(289:577,:)';
haha2=par_back_conversion(haha1,dia);
dN_dlogDp_5=haha2';

haha1=dN_6(289:577,:)';
haha2=par_back_conversion(haha1,dia);
dN_dlogDp_6=haha2';

[mm,nn]=size(dN_dlogDp_1);
for i=1:1:nn
    dp(i)=log10(dia(i));
end
for i=1:1:mm
    dmin=max(log10(3e-9),dp(1));
    dmax=min(log10(1000e-9),dp(end));
    dpi=[dmin:0.001:dmax];
    dddconc=dN_dlogDp_1(i,:);
    NC(i,1)=sum(interp1(dp,dddconc',dpi,'nearest')*0.001)*1e-6;
    VC(i,1)=sum(interp1(dp,dddconc',dpi,'nearest').*0.001.*(1/6).*pi.*(10.^dpi).^3)*1e-6;
    
    dddconc=dN_dlogDp_2(i,:);
    NC(i,2)=sum(interp1(dp,dddconc',dpi,'nearest')*0.001)*1e-6;
    VC(i,2)=sum(interp1(dp,dddconc',dpi,'nearest').*0.001.*(1/6).*pi.*(10.^dpi).^3)*1e-6;
    
    dddconc=dN_dlogDp_3(i,:);
    NC(i,3)=sum(interp1(dp,dddconc',dpi,'nearest')*0.001)*1e-6;
    VC(i,3)=sum(interp1(dp,dddconc',dpi,'nearest').*0.001.*(1/6).*pi.*(10.^dpi).^3)*1e-6;
    
    dddconc=dN_dlogDp_4(i,:);
    NC(i,4)=sum(interp1(dp,dddconc',dpi,'nearest')*0.001)*1e-6;
    VC(i,4)=sum(interp1(dp,dddconc',dpi,'nearest').*0.001.*(1/6).*pi.*(10.^dpi).^3)*1e-6;
    
    dddconc=dN_dlogDp_5(i,:);
    NC(i,5)=sum(interp1(dp,dddconc',dpi,'nearest')*0.001)*1e-6;
    VC(i,5)=sum(interp1(dp,dddconc',dpi,'nearest').*0.001.*(1/6).*pi.*(10.^dpi).^3)*1e-6;
    
    dddconc=dN_dlogDp_6(i,:);
    NC(i,6)=sum(interp1(dp,dddconc',dpi,'nearest')*0.001)*1e-6;
    VC(i,6)=sum(interp1(dp,dddconc',dpi,'nearest').*0.001.*(1/6).*pi.*(10.^dpi).^3)*1e-6;
    
    
end


%plot
ELVOC10    =[ELVOC10_1(289:577,1) ELVOC10_2(289:577,1) ELVOC10_3(289:577,1) ELVOC10_4(289:577,1) ELVOC10_5(289:577,1) ELVOC10_6(289:577,1)];
ELVOC20    =[ELVOC20_1(289:577,1) ELVOC20_2(289:577,1) ELVOC20_3(289:577,1) ELVOC20_4(289:577,1) ELVOC20_5(289:577,1) ELVOC20_6(289:577,1)];
ELVOC_NO   =[ELVOC_NO_1(289:577,1) ELVOC_NO_2(289:577,1) ELVOC_NO_3(289:577,1) ELVOC_NO_4(289:577,1) ELVOC_NO_5(289:577,1) ELVOC_NO_6(289:577,1)];
R_ELVOC    =[R_ELVOC_1(289:577,1) R_ELVOC_2(289:577,1) R_ELVOC_3(289:577,1) R_ELVOC_4(289:577,1) R_ELVOC_5(289:577,1) R_ELVOC_6(289:577,1)];
H2SO4_simu =[H2SO4_1(289:577,1) H2SO4_2(289:577,1) H2SO4_3(289:577,1) H2SO4_4(289:577,1) H2SO4_5(289:577,1) H2SO4_6(289:577,1)];
%...
ELVOC10(:,2)=NaN;
ELVOC20(:,2)=NaN;
ELVOC_NO(:,2)=NaN;
R_ELVOC(:,2)=NaN;
H2SO4_simu(:,2)=NaN;
NC(:,2)=NaN;
VC(:,2)=NaN;
%...

ELVOC_mean(:,1)=nanmean(ELVOC10,2);
ELVOC_mean(:,2)=nanmean(ELVOC20,2);
ELVOC_mean(:,3)=nanmean(ELVOC_NO,2);
ELVOC_mean(:,4)=nanmean(R_ELVOC,2);
H2SO4_mean(:,1)=nanmean(H2SO4_simu,2);
NC_mean(:,1)=nanmean(NC,2);
VC_mean(:,1)=nanmean(VC,2);

ELVOC_std(:,1)=nanstd(ELVOC10,0,2);
ELVOC_std(:,2)=nanstd(ELVOC20,0,2);
ELVOC_std(:,3)=nanstd(ELVOC_NO,0,2);
ELVOC_std(:,4)=nanstd(R_ELVOC,0,2);
H2SO4_std(:,1)=nanstd(H2SO4_simu,0,2);
NC_std(:,1)   =nanstd(NC,0,2);
VC_std(:,1)   =nanstd(VC,0,2);

%.................................
timew=[0:1:288]'./288.*24;
timew1=[0:1:47]'./48.*24; %for measurement ELVOC
timew2=[0:1:144]'./144.*24; %for measurement NC VC
%.................................

%measurement
elvoc=load('/home/qiximeng/New_Malte_box_v2/Malte_in/Box/2013/Hyde2013_ELVOC_separated.txt');
h2so4=load('/home/qiximeng/New_Malte_box_v2/Malte_in/Box/2013/Hyde2013_spring_campaign_CI_APiTOF.txt');
%20130501
dmps_1=load(['/home/qiximeng/New_Malte_box_v2/Malte_in/Box/HY130501/HY_input_dmps_v2.txt']);
%20130506
dmps_2=load(['/home/qiximeng/New_Malte_box_v2/Malte_in/Box/HY130506/HY_input_dmps_v2.txt']);
%20130516
dmps_3=load(['/home/qiximeng/New_Malte_box_v2/Malte_in/Box/HY130516/HY_input_dmps_v2.txt']);
%20130522
dmps_4=load(['/home/qiximeng/New_Malte_box_v2/Malte_in/Box/HY130522/HY_input_dmps_v2.txt']);
%20130615
dmps_5=load(['/home/qiximeng/New_Malte_box_v2/Malte_in/Box/HY130615/HY_input_dmps_v2.txt']);
%20130423
dmps_6=load(['/home/qiximeng/New_Malte_box_v2/Malte_in/Box/HY130423/HY_input_dmps_v2.txt']);


%choose the elvoc
[m,n]=size(elvoc);
q1=1;
q2=1;
q3=1;
q4=1;
q5=1;
q6=1;
for i=1:1:m
   
   if fix(elvoc(i,1))==datenum(2013,5,1)
      meas_ELVOC10(q1,1)= elvoc(i,5);
      meas_ELVOC20(q1,1)= elvoc(i,6);
      meas_ELVOC_NO(q1,1)= elvoc(i,4);
      meas_R_ELVOC(q1,1)= elvoc(i,3);      
      q1=q1+1;          
   end
   
   if fix(elvoc(i,1))==datenum(2013,5,6)
      meas_ELVOC10(q2,2)= elvoc(i,5);
      meas_ELVOC20(q2,2)= elvoc(i,6);
      meas_ELVOC_NO(q2,2)= elvoc(i,4);
      meas_R_ELVOC(q2,2)= elvoc(i,3);      
      q2=q2+1;          
   end
  
   if fix(elvoc(i,1))==datenum(2013,5,16)
      meas_ELVOC10(q3,3)= elvoc(i,5);
      meas_ELVOC20(q3,3)= elvoc(i,6);
      meas_ELVOC_NO(q3,3)= elvoc(i,4);
      meas_R_ELVOC(q3,3)= elvoc(i,3);      
      q3=q3+1;          
   end 
   
   if fix(elvoc(i,1))==datenum(2013,5,22)
      meas_ELVOC10(q4,4)= elvoc(i,5);
      meas_ELVOC20(q4,4)= elvoc(i,6);
      meas_ELVOC_NO(q4,4)= elvoc(i,4);
      meas_R_ELVOC(q4,4)= elvoc(i,3);      
      q4=q4+1;          
   end  
   
   if fix(elvoc(i,1))==datenum(2013,6,15)
      meas_ELVOC10(q5,5)= elvoc(i,5);
      meas_ELVOC20(q5,5)= elvoc(i,6);
      meas_ELVOC_NO(q5,5)= elvoc(i,4);
      meas_R_ELVOC(q5,5)= elvoc(i,3);      
      q5=q5+1;          
   end  
    
   if fix(elvoc(i,1))==datenum(2013,4,23)
      meas_ELVOC10(q6,6)= elvoc(i,5);
      meas_ELVOC20(q6,6)= elvoc(i,6);
      meas_ELVOC_NO(q6,6)= elvoc(i,4);
      meas_R_ELVOC(q6,6)= elvoc(i,3);      
      q6=q6+1;          
   end  
    
end

%choose the H2SO4
[m,n]=size(h2so4);
q1=1;
q2=1;
q3=1;
q4=1;
q5=1;
q6=1;
for i=1:1:m
   
   if fix(h2so4(i,1))==datenum(2013,5,1)
      meas_H2SO4(q1,1)= h2so4(i,2);
      q1=q1+1;          
   end
   
   if fix(h2so4(i,1))==datenum(2013,5,6)
      meas_H2SO4(q2,2)= h2so4(i,2);
      q2=q2+1;          
   end
  
   if fix(h2so4(i,1))==datenum(2013,5,16)
      meas_H2SO4(q3,3)= h2so4(i,2);
      q3=q3+1;          
   end
   
   if fix(h2so4(i,1))==datenum(2013,5,22)
      meas_H2SO4(q4,4)= h2so4(i,2);
      q4=q4+1;          
   end  
   
   if fix(h2so4(i,1))==datenum(2013,6,15)
      meas_H2SO4(q5,5)= h2so4(i,2);
      q5=q5+1;          
   end 
    
   if fix(h2so4(i,1))==datenum(2013,4,23)
      meas_H2SO4(q6,6)= h2so4(i,2);
      q6=q6+1;          
   end
    
end

%cal the measurement NC VC

[mm nn]=size(dmps_1);
clear dp;
clear dpi;
clear dddconc;
for i=3:1:nn
    dp(i-2)=log10(dmps_1(1,i));
end

for i=146:1:290
    dmin=max(log10(3e-9),dp(1));
    dmax=min(log10(1000e-9),dp(end));
    dpi=[dmin:0.001:dmax];
    dddconc=dmps_1(i,3:end);
    meas_NC(i-145,1)=sum(interp1(dp,dddconc',dpi,'nearest')*0.001);
    meas_VC(i-145,1)=sum(interp1(dp,dddconc',dpi,'nearest').*0.001.*(1/6).*pi.*(10.^dpi).^3);
    
    dddconc=dmps_2(i,3:end);
    meas_NC(i-145,2)=sum(interp1(dp,dddconc',dpi,'nearest')*0.001);
    meas_VC(i-145,2)=sum(interp1(dp,dddconc',dpi,'nearest').*0.001.*(1/6).*pi.*(10.^dpi).^3);
    
    dddconc=dmps_3(i,3:end);
    meas_NC(i-145,3)=sum(interp1(dp,dddconc',dpi,'nearest')*0.001);
    meas_VC(i-145,3)=sum(interp1(dp,dddconc',dpi,'nearest').*0.001.*(1/6).*pi.*(10.^dpi).^3);
    
    dddconc=dmps_4(i,3:end);
    meas_NC(i-145,4)=sum(interp1(dp,dddconc',dpi,'nearest')*0.001);
    meas_VC(i-145,4)=sum(interp1(dp,dddconc',dpi,'nearest').*0.001.*(1/6).*pi.*(10.^dpi).^3);
    
    dddconc=dmps_5(i,3:end);
    meas_NC(i-145,5)=sum(interp1(dp,dddconc',dpi,'nearest')*0.001);
    meas_VC(i-145,5)=sum(interp1(dp,dddconc',dpi,'nearest').*0.001.*(1/6).*pi.*(10.^dpi).^3);
    
    dddconc=dmps_6(i,3:end);
    meas_NC(i-145,6)=sum(interp1(dp,dddconc',dpi,'nearest')*0.001);
    meas_VC(i-145,6)=sum(interp1(dp,dddconc',dpi,'nearest').*0.001.*(1/6).*pi.*(10.^dpi).^3);
end



%...
meas_ELVOC10(:,2)=nan;
meas_ELVOC20(:,2)=nan;
meas_ELVOC_NO(:,2)=nan;
meas_R_ELVOC(:,2)=nan;
meas_H2SO4(:,2)=nan;
meas_NC(:,2)=NaN;
meas_VC(:,2)=NaN;
%...

meas_ELVOC_mean(:,1)=nanmean(meas_ELVOC10,2);
meas_ELVOC_mean(:,2)=nanmean(meas_ELVOC20,2);
meas_ELVOC_mean(:,3)=nanmean(meas_ELVOC_NO,2);
meas_ELVOC_mean(:,4)=nanmean(meas_R_ELVOC,2);
meas_H2SO4_mean(:,1)=nanmean(meas_H2SO4,2);
meas_NC_mean(:,1)=nanmean(meas_NC,2);
meas_VC_mean(:,1)=nanmean(meas_VC,2);

meas_ELVOC_std(:,1)=nanstd(meas_ELVOC10,0,2);
meas_ELVOC_std(:,2)=nanstd(meas_ELVOC20,0,2);
meas_ELVOC_std(:,3)=nanstd(meas_ELVOC_NO,0,2);
meas_ELVOC_std(:,4)=nanstd(meas_R_ELVOC,0,2);
meas_H2SO4_std(:,1)=nanstd(meas_H2SO4,0,2);
meas_NC_std(:,1)=nanstd(meas_NC,0,2);
meas_VC_std(:,1)=nanstd(meas_VC,0,2);




figure(1)
subplot(2,2,1)
x1=[timew;flipud(timew)];
y1=[ELVOC_mean(:,1)-ELVOC_std(:,1);flipud(ELVOC_mean(:,1)+ELVOC_std(:,1))];
fill(x1,y1,'r','facealpha',0.2,'edgealpha',0);
hold on
P=plot(timew,ELVOC_mean(:,1),'r');
set(P,'linewidth',2);

xx1=[timew1;flipud(timew1)];
yy1=[meas_ELVOC_mean(:,1)-meas_ELVOC_std(:,1);flipud(meas_ELVOC_mean(:,1)+meas_ELVOC_std(:,1))];
fill(xx1,yy1,'b','facealpha',0.2,'edgealpha',0);
P=plot(timew1,meas_ELVOC_mean(:,1),'b');
set(P,'linewidth',2);
%set(gca,'yscale','log');
title('(a) ELVOC Monomers');
set(gca,'fontsize',18);
set(gca,'fontweight','bold');
set(gca,'fontname','Times New Roman');
set(gca,'xlim',[0 24]);
set(gca,'xtick',[0 6 12 18 24]);
set(gca,'ylim',[0 4e7]);
set(gca,'linewidth',1);
ylabel('Conc.[#/cm3]');
P=legend('simulation mean+/-std','simulation mean','measurement mean+/-std','measurement mean');
set(P,'fontsize',12);

subplot(2,2,2)
x2=[timew;flipud(timew)];
aaa=ELVOC_mean(:,2)-ELVOC_std(:,2);
aaa(find(aaa<0))=1;
y2=[aaa;flipud(ELVOC_mean(:,2)+ELVOC_std(:,2))];
%y2=[ELVOC_mean(:,2)-ELVOC_std(:,2);flipud(ELVOC_mean(:,2)+ELVOC_std(:,2))];
fill(x2,y2,'r','facealpha',0.2,'edgealpha',0);
hold on
P=plot(timew,ELVOC_mean(:,2),'r');
set(P,'linewidth',2);

xx2=[timew1;flipud(timew1)];
aa=meas_ELVOC_mean(:,2)-meas_ELVOC_std(:,2);
aa(find(aa<0))=1;
yy2=[aa;flipud(meas_ELVOC_mean(:,2)+meas_ELVOC_std(:,2))];
%yy2=[meas_ELVOC_mean(:,2)-meas_ELVOC_std(:,2);flipud(meas_ELVOC_mean(:,2)+meas_ELVOC_std(:,2))];
fill(xx2,yy2,'b','facealpha',0.2,'edgealpha',0);
P=plot(timew1,meas_ELVOC_mean(:,2),'b');
set(P,'linewidth',2);
set(gca,'yscale','log');
title('(b) ELVOC Dimers');
set(gca,'fontsize',18);
set(gca,'fontweight','bold');
set(gca,'fontname','Times New Roman');
set(gca,'xlim',[0 24]);
set(gca,'xtick',[0 6 12 18 24]);
set(gca,'ylim',[1e4 1e8]);
set(gca,'ytick',[1e4 1e5 1e6 1e7 1e8])
set(gca,'linewidth',1);
%set(gca,'ytick',[5e4 5e5 5e6 2e7]);

subplot(2,2,3)
x3=[timew;flipud(timew)];
y3=[ELVOC_mean(:,3)-ELVOC_std(:,3);flipud(ELVOC_mean(:,3)+ELVOC_std(:,3))];
fill(x3,y3,'r','facealpha',0.2,'edgealpha',0);
hold on
P=plot(timew,ELVOC_mean(:,3),'r');
set(P,'linewidth',2);

xx3=[timew1;flipud(timew1)];
yy3=[meas_ELVOC_mean(:,3)-meas_ELVOC_std(:,3);flipud(meas_ELVOC_mean(:,3)+meas_ELVOC_std(:,3))];
fill(xx3,yy3,'b','facealpha',0.2,'edgealpha',0);
P=plot(timew1,meas_ELVOC_mean(:,3),'b');
set(P,'linewidth',2);
%set(gca,'yscale','log');
title('(c) ELVOC Nitrates');
set(gca,'fontsize',18);
set(gca,'fontweight','bold');
set(gca,'fontname','Times New Roman');
set(gca,'xlim',[0 24]);
set(gca,'xtick',[0 6 12 18 24]);
set(gca,'ytick',[0 2e6 4e6 6e6 8e6 10e6])
set(gca,'ylim',[0 1e7]);
set(gca,'linewidth',1);
ylabel('Conc.[#/cm3]');
xlabel('Time(h)');

subplot(2,2,4)
x4=[timew;flipud(timew)];
y4=[ELVOC_mean(:,4)-ELVOC_std(:,4);flipud(ELVOC_mean(:,4)+ELVOC_std(:,4))];
fill(x4,y4,'r','facealpha',0.2,'edgealpha',0);
hold on
P=plot(timew,ELVOC_mean(:,4),'r');
set(P,'linewidth',2);

xx4=[timew1;flipud(timew1)];
yy4=[meas_ELVOC_mean(:,4)-meas_ELVOC_std(:,4);flipud(meas_ELVOC_mean(:,4)+meas_ELVOC_std(:,4))];
fill(xx4,yy4,'b','facealpha',0.2,'edgealpha',0);
P=plot(timew1,meas_ELVOC_mean(:,4),'b');
set(P,'linewidth',2);
%set(gca,'yscale','log');
title('(d) ELVOC radicals');
set(gca,'fontsize',18);
set(gca,'fontweight','bold');
set(gca,'fontname','Times New Roman');
set(gca,'xlim',[0 24]);
set(gca,'xtick',[0 6 12 18 24]);
set(gca,'ylim',[0 5e6]);
set(gca,'linewidth',1);
xlabel('Time(h)');

figure(2)
x5=[timew;flipud(timew)];
y5=[H2SO4_mean(:,1)-H2SO4_std(:,1);flipud(H2SO4_mean(:,1)+H2SO4_std(:,1))];
fill(x5,y5,'r','facealpha',0.2,'edgealpha',0);
hold on
plot(timew,H2SO4_mean(:,1),'r');


xx5=[timew1;flipud(timew1)];
yy5=[meas_H2SO4_mean(:,1)-meas_H2SO4_std(:,1);flipud(meas_H2SO4_mean(:,1)+meas_H2SO4_std(:,1))];
fill(xx5,yy5,'b','facealpha',0.2,'edgealpha',0);
plot(timew1,meas_H2SO4_mean(:,1),'b');
%set(gca,'yscale','log');
title('H2SO4');
set(gca,'fontsize',10);
set(gca,'xlim',[0 24]);
set(gca,'ylim',[0 5e6]);
ylabel('Conc.[#/cm3]');
xlabel('Time(h)');
legend('simulation mean+/-std','simulation mean','measurement mean+/-std','measurement mean')

figure(3)

subplot(2,1,1)
x6=[timew;flipud(timew)];
y6=[NC_mean(:,1)-NC_std(:,1);flipud(NC_mean(:,1)+NC_std(:,1))];
fill(x6,y6,'r','facealpha',0.2,'edgealpha',0);
hold on
plot(timew,NC_mean(:,1),'r');

xx6=[timew2;flipud(timew2)];
yy6=[meas_NC_mean(:,1)-meas_NC_std(:,1);flipud(meas_NC_mean(:,1)+meas_NC_std(:,1))];
fill(xx6,yy6,'b','facealpha',0.2,'edgealpha',0);
plot(timew2,meas_NC_mean(:,1),'b');
%set(gca,'yscale','log');
title('Number Concentration');
set(gca,'fontsize',10);
set(gca,'xlim',[0 24]);
%set(gca,'ylim',[0 5e6]);
ylabel('Conc.[#/cm3]');
%xlabel('Time(h)');
legend('simulation mean+/-std','simulation mean','measurement mean+/-std','measurement mean')




subplot(2,1,2)
x7=[timew;flipud(timew)];
y7=[VC_mean(:,1)-VC_std(:,1);flipud(VC_mean(:,1)+VC_std(:,1))];
fill(x7,y7,'r','facealpha',0.2,'edgealpha',0);
hold on
plot(timew,VC_mean(:,1),'r');

xx7=[timew2;flipud(timew2)];
yy7=[meas_VC_mean(:,1)-meas_VC_std(:,1);flipud(meas_VC_mean(:,1)+meas_VC_std(:,1))];
fill(xx7,yy7,'b','facealpha',0.2,'edgealpha',0);
plot(timew2,meas_VC_mean(:,1),'b');
%set(gca,'yscale','log');
title('Volume Concentration');
set(gca,'fontsize',10);
set(gca,'xlim',[0 24]);
%set(gca,'ylim',[0 5e6]);
ylabel('Conc.[#/cm3]');
xlabel('Time(h)');
%legend('simulation mean+/-std','simulation mean','measurement mean+/-std','measurement mean')

