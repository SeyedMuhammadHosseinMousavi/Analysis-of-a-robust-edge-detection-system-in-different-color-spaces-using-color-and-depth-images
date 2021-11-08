clear;
img=imread('teapotdepth.jpg');
lab=rgb2lab(img,'WhitePoint','d65');

subplot(1,2,1)
subimage(img)
subplot(1,2,2)
subimage(lab)

subimage(lab(:,:,1),[0 100])



