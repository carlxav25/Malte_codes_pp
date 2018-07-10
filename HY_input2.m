%prepare the input data
%choose the date
clear;
clc;
close all
index_long_term=1;
adate='20130501';
date=datenum(str2num(adate(1:4)),str2num(adate(5:6)),str2num(adate(7:8)));
%........ELVOCs..H2SO4.......

elvoc=load('/home/qiximeng/New_Malte_box_v2/Malte_in/Box/2013/Hyde2013_ELVOC_separated.txt');
h2so4=load('/home/qiximeng/New_Malte_box_v2/Malte_in/Box/2013/Hyde2013_spring_campaign_CI_APiTOF.txt');
%........VOCs............
aa=load('/home/qiximeng/New_Malte_box_v2/Malte_in/Box/2013/VOC16m.txt');
voc(:,1)=datenum(aa(:,1),aa(:,2),aa(:,3),aa(:,4),aa(:,5),aa(:,6));
voc(:,2:13)=aa(:,7:end);

%........Met..............
aa1=load('/home/qiximeng/New_Malte_box_v2/Malte_in/Box/2013/Met16m.txt');
met(:,1)=datenum(aa1(:,1),aa1(:,2),aa1(:,3),aa1(:,4),aa1(:,5),aa1(:,6));
met(:,2:6)=aa1(:,7:end);

%.........Gas................
aa2=load('/home/qiximeng/New_Malte_box_v2/Malte_in/Box/2013/Gas16m.txt');
gas(:,1)=datenum(aa2(:,1),aa2(:,2),aa2(:,3),aa2(:,4),aa2(:,5),aa2(:,6));
gas(:,2:9)=aa2(:,7:end);

%........Rad..........
aa3=load('/home/qiximeng/New_Malte_box_v2/Malte_in/Box/2013/Rad18m.txt');
rad(:,1)=datenum(aa3(:,1),aa3(:,2),aa3(:,3),aa3(:,4),aa3(:,5),aa3(:,6));
rad(:,2:4)=aa3(:,7:end);
%......................................................................
%same format with Case for University of Eastern Finland
input(:,1)=[date:1/144:date+1];
a1=find(~isnan(met(:,6)));
input(:,2)=interp1(met(a1,1),met(a1,6),input(:,1),'linear');
a2=find(~isnan(met(:,5)));
input(:,3)=interp1(met(a2,1),met(a2,5),input(:,1),'linear');
a3=find(~isnan(met(:,3)));
input(:,4)=interp1(met(a3,1),met(a3,3),input(:,1),'linear')+273.15;
a4=find(~isnan(met(:,4)));
input(:,5)=interp1(met(a4,1),met(a4,4),input(:,1),'linear');
a5=find(~isnan(met(:,2)));
input(:,6)=interp1(met(a5,1),met(a5,2),input(:,1),'linear');
a6=find(~isnan(rad(:,4)));
input(:,7)=interp1(rad(a6,1),rad(a6,4),input(:,1),'linear');
a7=find(~isnan(rad(:,2)));
input(:,8)=interp1(rad(a7,1),rad(a7,2),input(:,1),'linear');
a8=find(~isnan(rad(:,3)));
input(:,9)=interp1(rad(a8,1),rad(a8,3),input(:,1),'linear');
a9=find(~isnan(gas(:,5)));
input(:,10)=interp1(gas(a9,1),gas(a9,5),input(:,1),'linear'); %unit of gas ppb
a10=find(~isnan(gas(:,8)));
input(:,11)=interp1(gas(a10,1),gas(a10,8),input(:,1),'linear');
a11=find(~isnan(gas(:,4)));
input(:,12)=interp1(gas(a11,1),gas(a11,4),input(:,1),'linear');
a12=find(~isnan(gas(:,6)));
input(:,13)=interp1(gas(a12,1),gas(a12,6),input(:,1),'linear');
a13=find(~isnan(gas(:,7)));
input(:,14)=interp1(gas(a13,1),gas(a13,7),input(:,1),'linear')-input(:,13);  %only for v4
a14=find(~isnan(gas(:,9)));
input(:,15)=interp1(gas(a14,1),gas(a14,9),input(:,1),'linear').*1000.0;
%re-invert the NO data ..................


