% This code helps in loading the unitary matrix G and then apply the
% transpose of the unitary matrix to all the right singular vector matrix 
% V to obtain the
% transformed matrix VDASH. This VDASH is then used to get back the
% transformed blocks of image i.e by the inverse SVD. The matrix is BDASH

function [UDASH,VDASH,BDASH] = applyingUnitaryMatrix(ALLV,G_V,G_U,ALLU,ALLS)
VDASH = zeros(16,16,1024);
BDASH = zeros(16,16,1024);
UDASH = zeros(16,16,1024);
for i = 1:1024
    VDASH(:,:,i) = ALLV(:,:,i) * G_V(:,:,i)';
    UDASH(:,:,i) = ALLU(:,:,i) * G_U(:,:,i)';
    BDASH(:,:,i) = UDASH(:,:,i) * ALLS(:,:,i) * VDASH(:,:,i)';
end
end
