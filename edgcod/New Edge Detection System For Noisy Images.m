%% Pre-Processing
clc;clear;
testimage=imread('watch.png');
testimage=rgb2gray(testimage);
%% Processing
sobelresult = edge(testimage,'Sobel');
prewittresult = edge(testimage,'Prewitt');
robertsresult = edge(testimage,'Roberts');
logresult = edge(testimage,'log');
zerocrossresult = edge(testimage,'zerocross');
cannyresult = edge(testimage,'Canny');
%% Post_Processing
figure('units','normalized','outerposition',[0 0 1 1])
subplot(2,3,1)
subimage(sobelresult);title('Sobel Result')
subplot(2,3,2)
subimage(prewittresult);title('Prewitt Result')
subplot(2,3,3)
subimage(robertsresult);title('Roberts Result')
subplot(2,3,4)
subimage(logresult);title('Log Result')
subplot(2,3,5)
subimage(zerocrossresult);title('Zerocross Result')
subplot(2,3,6)
subimage(cannyresult);title('Canny Result')
%% Process No.2
%sobel
mean=0;
variance=0.0005;
noisedensity=0.001;
specklevariance=0.001;
figure('units','normalized','outerposition',[0 0 1 1])
subplot(2,3,1)
subimage(testimage);title('Main Image');
subplot(2,3,2)
subimage(sobelresult);title('Sobel Result');
subplot(2,3,3)
gaussiannoise = imnoise(testimage,'gaussian',mean,variance);
subimage(gaussiannoise);title(['Gaussian Noise with mean = ',num2str(mean),' and variance = ',num2str(variance)]);
subplot(2,3,4)
saltynoise = imnoise(testimage,'salt & pepper',noisedensity);
subimage(saltynoise);title(['Salt & Pepper Noise with noise density of ',num2str(noisedensity)]);
subplot(2,3,5)
gaussiannoiseedge=edge(gaussiannoise,'Sobel');
subimage(gaussiannoiseedge);title('Gaussian Noise Edge');
subplot(2,3,6)
saltynoiseedge=edge(saltynoise,'Sobel');
subimage(saltynoiseedge);title('Salt & Pepper Noise Edge');

figure('units','normalized','outerposition',[0 0 1 1])
subplot(2,2,1)
poissonnoise = imnoise(testimage,'poisson');
poissonnoiseedge=edge(poissonnoise,'Sobel');
subimage(gaussiannoiseedge);title('poisson Noise Edge');
subplot(2,2,2)
specklenoise = imnoise(testimage,'speckle',specklevariance);
specklenoiseedge=edge(specklenoise,'Sobel');
subimage(gaussiannoiseedge);title('speckle Noise Edge');
subplot(2,2,3)
subimage(poissonnoise);title('poisson Noise')
subplot(2,2,4)
subimage(specklenoise);title('speckle Noise');
%PSNR and SNR and SSIM and MSE
sobelresultdouble=double(sobelresult);
gaussiannoiseedgedouble=double(gaussiannoiseedge);
saltynoiseedgedouble=double(saltynoiseedge);

poissonnoiseedgedouble=double(poissonnoiseedge);
specklenoiseedgedouble=double(specklenoiseedge);

[peaksnrG, snrG] = psnr(sobelresultdouble, gaussiannoiseedgedouble)
[peaksnrS, snrS] = psnr(sobelresultdouble, saltynoiseedgedouble)
[peaksnrG, snrG] = psnr(sobelresultdouble, poissonnoiseedgedouble)
[peaksnrS, snrS] = psnr(sobelresultdouble, specklenoiseedgedouble)
[ssimval, ssimmap] = ssim(gaussiannoiseedgedouble,sobelresultdouble);
fprintf('The SSIM value is %0.4f.\n',ssimval);
[ssimval, ssimmap] = ssim(saltynoiseedgedouble,sobelresultdouble);
fprintf('The SSIM value is %0.4f.\n',ssimval);
[ssimval, ssimmap] = ssim(poissonnoiseedgedouble,sobelresultdouble);
fprintf('The SSIM value is %0.4f.\n',ssimval);
[ssimval, ssimmap] = ssim(specklenoiseedgedouble,sobelresultdouble);
fprintf('The SSIM value is %0.4f.\n',ssimval);

err = immse(gaussiannoiseedgedouble, sobelresultdouble);
fprintf('\n The mean-squared error is %0.4f\n', err);

