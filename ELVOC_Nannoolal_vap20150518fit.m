clear all
close all
%load ELVOC_p_250_320K.txt
[aa,bb,cb]=xlsread('/Users/Michael/Downloads/umansysprop.xlsx','sheet1','B2:BT4407'); %change the file size
ELVOC_p_250_320K=aa;


T=[250:320]; %change the temperature


for j=1:length(ELVOC_p_250_320K(:,1))
    j
    log10p =ELVOC_p_250_320K(j,:);
    % Fit Antoine equation
    fun = @(p) sum((log10p - p(1)+p(2)./T).^2);
    
    %starting guess
    pguess = [10,6000];
    %optimise
    [p,fminres] = fminsearch(fun,pguess)
    log10p_fit=p(1)-p(2)./T;
    A(j)=p(1);
    B(j)=p(2);
    %figure(j)
    %plot(T,log10p,'--')%,T,log10p_fit)
    %xlabel('T (K)')
    %ylabel('log_1_0(p_0(atm))')
    %hold on
end

Mass = load (



