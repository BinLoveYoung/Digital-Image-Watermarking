
function [phiU,chiU,taoU] = findPhiU(ALLU,alphaU)
phiU = zeros(32,32);
chiU = zeros(32,32);
taoU = zeros(32,32);
for i=1:1024
    x = ALLU(6,6,i);
    y = ALLU(7,6,i);
    z = ALLU(6,7,i);
    w = ALLU(7,7,i);
    chiU(i) = atan2((x*sin(alphaU(i))-y*cos(alphaU(i))),(z*sin(alphaU(i))-w*cos(alphaU(i))))+pi;
    taoU(i) = atan2(x*sin(alphaU(i))-y*cos(alphaU(i)),z*sin(alphaU(i))-w*cos(alphaU(i)));
    if ((y*cos(taoU(i))-w*sin(taoU(i))) < 0 && alphaU(i) > 0 )|| ((y*cos(taoU(i))-w*sin(taoU(i))) > 0 && alphaU(i) < 0)
      phiU(i) = chiU(i); 
    else
        phiU(i) = taoU(i);
    end
end
end