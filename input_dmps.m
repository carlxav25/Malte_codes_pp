clear;
clc;
v=load('/home/qiximeng/New_Malte_box/Malte_in/Box/HY140429/dm140429.sum');
dia=v(1,3:end);
dNdlogDp=v(2:end,3:end);
dN=par_conversion(dNdlogDp',dia);
inter=[v(1,3:end);dN'];
result=[v(:,1:2) inter];
save('/home/qiximeng/New_Malte_box/Malte_in/Box/HY140429/dmps_input.sum','result','-ascii');