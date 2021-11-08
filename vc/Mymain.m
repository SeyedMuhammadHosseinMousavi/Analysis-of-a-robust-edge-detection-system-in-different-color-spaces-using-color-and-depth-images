clc;clear;
% channels-adding noise-median smooth-unsharp mask-proposed filter-morphology
I=imread('c:\brain\4.jpg');
% [finr fing finb K]=Finalres(I); 
% subplot(1,4,1), subimage(r);title('R');
% subplot(1,4,2), subimage(g);title('G');
% subplot(1,4,3), subimage(b);title('B');
% subplot(1,4,4), subimage(I);title('RGB');
mean=0;
variance=0.01;
noisedensity=0.1;
specklevariance=0.01;
figure;
gaussiannoise = imnoise(I,'gaussian',mean,variance);
[finr fing finb K]=Finalres(gaussiannoise); Kgauss=K;
figure;
saltynoise = imnoise(I,'salt & pepper',noisedensity);
[finr fing finb K]=Finalres(saltynoise);Ksalt=K;
figure;
poissonnoise = imnoise(I,'poisson');
[finr fing finb K]=Finalres(poissonnoise);Kpoisson=K;
figure;
specklenoise = imnoise(I,'speckle',specklevariance);
[finr fing finb K]=Finalres(specklenoise);Kspeckle=K;
%% morphology
%imerode
se = strel('disk',1);
Kgaussmorph = imerode(Kgauss,se);subimage(Kgaussmorph);
Ksaltmorph = imerode(Ksalt,se);
Kpoissonmorph = imerode(Kpoisson,se);
Kspecklemorph = imerode(Kspeckle,se);
%imclose
se = strel('disk',1);
Kgaussclose = imclose(Kgaussmorph,se);subimage(Kgaussclose);
Ksaltclose = imclose(Ksaltmorph,se);
Kpoissonclose = imclose(Kpoissonmorph,se);
Kspeckleclose = imclose(Kspecklemorph,se);
%% hit miss function
output1=hitmiss(Kgaussclose);
output2=hitmiss(Ksaltclose);
output3=hitmiss(Kpoissonclose);
output4=hitmiss(Kspeckleclose);
