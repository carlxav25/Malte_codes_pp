import os
import matplotlib.pyplot as plt
import numpy as np
import pylab as pl
import matplotlib 
from mpl_toolkits.axes_grid.inset_locator import inset_axes

from os import path 
from numpy import *
from netCDF4 import Dataset
#import netCDF4


## loopin through individual directories

#coo    = '/bca'           # compound inner folder 
#coo_fo = '/Bcar_'         # comp outer folder
#coo1   = '/bcA'

jj = 5 # Isop = 1; alpha, beta = 2,3; lime = 4; bcar = 5

#............................................................................#
#................READING DATA FOR SPECIFIC CASES.............................#
#............................................................................#

if  (jj == 1): # isoprene
 
 print('Case = Isoprene')
 
 coo    = '/iso'           # compound inner folder 
 coo_fo = '/Isop_'         # comp outer folder

 
 for i in range(1,61):
  print('runs =' + str(i))

  if (i >= 1 and i < 16):
   conc     = 5
   Basename = coo+str(conc)+'_run_'+str(i)
   dir_name = coo_fo+str(conc)
   fold     = dir_name+Basename
 
  elif (i>=16 and i<31):
   conc     = 50
   Basename = coo+str(conc)+'_run_'+str(i)
   dir_name = coo_fo+str(conc)
   fold     = dir_name+Basename
 
  elif (i>=31 and i<46):
   conc     = 100
   Basename = coo+str(conc)+'_run_'+str(i)
   dir_name = coo_fo+str(conc)
   fold     = dir_name+Basename
 
  else:
   conc     = 200
   Basename = coo+str(conc)+'_run_'+str(i)
   dir_name = coo_fo+str(conc)
   fold     = dir_name+Basename

elif  (jj == 2 or jj == 3):  # for apinene or bpinene
 
  if (jj == 2): # for apinene

   print('Case = Apinene')
   coo    = '/api'           # compound inner folder 
   coo_fo = '/Apin_'         # comp outer folder 
   
  elif (jj == 3): # for bpinene
  
   print('Case = Bpinene')
   coo    = '/bpi'           # compound inner folder 
   coo_fo = '/Bpin_'         # comp outer folder
 
  for i in range(1,91):
   print(i) 
  
   if (i >= 1 and i < 16):
    conc     = 0.5
    conc_fp  = 5
    Basename = coo+str(0)+str(conc_fp)+'_run_'+str(i)
    dir_name = coo_fo+str(0)+str(conc_fp)
    fold     = dir_name+Basename
 
   elif (i>=16 and i<31):
    conc     = 1
    Basename = coo+str(conc)+'_run_'+str(i)
    dir_name = coo_fo+str(conc)
    fold     = dir_name+Basename
 
   elif (i>=31 and i<46):
    conc     = 5
    Basename = coo+str(conc)+'_run_'+str(i)
    dir_name = coo_fo+str(conc)
    fold     = dir_name+Basename
 
   elif (i>=46 and i<61):
    conc     = 50
    Basename = coo+str(conc)+'_run_'+str(i)
    dir_name = coo_fo+str(conc)
    fold     = dir_name+Basename

   elif (i>=61 and i<75):
    conc     = 100
    Basename = coo+str(conc)+'_run_'+str(i)
    dir_name = coo_fo+str(conc)
    fold     = dir_name+Basename
 
   else:
    conc     = 200
    Basename = coo+str(conc)+'_run_'+str(i)
    dir_name = coo_fo+str(conc)
    fold     = dir_name+Basename
 
  
 
elif  (jj == 4):  # for limonene
  
 print('Case = Limonene')
 coo    = '/lim'           # compound inner folder 
 coo_fo = '/Lime_'         # comp outer folder
 
 for i in range(1,76):
 
  print(i) 
  
  if (i >= 1 and i < 16):
   conc     = 1
   Basename = coo+str(conc)+'_run_'+str(i)
   dir_name = coo_fo+str(conc)
   fold     = dir_name+Basename
 
  elif (i>=16 and i<31):
   conc     = 5
   Basename = coo+str(conc)+'_run_'+str(i)
   dir_name = coo_fo+str(conc)
   fold     = dir_name+Basename
 
  elif (i>=31 and i<46):
   conc     = 50
   Basename = coo+str(conc)+'_run_'+str(i)
   dir_name = coo_fo+str(conc)
   fold     = dir_name+Basename
 
  elif (i>=46 and i<61):
   conc     = 100
   Basename = coo+str(conc)+'_run_'+str(i)
   dir_name = coo_fo+str(conc)
   fold     = dir_name+Basename

  else:
   conc     = 200
   Basename = coo+str(conc)+'_run_'+str(i)
   dir_name = coo_fo+str(conc)
   fold     = dir_name+Basename
 
 
