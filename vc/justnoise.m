clc;clear;
I=imread('c:\brain\brain2.jpg');

mean=0;
variance=0.01;
noisedensity=0.1;
specklevariance=0.01;

gaussiannoise = imnoise(I,'gaussian',mean,variance);
saltynoise = imnoise(I,'salt & pepper',noisedensity);
poissonnoise = imnoise(I,'poisson');
specklenoise = imnoise(I,'speckle',specklevariance);

subplot(2,3,1)
subimage(I);title('Original');
subplot(2,3,2)
subimage(gaussiannoise);title('Guassian Noise');
subplot(2,3,3)
subimage(saltynoise);title('Salt & Pepper Noise');
subplot(2,3,4)
subimage(poissonnoise);title('Poisson Noise');
subplot(2,3,5)
subimage(specklenoise);title('Speckle Noise');