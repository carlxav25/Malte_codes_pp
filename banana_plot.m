clear;
clc;
close all;

% read all the dmps data
%measurement
%20130423
meas_dmps_1  =load(['/home/qiximeng/New_Malte_box_v2/Malte_in/Box/HY130423/HY_input_dmps_v5.txt']);
%20130501
meas_dmps_2  =load(['/home/qiximeng/New_Malte_box_v2/Malte_in/Box/HY130501/HY_input_dmps_v5.txt']);
%20130516
meas_dmps_3  =load(['/home/qiximeng/New_Malte_box_v2/Malte_in/Box/HY130516/HY_input_dmps_v5.txt']);
%20130522
meas_dmps_4  =load(['/home/qiximeng/New_Malte_box_v2/Malte_in/Box/HY130522/HY_input_dmps_v5.txt']);
%20130615
meas_dmps_5  =load(['/home/qiximeng/New_Malte_box_v2/Malte_in/Box/HY130615/HY_input_dmps_v5.txt']);

%simulation
simu_dp11=load('/home/qiximeng/New_Malte_box_v2/Malte_out/Box/HY130423/A2/par_rad.dat');
simu_dp=simu_dp11(2,:);
%20130423
simu_dmps_1  =load('/home/qiximeng/New_Malte_box_v2/Malte_out/Box/HY130423/A2/par_num.dat');
simu_time_1   =[0:1:288]'./288+113;
%20130501
simu_dmps_2  =load('/home/qiximeng/New_Malte_box_v2/Malte_out/Box/HY130501/A1/par_num.dat');
simu_time_2   =[0:1:288]'./288+121;
%20130516
simu_dmps_3  =load('/home/qiximeng/New_Malte_box_v2/Malte_out/Box/HY130516/A6/par_num.dat');
simu_time_3   =[0:1:288]'./288+136;
%20130522
simu_dmps_4  =load('/home/qiximeng/New_Malte_box_v2/Malte_out/Box/HY130522/A2/par_num.dat');
simu_time_4   =[0:1:288]'./288+142;
%20130615
simu_dmps_5  =load('/home/qiximeng/New_Malte_box_v2/Malte_out/Box/HY130615/A8/par_num.dat');
simu_time_5   =[0:1:288]'./288+166;

% put all the measurement data together
[m,n]=size(meas_dmps_1);
meas_dp=meas_dmps_1(1,3:end)';
aa(1,1)=NaN;
bb(1,1:n-2)=NaN;
meas_time=[meas_dmps_1(146:end,1);aa;meas_dmps_2(146:end,1);aa;meas_dmps_3(146:end,1);...
    aa;meas_dmps_4(146:end,1);aa;meas_dmps_5(146:end,1)];
meas_dmps=[meas_dmps_1(146:end,3:end);bb;meas_dmps_2(146:end,3:end);bb;meas_dmps_3(146:end,3:end);...
    bb;meas_dmps_4(146:end,3:end);bb;meas_dmps_5(146:end,3:end)];

%put all the simulation data together
[m,n]=size(simu_dmps_1);
bb1(1,1:n)=NaN;
simu_time=[simu_time_1;aa;simu_time_2;aa;simu_time_3;aa;simu_time_4;aa;simu_time_5;aa];
simu_dmps_dN=[simu_dmps_1(289:577,:);bb1;simu_dmps_2(289:577,:);bb1;simu_dmps_3(289:577,:);bb1;...
    simu_dmps_4(289:577,:);bb1;simu_dmps_5(289:577,:);bb1];
% change radius into diameter, change dN into dN/dlogDp

simu_dp=simu_dp.*2;
numN=simu_dmps_dN'./1E6;
rere=par_back_conversion(numN,simu_dp);
simu_dmps=rere';
clear rere

%break X axis
width=0.2;
start1= 114;
stop1 = 121;

start2= 122-(stop1-start1-width);
stop2 = 136-(stop1-start1-width);

start3= 137-(stop1-start1-width)-(stop2-start2-width);
stop3 = 142-(stop1-start1-width)-(stop2-start2-width);

start4= 143-(stop1-start1-width)-(stop2-start2-width)-(stop3-start3-width);
stop4 = 166-(stop1-start1-width)-(stop2-start2-width)-(stop3-start3-width);

%meas_dmps(meas_time>start1 & meas_time<stop1,:)=NaN;
%meas_time(meas_time>start1 & meas_time<stop1,1)=NaN;

