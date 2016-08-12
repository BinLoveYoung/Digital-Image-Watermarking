% This function divides the 512x512 original matrix A into 1024 smaller
% matrices of size 16x16. Also it calculates the SVD of each of them and
% then saves all the V matrices in the matrix ALLV.
function [ALLV,ALLU,ALLS] = watermarkEmbedding(A) 
N = 512;
m = 16;
B = zeros(m,m,1024);
ALLV = zeros(m,m,1024);
ALLU = zeros(m,m,1024);
ALLS = zeros(m,m,1024);
%AD = dct(double(A));
l = 1;
k = 1;
for i = 1:m:N
    for j = 1:m:N
        B(:,:,k) = A(i:i+m-1,j:j+m-1); % All 16x16 small matrices are saved in B,here k runs from 1 to 1024
        [U,S,V] = svd(B(:,:,k)); % calculating svd of each 1024 matrices
        ALLV(:,:,l) = V;
        ALLU(:,:,l) = U;
        ALLS(:,:,l) = S;
        k = k+1;
        l = l+1;
    end
end
end
