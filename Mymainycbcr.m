clc;clear;
% channels-adding noise-median smooth-unsharp mask-proposed filter-morphology
I=imread('c:\brain\4.jpg');
% [finr fing finb K]=Finalresycbcr(I); 
%
mean=0;
variance=0.01;
noisedensity=0.1;
specklevariance=0.01;
figure;
gaussiannoise = imnoise(I,'gaussian',mean,variance);
[finr fing finb K]=Finalresycbcr(gaussiannoise); Kgauss=K;
figure;
saltynoise = imnoise(I,'salt & pepper',noisedensity);
[finr fing finb K]=Finalresycbcr(saltynoise);Ksalt=K;
figure;
poissonnoise = imnoise(I,'poisson');
[finr fing finb K]=Finalresycbcr(poissonnoise);Kpoisson=K;
figure;
specklenoise = imnoise(I,'speckle',specklevariance);
[finr fing finb K]=Finalresycbcr(specklenoise);Kspeckle=K;
%% morphology
%imerode
se = strel('disk',1);
Kgaussmorph = imerode(Kgauss,se);
Ksaltmorph = imerode(Ksalt,se);
Kpoissonmorph = imerode(Kpoisson,se);
Kspecklemorph = imerode(Kspeckle,se);subimage(Kspecklemorph);
%imclose
se = strel('disk',1);
Kgaussclose = imclose(Kgaussmorph,se);
Ksaltclose = imclose(Ksaltmorph,se);
Kpoissonclose = imclose(Kpoissonmorph,se);
Kspeckleclose = imclose(Kspecklemorph,se);subimage(Kspeckleclose);
%% hit miss function
output1=hitmiss(Kgaussclose);
output2=hitmiss(Ksaltclose);
output3=hitmiss(Kpoissonclose);
output4=hitmiss(Kspeckleclose);
