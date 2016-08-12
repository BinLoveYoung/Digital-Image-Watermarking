function [W_IM ,S,Uw,Vw] = embedding(A,W,a,alpha)
Faf = frft(A, a);
Faw = frft(W,a);
F = reshape(Faf,[512,512]);
FW = reshape(Faw,[256,256]);
[U,S,V]=svd(F);
[Uw,Sw,Vw]=svd(FW);
Sdash=S;
for i=1:256
    Sdash(i,i) = S(i,i) + alpha*Sw(i,i);
end
Adash = U*Sdash*V';
W_IM=ifrft(Adash,a);
W_IM=reshape(W_IM,[512,512]);
W_IM=real(W_IM);
W_IM=uint8(W_IM);
figure
subplot(1,3,1)
imshow(A)
title('original image')
subplot(1,3,2)
imshow(uint8(W))
title('watermark')
subplot(1,3,3)
imshow(W_IM)
title('watermarked image')
peaksnr = psnr(W_IM,A)

end

