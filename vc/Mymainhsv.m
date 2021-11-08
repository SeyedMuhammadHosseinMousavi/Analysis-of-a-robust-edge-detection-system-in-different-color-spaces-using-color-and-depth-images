clc;clear;
% channels-adding noise-median smooth-unsharp mask-proposed filter-morphology
I=imread('c:\brain\4.jpg');
% [finr fing finb K]=Finalreshsv(I); 
% subplot(1,4,1), subimage(h);title('H');
% subplot(1,4,2), subimage(s);title('S');
% subplot(1,4,3), subimage(v);title('V');
% subplot(1,4,4), subimage(I);title('HSV');
%
mean=0;
variance=0.01;
noisedensity=0.1;
specklevariance=0.01;
figure;
gaussiannoise = imnoise(I,'gaussian',mean,variance);
[finr fing finb K]=Finalreshsv(gaussiannoise); Kgauss=K;
figure;
saltynoise = imnoise(I,'salt & pepper',noisedensity);
[finr fing finb K]=Finalreshsv(saltynoise);Ksalt=K;
figure;
poissonnoise = imnoise(I,'poisson');
[finr fing finb K]=Finalreshsv(poissonnoise);Kpoisson=K;
figure;
specklenoise = imnoise(I,'speckle',specklevariance);
[finr fing finb K]=Finalreshsv(specklenoise);Kspeckle=K;
%% morphology
%imerode
se = strel('disk',1);
Kgaussmorph = imerode(Kgauss,se);
Ksaltmorph = imerode(Ksalt,se);
Kpoissonmorph = imerode(Kpoisson,se);
Kspecklemorph = imerode(Kspeckle,se);
%imclose
se = strel('disk',1);
Kgaussclose = imclose(Kgaussmorph,se);
Ksaltclose = imclose(Ksaltmorph,se);
Kpoissonclose = imclose(Kpoissonmorph,se);
Kspeckleclose = imclose(Kspecklemorph,se);

%% hit miss function
output1=hitmiss(Kgaussclose);
output2=hitmiss(Ksaltclose);
output3=hitmiss(Kpoissonclose);
output4=hitmiss(Kspeckleclose);
