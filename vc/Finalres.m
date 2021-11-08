function [finr fing finb K]=Finalres(I)
r=I(:,:,1);
g=I(:,:,2);
b=I(:,:,3);
Kat = cat(3, r, g, b);
subplot(1,4,1), subimage(r);title('Noisy R');
subplot(1,4,2), subimage(g);title('Noisy G');
subplot(1,4,3), subimage(b);title('Noisy B');
subplot(1,4,4), subimage(Kat);title('RGB');
figure;
% Median smooth
r = medfilt2(I(:, :, 1), [10 10]);
g = medfilt2(I(:, :, 2), [10 10]);
b = medfilt2(I(:, :, 3), [10 10]);
Kat2 = cat(3, r, g, b);
subplot(1,4,1), subimage(r);title('Median R');
subplot(1,4,2), subimage(g);title('Median G');
subplot(1,4,3), subimage(b);title('Median B');
subplot(1,4,4), subimage(Kat2);title('RGB');
figure;
% Unsharp masking
r = imsharpen(r,'Radius',7,'Amount',0.5);
g = imsharpen(g,'Radius',7,'Amount',0.5);
b = imsharpen(b,'Radius',7,'Amount',0.5);
Kat3 = cat(3, r, g, b);
subplot(1,4,1), subimage(r);title('Processed R');
subplot(1,4,2), subimage(g);title('Processed G');
subplot(1,4,3), subimage(b);title('Processed B');
subplot(1,4,4), subimage(Kat3);title('RGB');
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
%% r
polished1filter=imfilter(r,polished1);
polished2filter=imfilter(r,polished2);
polished11filter=imfilter(r,polished11);
polished22filter=imfilter(r,polished22);
polished111filter=imfilter(r,polished111);
polished222filter=imfilter(r,polished222);
polished1111filter=imfilter(r,polished1111);
polished2222filter=imfilter(r,polished2222);
polished=abs(polished1filter)+abs(polished2filter)+abs(polished11filter)+abs(polished22filter)+abs(polished111filter)+abs(polished222filter)+abs(polished1111filter)+abs(polished2222filter);
finr=polished;
%% g
polished1filter=0;polished2filter=0;polished11filter=0;polished22filter=0;polished111filter=0;
polished222filter=0;polished1111filter=0;polished2222filter=0;polished=0;
polished1filter=imfilter(g,polished1);
polished2filter=imfilter(g,polished2);
polished11filter=imfilter(g,polished11);
polished22filter=imfilter(g,polished22);
polished111filter=imfilter(g,polished111);
polished222filter=imfilter(g,polished222);
polished1111filter=imfilter(g,polished1111);
polished2222filter=imfilter(g,polished2222);
polished=abs(polished1filter)+abs(polished2filter)+abs(polished11filter)+abs(polished22filter)+abs(polished111filter)+abs(polished222filter)+abs(polished1111filter)+abs(polished2222filter);
fing=polished; 
%% b
polished1filter=0;polished2filter=0;polished11filter=0;polished22filter=0;polished111filter=0;
polished222filter=0;polished1111filter=0;polished2222filter=0;polished=0;
polished1filter=imfilter(b,polished1);
polished2filter=imfilter(b,polished2);
polished11filter=imfilter(b,polished11);
polished22filter=imfilter(b,polished22);
polished111filter=imfilter(b,polished111);
polished222filter=imfilter(b,polished222);
polished1111filter=imfilter(b,polished1111);
polished2222filter=imfilter(b,polished2222);
polished=abs(polished1filter)+abs(polished2filter)+abs(polished11filter)+abs(polished22filter)+abs(polished111filter)+abs(polished222filter)+abs(polished1111filter)+abs(polished2222filter);
finb=polished; 
%% rgb cat plot
K = cat(3, finr, fing, finb);
subplot(1,4,1)
subimage(finr);title('R Edges');
subplot(1,4,2)
subimage(fing);title('G Edges');
subplot(1,4,3)
subimage(finb);title('B Edges');
subplot(1,4,4)
subimage(K);title('RGB Edges');
end