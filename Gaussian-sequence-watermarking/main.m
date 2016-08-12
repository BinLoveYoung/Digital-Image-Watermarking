clear all
clc
A = imread('lenaTest3.jpg');
[ALLV,ALLU,ALLS] = watermarkEmbedding(A);
[thetaU,thetaV] = findAngle(ALLV,ALLU);
[alphaU,alphaV,W] = addWatermark(thetaU,thetaV);
[phiV,chiV,taoV] = findPhi(ALLV,alphaV);
[phiU,chiU,taoU] = findPhiU(ALLU,alphaU);
[G_V] = getUnitaryMatrix(phiV);
[G_U] = getUnitaryMatrixU(phiU);
[UDASH,VDASH,BDASH] = applyingUnitaryMatrix(ALLV,G_V,G_V,ALLU,ALLS);
[peakpsnr,NEWA,NEW] = matrixReconstruction(BDASH,A);
[B_D,ALLV_D,ALLU_D] = WatermarkDetection(NEW);
[Z_D,ALLV1,ALLV2,Z_D1] = addnoise(NEW,A);
[ CompressedIM,CompressedIM1,CompressedIM2,ALLV_COM,ALLV_COM1,ALLV_COM2] = Compression( NEW,A );
[R_IM1,R_IM2,ALLV_RM1,ALLV_RM2 ] = Rotation( NEW,A );
[ CR ,ALLV_CROP] = cropping( NEW ,A);
[ J,ALLV_TR ] = translation( NEW ,A);
[I ,ALLV_B] = row_col_blank( NEW ,A);
[thetaDash,thetaDashU,theta_Z,theta_ZD,theta_COM,theta_COM1,theta_COM2,theta_RM1,theta_RM2,theta_TR,theta_CR,theta_B] = AngleOfWatermarked(ALLV_D,ALLU_D,ALLV1,ALLV2,ALLV_COM,ALLV_COM1,ALLV_COM2,ALLV_RM1,ALLV_RM2,ALLV_TR,ALLV_CROP,ALLV_B);
[q1,T] = TestStatistic(thetaDash,thetaDashU,thetaU,thetaV,theta_Z,theta_ZD,W,theta_COM,theta_COM1,theta_COM2,theta_RM1,theta_RM2,theta_TR,theta_CR,theta_B);
