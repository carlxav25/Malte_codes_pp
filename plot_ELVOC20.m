clear;
clc;
close all;

gas_vap1     =load(['/home/qiximeng/New_Malte_box_v2/Malte_out/Box/HY130501/A1/gas_vap.dat']);

gas_vap2     =load(['/home/qiximeng/New_Malte_box_v2/Malte_out/Box/HY130506/A1/gas_vap.dat']);

gas_vap3     =load(['/home/qiximeng/New_Malte_box_v2/Malte_out/Box/HY130516/A3/gas_vap.dat']);

gas_vap4     =load(['/home/qiximeng/New_Malte_box_v2/Malte_out/Box/HY130522/A1/gas_vap.dat']);

gas_vap5     =load(['/home/qiximeng/New_Malte_box_v2/Malte_out/Box/HY130615/A8/gas_vap.dat']);

gas_vap6     =load(['/home/qiximeng/New_Malte_box_v2/Malte_out/Box/HY130423/A2/gas_vap.dat']);


timew=[0:1:288]'./288.*24;
gas_vap1=gas_vap1./1e6;
gas_vap2=gas_vap2./1e6;
gas_vap3=gas_vap3./1e6;
gas_vap4=gas_vap4./1e6;
gas_vap5=gas_vap5./1e6;
gas_vap6=gas_vap6./1e6;
figure(1) %  20130501
P=plot(timew,gas_vap1(289:577,633),'r');
set(P,'linewidth',2);
hold on
P=plot(timew,gas_vap1(289:577,634),'r:');
set(P,'linewidth',2);
P=plot(timew,gas_vap1(289:577,635),'g');
set(P,'linewidth',2);
P=plot(timew,gas_vap1(289:577,636),'g:');
set(P,'linewidth',2);
P=plot(timew,gas_vap1(289:577,637),'b');
set(P,'linewidth',2);
P=plot(timew,gas_vap1(289:577,638),'b:');
set(P,'linewidth',2);
P=plot(timew,gas_vap1(289:577,639),'k');
set(P,'linewidth',2);
P=plot(timew,gas_vap1(289:577,640),'k:');
set(P,'linewidth',2);
P=plot(timew,gas_vap1(289:577,641),'y');
set(P,'linewidth',2);
P=plot(timew,gas_vap1(289:577,642),'y:');
set(P,'linewidth',2);
set(gca,'yscale','log');
title('20130501');
ylabel('ELVOC20(#/cm3)');
xlabel('Time')
legend('ELVOC20\_O8','ELVOC20\_O9','ELVOC20\_O10','ELVOC20\_O11','ELVOC20\_O12',...
    'ELVOC20\_O13','ELVOC20\_O14','ELVOC20\_O15','ELVOC20\_O16','ELVOC20\_O17');


figure(2) %  20130516
P=plot(timew,gas_vap3(289:577,633),'r');
set(P,'linewidth',2);
hold on
P=plot(timew,gas_vap3(289:577,634),'r:');
set(P,'linewidth',2);
P=plot(timew,gas_vap3(289:577,635),'g');
set(P,'linewidth',2);
P=plot(timew,gas_vap3(289:577,636),'g:');
set(P,'linewidth',2);
P=plot(timew,gas_vap3(289:577,637),'b');
set(P,'linewidth',2);
P=plot(timew,gas_vap3(289:577,638),'b:');
set(P,'linewidth',2);
P=plot(timew,gas_vap3(289:577,639),'k');
set(P,'linewidth',2);
P=plot(timew,gas_vap3(289:577,640),'k:');
set(P,'linewidth',2);
P=plot(timew,gas_vap3(289:577,641),'y');
set(P,'linewidth',2);
P=plot(timew,gas_vap3(289:577,642),'y:');
set(P,'linewidth',2);
set(gca,'yscale','log');
title('20130516');
ylabel('ELVOC20(#/cm3)');
xlabel('Time')
legend('ELVOC20\_O8','ELVOC20\_O9','ELVOC20\_O10','ELVOC20\_O11','ELVOC20\_O12',...
    'ELVOC20\_O13','ELVOC20\_O14','ELVOC20\_O15','ELVOC20\_O16','ELVOC20\_O17');

