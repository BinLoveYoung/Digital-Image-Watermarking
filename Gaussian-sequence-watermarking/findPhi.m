function [phiV,chiV,taoV] = findPhi(ALLV,alphaV)
phiV = zeros(32,32);
chiV = zeros(32,32);
taoV = zeros(32,32);
for i=1:1024
    x = ALLV(6,6,i);
    y = ALLV(7,6,i);
    z = ALLV(6,7,i);
    w = ALLV(7,7,i);
    chiV(i) = atan2((x*sin(alphaV(i))-y*cos(alphaV(i))),(z*sin(alphaV(i))-w*cos(alphaV(i))))+pi;
    taoV(i) = atan2(x*sin(alphaV(i))-y*cos(alphaV(i)),z*sin(alphaV(i))-w*cos(alphaV(i)));
    if ((y*cos(taoV(i))-w*sin(taoV(i))) < 0 && alphaV(i) > 0 )|| ((y*cos(taoV(i))-w*sin(taoV(i))) > 0 && alphaV(i) < 0)
      phiV(i) = chiV(i); 
    else
        phiV(i) = taoV(i);
    end
end
end