function [G_V] = getUnitaryMatrix(phiV) 
i=6;
j=7;
k=1;
G_V = zeros(16,16,1024);
for m =1:1024
        G_V(1,1,k) = 1;
        G_V(2,2,k) = 1;
        G_V(3,3,k) = 1;
        G_V(4,4,k) = 1;
        G_V(5,5,k) = 1;
        G_V(8,8,k) = 1;
        G_V(9,9,k) = 1;
        G_V(10,10,k) = 1;
        G_V(11,11,k) = 1;
        G_V(12,12,k) = 1;
        G_V(13,13,k) = 1;
        G_V(14,14,k) = 1;
        G_V(15,15,k) = 1;
        G_V(16,16,k) = 1;
        G_V(i,i,k) = cos(phiV(m));
        G_V(i,j,k) = sin(phiV(m));
        G_V(j,i,k) = -sin(phiV(m));
        G_V(j,j,k) = cos(phiV(m));
        k = k+1;
end
end

