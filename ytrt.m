clc;clear;
I=imread('cat.jpg');

I=rgb2lab(I);
I=I(:,:,1);
I=uint8(I);

mean=0;
variance=0.001;
noisedensity=0.01;
specklevariance=0.01;


gaussiannoise = imnoise(I,'gaussian',mean,variance);
saltynoise = imnoise(I,'salt & pepper',noisedensity);
poissonnoise = imnoise(I,'poisson');
specklenoise = imnoise(I,'speckle',specklevariance);

subplot(1,4,1)
imshow(gaussiannoise,[]);title('Guassian Noise');
subplot(1,4,2)
imshow(saltynoise,[]);title('Salt & Pepper Noise');
subplot(1,4,3)
imshow(poissonnoise,[]);title('Poisson Noise');
subplot(1,4,4)
imshow(specklenoise,[]);title('Speckle Noise');