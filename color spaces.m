clear;
img=imread('monarch.png');
hsv=rgb2hsv(img);
yiq=rgb2ntsc(img);
ycbcr=rgb2ycbcr(img);

subplot(2,2,1)
subimage(img); title('RGB');
subplot(2,2,2)
subimage(hsv); title('HSV');
subplot(2,2,3)
subimage(yiq); title('YIQ');
subplot(2,2,4)
subimage(ycbcr); title('YCbCr');