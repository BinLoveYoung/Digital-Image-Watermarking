function [B_D,ALLV_D,ALLU_D] = WatermarkDetection(NEW)
N = 512;
m = 16;
B_D = zeros(m,m,1024);
ALLV_D = zeros(m,m,1024);
ALLU_D = zeros(m,m,1024);
l = 1;
k = 1;
for i = 1:m:N
    for j = 1:m:N
        B_D(:,:,k) = NEW(i:i+m-1,j:j+m-1); % All 16x16 small matrices are saved in B,here k runs from 1 to 1024
        [U,~,V] = svd(B_D(:,:,k)); % calculating svd of each 1024 matrices
        ALLV_D(:,:,l) = V;
        ALLU_D(:,:,l) = U;
        l = l+1;
        k = k+1;
    end
end
end