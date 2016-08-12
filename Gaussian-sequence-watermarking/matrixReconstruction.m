% This code helps to reconstruct the image which is now a watermarked
% image. Here NEWA is the matrix i.e, the watermarked image which is the
% concatenation of all the 16x16 smaller blocks of images BDASH.
function [peakpsnr,NEWA,NEW] = matrixReconstruction(BDASH,A)
N = 512;
m=16;
NEWA = zeros(512,512);
k=1;
for i = 1:m:N
    for j = 1:m:N
        NEWA(i:i+m-1,j:j+m-1) = BDASH(:,:,k);
        k=k+1;
    end
end
NEW = uint8(NEWA);
%NEWD = dct(double(NEWA));
figure
ax(1)=subplot(1,2,1);
imshow(A);
title('Original Image')
ax(2) = subplot(1,2,2);
imshow(NEW)
title('Watermarked image');
%EX = NEWD-AD;
%hist(EX);
disp('The peak-signal-to-noise-ratio is given by:')
peakpsnr = psnr(NEW,A)
end