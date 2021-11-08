clc;
clear;
img=imread('girlface.bmp');
org=img;
img=imbinarize(img);
se1 = strel('disk',1);
se2 = strel('disk',3);
erodedBW = imerode(img,se1);
closeBW = imclose(erodedBW,se2);
subplot(1,4,1)
subimage(org); title('Original');
subplot(1,4,2)
subimage(img);title('BW');
subplot(1,4,3)
subimage(erodedBW); title('SE= Disc, Erode');
subplot(1,4,4)
subimage(closeBW); title('SE=Disc, Closing');