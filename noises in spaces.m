clear;
rgb=imread('cat.png');

hsv=rgb2hsv(rgb);
yiq=rgb2ntsc(rgb);
ycbcr=rgb2ycbcr(rgb);
%% rgb
gaussian= imnoise(rgb,'gaussian');
sp = imnoise(rgb,'salt & pepper',0.02);
poisson = imnoise(rgb,'poisson');
speckle = imnoise(rgb,'speckle');
%
subplot(1,4,1)
subimage(gaussian); title('RGB-Gaussian(var=0.01)');
subplot(1,4,2)
subimage(sp); title('RGB-Salt & Pepper(noise density=0.05)');
subplot(1,4,3)
subimage(poisson); title('RGB-Poisson');
subplot(1,4,4)
subimage(speckle); title('RGB-Speckle(mean=0, var=0.04)');

%% hsv
gaussianhsv= imnoise(hsv,'gaussian');
sphsv = imnoise(hsv,'salt & pepper',0.02);
poissonhsv = imnoise(hsv,'poisson');
specklehsv = imnoise(hsv,'speckle');
%
subplot(1,4,1)
subimage(gaussianhsv); title('HSV-Gaussian(var=0.01)');
subplot(1,4,2)
subimage(sphsv); title('HSV-Salt & Pepper(noise density=0.05)');
subplot(1,4,3)
subimage(poissonhsv); title('HSV-Poisson');
subplot(1,4,4)
subimage(specklehsv); title('HSV-Speckle(mean=0, var=0.04)');

%% YIQ
gaussianyiq= imnoise(yiq,'gaussian');
spyiq = imnoise(yiq,'salt & pepper',0.02);
poissonyiq = imnoise(yiq,'poisson');
speckleyiq = imnoise(yiq,'speckle');
%
subplot(1,4,1)
subimage(gaussianyiq); title('YIQ-Gaussian(var=0.01)');
subplot(1,4,2)
subimage(spyiq); title('YIQ-Salt & Pepper(noise density=0.05)');
subplot(1,4,3)
subimage(poissonyiq); title('YIQ-Poisson');
subplot(1,4,4)
subimage(speckleyiq); title('YIQ-Speckle(mean=0, var=0.04)');

%% ycbcr
gaussiany= imnoise(ycbcr,'gaussian');
spy = imnoise(ycbcr,'salt & pepper',0.02);
poissony = imnoise(ycbcr,'poisson');
speckley = imnoise(ycbcr,'speckle');
%
subplot(1,4,1)
subimage(gaussiany); title('YCbCr-Gaussian(var=0.01)');
subplot(1,4,2)
subimage(spy); title('YCbCr-Salt & Pepper(noise density=0.05)');
subplot(1,4,3)
subimage(poissony); title('YCbCr-Poisson');
subplot(1,4,4)
subimage(speckley); title('YCbCr-Speckle(mean=0, var=0.04)');



