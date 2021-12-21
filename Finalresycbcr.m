function [finr fing finb K]=Finalresycbcr(I)
I = rgb2ycbcr(I);
y=I(:,:,1);
cb=I(:,:,2);
cr=I(:,:,3);
Kat = cat(3, y, cb, cr);
subplot(1,4,1), subimage(y);title('Y');
subplot(1,4,2), subimage(cb);title('Cb');
subplot(1,4,3), subimage(cr);title('Cr');
subplot(1,4,4), subimage(Kat);title('Combined');
figure;
% Unsharp masking
y = imsharpen(y,'Radius',7,'Amount',0.5);
% Median smooth
cb = medfilt2(cb, [10 10]);
cr = medfilt2(cr, [10 10]);
Kat2 = cat(3, y, cb, cr);
subplot(1,4,1), subimage(y);title('Unsharp mask Y');
subplot(1,4,2), subimage(cb);title('Median CB');
subplot(1,4,3), subimage(cr);title('Median CR');
subplot(1,4,4), subimage(Kat2);title('YCBCR');
figure;
%
polished1=[-1.2 -0.8 -0.6 ;0 0 0 ;1.2 0.8 0.6 ];
polished11=[1.2 0.8 0.6 ;0 0 0 ;-1.2 -0.8 -0.6 ];
polished111=[-0.1 -0.8 -0.6 ;0 0  0;0.1 0.8 0.6 ];
polished1111=[0.1 0.8 0.6 ;0 0 0 ;-0.1 -0.8 -0.6 ];
%
polished2=polished1';
polished22=polished11';
polished222=polished111';
polished2222=polished1111';
%% y
polished1filter=imfilter(y,polished1);
polished2filter=imfilter(y,polished2);
polished11filter=imfilter(y,polished11);
polished22filter=imfilter(y,polished22);
polished111filter=imfilter(y,polished111);
polished222filter=imfilter(y,polished222);
polished1111filter=imfilter(y,polished1111);
polished2222filter=imfilter(y,polished2222);
polished=abs(polished1filter)+abs(polished2filter)+abs(polished11filter)+abs(polished22filter)+abs(polished111filter)+abs(polished222filter)+abs(polished1111filter)+abs(polished2222filter);
finr=polished;
%% i
polished1filter=0;polished2filter=0;polished11filter=0;polished22filter=0;polished111filter=0;
polished222filter=0;polished1111filter=0;polished2222filter=0;polished=0;
polished1filter=imfilter(cb,polished1);
polished2filter=imfilter(cb,polished2);
polished11filter=imfilter(cb,polished11);
polished22filter=imfilter(cb,polished22);
polished111filter=imfilter(cb,polished111);
polished222filter=imfilter(cb,polished222);
polished1111filter=imfilter(cb,polished1111);
polished2222filter=imfilter(cb,polished2222);
polished=abs(polished1filter)+abs(polished2filter)+abs(polished11filter)+abs(polished22filter)+abs(polished111filter)+abs(polished222filter)+abs(polished1111filter)+abs(polished2222filter);
fing=polished; 
%% q
polished1filter=0;polished2filter=0;polished11filter=0;polished22filter=0;polished111filter=0;
polished222filter=0;polished1111filter=0;polished2222filter=0;polished=0;
polished1filter=imfilter(cr,polished1);
polished2filter=imfilter(cr,polished2);
polished11filter=imfilter(cr,polished11);
polished22filter=imfilter(cr,polished22);
polished111filter=imfilter(cr,polished111);
polished222filter=imfilter(cr,polished222);
polished1111filter=imfilter(cr,polished1111);
polished2222filter=imfilter(cr,polished2222);
polished=abs(polished1filter)+abs(polished2filter)+abs(polished11filter)+abs(polished22filter)+abs(polished111filter)+abs(polished222filter)+abs(polished1111filter)+abs(polished2222filter);
finb=polished; 
%% rgb cat plot
K = cat(3, finr, fing, finb);
subplot(1,4,1)
subimage(finr);title('Y Channel-edge');
subplot(1,4,2)
subimage(fing);title('Cb Channel-edge');
subplot(1,4,3)
subimage(finb);title('Cr Channel-edge');
subplot(1,4,4)
subimage(K);title('YCbCr Edges');
end