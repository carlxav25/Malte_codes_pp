clear;
clc;
close all;
v1=load('/home/qiximeng/New_Malte_box_v2/Malte_in/Box/2013/2013_04_ABL_HEIGHT.dat');
v2=load('/home/qiximeng/New_Malte_box_v2/Malte_in/Box/2013/2013_05_ABL_HEIGHT.dat');
v3=load('/home/qiximeng/New_Malte_box_v2/Malte_in/Box/2013/2013_06_ABL_HEIGHT.dat');
vv=[v1;v2;v3];
[m,n]=size(vv);
for t=0:1:23
    q=1;
    for i=1:1:m
    if vv(i,4)==t
        hhhh(t+1,q)=vv(i,7);
        q=q+1;
    end
    end
    re(t+1,1)=t;
    re(t+1,2)=mean(hhhh(t+1,:),2);
end
re(1,2)=386;
re(3,2)=380;

BL=[re(:,2);re(:,2);re(end,2);re(end,2)];
save('./BLH.txt','BL','-ascii');
timew=[0:1:49]./24;
figure(2)
plot(timew,BL)

figure(1)
plot(re(:,1),re(:,2),'bo');





