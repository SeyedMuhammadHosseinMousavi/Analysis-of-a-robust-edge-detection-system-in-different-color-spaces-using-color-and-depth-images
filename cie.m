clear;
img=imread('monarch.png');
lab=rgb2lab(img,'WhitePoint','d65');



subplot(2,2,1)
subimage(lab(:,:,1),[0 100])
subplot(2,2,2)
subimage(lab(:,:,2),[0 100])
subplot(2,2,3)
subimage(lab(:,:,3),[0 100])
subplot(2,2,4)
subimage(lab)