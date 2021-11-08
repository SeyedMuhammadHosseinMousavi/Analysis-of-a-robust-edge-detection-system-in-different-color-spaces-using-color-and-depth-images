clear;
clc;
img=imread('lena.jpg');
sp = imnoise(img,'salt & pepper',0.03);
yiq=rgb2ntsc(sp);
Y=yiq(:,:,1);
I=yiq(:,:,2);
Q=yiq(:,:,3);
sharpy=imsharpen(Y,'Radius',3,'Amount',2); sharpy=medfilt2(sharpy,[3 3]);
mediani=medfilt2(I,[3 3]);
medianq=medfilt2(Q,[3 3]);
combineyiq = cat(3, sharpy, mediani, medianq);
Gray=rgb2gray(combineyiq);
edgedetection = edge(Gray,'Canny');
% se1 = strel('disk',1);
% se2 = strel('disk',1);
% erodedBW = imerode(edgedetection,se1);
% closeBW = imclose(edgedetection,se2);
%%%
subplot(2,3,1);subimage(img);title('Original');
subplot(2,3,2);subimage(sp);title('Impulse Noise-RGB');
subplot(2,3,3);subimage(yiq);title('Convert to YIQ');
subplot(2,3,4);subimage(Y);title('Y-Noisy');
subplot(2,3,5);subimage(I);title('I-Noisy');
subplot(2,3,6);subimage(Q);title('Q-Noisy');
figure;
subplot(2,3,1);subimage(sharpy);title('Y-Unsharp Masked');
subplot(2,3,2);subimage(mediani);title('I-Median Filter');
subplot(2,3,3);subimage(medianq);title('Q-Median Filter');
subplot(2,3,4);subimage(combineyiq);title('Combined YIQ');
subplot(2,3,5);subimage(Gray);title('Gray');
subplot(2,3,6);subimage(edgedetection);title('M-ACO Edge detection along with Morphology');