figure(121212)



plot(input(:,1),input(:,13),'bo');
set(gca,'xlim',[date date+1]);
hold on
input(:,13)=smooth(input(:,1),input(:,13),30);
input(1,13)=input(2,13);
input(end,13)=input(end-1,13);
plot(input(:,1),input(:,13),'r');

%re-invet the NO data....................

%..........VOC...............
  input(:,16)=1e-6;  

  a31=find(~isnan(voc(:,2)));
  aaaa(:,1)=smooth(voc(a31,2),20);
  input(:,17)=interp1(voc(a31,1),aaaa(:,1),input(:,1),'linear');
  clear a31;
  clear aaaa
  
  a31=find(~isnan(voc(:,3)));
  aaaa(:,1)=smooth(voc(a31,3),20);
  input(:,18)=interp1(voc(a31,1),aaaa(:,1),input(:,1),'linear');
  clear a31;
  clear aaaa
  
  a31=find(~isnan(voc(:,4)));
  aaaa(:,1)=smooth(voc(a31,4),20);
  input(:,19)=interp1(voc(a31,1),aaaa(:,1),input(:,1),'linear');
  clear a31;
  clear aaaa
  
  a31=find(~isnan(voc(:,6)));
  aaaa(:,1)=smooth(voc(a31,6),20);
  input(:,20)=interp1(voc(a31,1),aaaa(:,1),input(:,1),'linear');
  clear a31;
  clear aaaa
  
  a31=find(~isnan(voc(:,7)));
  aaaa(:,1)=smooth(voc(a31,7),20);
  input(:,21)=interp1(voc(a31,1),aaaa(:,1),input(:,1),'linear');
  clear a31;
  clear aaaa
  
  a31=find(~isnan(voc(:,8)));
  aaaa(:,1)=smooth(voc(a31,8),20);
  input(:,22)=interp1(voc(a31,1),aaaa(:,1),input(:,1),'linear');
  clear a31;
  clear aaaa
  
  a31=find(~isnan(voc(:,9)));
  aaaa(:,1)=smooth(voc(a31,9),20);
  input(:,23)=interp1(voc(a31,1),aaaa(:,1),input(:,1),'linear');
  clear a31;
  clear aaaa
  
  a31=find(~isnan(voc(:,10)));
  aaaa(:,1)=smooth(voc(a31,10),20);
  input(:,24)=interp1(voc(a31,1),aaaa(:,1),input(:,1),'linear');
  clear a31;
  clear aaaa
  
  a31=find(~isnan(voc(:,11)));
  aaaa(:,1)=smooth(voc(a31,11),20);
  input(:,25)=interp1(voc(a31,1),aaaa(:,1),input(:,1),'linear');
  clear a31;
  clear aaaa
  
  for j=26:1:31
      input(:,j)=1e-6;
  end

  a31=find(~isnan(voc(:,13)));
  aaaa(:,1)=smooth(voc(a31,13),20);
  input(:,32)=interp1(voc(a31,1),aaaa(:,1),input(:,1),'linear');
  clear a31;
  clear aaaa
      
  for j=16:1:32
  input(:,j)=smooth(input(:,j),20);
  end
  input(:,1)=input(:,1)-datenum(2013,1,1)+1;
%.................CS.................
  %calculate CS for H2SO4 and HNO3.................
%step1: interp the dmps data, let the time is same with met's

dmps0=load(['/home/qiximeng/New_Malte_box_v2/Malte_in/Box/2013/2013/dm' adate(3:end) '.sum']);

[m_d,n_d]=size(dmps0);
for j=2:1:n_d
    ddmps(:,1)=input(:,1);
    ddmps(:,j)=interp1(dmps0(2:end,1),dmps0(2:end,j),ddmps(:,1),'linear');
