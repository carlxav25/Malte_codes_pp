clear;
clc;
close all;
vap_prop=load('/home/local/carltonx/Ph.D/Malte_box/Bitbucket_Malte_repo/malte_v1/Malte_in/mcm33_bvoc_compound_prop.dat');
Na=6.02*1e23;
boltzmann= 1.3807d-23;
surf_ten=0.05;
temp= 273.15+15;
r=load(['/home/local/carltonx/Ph.D/Malte_box/Bitbucket_Malte_repo/malte_v1/Malte_out/Box/Me130618/A3/par_rad.dat']);
%radius=r(2,:)';
radius=2.0e-9;
molevol=vap_prop(:,1).*1e-3./Na./1400.0;
expo=2.0.*surf_ten.*molevol;
expo=expo./(boltzmann*temp*radius);

figure(1)
plot(vap_prop(1:613,1),expo(1:613,1),'bo');
hold on
plot(vap_prop(614:622,1),expo(614:622,1),'ro');
plot(vap_prop(633:642,1),expo(633:642,1),'r*');
plot(vap_prop(623:632,1),expo(623:632,1),'rs');
plot(vap_prop(643:652,1),expo(643:652,1),'r+');
hold off

legend('SVOC','ELVOC10','ELVOC20','ELVOC\_NO','ELVOC\_CBN');
ylabel('Kelvin effect');xlabel('Molarmass');


%..........Vapor_pressure...........
vapor_pres=(10.^(vap_prop(:,2)-(vap_prop(:,3)./temp)))*1013.25;
c_sat=vapor_pres*100/(boltzmann*temp);
figure(2)
subplot(1,2,1)
plot(vap_prop(1:613,1),vapor_pres(1:613,1),'bo');
hold on
plot(vap_prop(614:622,1),vapor_pres(614:622,1),'ro');
plot(vap_prop(633:642,1),vapor_pres(633:642,1),'r*');
plot(vap_prop(623:632,1),vapor_pres(623:632,1),'rs');
plot(vap_prop(643:652,1),vapor_pres(643:652,1),'r+');
hold off
set(gca,'yscale','log');

%legend('SVOC','ELVOC10','ELVOC20','ELVOC\_NO','ELVOC\_CBN');
ylabel('Vapor Pressure(hPa)');xlabel('Molarmass');

subplot(1,2,2)
plot(vap_prop(1:613,1),c_sat(1:613,1),'bo');
hold on
plot(vap_prop(614:622,1),c_sat(614:622,1),'ro');
plot(vap_prop(633:642,1),c_sat(633:642,1),'r*');
plot(vap_prop(623:632,1),c_sat(623:632,1),'rs');
plot(vap_prop(643:652,1),c_sat(643:652,1),'r+');
hold off
set(gca,'yscale','log');
legend('SVOC','ELVOC10','ELVOC20','ELVOC\_NO','ELVOC\_CBN');
ylabel('C\_sat(#/m3)');xlabel('Molarmass');
%........................Vapor_concentration...........
vap_conc=load('/home/qiximeng/New_Malte_box_v2/Malte_out/Box/HY130501/A2/gas_vap.dat');
timew=[0:1:288]'./288;
figure(3)
plot(timew,sum(vap_conc(:,1:613),2),'bo');
hold on
plot(timew,sum(vap_conc(:,614:622),2),'ro');
plot(timew,sum(vap_conc(:,633:642),2),'r*');
plot(timew,sum(vap_conc(:,623:632),2),'rs');
plot(timew,sum(vap_conc(:,643:652),2),'r+');
hold off
set(gca,'yscale','log');
legend('SVOC','ELVOC10','ELVOC20','ELVOC\_NO','ELVOC\_CBN');
ylabel('Conc.(#/m3)');xlabel('Time');















