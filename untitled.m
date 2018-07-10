clear;
%close all;
NO3_nanjing=load(['/home/qiximeng/v3_New_Malte_box_v3_Nanjing/Malte_out/Box/NJ141004/A2/gas_NO3.dat']);
NO3_hyytiala=load(['/home/qiximeng/New_Malte_box_v2/Malte_out/Box/HY130615/A6/gas_NO3.dat']);
timew=[0:1:288]'./288.*24;


figure(11111)
p=plot(timew,NO3_nanjing(289:577),'b');
set(p,'linewidth',2)
hold on
p=plot(timew,NO3_hyytiala(289:577),'r');
set(p,'linewidth',2)
hold off
set(gca,'fontsize',15);
set(gca,'yscale','log');
set(gca,'xlim',[0 24]);
set(gca,'xtick',[0:3:24]);
ylabel('#/cm3');xlabel('time');
legend('NO3\_Nanjing','NO3\_Hyytiala');
