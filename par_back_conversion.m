function [pnum3] = CS_general(num_par, radius);


% Change malte data from N/cm3 to dN/dlogDp 

[fx fy] = size(num_par)

% Minimal and maximal diameters per size bin

%    dmin1 = radius(1); dmax1 = radius(fy);
%    dmin1 = log10(dmin1); dmax1 = log10(dmax1); 

% Dense diameter grid inside size bin
%dpi1 = [dmin1:0.001:dmax1]; %';

for i = 1:fy
    for j = 2:fx-1
        pnum3(j,i) = num_par(j,i) / ((log10(radius(j+1))-log10(radius(j)))/2 + (log10(radius(j))-log10(radius(j-1)))/2);
    end
    pnum3(1,i)   = num_par(1,i)   / (log10(radius(j+1))-log10(radius(j)));
    pnum3(fx,i) = num_par(fx,i) / (log10(radius(j))-log10(radius(j-1)));

end   