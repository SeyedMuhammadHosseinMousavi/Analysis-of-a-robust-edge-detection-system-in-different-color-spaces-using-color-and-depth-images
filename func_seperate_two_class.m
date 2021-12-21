function level = func_seperate_two_class(I)
 

I = I(:);

% STEP 1: Compute mean intensity of image from histogram, set T=mean(I)
[counts, N]=hist(I,256);
i=1;
mu=cumsum(counts);
T(i)=(sum(N.*counts))/mu(end);

% STEP 2: compute Mean above T (MAT) and Mean below T (MBT) using T from
% step 1
mu2=cumsum(counts(N<=T(i)));
MBT=sum(N(N<=T(i)).*counts(N<=T(i)))/mu2(end);

mu3=cumsum(counts(N>T(i)));
MAT=sum(N(N>T(i)).*counts(N>T(i)))/mu3(end);
i=i+1;
T(i)=(MAT+MBT)/2;

% STEP 3 to n: repeat step 2 if T(i)~=T(i-1)
Threshold=T(i);
while abs(T(i)-T(i-1))>=1
    mu2=cumsum(counts(N<=T(i)));
    MBT=sum(N(N<=T(i)).*counts(N<=T(i)))/mu2(end);
    
    mu3=cumsum(counts(N>T(i)));
    MAT=sum(N(N>T(i)).*counts(N>T(i)))/mu3(end);
    
    i=i+1;
    T(i)=(MAT+MBT)/2; 
    Threshold=T(i);
end

% Normalize the threshold to the range [i, 1].
level = Threshold;