clear;
clc;

%as the simiularity increase , the snr and psnr will increase two

b=imread('c:\3.tif');
c=imread('c:\4.tif');
d=imread('c:\5.tif');
e=imread('c:\6.tif');
f=imread('c:\7.tif');
g=imread('c:\8.tif');


[peaksnr, snr] = psnr(b, c);
[ppp, sss] = psnr(b, f);
[pppp, ssss] = psnr(b, g);

peaksnrmatris=[peaksnr;ppp;pppp];
snrmatris=[snr;sss;ssss];

fprintf(' The Peak-SNR value is ');
psnrnorm=normc(peaksnrmatris)
fprintf(' The SNR value is  ');
snrnorm=normc(snrmatris)

%for dissimularity
bb=1-psnrnorm;
cc=1-snrnorm;
