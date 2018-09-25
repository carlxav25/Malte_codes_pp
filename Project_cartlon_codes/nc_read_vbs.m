%% function
function [cond_phase,vap_phase, eff_sat_con] = nc_read_vbs(file)

time_in_units = ncread([file], 'time_in_units');
% Dimensions:  time
% Units = 's'

num_con = ncread([file], 'number_concentration');
% Dimension: Sections,time
% Units = '1/m^3'

vol_con = ncread([file], 'volume_concentration');
% Dimensions:  Sections,Composition,time
% Units = 'um^3/m^3'

vap_conc = ncread([file], 'vapor_concentration');
% Dimensions:  Condensable,time
% Units = '1/m^3'

rad = ncread([file], 'radius');
% Dimensions:  Sections,time
% Units = 'm'

temp = ncread([file], 'temperature');
% Dimensions:  time
% Units = 'K'

vap_dens = ncread([file], 'vapor_density');
% Dimensions:  Condensable
% Units = 'kg/m^3'

molar_mass= ncread([file], 'molarmass');
% Dimensions:  Condensable
% Units = 'g/mol'

sat_conc= ncread([file], 'saturation_concentration');
% Dimensions:  Condensable,time
% Units = '#/m^3'

[com tim]  = size(vap_conc);
[sec tim]  = size(rad);

ch_air     = 2.47E19 ;
Na         = 6.022E23; % [#/mol] 

cond_phase  = sum(vol_con(:,1:com-2,end).*vap_dens(1:com-2)')*1E-9; %ug/m3
vap_phase   = vap_conc(1:com-2,end) .* molar_mass(1:com-2)./Na *1E6; %ug/m3
eff_sat_con = sat_conc(1:com-2,end) .* molar_mass(1:com-2)./Na *1E6; %ug/m3


end