function [Ieval3,pic]=fuzzyedge5(pic)

% Import RGB Image and Convert to Grayscale
Irgb = imread('zelda.png');
Irgb = imnoise(Irgb,'speckle',0.04);
% Irgb is a 384 x 512 x 3 uint8 array. The three channels of Irgb (third array dimension) represent the red, green, and blue intensities of the image.
% Convert Irgb to grayscale so that you can work with a 2-D array instead of a 3-D array. Use the standard NTSC conversion formula to calculate the effective luminance of each pixel.
Igray = 0.2989*Irgb(:,:,1)+0.5870*Irgb(:,:,2)+0.1140*Irgb(:,:,3);
figure; image(Igray,'CDataMapping','scaled'); colormap('gray');
title('Input Image in Grayscale')
% Alternatively, you can use the rgb2gray function in the Image Processing Toolbox software to convert Irgb to grayscale.
% Convert Image to Double-Precision Data
% The Fuzzy Logic Toolbox software operates on double-precision numbers only. So, convert Igray, a uint8 array, to a double array.
I = double(Igray);
% Because uint8 values are in the [0 2^8-1] range, all elements of I are in that range too. Scale I so that its elements are in the [0 1] range.
classType = class(Igray);
scalingFactor = double(intmax(classType));
I = I/scalingFactor;
% Obtain Image Gradient
% The fuzzy logic edge-detection algorithm for this example relies on the image gradient to locate breaks in uniform regions. Calculate the image gradient along the x-axis and y-axis.
Gx = [-1 1];
Gy = Gx';
Ix = conv2(I,Gx,'same');
Iy = conv2(I,Gy,'same');
figure; image(Ix,'CDataMapping','scaled'); colormap('gray'); title('Ix');
figure; image(Iy,'CDataMapping','scaled'); colormap('gray'); title('Iy');
% Define Fuzzy Inference System (FIS) for Edge Detection
% Create a Fuzzy Inference System (FIS) for edge detection, edgeFIS.
edgeFIS = newfis('edgeDetection');
% Specify the image gradients, Ix and Iy, as the inputs of edgeFIS.
edgeFIS = addvar(edgeFIS,'input','Ix',[-1 1]);
edgeFIS = addvar(edgeFIS,'input','Iy',[-1 1]);
% Specify a zero-mean Gaussian membership function for each input. If the gradient value for a pixel is 0, then it belongs to the zero membership function with a degree of 1.
sx = 0.1; sy = 0.1;
edgeFIS = addmf(edgeFIS,'input',1,'zero','gaussmf',[sx 0]);
edgeFIS = addmf(edgeFIS,'input',2,'zero','gaussmf',[sy 0]);
% Specify the intensity of the edge-detected image as an output of edgeFIS.
edgeFIS = addvar(edgeFIS,'output','Iout',[0 1]);
% Specify the triangular membership functions, white and black, for Iout.
wa = 0.1; wb = 1; wc = 1;
ba = 0; bb = 0; bc = .7;
edgeFIS = addmf(edgeFIS,'output',1,'white','trimf',[wa wb wc]);
edgeFIS = addmf(edgeFIS,'output',1,'black','trimf',[ba bb bc]);
% Plot the membership functions of the inputs/outputs of edgeFIS.
figure
subplot(2,2,1); plotmf(edgeFIS,'input',1); title('Ix');
subplot(2,2,2); plotmf(edgeFIS,'input',2); title('Iy');
subplot(2,2,[3 4]); plotmf(edgeFIS,'output',1); title('Iout')
% Specify FIS Rules
% Add rules to make a pixel white if it belongs to a uniform region. Otherwise, make the pixel black.
r1 = 'If Ix is zero and Iy is zero then Iout is white';
r2 = 'If Ix is not zero or Iy is not zero then Iout is black';
r = char(r1,r2);
edgeFIS = parsrule(edgeFIS,r);
showrule(edgeFIS)
% Evaluate FIS
% Evaluate the output of the edge detector for each row of pixels in I using corresponding rows of Ix and Iy as inputs.
Ieval3 = zeros(size(I));% Preallocate the output matrix
for ii = 1:size(I,1)
    Ieval3(ii,:) = evalfis([(Ix(ii,:));(Iy(ii,:));]',edgeFIS);
end
% Plot Results
figure; image(I,'CDataMapping','scaled'); colormap('gray');
title('Original Grayscale Image')
figure; image(Ieval3,'CDataMapping','scaled'); colormap('gray');
title('Edge Detection Using Fuzzy Logic')
% Summary
% You detected the edges in an image using a FIS, comparing the gradient of every pixel in the x and y directions.
% If the gradient for a pixel is not zero, then the pixel belongs to an edge (black). You defined the gradient as
% zero using Gaussian membership functions for your FIS inputs.
end