%break #1
meas_time(meas_time>=stop1)=meas_time(meas_time>=stop1)-(stop1-start1-width);
simu_time(simu_time>=stop1)=simu_time(simu_time>=stop1)-(stop1-start1-width);
%break #2
meas_time(meas_time>=stop2)=meas_time(meas_time>=stop2)-(stop2-start2-width);
simu_time(simu_time>=stop2)=simu_time(simu_time>=stop2)-(stop2-start2-width);
%break #3
meas_time(meas_time>=stop3)=meas_time(meas_time>=stop3)-(stop3-start3-width);
simu_time(simu_time>=stop3)=simu_time(simu_time>=stop3)-(stop3-start3-width);
%break #4
meas_time(meas_time>=stop4)=meas_time(meas_time>=stop4)-(stop4-start4-width);
simu_time(simu_time>=stop4)=simu_time(simu_time>=stop4)-(stop4-start4-width);
%plot
figure(1)
subplot(2,1,1)
pcolor(meas_time',meas_dp,log10(abs(meas_dmps')+1e-6));
set(gca,'yscale','log');
caxis([1 5]);
shading flat;
colormap('jet');
ylabel('Dp(m)','fontsize',15);
title('(a) Observation (SMEAR II)','fontsize',15);
set(gca,'fontweight','bold');
set(gca,'fontname','Times New Roman');
set(gca,'fontsize',12);
%set(gca,'yticks',[1e])

%plot the '//'  time break characters
ytick=get(gca,'YTick');
text(start1+width/3,3e-9,'//','fontsize',12);
text(start1+width/3,ytick(max(length(ytick))),'//','fontsize',12);

text(start2+width/3,3e-9,'//','fontsize',12);
text(start2+width/3,ytick(max(length(ytick))),'//','fontsize',12);

text(start3+width/3,3e-9,'//','fontsize',12);
text(start3+width/3,ytick(max(length(ytick))),'//','fontsize',12);

text(start4+width/3,3e-9,'//','fontsize',12);
text(start4+width/3,ytick(max(length(ytick))),'//','fontsize',12);
%..........................................

%remap xtick marks

%xtick=[meas_time(1,1) meas_time(1,1)+0.5 meas_time(1,1)+1 meas_time(1,1)+1+width];
xtick=[meas_time(1,1) meas_time(1,1)+0.5 meas_time(1,1)+1 meas_time(1,1)+1+width ...
    meas_time(1,1)+1+width+0.5 meas_time(1,1)+1+width+1 meas_time(1,1)+1+width+1+width ...
    meas_time(1,1)+1+width+1+width+0.5 meas_time(1,1)+1+width+1+width+1 meas_time(1,1)+1+width+1+width+1+width ...
    meas_time(1,1)+1+width+1+width+1+width+0.5 meas_time(1,1)+1+width+1+width+1+width+1 ...
    meas_time(1,1)+1+width+1+width+1+width+1+width meas_time(1,1)+1+width+1+width+1+width+1+width+0.5 ...
    meas_time(1,1)+1+width+1+width+1+width+1+width+1];
xxlabel={'113','113.5','114','121','121.5','122','136','136.5','137','142','142.5','143',...
    '166','166.5','167'};
dtick=0.5;
gap=floor(width/dtick);% =0 most of time

set(gca,'xtick',xtick);
set(gca,'xticklabel',xxlabel);

%simulation plot
subplot(2,1,2)

pcolor(simu_time',simu_dp,log10(abs(simu_dmps')+1e-6));
set(gca,'yscale','log');
caxis([1 5]);
shading flat;
colormap('jet');
ylabel('Dp(m)','fontsize',15);
title('(b) Simulation (SMEAR II)','fontsize',15);
set(gca,'fontweight','bold');
set(gca,'fontname','Times New Roman');
set(gca,'fontsize',12);
set(gca,'ylim',[3*1e-9 1000*1e-9])
xlabel('Julian day','fontsize',15);

%plot the '//'  time break characters
ytick=get(gca,'YTick');
text(start1+width/3,3e-9,'//','fontsize',12);
text(start1+width/3,ytick(max(length(ytick))),'//','fontsize',12);

text(start2+width/3,3e-9,'//','fontsize',12);
text(start2+width/3,ytick(max(length(ytick))),'//','fontsize',12);

text(start3+width/3,3e-9,'//','fontsize',12);
text(start3+width/3,ytick(max(length(ytick))),'//','fontsize',12);

text(start4+width/3,3e-9,'//','fontsize',12);
text(start4+width/3,ytick(max(length(ytick))),'//','fontsize',12);
%..........................................
set(gca,'xtick',xtick);
set(gca,'xticklabel',xxlabel);

hp=get(subplot(2,1,2),'Position');
hp1=get(subplot(2,1,1),'Position');

gcc=colorbar('Position',[hp(1)+hp(3)+0.02 hp(2)+0.08 0.01 (hp1(4)+hp(4))*0.8]);
set(gcc,'ylim',[1 5],'ytick',[1 2 3 4 5])
set(gcc,'yticklabel',{'10^{1}','10^{2}','10^{3}','10^{4}','10^{5}'}', 'fontsize', 12,'fontweight','bold')
hp2=get(gcc,'Position');
%t1=text(hp2(1),hp2(2),'dN/dlogDp(cm^{-3})','fontsize',12);
str={'dN/dlogDp(cm^{-3})'};
ylabel(gcc,str,'fontsize',12)
%set(t1,'rotation',270);




