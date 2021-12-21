function [finr fing finb K]=Finalreshsv(I)
I=rgb2hsv(I);
h=I(:,:,1);
s=I(:,:,2);
v=I(:,:,3);
Kat = cat(3, h, s, v);
subplot(2,2,1), subimage(h);title('H');
subplot(2,2,2), subimage(s);title('S');
subplot(2,2,3), subimage(v);title('V');
subplot(2,2,4), subimage(Kat);title('Combined');
figure;
% Unsharp masking
h = medfilt2(h, [10 10]);
s = medfilt2(s, [10 10]);
% Median smooth
v = imsharpen(v,'Radius',7,'Amount',0.5);
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
%% h
polished1filter=imfilter(h,polished1);
polished2filter=imfilter(h,polished2);
polished11filter=imfilter(h,polished11);
polished22filter=imfilter(h,polished22);
polished111filter=imfilter(h,polished111);
polished222filter=imfilter(h,polished222);
polished1111filter=imfilter(h,polished1111);
polished2222filter=imfilter(h,polished2222);
polished=abs(polished1filter)+abs(polished2filter)+abs(polished11filter)+abs(polished22filter)+abs(polished111filter)+abs(polished222filter)+abs(polished1111filter)+abs(polished2222filter);
finr=polished;
%% s
polished1filter=0;polished2filter=0;polished11filter=0;polished22filter=0;polished111filter=0;
polished222filter=0;polished1111filter=0;polished2222filter=0;polished=0;
polished1filter=imfilter(s,polished1);
polished2filter=imfilter(s,polished2);
polished11filter=imfilter(s,polished11);
polished22filter=imfilter(s,polished22);
polished111filter=imfilter(s,polished111);
polished222filter=imfilter(s,polished222);
polished1111filter=imfilter(s,polished1111);
polished2222filter=imfilter(s,polished2222);
polished=abs(polished1filter)+abs(polished2filter)+abs(polished11filter)+abs(polished22filter)+abs(polished111filter)+abs(polished222filter)+abs(polished1111filter)+abs(polished2222filter);
fing=polished; 
%% v
polished1filter=0;polished2filter=0;polished11filter=0;polished22filter=0;polished111filter=0;
polished222filter=0;polished1111filter=0;polished2222filter=0;polished=0;
polished1filter=imfilter(v,polished1);
polished2filter=imfilter(v,polished2);
polished11filter=imfilter(v,polished11);
polished22filter=imfilter(v,polished22);
polished111filter=imfilter(v,polished111);
polished222filter=imfilter(v,polished222);
polished1111filter=imfilter(v,polished1111);
polished2222filter=imfilter(v,polished2222);
polished=abs(polished1filter)+abs(polished2filter)+abs(polished11filter)+abs(polished22filter)+abs(polished111filter)+abs(polished222filter)+abs(polished1111filter)+abs(polished2222filter);
finb=polished; 
%% rgb cat plot
K = cat(3, finr, fing, finb);
subplot(2,3,1)
subimage(I);title('HSV Original');
subplot(2,3,2)
subimage(finr);title('H Channel-edge');
subplot(2,3,3)
subimage(fing);title('S Channel-edge');
subplot(2,3,4)
subimage(finb);title('V Channel-edge');
subplot(2,3,5)
subimage(K);title('HSV Edges');
end