figure(3) %  20130522
P=plot(timew,gas_vap4(289:577,633),'r');
set(P,'linewidth',2);
hold on
P=plot(timew,gas_vap4(289:577,634),'r:');
set(P,'linewidth',2);
P=plot(timew,gas_vap4(289:577,635),'g');
set(P,'linewidth',2);
P=plot(timew,gas_vap4(289:577,636),'g:');
set(P,'linewidth',2);
P=plot(timew,gas_vap4(289:577,637),'b');
set(P,'linewidth',2);
P=plot(timew,gas_vap4(289:577,638),'b:');
set(P,'linewidth',2);
P=plot(timew,gas_vap4(289:577,639),'k');
set(P,'linewidth',2);
P=plot(timew,gas_vap4(289:577,640),'k:');
set(P,'linewidth',2);
P=plot(timew,gas_vap4(289:577,641),'y');
set(P,'linewidth',2);
P=plot(timew,gas_vap4(289:577,642),'y:');
set(P,'linewidth',2);
set(gca,'yscale','log');
title('20130522');
ylabel('ELVOC20(#/cm3)');
xlabel('Time')
legend('ELVOC20\_O8','ELVOC20\_O9','ELVOC20\_O10','ELVOC20\_O11','ELVOC20\_O12',...
    'ELVOC20\_O13','ELVOC20\_O14','ELVOC20\_O15','ELVOC20\_O16','ELVOC20\_O17');


figure(4) %  20130615
P=plot(timew,gas_vap5(289:577,633),'r');
set(P,'linewidth',2);
hold on
P=plot(timew,gas_vap5(289:577,634),'r:');
set(P,'linewidth',2);
P=plot(timew,gas_vap5(289:577,635),'g');
set(P,'linewidth',2);
P=plot(timew,gas_vap5(289:577,636),'g:');
set(P,'linewidth',2);
P=plot(timew,gas_vap5(289:577,637),'b');
set(P,'linewidth',2);
P=plot(timew,gas_vap5(289:577,638),'b:');
set(P,'linewidth',2);
P=plot(timew,gas_vap5(289:577,639),'k');
set(P,'linewidth',2);
P=plot(timew,gas_vap5(289:577,640),'k:');
set(P,'linewidth',2);
P=plot(timew,gas_vap5(289:577,641),'y');
set(P,'linewidth',2);
P=plot(timew,gas_vap5(289:577,642),'y:');
set(P,'linewidth',2);
set(gca,'yscale','log');
title('20130615');
ylabel('ELVOC20(#/cm3)');
xlabel('Time')
legend('ELVOC20\_O8','ELVOC20\_O9','ELVOC20\_O10','ELVOC20\_O11','ELVOC20\_O12',...
    'ELVOC20\_O13','ELVOC20\_O14','ELVOC20\_O15','ELVOC20\_O16','ELVOC20\_O17');

figure(5) %  20130423
P=plot(timew,gas_vap6(289:577,633),'r');
set(P,'linewidth',2);
hold on
P=plot(timew,gas_vap6(289:577,634),'r:');
set(P,'linewidth',2);
P=plot(timew,gas_vap6(289:577,635),'g');
set(P,'linewidth',2);
P=plot(timew,gas_vap6(289:577,636),'g:');
set(P,'linewidth',2);
P=plot(timew,gas_vap6(289:577,637),'b');
set(P,'linewidth',2);
P=plot(timew,gas_vap6(289:577,638),'b:');
set(P,'linewidth',2);
P=plot(timew,gas_vap6(289:577,639),'k');
set(P,'linewidth',2);
P=plot(timew,gas_vap6(289:577,640),'k:');
set(P,'linewidth',2);
P=plot(timew,gas_vap6(289:577,641),'y');
set(P,'linewidth',2);
P=plot(timew,gas_vap6(289:577,642),'y:');
set(P,'linewidth',2);
set(gca,'yscale','log');
title('20130423');
ylabel('ELVOC20(#/cm3)');
xlabel('Time')
legend('ELVOC20\_O8','ELVOC20\_O9','ELVOC20\_O10','ELVOC20\_O11','ELVOC20\_O12',...
    'ELVOC20\_O13','ELVOC20\_O14','ELVOC20\_O15','ELVOC20\_O16','ELVOC20\_O17');

