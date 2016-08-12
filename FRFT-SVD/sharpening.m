function [ sharp_IM ] = sharpening( A,S,W,W_IM ,a,alpha,Uw,Vw )
H = fspecial('unsharp');
sharp_IM = imfilter(W_IM,H,'replicate');
figure
subplot(1,2,1)
imshow(W_IM)
title('watermarked image')
subplot(1,2,2)
imshow(sharp_IM)
title('sharpened Image')
B_S = frft(sharp_IM,a);
F_S=reshape(B_S,[512,512]);
[Us,Ss,Vs] = svd(F_S);
for i=1:256
    EX_S(i,i)=(Ss(i,i)-S(i,i))/alpha;
end
EX=Uw*EX_S*Vw';
EX = ifrft(EX,a);
EX=reshape(EX,[256,256]);
EX=real(EX);
EX_S=uint8(EX);
figure
subplot(1,2,1)
imshow(uint8(W))
title('original watemark')
subplot(1,2,2)
imshow(EX_S)
title('extracted watermark from a sharpened image')
peaksnr_sharp_wm = psnr(EX_S,uint8(W))
% temp = sum(not(xor(W(:),EX_N(:))));
% BCR = (temp/(256*256))*100
% r = corrcoef(double(W),double(EX_N))
peaksnr_sharp=psnr(sharp_IM,uint8(A))
ssimval_sharp = ssim(sharp_IM,uint8(A))
end