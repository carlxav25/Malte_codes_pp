clear;
clc;
close all
type='A4';
day = 119;

ELVOC10=load(['/home/qiximeng/New_Malte_box_v2/Malte_out/Box/HY140429/' type '/gas_ELVOC10.dat']);
ELVOC20=load(['/home/qiximeng/New_Malte_box_v2/Malte_out/Box/HY140429/' type '/gas_ELVOC20.dat']);
ELVOC_NO=load(['/home/qiximeng/New_Malte_box_v2/Malte_out/Box/HY140429/' type '/gas_ELVOC_NO.dat']);

ELVOC10_1=load(['/home/qiximeng/New_Malte_box/Malte_out/Box/HY140429/' type '/gas_ELVOC10.dat']);
ELVOC20_1=load(['/home/qiximeng/New_Malte_box/Malte_out/Box/HY140429/' type '/gas_ELVOC20.dat']);
ELVOC_NO_1=load(['/home/qiximeng/New_Malte_box/Malte_out/Box/HY140429/' type '/gas_ELVOC_NO.dat']);

timew=[0:1:360]'./288+day;


figure(1)
subplot(3,1,1);
plot(timew,ELVOC10,'r');
hold on
plot(timew,ELVOC10_1,'b');
hold off
title('ELVOC10');
legend('new','old');
subplot(3,1,2);
plot(timew,ELVOC20,'r');
hold on
plot(timew,ELVOC20_1,'b');
hold off
title('ELVOC20');
subplot(3,1,3);
plot(timew,ELVOC_NO,'r');
hold on
plot(timew,ELVOC_NO_1,'b');
hold off
title('ELVOC\_NO');