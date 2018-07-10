%read monoterpene.
clear;
clc;
close all
a=load('/home/qiximeng/New_Malte_box_v2/Malte_in/Box/2013/Monoterpene_levels.txt');
mono(:,1)=datenum(a(:,1),a(:,2),a(:,3),a(:,4),a(:,5),a(:,6));
mono(:,2:9)=a(:,7:14);
figure(1);
plot(mono(:,1),mono(:,2),'bo');
hold on
plot(mono(:,1),mono(:,3),'b.');
plot(mono(:,1),mono(:,4),'ro');
plot(mono(:,1),mono(:,5),'r.');
plot(mono(:,1),mono(:,6),'go');
plot(mono(:,1),mono(:,7),'g.');
plot(mono(:,1),mono(:,8),'ko');
plot(mono(:,1),mono(:,9),'k.');
set(gca,'yscale','log');

figure(2)
height=[125;101;67.2;50.4;33.6;16.8;8.4;4.2];
mean_mono=nanmean(mono(:,2:end),1);
plot(mean_mono,height);
hold on
plot(mean_mono,height,'b*');
set(gca,'yscale','log');
ylabel('Height(m)');xlabel('Monoterpene(ppbv)');
title('Monoterpene(8.4.2013-28.6.2013)');






