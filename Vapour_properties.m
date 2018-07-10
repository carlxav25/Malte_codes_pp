clear all
close all

% Change the file size related to your output file from "Nannoolal"
[aa,bb,cb]=xlsread('/home/local/carltonx/Work/Malte_box/Bitbucket_Malte_repo/malte_v1/Malte_in/Box/Me130618/Orginal/umansysprop.xlsx','B5:FMK55'); 
ELVOC_p_270_320=aa'; % Vapour pressures at log10 values in atmosphere


% Only to calculate the O:C ratio of the compounds
fileID = fopen('/home/local/carltonx/Work/Malte_box/Bitbucket_Malte_repo/malte_v1/Malte_in/Box/Me130618/Orginal/aaa.txt');
C1 = textscan(fileID, '%s',4404);

clear O_count C_count N_count c_count CT_count
for j = 1:4404
    C_count(j)=0.; c_count(j)=0.; O_count(j)=0.; N_count(j)=0.; CT_count=0.;
    [x y] = size(C1{1}{j});
    for i = 1:y
        if C1{1}{j}(i) == 'C'
           C_count(j) = C_count(j) + 1;
        end
        if C1{1}{j}(i) == 'c'
           c_count(j) = c_count(j) + 1;
        end
        if C1{1}{j}(i) == 'O'
           O_count(j) = O_count(j) + 1;
        end
        if C1{1}{j}(i) == 'N'
           O_count(j) = N_count(j) + 1;
        end
    end
    CT_count(j) = C_count(j) + c_count(j);
    
    O_C_ratio(j) = O_count(j) / CT_count(j);    
end


% Make sure the number of the temperature intervals are the same - here it was 51
for j = 1:4404
    for i = 1:51
        if ELVOC_p_270_320(j,i) < -20.
           ELVOC_p_270_320(j,i) = -20.;
        end
        if O_C_ratio(j) > 0.1
           ELVOC_p_270_320K(j,i) = ELVOC_p_270_320(j,i)+(2.8*O_C_ratio(j)-0.1); 
        else
           ELVOC_p_270_320K(j,i) = ELVOC_p_270_320(j,i)+(2.8*O_C_ratio(j)); 
        end
    end
end


% Change the temperature if you have selected a different range
T=[270:320]; 

% Calculate the A and B coefficients for the vapour pressure
for j=1:length(ELVOC_p_270_320K(:,1))
    
    log10p =ELVOC_p_270_320K(j,:);
    
    % Fit Antoine equation
    fun = @(p) sum((log10p - p(1)+p(2)./T).^2);
 
    % Starting guess
    pguess = [10,6000];

    % Optimise
    [p,fminres] = fminsearch(fun,pguess);
    log10p_fit=p(1)-p(2)./T;
    A(j)=p(1);
    B(j)=p(2);
end


% Open the ELVOC names and properties file
Prop_ELVOC = load(['/home/local/carltonx/Work/Malte_box/Bitbucket_Malte_repo/malte_v1/Malte_in/Prop_ELVOC.dat']);
fileID = fopen('/home/local/carltonx/Work/Malte_box/Bitbucket_Malte_repo/malte_v1/Malte_in/Names_ELVOC.dat');
C1 = textscan(fileID, '%s',42);
fclose(fileID)

% Open the mass file for all organic compounds
Mass = load(['/home/local/carltonx/Work/Malte_box/Bitbucket_Malte_repo/malte_v1/Malte_in/Box/Me130618/Orginal/Mass.txt']);

% Open the name file for all organic compounds
fileID = fopen('/home/local/carltonx/Work/Malte_box/Bitbucket_Malte_repo/malte_v1/Malte_in/Box/Me130618/Orginal/Name.txt');
C2 = textscan(fileID, '%s',4404);


% Create the out put files and selcet only the vapour pressure below a certain lower limit - e.g. 1E18
fid1 = fopen('/home/local/carltonx/Work/Malte_box/Bitbucket_Malte_repo/malte_v1/Malte_in/Box/Me130618/Orginal/mcm33_bvoc_compound_prop.dat','w');
fid2 = fopen('/home/local/carltonx/Work/Malte_box/Bitbucket_Malte_repo/malte_v1/Malte_in/Box/Me130618/Orginal/mcm33_bvoc_names.dat','w');

