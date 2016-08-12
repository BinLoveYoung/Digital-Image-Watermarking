function [thetaU,thetaV] = findAngle(ALLV,ALLU)
delta = 4;
thetaU = zeros(32,32);
thetaV = zeros(32,32);
for i=1:1024
    thetaV(i) = atan2(ALLV(7,6,i),ALLV(6,6,i))/delta;
    thetaU(i) = atan2(ALLU(7,6,i),ALLU(6,6,i))/delta;
end
end