else:  # for bcarp
  
 print('Case = Bcarp')
 coo    = '/bca'           # compound inner folder 
 coo_fo = '/Bca_'         # comp outer folder
 coo5   = '/bcA2' 
 coo10  = '/bcA20'

 for i in range(1,76):
 
  print(i) 
  
  if (i >= 1 and i < 16):
   conc     = 0.1
   conc_fp  = 1
   Basename = coo+str(0)+str(conc_fp)+'_run_'+str(i)
   dir_name = coo_fo+str(0)+str(conc_fp)
   fold     = dir_name+Basename
 
  elif (i>=16 and i<31):
   conc     = 0.5
   conc_fp  = 5
   Basename = coo+str(0)+str(conc_fp)+'_run_'+str(i)
   dir_name = coo_fo+str(0)+str(conc_fp)
   fold     = dir_name+Basename
 
  elif (i>=31 and i<46):
   conc     = 2
   Basename = coo5+'_run_'+str(i)
   dir_name = coo_fo+str(conc)
   fold     = dir_name+Basename
 
  elif (i>=46 and i<61):
   conc     = 5
   Basename = coo5+'_run_'+str(i)
   dir_name = coo_fo+str(conc)
   fold     = dir_name+Basename

  else:
   conc     = 10
   Basename = coo10+'_run_'+str(i)
   dir_name = coo_fo+str(conc)
   fold     = dir_name+Basename
 
 

  
  path = '/home/local/carltonx/Work/Malte_box/Project_runs/malte_box/Malte_out/Box/Test1234/A4/A4'+fold+'/'

  nc = Dataset(path+'particle.nc', 'r')


  num_conc = nc.variables['number_concentration']
#print num_conc.units
#print num_conc.shape 

  rad = nc.variables['radius']
#print rad.units
#print rad.shape 

  dry_rad = nc.variables['dry_radius']
#print dry_rad.units
#print dry_rad.shape 

  or_dry_rad = nc.variables['original_dry_radius']
#print or_dry_rad.units
#print or_dry_rad.shape 

  time_in_units = nc.variables['time_in_units']
#print time_in_units.units
#print time_in_units.shape

  vol_conc = nc.variables['volume_concentration']
#print vol_conc.units
#print vol_conc.shape 
 
  vap_conc = nc.variables['vapor_concentration']
#print vap_conc.units
#print vap_conc.shape 

  vap_den = nc.variables['vapor_density']
#print vap_den.units
#print vap_den.shape 

  (tim, com)  = vap_conc.shape
  (tim, sec)  = rad.shape
  time = time_in_units[:]//43200

#print(com)
#print(tim)

  time      = np.loadtxt(path+'/Time_main.dat')
  comp      = np.loadtxt(path+'/gas_Limo.dat')
  gas_no3   = np.loadtxt(path+'/gas_NO3.dat')
  gas_OH    = np.loadtxt(path+'/gas_OH.dat')
  gas_o3    = np.loadtxt(path+'/gas_o3.dat')
  par_num   = np.loadtxt(path+'/par_num.dat')
  par_rad   = np.loadtxt(path+'/par_rad.dat')

  par_num_num = par_num.sum(axis=1) #sum across the columns :: dimension(time,)
  par_rad_rad = par_rad.sum(axis=1) #sum across the columns :: dimension(time,)

#constants
  ch_air  = 2.47E19
  Na      = 6.022E23
  MW_comp = 204.36

#compound final concentration
  comp_final  =  comp[-1]
  initial     =  conc *  ch_air * 1E-9 /3600

### concentration reacted
  comp_reacted             = (initial * 3600  - comp_final) # in #/cm3
  comp_reacted_ppb	  = comp_reacted *1E9 / ch_air # IN ppb
  comp_left_ppb		  = conc - comp_reacted_ppb
  comp_ug                  = comp_reacted_ppb * MW_comp * 12.187 / 293.15 
  
  print ('Compound reacted  in ppb is =' + str(comp_reacted_ppb) + '& in ug is =' + str(comp_ug)) 
#print(comp_reacted_ppb)

# mass yields calulation from g/cm3 

  A        = sum(sum(np.transpose(vol_conc[-1,0:com-2,:]) * vap_den[:-2])) * 1E-21 #g/cm3
  B        = comp_reacted * MW_comp / Na # g/cm3
  gamma    = (A/B)*100 # mass yield
  a_ug     = A * 1E12
  gamma_ug = a_ug/comp_ug 

#cond_phase  = sum(vol_con[:,0:com-2,-1]) * vap_dens[:-2].T)*1E-9  #ug/m3
#vap_phase   = vap_conc[0:com-2,-1] * molar_mass[:-2]./Na *1E6  #ug/m3
#eff_sat_con = sat_conc[0:com-2,-1] * molar_mass[1:com-2]./Na *1E6 #ug/m3

# Summing particle volume up over time or sections
  sum_sec_com = np.zeros((sec,com)) 
  sum_tim_com = np.zeros((tim,com)) 
		


# for j in range(com):
#  for i in range(sec):
#   for t in range(tim):
#      sum_sec_com[i,j]   = sum_sec_com[i,j] + vol_conc[t,j,i] #summation over time
 
#  for t in range(tim):      
#   for i in range(sec):
#       sum_tim_com[t,j]  = sum_tim_com[t,j] + vol_conc[t,j,i] # summation over sections     
#INMAT and H2SO4 are set to zero as we only consider organics

# for i in range(sec):
#    sum_sec_com[i,-2] = 0
#    sum_sec_com[i,-1] = 0

# for t in range(tim): 
#    sum_tim_com[t,-2] = 0
#    sum_tim_com[t,-1] = 0
   
  time_taken = time[-1]
 
  output_path = '/home/local/carltonx/Work/Malte_box/Project_runs/Results_June/Hom_runs/'



  f = open(output_path+'bpinene.dat','a+')


  f.write("%22.3f" % conc)
  f.write("%22.3f" % gas_OH[10])
  f.write("%22.3f" % gas_o3)
  f.write("%22.3f" % gas_no3[10])
  f.write("%22.3f" % comp_reacted_ppb)
  f.write("%22.3f" % gamma)
  f.write("%22.3f" % time_taken)
  f.write("%22.3f" % comp_ug)
  f.write("\n")

  f.close()