boltzmann = 1.3806488E-23;

for j = 1:length(ELVOC_p_270_320K(:,1))
    vap_pressure(j) = 10^(A(j)-(B(j)/T(25)));
    vapor_concentration(j) = (vap_pressure(j)*101325)/(boltzmann*T(25));

    if vapor_concentration(j) < 1E15
       fprintf (fid1, '%22.3f',  Mass(j));
       fprintf (fid1, '%22.3f',  A(j));
       fprintf (fid1, '%22.3f',  B(j));
       fprintf (fid1, '\n');  

       fprintf (fid2, '%s',  C2{1}{j});
       fprintf (fid2, '\n');
    end
end

for j = 1:length(Prop_ELVOC)
    fprintf (fid1, '%22.3f',  Prop_ELVOC(j,1));
    fprintf (fid1, '%22.3f',  Prop_ELVOC(j,2));
    fprintf (fid1, '%22.3f',  Prop_ELVOC(j,3));
    fprintf (fid1, '\n');  
    
    fprintf (fid2, '%s',      C1{1}{j});
    fprintf (fid2, '\n');
end


% Only for testing the new vapour pressure we calcualte here the vapour
% pressure without the correction from Pontus

clear fun pguess p fminres log10p A B
% Calculate the A and B coefficients for the vapour pressure
for j=1:length(ELVOC_p_270_320(:,1))
    j
    log10p =ELVOC_p_270_320(j,:);
    
    % Fit Antoine equation
    fun = @(p) sum((log10p - p(1)+p(2)./T).^2);
 
    % Starting guess
    pguess = [10,6000];

    % Optimise
    [p,fminres] = fminsearch(fun,pguess);
    log10p_fit=p(1)-p(2)./T;
    A(j)=p(1);
    B(j)=p(2);
end

for j = 1:length(ELVOC_p_270_320(:,1))
    vap_pressure_org(j) = 10^(A(j)-(B(j)/T(25)));
    vap_concentration_org(j) = (vap_pressure(j)*101325)/(boltzmann*T(25));
end

figure(2)
clf
% All MCM compounds
%semilogy(O_C_ratio, vap_pressure(:) ,'ko')
%hold on
%semilogy(O_C_ratio, vap_pressure_org(:) ,'ro')


plot(log10(vap_pressure(:)) ,'ko')
hold on
plot(log10(vap_pressure_org(:)) ,'ro')


%semilogy(vap_pressure(:) ,'ko')
%hold on
%semilogy(vap_pressure_org(:) ,'ro')


% Only for plotting the vapour pressures against the masses
Vap_prop_all = load(['/home/local/carltonx/Work/Malte_box/Bitbucket_Malte_repo/malte_v1/Malte_in/Box/Me130618/Orginal/mcm33_bvoc_compound_prop.dat']);

for j = 1:length(Vap_prop_all)
    vap_pres(j) = 10^(Vap_prop_all(j,2)-(Vap_prop_all(j,3)/T(25)));
    vapor_conc(j) = (vap_pres(j)*101325)/(boltzmann*T(25));
end

xL = length(vapor_conc);

figure(1)
% All MCM compounds
semilogy(Vap_prop_all(1:xL-42,1), vapor_conc(1:xL-42) ,'ko')
hold on
% ELVOCs
semilogy(Vap_prop_all(xL-42:xL,1), vapor_conc(xL-42:xL), 'ro')



Vap_prop_all = load(['/home/local/carltonx/Work/Malte_box/Bitbucket_Malte_repo/malte_v1/Malte_in/mcm33_bvoc_compound_prop.dat']);


fid1 = fopen('/home/local/carltonx/Work/Malte_box/Bitbucket_Malte_repo/malte_v1/Malte_in/xmcm33_bvoc_compound_prop.dat','w');

for j = 1:692
    fprintf (fid1, '%22.3f',  Vap_prop_all(j,1));
    fprintf (fid1, '%22.3f',  Vap_prop_all(j,2));
    fprintf (fid1, '%22.3f',  Vap_prop_all(j,3));
    fprintf (fid1, '\n');  
end

