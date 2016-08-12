function [q1,T] = TestStatistic(thetaDash,thetaDashU,theta_Z,theta_ZD,thetaU,thetaV,W,theta_COM,theta_COM1,theta_COM2,theta_RM1,theta_RM2,theta_TR,theta_CR,theta_B)
YHo = 0;
YU=0;
YV = 0;
Y1 = 0;
Y2 = 0;
YCOM = 0; YCOM1 = 0; YCOM2 = 0; YRM = 0; YRM1 = 0; YTR = 0; YCR = 0; YB = 0;
y = 0;
t =0;
t1 = 0; t01 = 0;
t2 = 0;
t3 = 0;
t4 = 0; t5 = 0; t6 = 0;  t7 = 0; t8 = 0; t9 = 0 ; t10 = 0; t11=0;
beta = pi/4 ;
FDash = zeros(32);
for m =1:1024
   FDashV(m) = thetaDash(m) + beta * W(m);
   FDashU(m) = thetaDashU(m) + beta * W(m);
   F_Z(m) = theta_Z(m) + beta * W(m);
   F_ZD(m) = theta_ZD(m) + beta * W(m);
   F_COM(m) = theta_COM(m) + beta * W(m);
   F_COM1(m) = theta_COM1(m) + beta * W(m);
   F_COM2(m) = theta_COM2(m) + beta * W(m);
   F_RM(m) = theta_RM1(m) + beta * W(m);
   F_RM1(m) = theta_RM2(m) + beta * W(m);
   F_TR(m) = theta_TR(m) + beta * W(m);
   F_CR(m) = theta_CR(m) + beta * W(m);
   F_B(m) = theta_B(m) + beta * W(m);
end

for i=1:1024
         YV = YV + FDashV(i).*W(i);
         YU = YU + FDashU(i).*W(i);
         y = y + thetaV(i).*W(i);
         Y1 = Y1 + F_Z(i).*W(i);
         Y2 = Y2 + F_ZD(i).*W(i);
         YCOM = YCOM + F_COM(i).*W(i);
         YCOM1 = YCOM1 + F_COM1(i).*W(i);
         YCOM2 = YCOM2 + F_COM2(i).*W(i);
         YRM = YRM + F_RM(i).*W(i);
         YRM1 = YRM1 + F_RM1(i).*W(i);
         YTR = YTR + F_TR(i).*W(i); 
         YCR = YCR + F_CR(i).*W(i);
         YB = YB + F_B(i).*W(i);
end
 for i=1:1024
    t01  = t01 + ((FDashU(i).*W(i))-(thetaU(i).*W(i))).^2;
    t1 = t1 + ((FDashV(i).*W(i))-(thetaV(i).*W(i))).^2;
    t2 = t2 + ((F_Z(i).*W(i))-(thetaV(i).*W(i))).^2;
    t3 = t3 + ((F_ZD(i).*W(i))-(thetaV(i).*W(i))).^2;
    t4 = t4 + ((F_COM(i).*W(i))-(thetaV(i).*W(i))).^2;
    t5 = t5 + ((F_COM1(i).*W(i))-(thetaV(i).*W(i))).^2;
    t6 = t6 + ((F_COM2(i).*W(i))-(thetaV(i).*W(i))).^2;
    t7 = t7 + ((F_RM(i).*W(i))-(thetaV(i).*W(i))).^2;
    t8 = t8 + ((F_RM1(i).*W(i))-(thetaV(i).*W(i))).^2;
    t9 = t9 + ((F_TR(i).*W(i))-(thetaV(i).*W(i))).^2;
    t10 = t10 + ((F_CR(i).*W(i))-(thetaV(i).*W(i))).^2;
    t11 = t11 + ((F_B(i).*W(i))-(thetaV(i).*W(i))).^2;
 end
v01 = sqrt(t01)/32;
v1 = sqrt(t1)/32
v2 = sqrt(t2)/32;
v3 = sqrt(t3)/32;
v4 = sqrt(t4)/32;
v5 = sqrt(t5)/32;
v6 = sqrt(t6)/32;
v7 = sqrt(t7)/32;
v8 = sqrt(t8)/32;
v9 = sqrt(t9)/32;
v10 = sqrt(t10)/32;
v11 = sqrt(t11)/32;
for i=1:1024
    YHo = YHo + thetaDash(i).*W(i);
end
for i=1:1024
    t = t + ((thetaDash(i).*W(i))-(thetaV(i).*W(i))).^2;
end
meanYHo = YHo/1024;
meanY = YV/1024;
meanY01 = YU/1024;
meanY1 = Y1/1024;
meanY2 = Y2/1024;
meanYCOM = YCOM/1024;
meanYCOM1 = YCOM1/1024;
meanYCOM2 = YCOM2/1024;
meanYRM = YRM/1024;
meanYRM1 = YRM1/1024;
meanTR = YTR/1024;
meanCR = YCR/1024;
meanYB = YB/1024;
v = sqrt(t)/32;
disp('The value of a statistic q for null hypothesis is:')
q = (meanYHo*32)/v
disp('The value of a statistic q1 for an alternative hypothesis is:')
q1 = (meanY*32)/v1
q01 = (meanY01*32)/v01
q2 = (meanY1*32)/v2
q3 = (meanY2*32)/v3
qCOM = (meanYCOM*32)/v4
qCOM1 = (meanYCOM1*32)/v5
qCOM2 = (meanYCOM2*32)/v6
qRM = (meanYRM*32)/v7
qRM1 = (meanYRM1*32)/v8
qTR = (meanTR*32)/v9
qCR = (meanCR*32)/v10
qB = (meanYB*32)/v11
sum1 = 0;
for i=1:1024
      sum1 = sum1 + W(i).*W(i);
end
temp = beta * sum1;
temp1 = temp/(v1*32);
temp01 = temp/(v01*32);
disp('The threshold value T is given by:')
T = 0.5 * temp1
T_U = 0.5 * temp01 
if q>T
    disp('watermark is detected and the null hypothesis is accepted');
else
    disp('Since q<T, the null hypothesis is rejected and the alternative hypothesis is accepted');
end
if q1>T 
   disp('Since q1 > T, this implies that the watermark is detected and the alternative hypothesis is accepted')
else
    disp('the alternative hypothesis is rejected')
end
fprintf('\nThe probability of false positive error at %f threshold, %f variance, %f mean is', T,v1,meanY )
fp = 1-normcdf(T,meanY,v1)
fpnoise1 = 1-normcdf(T,meanY1,v2)
fpnoise2 = 1-normcdf(T,meanY2,v3)
fpcomp = 1-normcdf(T,meanYCOM,v4)
fpcomp1 = 1-normcdf(T,meanYCOM1,v5)
fpcomp2 = 1-normcdf(T,meanYCOM2,v6)
fprotate1 = 1-normcdf(T,meanYRM,v7)
fprotate2 = 1-normcdf(T,meanYRM1,v8)
fptrans = 1-normcdf(T,meanTR,v9)
fpcrop = 1-normcdf(T,meanCR,v10)
fpblank = 1-normcdf(T,meanYB,v11)
end
                                                                                                                                          