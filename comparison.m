% YCBCR with Speckle noise comparison
clear;
clc;
img=imread('brain1.png');
sp = imnoise(img,'speckle',0.01);
yiq=rgb2ycbcr(sp);
Y=yiq(:,:,1);
I=yiq(:,:,2);
Q=yiq(:,:,3);
sharpy=imsharpen(Y,'Radius',2,'Amount',1); sharpy=medfilt2(sharpy,[3 3]);
mediani=medfilt2(I,[5 5]);
medianq=medfilt2(Q,[5 5]);
combineyiq = cat(3, sharpy, mediani, medianq);
Gray=rgb2gray(combineyiq);
edgedetection = edge(Gray,'Canny');
%
ycbcrgray=rgb2gray(yiq);
sobel=edge(ycbcrgray,'sobel');
roberts=edge(ycbcrgray,'roberts');
Prewitt=edge(ycbcrgray,'Prewitt');
log=edge(ycbcrgray,'log');
zerocross=edge(ycbcrgray,'zerocross');

sp1 = imnoise(img,'speckle',0.2);
yiq1=rgb2ycbcr(sp1); yiq1=rgb2gray(yiq1);
Canny=edge(yiq1,'Canny');


yiqnoise=imnoise(yiq,'speckle',0.01);

subplot(2,4,1);subimage(yiqnoise);title('YCbCr');
subplot(2,4,2);subimage(sobel);title('Sobel');
subplot(2,4,3);subimage(roberts);title('Roberts');
subplot(2,4,4);subimage(Prewitt);title('Prewitt');
subplot(2,4,5);subimage(log);title('Log');
subplot(2,4,6);subimage(zerocross);title('Zerocross');
subplot(2,4,7);subimage(Canny);title('Canny');
subplot(2,4,8);subimage(edgedetection);title('Proposed Method');



