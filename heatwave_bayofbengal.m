%%
clc
clear
%%
filepath ='';% input the file path
%%
temp =[];
LAT = [];
LON= [];
%%
for k=2014:2023 %input the time period
filename = ['sst.day.mean.' num2str(k) '.nc'];
% filename = 'sst.day.mean.2013.nc';

fullfile = [filepath filename ];
ncdisp(fullfile);
sst = ncread(fullfile,'sst');
lon = ncread(fullfile,'lon');
lat = ncread(fullfile,'lat');
 lonidx = find(80 <= lon & lon <= 90);
latidx = find(5 <= lat & lat <= 22);

longom = lon(lonidx);
latgom = lat(latidx);

sstgom = sst(lonidx,latidx,1:365);
indx = find(sstgom < 0);
sstgom(indx) = NaN;

    LAT = [LAT;latgom];
      LON = [LON; longom]; 
    temp = [temp;sstgom]     
end
%%
TEMP1 = squeeze(temp(1:40,1:68,1:365));
TEMP2 = squeeze(temp(41:80,1:68,1:365));
TEMP3 = squeeze(temp(81:120,1:68,1:365));
TEMP4 = squeeze(temp(121:160,1:68,1:365));
TEMP5 = squeeze(temp(161:200,1:68,1:365));
TEMP6 = squeeze(temp(201:240,1:68,1:365));
TEMP7 = squeeze(temp(241:280,1:68,1:365));
TEMP8 = squeeze(temp(281:320,1:68,1:365));
TEMP9 = squeeze(temp(321:360,1:68,1:365));
TEMP10 = squeeze(temp(361:400,1:68,1:365));
element = numel(TEMP1)
TEMP_RSHP_1= reshape(TEMP1,[element 1]); % total number of elemnets
TEMP_RSHP_1_check = reshape(TEMP_RSHP_1, [2720 365]); % dividing it for 365 days for all grid
TEMP_RSHP_1_check_1 = nanmean(TEMP_RSHP_1_check);% mean it for one specific day

TEMP_RSHP_2= reshape(TEMP2,[element 1]); % total number of elemnets
TEMP_RSHP_2_check = reshape(TEMP_RSHP_2, [2720 365]); % dividing it for 365 days for all grid
TEMP_RSHP_2_check_2 = nanmean(TEMP_RSHP_2_check);

TEMP_RSHP_3= reshape(TEMP3,[element 1]); % total number of elemnets
TEMP_RSHP_3_check = reshape(TEMP_RSHP_3, [2720 365]); % dividing it for 365 days for all grid
TEMP_RSHP_3_check_3 = nanmean(TEMP_RSHP_3_check);

TEMP_RSHP_4= reshape(TEMP4,[element 1]); % total number of elemnets
TEMP_RSHP_4_check = reshape(TEMP_RSHP_4, [2720 365]); % dividing it for 365 days for all grid
TEMP_RSHP_4_check_4 = nanmean(TEMP_RSHP_4_check);

TEMP_RSHP_5= reshape(TEMP5,[element 1]); % total number of elemnets
TEMP_RSHP_5_check = reshape(TEMP_RSHP_5, [2720 365]); % dividing it for 365 days for all grid
TEMP_RSHP_5_check_5 = nanmean(TEMP_RSHP_5_check);

TEMP_RSHP_6= reshape(TEMP6,[element 1]); % total number of elemnets
TEMP_RSHP_6_check = reshape(TEMP_RSHP_6, [2720 365]); % dividing it for 365 days for all grid
TEMP_RSHP_6_check_6 = nanmean(TEMP_RSHP_6_check);

TEMP_RSHP_7= reshape(TEMP7,[element 1]); % total number of elemnets
TEMP_RSHP_7_check = reshape(TEMP_RSHP_7, [2720 365]); % dividing it for 365 days for all grid
TEMP_RSHP_7_check_7 = nanmean(TEMP_RSHP_7_check);

TEMP_RSHP_8= reshape(TEMP8,[element 1]); % total number of elemnets
TEMP_RSHP_8_check = reshape(TEMP_RSHP_8, [2720 365]); % dividing it for 365 days for all grid
TEMP_RSHP_8_check_8 = nanmean(TEMP_RSHP_8_check);

TEMP_RSHP_9= reshape(TEMP9,[element 1]); % total number of elemnets
TEMP_RSHP_9_check = reshape(TEMP_RSHP_9, [2720 365]); % dividing it for 365 days for all grid
TEMP_RSHP_9_check_9 = nanmean(TEMP_RSHP_9_check);

TEMP_RSHP_10= reshape(TEMP10,[element 1]); % total number of elemnets
TEMP_RSHP_10_check = reshape(TEMP_RSHP_10, [2720 365]); % dividing it for 365 days for all grid
TEMP_RSHP_10_check_10 = nanmean(TEMP_RSHP_10_check);


mean_value = (TEMP_RSHP_1_check_1+TEMP_RSHP_2_check_2 +TEMP_RSHP_3_check_3 + TEMP_RSHP_4_check_4+TEMP_RSHP_5_check_5+TEMP_RSHP_6_check_6+TEMP_RSHP_7_check_7+TEMP_RSHP_8_check_8+TEMP_RSHP_9_check_9+TEMP_RSHP_10_check_10)/10;

 perct_value_1 = [TEMP_RSHP_1_check_1;TEMP_RSHP_2_check_2;TEMP_RSHP_3_check_3;TEMP_RSHP_4_check_4;TEMP_RSHP_5_check_5;TEMP_RSHP_6_check_6; TEMP_RSHP_7_check_7;TEMP_RSHP_8_check_8;TEMP_RSHP_9_check_9;TEMP_RSHP_10_check_10];
perct_value = prctile(perct_value_1 , 90,1)
%%
x =(1:365)
 figure(1)
 plot(x,mean_value,'k','Linewidth',3)
 xlabel ('days in year')
 ylabel('SST')
 title ('Marine HeatWave  at Bay of Bengal')
 hold on
 plot(x,TEMP_RSHP_1_check_1,'g')
 plot(x,TEMP_RSHP_2_check_2,'w')
 plot(x,TEMP_RSHP_3_check_3,'r','Linewidth',3)
  plot(x,TEMP_RSHP_4_check_4,'y')
  plot(x,TEMP_RSHP_5_check_5,'c')
 plot(x,TEMP_RSHP_6_check_6,'g.')
 plot(x,TEMP_RSHP_7_check_7,'y.')
 plot(x,TEMP_RSHP_8_check_8,'b.')
 plot(x,TEMP_RSHP_9_check_9,'m.')
 plot(x,TEMP_RSHP_10_check_10,'c.')
 plot(x,perct_value,'g','Linewidth',3)
legend ('mean','2014','2015','2016', '2017','2018','2019','2020','2021','2022','2023','90th prctl'),
 hold off
 
 %% frequency 
  freequecy_2003= TEMP_RSHP_3_check_3>perct_value;
  figure(2)
  plot (x, freequecy_2003, 'r','Linewidth',3 )
  xlabel ('number of days in a year')
  legend ('2003')
  title ('Frequecy ( Total numer of MHW Days)')
%%

intensity_2003 = (TEMP_RSHP_3_check_3-mean_value);
 figure(3)
 plot (x, intensity_2003 , 'r','Linewidth',3 )
  xlabel ('number of days in a year')
  ylabel ('Temperature anomaly')
  legend ('2003')
  title ('Intensity ')
  grid
  