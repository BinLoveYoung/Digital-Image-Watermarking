function [G_U] = getUnitaryMatrixU(phiU) 
i=6;
j=7;
k=1;
G_U = zeros(16,16,1024);
for m =1:1024
        G_U(1,1,k) = 1;
        G_U(2,2,k) = 1;
        G_U(3,3,k) = 1;
        G_U(4,4,k) = 1;
        G_U(5,5,k) = 1;
        G_U(8,8,k) = 1;
        G_U(9,9,k) = 1;
        G_U(10,10,k) = 1;
        G_U(11,11,k) = 1;
        G_U(12,12,k) = 1;
        G_U(13,13,k) = 1;
        G_U(14,14,k) = 1;
        G_U(15,15,k) = 1;
        G_U(16,16,k) = 1;
        G_U(i,i,k) = cos(phiU(m));
        G_U(i,j,k) = sin(phiU(m));
        G_U(j,i,k) = -sin(phiU(m));
        G_U(j,j,k) = cos(phiU(m));
        k = k+1;
end
end



