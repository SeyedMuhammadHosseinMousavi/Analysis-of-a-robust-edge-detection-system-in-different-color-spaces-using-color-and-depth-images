%%  rgb median filter very important     very very good code for pre processing
clc;clear;
I = imread('c:\brain\4.jpg');
% filter each channel separately
r=I(:,:,1);
g=I(:,:,2);
b=I(:,:,3);
% median filter
rmed = medfilt2(I(:, :, 1), [7 7]);
gmed = medfilt2(I(:, :, 2), [7 7]);
bmed = medfilt2(I(:, :, 3), [7 7]);
% reconstruct the image from r,g,b channels
K = cat(3, rmed, gmed, bmed);
% figure('units','normalized','outerposition',[0 0 1 1])
subplot(2,2,1), subimage(rmed)
subplot(2,2,2), subimage(gmed)
subplot(2,2,3), subimage(bmed)
subplot(2,2,4), subimage(K)
figure;
subplot(121);
subimage(I)
subplot(122);
subimage(K);