err = immse(saltynoiseedgedouble, sobelresultdouble);
fprintf('\n The mean-squared error is %0.4f\n', err);

err = immse(poissonnoiseedgedouble, sobelresultdouble);
fprintf('\n The mean-squared error is %0.4f\n', err);

err = immse(specklenoiseedgedouble, sobelresultdouble);
fprintf('\n The mean-squared error is %0.4f\n', err);
%% prewitt
 figure;
subplot(2,3,1)
subimage(testimage);title('Main Image');
subplot(2,3,2)
subimage(prewittresult);title('Prewitt Result');
subplot(2,3,3)
gaussiannoise = imnoise(testimage,'gaussian',mean,variance);
subimage(gaussiannoise);title(['Gaussian Noise with mean = ',num2str(mean),' and variance = ',num2str(variance)]);
subplot(2,3,4)
saltynoise = imnoise(testimage,'salt & pepper',noisedensity);
subimage(saltynoise);title(['Salt & Pepper Noise with noise density of ',num2str(noisedensity)]);
subplot(2,3,5)
gaussiannoiseedge=edge(gaussiannoise,'Prewitt');
subimage(gaussiannoiseedge);title('Gaussian Noise Edge');
subplot(2,3,6)
saltynoiseedge=edge(saltynoise,'Prewitt');
subimage(saltynoiseedge);title('Salt & Pepper Noise Edge');

figure;
subplot(1,2,1)
poissonnoise = imnoise(testimage,'poisson');
poissonnoiseedge=edge(poissonnoise,'Prewitt');
subimage(gaussiannoiseedge);title('poisson Noise Edge');
subplot(1,2,2)
specklenoise = imnoise(testimage,'speckle',specklevariance);
specklenoiseedge=edge(specklenoise,'Prewitt');
subimage(gaussiannoiseedge);title('speckle Noise Edge');
%PSNR and SNR and SSIM
prewittresultdouble=double(prewittresult);
gaussiannoiseedgedouble=double(gaussiannoiseedge);
saltynoiseedgedouble=double(saltynoiseedge);
poissonnoiseedgedouble=double(poissonnoiseedge);
specklenoiseedgedouble=double(specklenoiseedge);

[peaksnrG, snrG] = psnr(prewittresultdouble, gaussiannoiseedgedouble)
[peaksnrS, snrS] = psnr(prewittresultdouble, saltynoiseedgedouble)
[peaksnrG, snrG] = psnr(prewittresultdouble, poissonnoiseedgedouble)
[peaksnrS, snrS] = psnr(prewittresultdouble, specklenoiseedgedouble)

[ssimval, ssimmap] = ssim(gaussiannoiseedgedouble,prewittresultdouble);
fprintf('The SSIM value is %0.4f.\n',ssimval);
[ssimval, ssimmap] = ssim(saltynoiseedgedouble,prewittresultdouble);
fprintf('The SSIM value is %0.4f.\n',ssimval);
[ssimval, ssimmap] = ssim(poissonnoiseedgedouble,prewittresultdouble);
fprintf('The SSIM value is %0.4f.\n',ssimval);
[ssimval, ssimmap] = ssim(specklenoiseedgedouble,prewittresultdouble);
fprintf('The SSIM value is %0.4f.\n',ssimval);

err = immse(gaussiannoiseedgedouble, prewittresultdouble);
fprintf('\n The mean-squared error is %0.4f\n', err);

err = immse(saltynoiseedgedouble, prewittresultdouble);
fprintf('\n The mean-squared error is %0.4f\n', err);

err = immse(poissonnoiseedgedouble, prewittresultdouble);
fprintf('\n The mean-squared error is %0.4f\n', err);

err = immse(specklenoiseedgedouble, prewittresultdouble);
fprintf('\n The mean-squared error is %0.4f\n', err);
%% roberts

