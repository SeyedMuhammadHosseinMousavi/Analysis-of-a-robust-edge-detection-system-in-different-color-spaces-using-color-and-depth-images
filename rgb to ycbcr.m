clc;clear;
RGB = imread('teapotdepth.jpg');
YCBCR = rgb2ycbcr(RGB);
Y=YCBCR(:,:,1);
CB=YCBCR(:,:,2);
CR=YCBCR(:,:,3);
K = cat(3, Y, CB, CR);
subplot(2,2,1), subimage(Y);title('Y');
subplot(2,2,2), subimage(CB);title('CB');
subplot(2,2,3), subimage(CR);title('CR');
subplot(2,2,4), subimage(K);title('Combined');
figure;
subplot(1,2,1), subimage(RGB); title('RGB');
subplot(1,2,2), subimage(YCBCR); title('YCBCR');


