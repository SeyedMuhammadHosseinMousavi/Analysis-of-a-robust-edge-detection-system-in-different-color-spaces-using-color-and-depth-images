% Refer http://en.wikipedia.org/wiki/Hit-or-miss_transform#Thinning

C(:,:,1) = [0 0 0; 0 1 0; 1 1 1];
C(:,:,2) = [0 0 0; 1 1 0; 1 1 0];
C(:,:,3) = [1 0 0; 1 1 0; 1 0 0];
C(:,:,4) = [1 1 0; 1 1 0; 0 0 0];
C(:,:,5) = [1 1 1; 0 1 0; 0 0 0];
C(:,:,6) = [0 1 1; 0 1 1; 0 0 0];
C(:,:,7) = [0 0 1; 0 1 1; 0 0 1];
C(:,:,8) = [0 0 0; 0 1 1; 0 1 1];
idxset=[[1 3:7 9];2:8;[1:3 5 7:9];[1:2 4:6 8:9];[1 3:7 9];2:8;[1:3 5 7:9];[1:2 4:6 8:9]];