figure;
subplot(2,3,1)
subimage(testimage);title('Main Image');
subplot(2,3,2)
subimage(robertsresult);title('Roberts Result');
subplot(2,3,3)
gaussiannoise = imnoise(testimage,'gaussian',mean,variance);
subimage(gaussiannoise);title(['Gaussian Noise with mean = ',num2str(mean),' and variance = ',num2str(variance)]);
subplot(2,3,4)
saltynoise = imnoise(testimage,'salt & pepper',noisedensity);
subimage(saltynoise);title(['Salt & Pepper Noise with noise density of ',num2str(noisedensity)]);
subplot(2,3,5)
gaussiannoiseedge=edge(gaussiannoise,'Roberts');
subimage(gaussiannoiseedge);title('Gaussian Noise Edge');
subplot(2,3,6)
saltynoiseedge=edge(saltynoise,'Roberts');
subimage(saltynoiseedge);title('Salt & Pepper Noise Edge');

figure;
subplot(1,2,1)
poissonnoise = imnoise(testimage,'poisson');
poissonnoiseedge=edge(poissonnoise,'Roberts');
subimage(gaussiannoiseedge);title('poisson Noise Edge');
subplot(1,2,2)
specklenoise = imnoise(testimage,'speckle',specklevariance);
specklenoiseedge=edge(specklenoise,'Roberts');
subimage(gaussiannoiseedge);title('speckle Noise Edge');
%PSNR and SNR and SSIM
robertsresultdouble=double(robertsresult);
gaussiannoiseedgedouble=double(gaussiannoiseedge);
saltynoiseedgedouble=double(saltynoiseedge);
poissonnoiseedgedouble=double(poissonnoiseedge);
specklenoiseedgedouble=double(specklenoiseedge);

[peaksnrG, snrG] = psnr(robertsresultdouble, gaussiannoiseedgedouble)
[peaksnrS, snrS] = psnr(robertsresultdouble, saltynoiseedgedouble)
[peaksnrG, snrG] = psnr(robertsresultdouble, poissonnoiseedgedouble)
[peaksnrS, snrS] = psnr(robertsresultdouble, specklenoiseedgedouble)

[ssimval, ssimmap] = ssim(gaussiannoiseedgedouble,robertsresultdouble);
fprintf('The SSIM value is %0.4f.\n',ssimval);
[ssimval, ssimmap] = ssim(saltynoiseedgedouble,robertsresultdouble);
fprintf('The SSIM value is %0.4f.\n',ssimval);
[ssimval, ssimmap] = ssim(poissonnoiseedgedouble,robertsresultdouble);
fprintf('The SSIM value is %0.4f.\n',ssimval);
[ssimval, ssimmap] = ssim(specklenoiseedgedouble,robertsresultdouble);
fprintf('The SSIM value is %0.4f.\n',ssimval);

err = immse(gaussiannoiseedgedouble, robertsresultdouble);
fprintf('\n The mean-squared error is %0.4f\n', err);

err = immse(saltynoiseedgedouble, robertsresultdouble);
fprintf('\n The mean-squared error is %0.4f\n', err);

err = immse(poissonnoiseedgedouble, robertsresultdouble);
fprintf('\n The mean-squared error is %0.4f\n', err);

err = immse(specklenoiseedgedouble, robertsresultdouble);
fprintf('\n The mean-squared error is %0.4f\n', err);
%% log

figure;
subplot(2,3,1)
subimage(testimage);title('Main Image');
subplot(2,3,2)
subimage(logresult);title('Log Result');
subplot(2,3,3)
gaussiannoise = imnoise(testimage,'gaussian',mean,variance);
subimage(gaussiannoise);title(['Gaussian Noise with mean = ',num2str(mean),' and variance = ',num2str(variance)]);
subplot(2,3,4)
saltynoise = imnoise(testimage,'salt & pepper',noisedensity);
subimage(saltynoise);title(['Salt & Pepper Noise with noise density of ',num2str(noisedensity)]);
subplot(2,3,5)
gaussiannoiseedge=edge(gaussiannoise,'Log');
subimage(gaussiannoiseedge);title('Gaussian Noise Edge');
subplot(2,3,6)
saltynoiseedge=edge(saltynoise,'Log');
subimage(saltynoiseedge);title('Salt & Pepper Noise Edge');

 figure;
subplot(1,2,1)
poissonnoise = imnoise(testimage,'poisson');
poissonnoiseedge=edge(poissonnoise,'log');
subimage(gaussiannoiseedge);title('poisson Noise Edge');
subplot(1,2,2)
specklenoise = imnoise(testimage,'speckle',specklevariance);
specklenoiseedge=edge(specklenoise,'log');
subimage(gaussiannoiseedge);title('speckle Noise Edge');
%PSNR and SNR and SSIM
logresultdouble=double(logresult);
gaussiannoiseedgedouble=double(gaussiannoiseedge);
saltynoiseedgedouble=double(saltynoiseedge);
poissonnoiseedgedouble=double(poissonnoiseedge);
specklenoiseedgedouble=double(specklenoiseedge);