end
dmps=[dmps0(1,:);ddmps];
dmps(end,2:end)=dmps(end-1,2:end);
dmps(2,2:end)=dmps(3,2:end);
[x,y]=size(dmps);
y=y-1;
%step2:calculation 
   dia = dmps(1,3:end); 
   numO(:,:) = dmps(2:end,3:end);
   numI(:,:) = dmps(2:end,3:end)';
   cs_d = 0; cs_dL = 0; ch_d = 0; ch_dL = 0;

   % Change dmps data from dN/dlogDp to N/cm3
   numC = par_conversion(numI, dia);
   num = numC';
   
   
   % Calcuating the growth function for different humidities based on Lauris results
   for i = 1:x-1
       for j = 1:y-1    
           GrfL(j,i) = (1-input(i,5)/100)^(-3.11E5*dia(j)-0.0847);   % Lauri
                 
          % if dia(m) > 3E-7, GrfL(m,i) = GrfL(m-1,i); end
       end
       
       for j = y-1:-1:1
          % if dia(m) < 10E-8, GrfL(m,i) = GrfL(m+1,i); end
           diaL(j) = GrfL(j,i) * dia(j);     
       end
   end
   
   for i = 1:x-1
       cs_d(i)   = sosa_cs_sa(dia,  num(i,:), input(i,4), 1);
       cs_dL(i)  = sosa_cs_sa(diaL, num(i,:), input(i,4), 1);  
   
       if input(i,5) < 60
          ch_d(i)  = cs_d(i)/100;
          ch_dL(i) = cs_dL(i)/100;
       else
          ch_d(i)  = cs_d(i)/100 + cs_d(i)  * (input(i,5)-60)/100;  
          ch_dL(i) = cs_dL(i)/100 + cs_dL(i) * (input(i,5)-60)/100; 
       end
   end
   CS=[input(:,1) cs_d' cs_dL' ch_d' ch_dL'];
  
 % change the unit
 
 [m,n]=size(input);
 Rgas = 8.314;    % [J/K/mol]
 Avog = 6.022E23; % [#/mol] 
 for i = 1:m
    input(i,n+1) = input(i,6) / Rgas / input(i,4) * Avog / 1E4;
 end
 
for i=1:1:m
    for j=2:1:n
        if isnan(input(i,j))==1
            
               disp('Met and trace errors!!')

        end
        if input(i,j)<=0 && j>=7
            input(i,j)=1e-6;
        end
        if j>=10
            input(i,j)=input(i,j)*1E-9*input(i,n+1);
        end

    end
end

%....................
[mm,nn]=size(CS);
for i=1:1:mm
    for j=2:1:nn
        if isnan(CS(i,j))==1 || CS(i,j)==0
           disp('Cs errors!!')      
        end
    end
end
  
%...........................  
  r_input=[input(1:end-1,:); input(1:end,:); input(end,:)];
  r_CS=[CS(1:end-1,:);CS(1:end,:);CS(end,:)]; %last line is useless
  r_dmps=[dmps(1:end-1,:);dmps(2:end,:);dmps(end,:)];
  
  
  
%.................PLOT..............
figure(1) %elvocs & vocs & WD & WS %raw data
subplot(5,1,1);
plot(elvoc(:,1),elvoc(:,5),'bo');
set(gca,'ylim',[0 2e7])
%set(gca,'xtick',[elvoc(1,1):1:elvoc(end,1)]');
set(gca,'xlim',[date date+1]);
datetick('x','mm/dd','keepticks');
title('ELVOC10')


subplot(5,1,2);
plot(voc(:,1),voc(:,13),'bo');
%set(gca,'xtick',[voc(1,1):1:voc(end,1)]');
set(gca,'xlim',[date date+1]);
datetick('x','mm/dd','keepticks');
title('Monoterpene')

subplot(5,1,3)
plot(met(:,1),met(:,6),'bo');
%set(gca,'xtick',[met(1,1):1:met(end,1)]');
set(gca,'ylim',[0 360]);
set(gca,'xlim',[date date+1]);
datetick('x','mm/dd','keepticks');
title('WD');

subplot(5,1,4)
plot(gas(:,1),gas(:,5),'bo');
%set(gca,'ylim',[0 360]);
%set(gca,'xtick',[met(1,1):1:met(end,1)]');
set(gca,'xlim',[date date+1]);
datetick('x','mm/dd','keepticks');
title('O3')

subplot(5,1,5)
plot(rad(:,1),rad(:,4),'bo');
%set(gca,'ylim',[0 360]);
%set(gca,'xtick',[met(1,1):1:met(end,1)]');
set(gca,'xlim',[date date+1]);
datetick('x','mm/dd','keepticks');
title('Radiation')
%....
%figure(1111)
%plot(voc(:,1),voc(:,13),'go');
%set(gca,'xtick',[fix(voc(1,1)):1:fix(voc(end,1))]);
%datetick
%................
figure(2) %met
subplot(5,1,1)
plot(input(:,1),input(:,2),'bo');
subplot(5,1,2)
plot(input(:,1),input(:,3),'bo');
subplot(5,1,3)
plot(input(:,1),input(:,4),'bo');
subplot(5,1,4)
plot(input(:,1),input(:,5),'bo');
subplot(5,1,5)
plot(input(:,1),input(:,6),'bo');

figure(3) %rad
subplot(3,1,1)
plot(input(:,1),input(:,7),'bo');
subplot(3,1,2)
plot(input(:,1),input(:,8),'bo');
subplot(3,1,3)
plot(input(:,1),input(:,9),'bo');

figure(4)%gas
subplot(6,1,1)
plot(input(:,1),input(:,10),'bo');
subplot(6,1,2)
plot(input(:,1),input(:,11),'bo');
subplot(6,1,3)
plot(input(:,1),input(:,12),'bo');
subplot(6,1,4)
plot(input(:,1),input(:,13),'bo');
title('NO')
subplot(6,1,5)
plot(input(:,1),input(:,14),'bo');
subplot(6,1,6)
plot(input(:,1),input(:,15),'bo');

figure(5) %voc monoterpene
airr=met(:,2)./ Rgas ./ (met(:,3)+273.15) .* Avog ./ 1E4;
bbbb=voc(:,13).*1E-9.*airr;
plot(voc(:,1)-datenum(2013,1,1)+1,bbbb,'go');
set(gca,'xlim',[input(1,1) input(1,1)+1]);
hold on
plot(input(:,1),input(:,32),'r-');

figure(51) %voc
airr=met(:,2)./ Rgas ./ (met(:,3)+273.15) .* Avog ./ 1E4;
bbbb=voc(:,2).*1E-9.*airr;
plot(voc(:,1)-datenum(2013,1,1)+1,bbbb,'go');
set(gca,'xlim',[input(1,1) input(1,1)+1]);
hold on
plot(input(:,1),input(:,17),'r-');

figure(6) %CS
plot(CS(:,1),CS(:,3),'bo');


%...........save
save(['/home/qiximeng/New_Malte_box_v2/Malte_in/Box/HY' adate(3:end) '/HY_input_v5.txt'],'r_input','-ascii');
save(['/home/qiximeng/New_Malte_box_v2/Malte_in/Box/HY' adate(3:end) '/HY_input_cs_v5.txt'],'r_CS','-ascii');
save(['/home/qiximeng/New_Malte_box_v2/Malte_in/Box/HY' adate(3:end) '/HY_input_dmps_v5.txt'],'r_dmps','-ascii');
if index_long_term==1
    figure(11)
     subplot(4,1,1)
     plot(elvoc(:,1)-datenum(2013,1,1)+1,elvoc(:,5),'b');
     title('ELVOC10');
     set(gca,'ylim',[0 3e7]);
     ylabel('#/cm3');
     subplot(4,1,2)
     plot(elvoc(:,1)-datenum(2013,1,1)+1,elvoc(:,6),'b');
     title('ELVOC20');
     set(gca,'ylim',[0 5e6]);
     ylabel('#/cm3');
     subplot(4,1,3)
     plot(elvoc(:,1)-datenum(2013,1,1)+1,elvoc(:,4),'b');
     title('ELVOC\_N0');
     set(gca,'ylim',[0 1e7]);
     ylabel('#/cm3');
     subplot(4,1,4)
     plot(h2so4(:,1)-datenum(2013,1,1)+1,h2so4(:,2),'b');
     title('H2SO4');
     set(gca,'ylim',[0 5e6]);
     ylabel('#/cm3');
   
end