%load the sperated measurement ELVOC20
aaa=load('/home/qiximeng/New_Malte_box_v2/Malte_in/Box/2013/Hyde2013_C20.mat');
ELVOC20_meas(:,1)=aaa.time_UMR'-datenum(2013,1,1)+1;
ELVOC20_meas(:,2:10)=aaa.data_C20;


figure(11)
P=plot(ELVOC20_meas(:,1),ELVOC20_meas(:,2),'r');
set(P,'linewidth',2);
hold on

P=plot(ELVOC20_meas(:,1),ELVOC20_meas(:,3),'r:');
set(P,'linewidth',2);

P=plot(ELVOC20_meas(:,1),ELVOC20_meas(:,4),'g');
set(P,'linewidth',2);

P=plot(ELVOC20_meas(:,1),ELVOC20_meas(:,5),'g:');
set(P,'linewidth',2);

P=plot(ELVOC20_meas(:,1),ELVOC20_meas(:,6),'b');
set(P,'linewidth',2);

P=plot(ELVOC20_meas(:,1),ELVOC20_meas(:,7),'b:');
set(P,'linewidth',2);

P=plot(ELVOC20_meas(:,1),ELVOC20_meas(:,8),'k');
set(P,'linewidth',2);

P=plot(ELVOC20_meas(:,1),ELVOC20_meas(:,9),'k:');
set(P,'linewidth',2);

P=plot(ELVOC20_meas(:,1),ELVOC20_meas(:,10),'y');
set(P,'linewidth',2);


title('measurement ELVOC20')
legend('ELVOC19\_O10','ELVOC20\_O10','ELVOC20\_O11','ELVOC20\_O12','ELVOC20\_O103',...
      'ELVOC20\_O14','ELVOC20\_O15','ELVOC20\_O16','ELVOC20\_O18')
%datetick('x','dd/mm');  
%set(gca,'yscale','log');


figure(12)
P=plot(ELVOC20_meas(:,1),sum(ELVOC20_meas(:,2:end),2));
set(P,'linewidth',2);
set(gca,'xlim',[142,143]);
%datetick('x','dd/mm'); 

figure(13)
%plot the day:20130516
title('20130516')
dday=136;
subplot(3,3,1)
P=plot(timew./24+dday,gas_vap3(289:577,635),'r');
set(P,'linewidth',2);
hold on
P=plot(ELVOC20_meas(:,1),ELVOC20_meas(:,3),'b');
set(P,'linewidth',2);
set(gca,'xlim',[136,137]);
title('ELVOC20\_O10');
set(gca,'yscale','log');

subplot(3,3,2)
P=plot(timew./24+dday,gas_vap3(289:577,636),'r');
set(P,'linewidth',2);
hold on
P=plot(ELVOC20_meas(:,1),ELVOC20_meas(:,4),'b');
set(P,'linewidth',2);
set(gca,'xlim',[136,137]);
title('ELVOC20\_O11');
set(gca,'yscale','log');


subplot(3,3,3)
P=plot(timew./24+dday,gas_vap3(289:577,637),'r');
set(P,'linewidth',2);
hold on
P=plot(ELVOC20_meas(:,1),ELVOC20_meas(:,5),'b');
set(P,'linewidth',2);
set(gca,'xlim',[136,137]);
title('ELVOC20\_O12');
set(gca,'yscale','log');


subplot(3,3,4)
P=plot(timew./24+dday,gas_vap3(289:577,638),'r');
set(P,'linewidth',2);
hold on
P=plot(ELVOC20_meas(:,1),ELVOC20_meas(:,6),'b');
set(P,'linewidth',2);
set(gca,'xlim',[136,137]);
title('ELVOC20\_O13');
set(gca,'yscale','log');


