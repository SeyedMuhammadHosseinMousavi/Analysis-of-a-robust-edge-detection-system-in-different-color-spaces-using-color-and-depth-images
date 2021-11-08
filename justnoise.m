clc;clear;
I=imread('Abu Ali Sina.png');

mean=0;
variance=0.01;
noisedensity=0.1;
specklevariance=0.02;

gaussiannoise = imnoise(I,'gaussian',mean,variance);
saltynoise = imnoise(I,'salt & pepper',noisedensity);
specklenoise = imnoise(I,'speckle',specklevariance);

subplot(2,2,1)
subimage(I);title('Original');
subplot(2,2,2)
subimage(gaussiannoise);title('Guassian Noise Mean=0, Variance=0.01');
subplot(2,2,3)
subimage(saltynoise);title('Salt & Pepper Noise, Noise Density=0.1');
subplot(2,2,4)
subimage(specklenoise);title('Speckle Noise Speckle Variance=0.02');
