clear;
clc;
close all;
%this script plot the composition comparison
%Hyytiala
%20130423
hy_vol_1=load(['/home/qiximeng/New_Malte_box_v2/Malte_out/Box/HY130423/A2/par_vol.dat']);
%20130501
hy_vol_2=load(['/home/qiximeng/New_Malte_box_v2/Malte_out/Box/HY130501/A1/par_vol.dat']);
%20130516
hy_vol_3=load(['/home/qiximeng/New_Malte_box_v2/Malte_out/Box/HY130516/A6/par_vol.dat']);
%20130522
hy_vol_4=load(['/home/qiximeng/New_Malte_box_v2/Malte_out/Box/HY130522/A2/par_vol.dat']);
%20130615
hy_vol_5=load(['/home/qiximeng/New_Malte_box_v2/Malte_out/Box/HY130615/A8/par_vol.dat']);
%...................................................
%SORPES
%20140922
nj_vol_1=load(['/home/qiximeng/New_Malte_box_v2_Nanjing/Malte_out/Box/NJ140922/A1/par_vol.dat']);
%20141004
nj_vol_2=load(['/home/qiximeng/New_Malte_box_v2_Nanjing/Malte_out/Box/NJ141004/A2/par_vol.dat']);
%20141005
nj_vol_3=load(['/home/qiximeng/New_Malte_box_v2_Nanjing/Malte_out/Box/NJ141005/A1/par_vol.dat']);
%20141006
nj_vol_4=load(['/home/qiximeng/New_Malte_box_v2_Nanjing/Malte_out/Box/NJ141006/A1/par_vol.dat']);
%20141007
nj_vol_5=load(['/home/qiximeng/New_Malte_box_v2_Nanjing/Malte_out/Box/NJ141007/A1/par_vol.dat']);

%%
%average the SMEARII and SORPES (only average typical NPF day)
%SMEAR II
hy_vol= (hy_vol_2+hy_vol_3+hy_vol_4+hy_vol_5)./4;
nj_vol= (nj_vol_1+nj_vol_2+nj_vol_4+nj_vol_5)./4;


%change the type of the volume
 for t=289:1:577
       
               
        for j=1:1:656
            for i=1:1:60
                hy_t(t-288).vol_conc(i,j)=hy_vol(t,i+(j-1)*60);
                nj_t(t-288).vol_conc(i,j)=nj_vol(t,i+(j-1)*60);
            end
        end

        
 end

 %............................
%% 
%average from time start to time end
st_time=9;
end_time=15;

q=0;
hy_aa=zeros(60,656);
nj_aa=zeros(60,656);
for t=1:1:289
    tt=t/289*24;
    if tt>=st_time && tt<=end_time
        hy_aa=hy_aa+hy_t(t).vol_conc;
        nj_aa=nj_aa+nj_t(t).vol_conc;
        q=q+1;
    end
            
end
hy_aa=hy_aa./q;
nj_aa=nj_aa./q;


%start to plot figure
%hyytiala
hy_p_H2SO4=sum(hy_aa(:,656),2)./sum(hy_aa,2);
hy_p_ELVOC10=sum(hy_aa(:,614:622),2)./sum(hy_aa,2);
hy_p_ELVOC20=sum(hy_aa(:,633:642),2)./sum(hy_aa,2);
hy_p_ELVOCNO=sum(hy_aa(:,623:632),2)./sum(hy_aa,2);
hy_p_ELVOCCBN=sum(hy_aa(:,643:652),2)./sum(hy_aa,2);
hy_p_SVOC=sum(hy_aa(:,1:613),2)./sum(hy_aa,2);
hy_p_BK=sum(hy_aa(:,655),2)./sum(hy_aa,2); %background composition
%SORPES 
nj_p_H2SO4=sum(nj_aa(:,656),2)./sum(nj_aa,2);
nj_p_ELVOC10=sum(nj_aa(:,614:622),2)./sum(nj_aa,2);
nj_p_ELVOC20=sum(nj_aa(:,633:642),2)./sum(nj_aa,2);
nj_p_ELVOCNO=sum(nj_aa(:,623:632),2)./sum(nj_aa,2);
nj_p_ELVOCCBN=sum(nj_aa(:,643:652),2)./sum(nj_aa,2);
nj_p_SVOC=sum(nj_aa(:,1:613),2)./sum(nj_aa,2);
nj_p_BK=sum(nj_aa(:,655),2)./sum(nj_aa,2);


%%
%plot the figure
hy_column=[hy_p_H2SO4 hy_p_ELVOC10 hy_p_ELVOCCBN hy_p_ELVOCNO hy_p_ELVOC20 hy_p_SVOC hy_p_BK];
nj_column=[nj_p_H2SO4 nj_p_ELVOC10 nj_p_ELVOCCBN nj_p_ELVOCNO nj_p_ELVOC20 nj_p_SVOC nj_p_BK];
radius=load(['/home/qiximeng/New_Malte_box_v2_Nanjing/Malte_out/Box/NJ140922/A2/par_rad.dat']);
par_dia=radius(2,:).*2;
%smooth the column
for j=1:1:7
  hy_column(:,j)=smooth(hy_column(:,j),10);
  nj_column(:,j)=smooth(nj_column(:,j),10);

end

%.................



figure(1)

subplot(1,2,1)

area(par_dia*1e9,hy_column);
set(gca,'xlim',[1 100]);
set(gca,'ylim',[0 1]);
set(gca,'xscale','log');
set(gca,'fontsize',18);
set(gca,'fontweight','bold');
set(gca,'fontname','Times New Roman');
set(gca,'linewidth',1);
xlabel('Dp(nm)');ylabel('Contribution to growth(%)');
title('(a) SMEAR II');
set(gca,'tickdir','out');
set(gca,'position',[0.1 0.25 0.37 0.65]);

subplot(1,2,2)

area(par_dia*1e9,nj_column);
set(gca,'xlim',[1 100]);
set(gca,'ylim',[0 1]);
set(gca,'xscale','log');
set(gca,'fontsize',18);
set(gca,'fontweight','bold');
set(gca,'fontname','Times New Roman');
set(gca,'linewidth',1);
xlabel('Dp(nm)');ylabel('Contribution to growth(%)');
title('(b) SORPES')    
set(gca,'tickdir','out');
P=legend('H_2SO_4','HOMs-O_5_-_1_3','HOMs-O_5_-_1_3(CBN)','HOMs-NO_5_-_1_4','HOMs_2_0-O_8_-_1_7',...
    'SVOCs','Background','orientation','horizontal');
set(P,'fontsize',15);
%legend boxoff
set(gca,'position',[0.57 0.25 0.37 0.65]);

















