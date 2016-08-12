function [I,ALLV_B ] = row_col_blank( NEW,A )
I = NEW;
k=1;
l=1;
R_C_B = zeros(16,16,1024);
ALLV_B = zeros(16,16,1024);
I(14,:) = 0;
I(169,:) = 0;
I(119,:) = 0;
I(:,26) = 0;
I(:,99) = 0;
I(:,192) = 0;
figure
subplot(1,2,1)
imshow(NEW)
title('Watermarked Image')
subplot(1,2,2)
imshow(I)
title('After ROW.COL.BLANKING attack')
for i=1:16:512
    for j=1:16:512
        R_C_B(:,:,k) = I(i:i+16-1,j:j+16-1);
        [~,~,VB] = svd(R_C_B(:,:,k));
        ALLV_B(:,:,l) = VB;
        k=k+1;
        l=l+1;
    end
end
psnr_R_C_blank = psnr(I,A)
ssim_R_C_blank = ssim(I,A)
end

