Irgb = imread('brain1.png');
Irgb = imnoise(Irgb,'speckle',0.01);
Irgb=rgb2ycbcr(Irgb);

Igray = 0.2989*Irgb(:,:,1)+0.5870*Irgb(:,:,2)+0.1140*Irgb(:,:,3);

figure
image(Igray,'CDataMapping','scaled');
colormap('gray')
title('Input Image in Grayscale')
I = double(Igray);
classType = class(Igray);                 
scalingFactor = double(intmax(classType));  
I = I/scalingFactor;
Gx = [-1 1];
Gy = Gx';
Ix = conv2(I,Gx,'same');
Iy = conv2(I,Gy,'same');

figure
image(Ix,'CDataMapping','scaled')
colormap('gray')
title('Ix')

figure
image(Iy,'CDataMapping','scaled')
colormap('gray')
title('Iy')
edgeFIS = newfis('edgeDetection');
edgeFIS = addvar(edgeFIS,'input','Ix',[-1 1]);
edgeFIS = addvar(edgeFIS,'input','Iy',[-1 1]);
sx = 0.1;
sy = 0.1;
edgeFIS = addmf(edgeFIS,'input',1,'zero','gaussmf',[sx 0]);
edgeFIS = addmf(edgeFIS,'input',2,'zero','gaussmf',[sy 0]);
edgeFIS = addvar(edgeFIS,'output','Iout',[0 1]);
wa = 0.1;
wb = 1;
wc = 1;
ba = 0;
bb = 0;
bc = 0.7;
edgeFIS = addmf(edgeFIS,'output',1,'white','trimf',[wa wb wc]);
edgeFIS = addmf(edgeFIS,'output',1,'black','trimf',[ba bb bc]);
figure
subplot(2,2,1)
plotmf(edgeFIS,'input',1)
title('Ix')
subplot(2,2,2)
plotmf(edgeFIS,'input',2)
title('Iy')
subplot(2,2,[3 4])
plotmf(edgeFIS,'output',1)
title('Iout')
r1 = 'If Ix is zero and Iy is zero then Iout is white';
r2 = 'If Ix is not zero or Iy is not zero then Iout is black';
r = char(r1,r2);
edgeFIS = parsrule(edgeFIS,r);
showrule(edgeFIS)
Ieval = zeros(size(I));
for ii = 1:size(I,1)
    Ieval(ii,:) = evalfis([(Ix(ii,:));(Iy(ii,:));]',edgeFIS);
end
figure
image(I,'CDataMapping','scaled')
colormap('gray')
title('Original Grayscale Image')
figure
image(Ieval,'CDataMapping','scaled')
colormap('gray')
title('Edge Detection Using Fuzzy Logic')