clear;
clc;
close all
k1=load('/home/qiximeng/New_Malte_box_v2/Malte_out/kkkk_new.txt');
k2=load('/home/qiximeng/New_Malte_box_v2/Malte_out/kkkk_old.txt');
k3=load('/home/qiximeng/New_Malte_box/Malte_out/kkk_old.txt');
v1=load('/home/qiximeng/New_Malte_box_v2/Malte_out/mole_new.txt');
v2=load('/home/qiximeng/New_Malte_box/Malte_out/mole.txt');



    
kk1=sum(k1,2);
kk2=sum(k2,2);
kk3=sum(k3,2);


%....................................................
%....test c_sat
temp=293.15;
boltzmann=1.38e-23;
filename='/home/qiximeng/New_Malte_box_v2/Malte_in/Vapor_properties_luxi.txt';
[name1,name2,vap(:,1),vap(:,2),vap(:,3), vap(:,4), vap(:,5),para_A2(:,1),para_B2(:,1),...
    vap(:,6),vap(:,7)]=textread(filename,'%s%s%f%f%f%f%f%f%f%f%f\n',189,'delimiter',','); 
filename1='/home/qiximeng/New_Malte_box_v2/Malte_in/mcm33_bvoc_compound_prop.dat';
para1=load(filename1);
vap_p1=10.^(para1(:,2)-(para1(:,3)./temp));
vap_p2=10.^(para_A2(:,1)-(para_B2(:,1)./temp));
c_sat1=(vap_p1.*101325)./(boltzmann.*temp);
c_sat2=(vap_p2.*101325)./(boltzmann.*temp);

figure(1)

plot(v1(:,1),kk1,'ro');
hold on
plot(v1(:,1),kk1*2,'r.');
plot(v2(:,1),kk3,'bo');
set(gca,'xlim',[100 600])
xlabel('Molarmass');ylabel('Mass transfer rate(m3/s)');
legend('new Run1','new Run2','old');

figure(2)
plot(para1(1:end-3,1),c_sat1(1:end-3),'ro');
hold on
plot(vap(3:end,1),c_sat2(3:end),'bo');
hold off
%set(gca,'ylim',[1e3 1e20]);
set(gca,'yscale','log');
xlabel('Molarmass');ylabel('C\_sat(#/m3)');
legend('new','old');
title('All Vapors');

figure(3)
plot(para1(614:652,1),c_sat1(614:652),'ro');
hold on
plot(vap(168:189,1),c_sat2(168:189),'bo');
hold off
xlabel('Molarmass');ylabel('C\_sat(#/m3)');
set(gca,'yscale','log');
legend('new','old');
title('ELVOCs');





    