[peaksnrG, snrG] = psnr(logresultdouble, gaussiannoiseedgedouble)
[peaksnrS, snrS] = psnr(logresultdouble, saltynoiseedgedouble)
[peaksnrG, snrG] = psnr(logresultdouble, poissonnoiseedgedouble)
[peaksnrS, snrS] = psnr(logresultdouble, specklenoiseedgedouble)

[ssimval, ssimmap] = ssim(gaussiannoiseedgedouble,logresultdouble);
fprintf('The SSIM value is %0.4f.\n',ssimval);
[ssimval, ssimmap] = ssim(saltynoiseedgedouble,logresultdouble);
fprintf('The SSIM value is %0.4f.\n',ssimval);
[ssimval, ssimmap] = ssim(poissonnoiseedgedouble,logresultdouble);
fprintf('The SSIM value is %0.4f.\n',ssimval);
[ssimval, ssimmap] = ssim(specklenoiseedgedouble,logresultdouble);
fprintf('The SSIM value is %0.4f.\n',ssimval);

err = immse(gaussiannoiseedgedouble, logresultdouble);
fprintf('\n The mean-squared error is %0.4f\n', err);

err = immse(saltynoiseedgedouble, logresultdouble);
fprintf('\n The mean-squared error is %0.4f\n', err);

err = immse(poissonnoiseedgedouble, logresultdouble);
fprintf('\n The mean-squared error is %0.4f\n', err);

err = immse(specklenoiseedgedouble, logresultdouble);
fprintf('\n The mean-squared error is %0.4f\n', err);
%% zerocross

figure;
subplot(2,3,1)
subimage(testimage);title('Main Image');
subplot(2,3,2)
subimage(logresult);title('zerocross Result');
subplot(2,3,3)
gaussiannoise = imnoise(testimage,'gaussian',mean,variance);
subimage(gaussiannoise);title(['Gaussian Noise with mean = ',num2str(mean),' and variance = ',num2str(variance)]);
subplot(2,3,4)
saltynoise = imnoise(testimage,'salt & pepper',noisedensity);
subimage(saltynoise);title(['Salt & Pepper Noise with noise density of ',num2str(noisedensity)]);
subplot(2,3,5)
gaussiannoiseedge=edge(gaussiannoise,'zerocross');
subimage(gaussiannoiseedge);title('Gaussian Noise Edge');
subplot(2,3,6)
saltynoiseedge=edge(saltynoise,'zerocross');
subimage(saltynoiseedge);title('Salt & Pepper Noise Edge');

figure;
subplot(1,2,1)
poissonnoise = imnoise(testimage,'poisson');
poissonnoiseedge=edge(poissonnoise,'zerocross');
subimage(gaussiannoiseedge);title('poisson Noise Edge');
subplot(1,2,2)
specklenoise = imnoise(testimage,'speckle',specklevariance);
specklenoiseedge=edge(specklenoise,'zerocross');
subimage(gaussiannoiseedge);title('speckle Noise Edge');
%PSNR and SNR and SSIM
zerocrossresultdouble=double(zerocrossresult);
gaussiannoiseedgedouble=double(gaussiannoiseedge);
saltynoiseedgedouble=double(saltynoiseedge);
poissonnoiseedgedouble=double(poissonnoiseedge);
specklenoiseedgedouble=double(specklenoiseedge);

[peaksnrG, snrG] = psnr(zerocrossresultdouble, gaussiannoiseedgedouble)
[peaksnrS, snrS] = psnr(zerocrossresultdouble, saltynoiseedgedouble)
[peaksnrG, snrG] = psnr(zerocrossresultdouble, poissonnoiseedgedouble)
[peaksnrS, snrS] = psnr(zerocrossresultdouble, specklenoiseedgedouble)

