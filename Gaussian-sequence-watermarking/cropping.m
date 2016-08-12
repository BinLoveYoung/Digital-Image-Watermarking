function [ I_CR,ALLV_CROP] = cropping( NEW,A )
IM_CR = zeros(16,16,1024);
k=1;
l=1;
ALLV_CROP = zeros(16,16,1024);
I_CR=NEW;
figure
subplot(1,2,1);
imshow(I_CR)
title('Watermarked Image');
subplot(1,2,2);
%IM_CROP=imcrop(I,[0,0,300,300]);
%CR = padarray(I,[50 50]);
for i =1:50
    for j=1:50
      I_CR(i,:)=0;
      I_CR(:,j)=0;
    end
end
for i=463:512
    for j = 463:512
        I_CR(i,:)=0;
        I_CR(:,j)=0;
    end
end

imshow(I_CR)
title('Cropped Image')


for i=1:16:512
    for j=1:16:512
        IM_CR(:,:,k) = I_CR(i:i+16-1,j:j+16-1);
        %Z_D1(:,:,k) = IM1(i:i+16-1,j:j+16-1);
        [~,~,VCr] = svd(IM_CR(:,:,k));
        %[U2,S2,V2] = svd(Z_D1(:,:,k));
        ALLV_CROP(:,:,l) = VCr;
       % ALLV2(:,:,l) = V2;
        k=k+1;
        l=l+1;
    end
end
psnr_crop = psnr(I_CR,A)
ssim_crop = ssim(I_CR,A)
end

