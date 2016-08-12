function [ J,ALLV_TR] = translation( NEW,A )
I = NEW;
k=1;
l=1;
TRANS = zeros(16,16,1024);
ALLV_TR = zeros(16,16,1024);
J = imtranslate(I,[15, 25]);
figure
subplot(1,2,1);
imshow(I)
title('Watermarked Image')
subplot(1,2,2);
imshow(J)
title('Translated Image')
for i=1:16:512
    for j=1:16:512
        TRANS(:,:,k) = J(i:i+16-1,j:j+16-1);
        [~,~,V_T] = svd(TRANS(:,:,k));
        ALLV_TR(:,:,l) = V_T;
        k=k+1;
        l=l+1;
    end
end
psnr_trans = psnr(J,A)
ssim_trans = ssim(J,A)
end