[ssimval, ssimmap] = ssim(gaussiannoiseedgedouble,zerocrossresultdouble);
fprintf('The SSIM value is %0.4f.\n',ssimval);
[ssimval, ssimmap] = ssim(saltynoiseedgedouble,zerocrossresultdouble);
fprintf('The SSIM value is %0.4f.\n',ssimval);
[ssimval, ssimmap] = ssim(poissonnoiseedgedouble,zerocrossresultdouble);
fprintf('The SSIM value is %0.4f.\n',ssimval);
[ssimval, ssimmap] = ssim(specklenoiseedgedouble,zerocrossresultdouble);
fprintf('The SSIM value is %0.4f.\n',ssimval);

err = immse(gaussiannoiseedgedouble, zerocrossresultdouble);
fprintf('\n The mean-squared error is %0.4f\n', err);

err = immse(saltynoiseedgedouble, zerocrossresultdouble);
fprintf('\n The mean-squared error is %0.4f\n', err);

err = immse(poissonnoiseedgedouble, zerocrossresultdouble);
fprintf('\n The mean-squared error is %0.4f\n', err);

err = immse(specklenoiseedgedouble, zerocrossresultdouble);
fprintf('\n The mean-squared error is %0.4f\n', err);
%% canny

figure;
subplot(2,3,1)
subimage(testimage);title('Main Image');
subplot(2,3,2)
subimage(cannyresult);title('Canny Result');
subplot(2,3,3)
gaussiannoise = imnoise(testimage,'gaussian',mean,variance);
subimage(gaussiannoise);title(['Gaussian Noise with mean = ',num2str(mean),' and variance = ',num2str(variance)]);
subplot(2,3,4)
saltynoise = imnoise(testimage,'salt & pepper',noisedensity);
subimage(saltynoise);title(['Salt & Pepper Noise with noise density of ',num2str(noisedensity)]);
subplot(2,3,5)
gaussiannoiseedge=edge(gaussiannoise,'canny');
subimage(gaussiannoiseedge);title('Gaussian Noise Edge');
subplot(2,3,6)
saltynoiseedge=edge(saltynoise,'canny');
subimage(saltynoiseedge);title('Salt & Pepper Noise Edge');

figure;
subplot(1,2,1)
poissonnoise = imnoise(testimage,'poisson');
poissonnoiseedge=edge(poissonnoise,'canny');
subimage(gaussiannoiseedge);title('poisson Noise Edge');
subplot(1,2,2)
specklenoise = imnoise(testimage,'speckle',specklevariance);
specklenoiseedge=edge(specklenoise,'canny');
subimage(gaussiannoiseedge);title('speckle Noise Edge');
%PSNR and SNR and SSIM
cannyresultdouble=double(cannyresult);
gaussiannoiseedgedouble=double(gaussiannoiseedge);
saltynoiseedgedouble=double(saltynoiseedge);
poissonnoiseedgedouble=double(poissonnoiseedge);
specklenoiseedgedouble=double(specklenoiseedge);

[peaksnrG, snrG] = psnr(cannyresultdouble, gaussiannoiseedgedouble)
[peaksnrS, snrS] = psnr(cannyresultdouble, saltynoiseedgedouble)
[peaksnrG, snrG] = psnr(cannyresultdouble, poissonnoiseedgedouble)
[peaksnrS, snrS] = psnr(cannyresultdouble, specklenoiseedgedouble)

[ssimval, ssimmap] = ssim(gaussiannoiseedgedouble,cannyresultdouble);
fprintf('The SSIM value is %0.4f.\n',ssimval);
[ssimval, ssimmap] = ssim(saltynoiseedgedouble,cannyresultdouble);
fprintf('The SSIM value is %0.4f.\n',ssimval);
[ssimval, ssimmap] = ssim(poissonnoiseedgedouble,cannyresultdouble);
fprintf('The SSIM value is %0.4f.\n',ssimval);
[ssimval, ssimmap] = ssim(specklenoiseedgedouble,cannyresultdouble);
fprintf('The SSIM value is %0.4f.\n',ssimval);

err = immse(gaussiannoiseedgedouble, cannyresultdouble);
fprintf('\n The mean-squared error is %0.4f\n', err);

err = immse(saltynoiseedgedouble, cannyresultdouble);
fprintf('\n The mean-squared error is %0.4f\n', err);

err = immse(poissonnoiseedgedouble, cannyresultdouble);
fprintf('\n The mean-squared error is %0.4f\n', err);

err = immse(specklenoiseedgedouble, cannyresultdouble);
fprintf('\n The mean-squared error is %0.4f\n', err);
