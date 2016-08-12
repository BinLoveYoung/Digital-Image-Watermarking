function [alphaU,alphaV,W] = addWatermark(thetaU,thetaV)
beta = pi/4 ;
rng('default');
W = randn(32);
alphaU = zeros(32);
alphaV = zeros(32);
for m =1:1024
   alphaU(m) = thetaU(m) + beta * W(m);
   alphaV(m) = thetaV(m) + beta * W(m);
end
end
