clc;clear;
mean=0;
variance=0.05;
noisedensity=0.1;
specklevariance=0.1;
pic=imread('fruits.png');
% pic=rgb2gray(pic);

[sharp]=sharppolished(pic);

gaussiannoise = imnoise(pic,'gaussian',mean,variance);
[sharp2]=sharppolished2(gaussiannoise);

saltynoise = imnoise(pic,'salt & pepper',noisedensity);
[sharp3]=sharppolished3(saltynoise);

poissonnoise = imnoise(pic,'poisson');
[sharp4]=sharppolished4(poissonnoise);

specklenoise = imnoise(pic,'speckle',specklevariance);
[sharp5]=sharppolished5(specklenoise);

[peaksnrG, snrG] = psnr(sharp, sharp2)
[peaksnrS, snrS] = psnr(sharp, sharp3)
[peaksnrG, snrG] = psnr(sharp, sharp4)
[peaksnrS, snrS] = psnr(sharp, sharp5)
[ssimval, ssimmap] = ssim(sharp2,sharp);
fprintf('The SSIM value for Gaussian is %0.4f.\n',ssimval);
[ssimval, ssimmap] = ssim(sharp3,sharp);
fprintf('The SSIM value for Salt & Pepper is %0.4f.\n',ssimval);
[ssimval, ssimmap] = ssim(sharp4,sharp);
fprintf('The SSIM value for Poisson is %0.4f.\n',ssimval);
[ssimval, ssimmap] = ssim(sharp5,sharp);
fprintf('The SSIM value for Speckle is %0.4f.\n',ssimval);
% mse err

o1=output;
o1=double(o1);
output=double(output);
err = immse(output, o1);
fprintf('\n The mean-squared error is %0.4f\n', err);

%%%%
figure('units','normalized','outerposition',[0 0 1 1])
subplot(2,2,1)
subimage(gaussiannoise);title(['Gaussian Noise with mean = ',num2str(mean),' and variance = ',num2str(variance)]);
subplot(2,2,2)
subimage(saltynoise);title(['Salt & Pepper Noise with noise density of ',num2str(noisedensity)]);
subplot(2,2,3)
subimage(poissonnoise);title('Poisson Noise');
subplot(2,2,4)
subimage(specklenoise);title(['Speckle Noise with variance = ',num2str(specklevariance)]);
%%%%
figure('units','normalized','outerposition',[0 0 1 1])
subplot(2,2,1)
subimage(sharp2);title('with Gaussian Noise');
subplot(2,2,2)
subimage(sharp3);title('with Salt & Pepper Noise');
subplot(2,2,3)
subimage(sharp4);title('with Poisson Noise');
subplot(2,2,4)
subimage(sharp5);title('with Speckle Noise');