subplot(3,3,5)
P=plot(timew./24+dday,gas_vap3(289:577,639),'r');
set(P,'linewidth',2);
hold on
P=plot(ELVOC20_meas(:,1),ELVOC20_meas(:,7),'b');
set(P,'linewidth',2);
set(gca,'xlim',[136,137]);
title('ELVOC20\_O14');
set(gca,'yscale','log');


subplot(3,3,6)
P=plot(timew./24+dday,gas_vap3(289:577,640),'r');
set(P,'linewidth',2);
hold on
P=plot(ELVOC20_meas(:,1),ELVOC20_meas(:,8),'b');
set(P,'linewidth',2);
set(gca,'xlim',[136,137]);
title('ELVOC20\_O15');
set(gca,'yscale','log');


subplot(3,3,7)
P=plot(timew./24+dday,gas_vap3(289:577,641),'r');
set(P,'linewidth',2);
hold on
P=plot(ELVOC20_meas(:,1),ELVOC20_meas(:,9),'b');
set(P,'linewidth',2);
set(gca,'xlim',[136,137]);
title('ELVOC20\_O16');
set(gca,'yscale','log');


% subplot(3,3,8)
% P=plot(timew./24+dday,gas_vap3(289:577,642),'r');
% set(P,'linewidth',2);
% hold on
% P=plot(ELVOC20_meas(:,1),ELVOC20_meas(:,4),'b');
% set(P,'linewidth',2);
% set(gca,'xlim',[136,137]);
% title('ELVOC20\_O18');
% set(gca,'yscale','log');

%subplot(3,3,9)
%title('20130516')
figure(14)
%plot the day:20130522

dday=142;
subplot(3,3,1)
P=plot(timew./24+dday,gas_vap4(289:577,635),'r');
set(P,'linewidth',2);
hold on
P=plot(ELVOC20_meas(:,1),ELVOC20_meas(:,3),'b');
set(P,'linewidth',2);
set(gca,'xlim',[142,143]);
title('ELVOC20\_O10');
set(gca,'yscale','log');

subplot(3,3,2)
P=plot(timew./24+dday,gas_vap4(289:577,636),'r');
set(P,'linewidth',2);
hold on
P=plot(ELVOC20_meas(:,1),ELVOC20_meas(:,4),'b');
set(P,'linewidth',2);
set(gca,'xlim',[142,143]);
title('ELVOC20\_O11');
set(gca,'yscale','log');


subplot(3,3,3)
P=plot(timew./24+dday,gas_vap4(289:577,637),'r');
set(P,'linewidth',2);
hold on
P=plot(ELVOC20_meas(:,1),ELVOC20_meas(:,5),'b');
set(P,'linewidth',2);
set(gca,'xlim',[142,143]);
title('ELVOC20\_O12');
set(gca,'yscale','log');


subplot(3,3,4)
P=plot(timew./24+dday,gas_vap4(289:577,638),'r');
set(P,'linewidth',2);
hold on
P=plot(ELVOC20_meas(:,1),ELVOC20_meas(:,6),'b');
set(P,'linewidth',2);
set(gca,'xlim',[142,143]);
title('ELVOC20\_O13');
set(gca,'yscale','log');


subplot(3,3,5)
P=plot(timew./24+dday,gas_vap4(289:577,639),'r');
set(P,'linewidth',2);
hold on
P=plot(ELVOC20_meas(:,1),ELVOC20_meas(:,7),'b');
set(P,'linewidth',2);
set(gca,'xlim',[142,143]);
title('ELVOC20\_O14');
set(gca,'yscale','log');


subplot(3,3,6)
P=plot(timew./24+dday,gas_vap4(289:577,640),'r');
set(P,'linewidth',2);
hold on
P=plot(ELVOC20_meas(:,1),ELVOC20_meas(:,8),'b');
set(P,'linewidth',2);
set(gca,'xlim',[142,143]);
title('ELVOC20\_O15');
set(gca,'yscale','log');


subplot(3,3,7)
P=plot(timew./24+dday,gas_vap4(289:577,641),'r');
set(P,'linewidth',2);
hold on
P=plot(ELVOC20_meas(:,1),ELVOC20_meas(:,9),'b');
set(P,'linewidth',2);
set(gca,'xlim',[142,143]);
title('ELVOC20\_O16');
set(gca,'yscale','log');


