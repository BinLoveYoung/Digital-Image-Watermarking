function [ CompressedIM,CompressedIM1,CompressedIM2,ALLV_COM,ALLV_COM1,ALLV_COM2] = Compression( NEW ,A)
m = 16;
k=1;
l=1;
IMCOM = zeros(m,m,1024);
IM_COM1 = zeros(m,m,1024);
IM_COM2 = zeros(m,m,1024);
ALLV_COM = zeros(m,m,1024);
ALLV_COM1 = zeros(m,m,1024);
ALLV_COM2 = zeros(m,m,1024);
imwrite(NEW,'wm_lena.jpg','Mode','lossy','Quality',90);
imwrite(NEW,'wm_lena1.jpg','Mode','lossy','Quality',75);
imwrite(NEW,'wm_lena2.jpg','Mode','lossy','Quality',60);
CompressedIM = imread ('wm_lena.jpg');
CompressedIM1 = imread ('wm_lena1.jpg');
CompressedIM2 = imread ('wm_lena2.jpg');
figure
ax(1)=subplot(1,3,1);
imshow(CompressedIM);
title('QF = 90')
ax(2) = subplot(1,3,2);
imshow(CompressedIM1)
title('QF = 75')
ax(3) = subplot(1,3,3);
imshow(CompressedIM2)
title('QF = 60')
for i=1:16:512
    for j=1:16:512
        IMCOM(:,:,k) = CompressedIM(i:i+16-1,j:j+16-1);
        IM_COM1(:,:,k) = CompressedIM1(i:i+16-1,j:j+16-1);
        IM_COM2(:,:,k) = CompressedIM2(i:i+16-1,j:j+16-1);
        [~,~,VC] = svd(IMCOM(:,:,k));
        [~,~,VC1] = svd(IM_COM1(:,:,k));
        ALLV_COM1(:,:,l) = VC1;
        [~,~,VC2] = svd(IM_COM2(:,:,k));
        ALLV_COM2(:,:,l) = VC2;
        ALLV_COM(:,:,l) = VC;
        k=k+1;
        l=l+1;
    end
end
peaksnr_comp = psnr(CompressedIM,A)
ssimval_comp = ssim(CompressedIM,A)
peaksnr_comp1 = psnr(CompressedIM1,A)
ssimval_comp1 = ssim(CompressedIM1,A)
peaksnr_comp2 = psnr(CompressedIM2,A)
ssimval_comp2= ssim(CompressedIM2,A)
end

