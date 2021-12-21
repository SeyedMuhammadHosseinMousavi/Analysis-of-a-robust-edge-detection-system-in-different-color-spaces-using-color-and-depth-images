function [finr fing finb K]=Finalresyiq(I)
I = rgb2ntsc(I);
y=I(:,:,1);
i=I(:,:,2);
q=I(:,:,3);
Kat = cat(3, y, i, q);
subplot(1,4,1), subimage(y);title('Y');
subplot(1,4,2), subimage(i);title('I');
subplot(1,4,3), subimage(q);title('Q');
subplot(1,4,4), subimage(Kat);title('Combined');
figure;
% Unsharp masking
y = imsharpen(y,'Radius',7,'Amount',0.5);
% Median smooth
i = medfilt2(i, [10 10]);
q = medfilt2(q, [10 10]);
Kat2 = cat(3, y, i, q);
subplot(1,4,1), subimage(y);title('Y');
subplot(1,4,2), subimage(i);title('I');
subplot(1,4,3), subimage(q);title('Q');
subplot(1,4,4), subimage(Kat2);title('Combined');
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
polished1filter=imfilter(i,polished1);
polished2filter=imfilter(i,polished2);
polished11filter=imfilter(i,polished11);
polished22filter=imfilter(i,polished22);
polished111filter=imfilter(i,polished111);
polished222filter=imfilter(i,polished222);
polished1111filter=imfilter(i,polished1111);
polished2222filter=imfilter(i,polished2222);
polished=abs(polished1filter)+abs(polished2filter)+abs(polished11filter)+abs(polished22filter)+abs(polished111filter)+abs(polished222filter)+abs(polished1111filter)+abs(polished2222filter);
fing=polished; 
%% q
polished1filter=0;polished2filter=0;polished11filter=0;polished22filter=0;polished111filter=0;
polished222filter=0;polished1111filter=0;polished2222filter=0;polished=0;
polished1filter=imfilter(q,polished1);
polished2filter=imfilter(q,polished2);
polished11filter=imfilter(q,polished11);
polished22filter=imfilter(q,polished22);
polished111filter=imfilter(q,polished111);
polished222filter=imfilter(q,polished222);
polished1111filter=imfilter(q,polished1111);
polished2222filter=imfilter(q,polished2222);
polished=abs(polished1filter)+abs(polished2filter)+abs(polished11filter)+abs(polished22filter)+abs(polished111filter)+abs(polished222filter)+abs(polished1111filter)+abs(polished2222filter);
finb=polished; 
%% rgb cat plot
K = cat(3, finr, fing, finb);
subplot(1,4,1)
subimage(finr);title('Y Channel-edge');
subplot(1,4,2)
subimage(fing);title('I Channel-edge');
subplot(1,4,3)
subimage(finb);title('Q Channel-edge');
subplot(1,4,4)
subimage(K);title('YIQ Edges');
end