% subplot(3,3,8)
% P=plot(timew./24+dday,gas_vap4(289:577,642),'r');
% set(P,'linewidth',2);
% hold on
% P=plot(ELVOC20_meas(:,1),ELVOC20_meas(:,4),'b');
% set(P,'linewidth',2);
% set(gca,'xlim',[142,143]);
% title('ELVOC20\_O18');
% set(gca,'yscale','log');

%subplot(3,3,9)
%title('20130522')

figure(15)
%plot the day:20130615

dday=166;
subplot(3,3,1)
P=plot(timew./24+dday,gas_vap5(289:577,635),'r');
set(P,'linewidth',2);
hold on
P=plot(ELVOC20_meas(:,1),ELVOC20_meas(:,3),'b');
set(P,'linewidth',2);
set(gca,'xlim',[166,167]);
set(gca,'ylim',[1e4 1e6]);
title('ELVOC20\_O10');
set(gca,'yscale','log');

subplot(3,3,2)
P=plot(timew./24+dday,gas_vap5(289:577,636),'r');
set(P,'linewidth',2);
hold on
P=plot(ELVOC20_meas(:,1),ELVOC20_meas(:,4),'b');
set(P,'linewidth',2);
set(gca,'xlim',[166,167]);
set(gca,'ylim',[1e4 1e6]);
title('ELVOC20\_O11');
set(gca,'yscale','log');


subplot(3,3,3)
P=plot(timew./24+dday,gas_vap5(289:577,637),'r');
set(P,'linewidth',2);
hold on
P=plot(ELVOC20_meas(:,1),ELVOC20_meas(:,5),'b');
set(P,'linewidth',2);
set(gca,'xlim',[166,167]);
set(gca,'ylim',[1e4 1e6]);
title('ELVOC20\_O12');
set(gca,'yscale','log');


subplot(3,3,4)
P=plot(timew./24+dday,gas_vap5(289:577,638),'r');
set(P,'linewidth',2);
hold on
P=plot(ELVOC20_meas(:,1),ELVOC20_meas(:,6),'b');
set(P,'linewidth',2);
set(gca,'xlim',[166,167]);
set(gca,'ylim',[1e4 1e6]);
title('ELVOC20\_O13');
set(gca,'yscale','log');


subplot(3,3,5)
P=plot(timew./24+dday,gas_vap5(289:577,639),'r');
set(P,'linewidth',2);
hold on
P=plot(ELVOC20_meas(:,1),ELVOC20_meas(:,7),'b');
set(P,'linewidth',2);
set(gca,'xlim',[166,167]);
set(gca,'ylim',[1e4 1e6]);
title('ELVOC20\_O14');
set(gca,'yscale','log');


subplot(3,3,6)
P=plot(timew./24+dday,gas_vap5(289:577,640),'r');
set(P,'linewidth',2);
hold on
P=plot(ELVOC20_meas(:,1),ELVOC20_meas(:,8),'b');
set(P,'linewidth',2);
set(gca,'xlim',[166,167]);
set(gca,'ylim',[1e4 1e6]);
title('ELVOC20\_O15');
set(gca,'yscale','log');


subplot(3,3,7)
P=plot(timew./24+dday,gas_vap5(289:577,641),'r');
set(P,'linewidth',2);
hold on
P=plot(ELVOC20_meas(:,1),ELVOC20_meas(:,9),'b');
set(P,'linewidth',2);
set(gca,'xlim',[166,167]);
set(gca,'ylim',[1e4 1e6]);
title('ELVOC20\_O16');
set(gca,'yscale','log');


% subplot(3,3,8)
% P=plot(timew./24+dday,gas_vap5(289:577,642),'r');
% set(P,'linewidth',2);
% hold on
% P=plot(ELVOC20_meas(:,1),ELVOC20_meas(:,4),'b');
% set(P,'linewidth',2);
% set(gca,'xlim',[166,167]);
% title('ELVOC20\_O18');
% set(gca,'yscale','log');








