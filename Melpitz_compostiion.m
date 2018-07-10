clear;
clc;
close all;

run  = 'A4';
day  = 167;
date = 'Me130618';

%This script plot the composition comparison
Mep_chem = load(['/Users/boy/Documents/Michael/New_Malte_Box_v2/Malte_out/Box/',date,'/',run,'/par_vol.dat']);

[xL yL] = size(Mep_chem);

% Change the type of the volume
 for t=1:1:xL
     for j=1:1:yL/100
         for i=1:1:100
             hy_t(t).vol_conc(i,j) = Mep_chem(t,i+(j-1)*60);
         end
     end
 end
 
 
% Average from time start to time end
st_time=1;
end_time=24;

q=0;
hy_aa=zeros(100,yL/100);
for t=1:1:xL
    tt=t/289*24;
    if tt>=st_time && tt<=end_time
        hy_aa=hy_aa+hy_t(t).vol_conc;
        q=q+1;
    end
end
hy_aa=hy_aa./q;

% Number of ElVOCs in the output
NE_10  = 9;   % ELVOC_10
NE_NO  = 10;  % ELVOC_NO
NE_20  = 10;  % ELVOC_20
NE_CBN = 10;  % ELVOC_CBN
Rest   = 4;   % ELVOC_nuc1, HOA, INMAT
Total  = yL/100;

%start to plot figure
%hyytiala
hy_p_H2SO4=sum(hy_aa(:,Total),2)./sum(hy_aa,2);
hy_p_ELVOC10=sum(hy_aa(:,Total-NE_10-NE_NO-NE_20-NE_CBN-Rest+1:Total-NE_NO-NE_20-NE_CBN-Rest),2)./sum(hy_aa,2);
hy_p_ELVOCNO=sum(hy_aa(:,Total-NE_NO-NE_20-NE_CBN-Rest+1:Total-NE_20-NE_CBN-Rest),2)./sum(hy_aa,2);
hy_p_ELVOC20=sum(hy_aa(:,Total-NE_20-NE_CBN-Rest+1:Total-NE_CBN-Rest),2)./sum(hy_aa,2);
hy_p_ELVOCCBN=sum(hy_aa(:,Total-NE_CBN-Rest+1:Total-Rest),2)./sum(hy_aa,2);
hy_p_SVOC=sum(hy_aa(:,1:Total-NE_10-NE_NO-NE_20-NE_CBN-Rest),2)./sum(hy_aa,2);
hy_p_BK=sum(hy_aa(:,Total-1),2)./sum(hy_aa,2); %background composition




%plot the figure
hy_column = [hy_p_H2SO4 hy_p_ELVOC10 hy_p_ELVOCCBN hy_p_ELVOCNO hy_p_ELVOC20 hy_p_SVOC hy_p_BK];
radius = load(['/Users/boy/Documents/Michael/New_Malte_Box_v2/Malte_out/Box/',date,'/',run,'/par_rad.dat']);

par_dia=radius(2,:).*2;
%smooth the column
for j=1:1:7
  hy_column(:,j)=smooth(hy_column(:,j),10);

end

%.................



figure(1)
clf
area(par_dia*1e9,hy_column);
set(gca,'xlim',[1 100]);
set(gca,'ylim',[0 1]);
set(gca,'xscale','log');
set(gca,'fontsize',18);
set(gca,'fontweight','bold');
set(gca,'fontname','Times New Roman');
set(gca,'linewidth',1);
xlabel('Dp(nm)');ylabel('Contribution to growth(%)');
title('Melpitz');
set(gca,'tickdir','out');

P=legend('H_2SO_4','HOMs-O_5_-_1_3','HOMs-O_5_-_1_3(CBN)','HOMs-NO_5_-_1_4','HOMs_2_0-O_8_-_1_7',...
    'SVOCs','Background');
set(P,'fontsize',15);

















