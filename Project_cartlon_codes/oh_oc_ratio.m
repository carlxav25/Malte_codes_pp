clear all
clc
close all

vap_oc = load('/home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_in/vap_new/Vapour_O_C_ratio_Carlton.dat');
% column 1 = o/c ratio
% column 2 = C molecules
% column 3 = O molecules
% column 4 = N molecules
% column 5 = molecular weight

W_O = 16;
W_C = 12;
W_H = 1;
W_N = 14;

num_h_at = (vap_oc(:,5) - (vap_oc(:,2).* 12 + vap_oc(:,3) .* 16  + vap_oc(:,4).*14))./W_H; % n(h) = mw -(n(c)*cw + n(o)*ow +n(n)*nw) )

pp = round(num_h_at, 1);
hc_ratio = num_h_at./ vap_oc(:,2);

figure('Position',[1 1 1200 1200]);

scatter(vap_oc(:,1),hc_ratio)
xlabel('O/C')
ylabel('H/C')
grid on
set(gca,'FontSize',14,'FontWeight','bold')