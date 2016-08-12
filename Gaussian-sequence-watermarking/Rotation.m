function [R_IM1,R_IM2,ALLV_RM1,ALLV_RM2 ] = Rotation( NEW ,A)
k=1;
l=1;
RIM = zeros(16,16,1024);
RIM1 = zeros(16,16,1024);
ALLV_RM1 = zeros(16,16,1024);
ALLV_RM2 = zeros(16,16,1024);
% Rotation: Clockwise and Anticlockwise
I = NEW;
figure
ax(1) = subplot(1,3,1);
imshow(I)
title('Original Image');
R_IM1 = imrotate(I,-90);
ax(2) = subplot(1,3,2);
imshow(R_IM1)
title('Rotation by -90');
ax(3) = subplot(1,3,3);
R_IM2 = imrotate(I,90);
imshow(R_IM2)
title('Rotation by 90');
for i=1:16:512
    for j=1:16:512
        RIM(:,:,k) = R_IM1(i:i+16-1,j:j+16-1);
        RIM1(:,:,k) = R_IM2(i:i+16-1,j:j+16-1);
        [~,~,VCR] = svd(RIM(:,:,k));
        [~,~,VCR1] = svd(RIM1(:,:,k));
        ALLV_RM1(:,:,l) = VCR;
        ALLV_RM2(:,:,l) = VCR1;
        k=k+1;
        l=l+1;
    end
end
psnr_rotate1 = psnr(R_IM1,A)
ssim_rotate1 = ssim(R_IM1,A)
psnr_rotate2 = psnr(R_IM2,A)
ssim_rotate2 = ssim(R_IM2,A)
end

