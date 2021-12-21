%% fuzzy
clc;clear;
mean=0;
variance=0.001;
noisedensity=0.01;
specklevariance=0.04;

Irgb=imread('zelda.png');
[Ieval]=fuzzyedge(Irgb);
[Ieval2]=fuzzyedge2(Irgb);
[Ieval3]=fuzzyedge3(Irgb);
[Ieval4]=fuzzyedge4(Irgb);
[Ieval5]=fuzzyedge5(Irgb);


 gaussiannoise = imnoise(Irgb,'gaussian',mean,variance);
 saltynoise = imnoise(Irgb,'salt & pepper',noisedensity);
 poissonnoise = imnoise(Irgb,'poisson');
 specklenoise = imnoise(Irgb,'speckle',specklevariance);

[peaksnrG, snrG] = psnr(Ieval, Ieval2)
[peaksnrS, snrS] = psnr(Ieval, Ieval3)
[peaksnrG, snrG] = psnr(Ieval, Ieval4)
[peaksnrS, snrS] = psnr(Ieval, Ieval5)
[ssimval, ssimmap] = ssim(Ieval2,Ieval);
fprintf('The SSIM value is %0.4f.\n',ssimval);
[ssimval, ssimmap] = ssim(Ieval3,Ieval);
fprintf('The SSIM value is %0.4f.\n',ssimval);
[ssimval, ssimmap] = ssim(Ieval4,Ieval);
fprintf('The SSIM value is %0.4f.\n',ssimval);
[ssimval, ssimmap] = ssim(Ieval5,Ieval);
fprintf('The SSIM value is %0.4f.\n',ssimval);

figure('units','normalized','outerposition',[0 0 1 1])
subplot(2,2,1)
subimage(gaussiannoise);title(['Gaussian Noise with mean = ',num2str(mean),' and variance = ',num2str(variance)]);
subplot(2,2,2)
subimage(saltynoise);title(['Salt & Pepper Noise with noise density of ',num2str(noisedensity)]);
subplot(2,2,3)
subimage(gaussiannoise);title('poisson Noise');
subplot(2,2,4)
subimage(saltynoise);title(['speckle Noise with variance of ',num2str(specklevariance)]);

figure;
image(Ieval,'CDataMapping','scaled');colormap('gray');title('Original');figure;
image(Ieval2,'CDataMapping','scaled');colormap('gray');title('with Gaussian Noise');figure;
image(Ieval3,'CDataMapping','scaled');colormap('gray');title(' with Salt & Pepper Noise');figure;
image(Ieval4,'CDataMapping','scaled');colormap('gray');title('with poisson');figure;
image(Ieval5,'CDataMapping','scaled');colormap('gray');title(' with speckle Noise');