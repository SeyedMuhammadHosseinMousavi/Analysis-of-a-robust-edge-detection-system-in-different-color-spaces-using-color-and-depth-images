clc;
clear;
img=imread('shoulderCR.jpg');
median=medfilt2(img,[9 9]);
sharp=imsharpen(median,'Radius',5,'Amount',3);

subplot(1,3,1)
subimage(img);
subplot(1,3,2)
subimage(median);
subplot(1,3,3)
subimage(sharp);