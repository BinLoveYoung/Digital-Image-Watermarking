function [Z_D,ALLV1,ALLV2,ALLU1,ALLU2,Z_D1] = addnoise(NEW,A)
k=1;
l=1;
m=16;
Z_D = zeros(16,16,1024);
Z_D1 = zeros(16,16,1024);
IM = imnoise(NEW,'gaussian', 0.1);
IM1 =imnoise(NEW,'salt & pepper', 0.003);
ALLV1=zeros(m,m,1024);
ALLV2=zeros(m,m,1024);
ALLU1=zeros(m,m,1024);
ALLU2=zeros(m,m,1024);
figure
subplot(1,3,1);
imshow(NEW);
title('Watermarked Image')
subplot(1,3,2);
imshow(IM);
title('Gaussian Noisy Image')
subplot(1,3,3);
imshow(IM1)
title('Salt&Pepper Noisy Image')
for i=1:16:512
    for j=1:16:512
        Z_D(:,:,k) = IM(i:i+16-1,j:j+16-1);
        Z_D1(:,:,k) = IM1(i:i+16-1,j:j+16-1);
        [U1,~,V1] = svd(Z_D(:,:,k));
        [U2,~,V2] = svd(Z_D1(:,:,k));
        ALLV1(:,:,l) = V1;
        ALLV2(:,:,l) = V2;
        ALLU1(:,:,l) = U1;
        ALLU2(:,:,l) = U2;
        k=k+1;
        l=l+1;
    end
end
peaksnrnoise = psnr(IM,A)
ssimvalnoise = ssim(IM,A)
peaksnrnoise1 = psnr(IM1,A)
ssimvalnoise1 = ssim(IM1,A)
end
