clear;clc
%%
D1=double(imread('PSF照片/计算组(1,2,3,4,4.5cm)/2（1）.bmp'));
I1=double(imread('PSF照片/计算组(1,2,3,4,4.5cm)/2（2）.bmp'));
T1=double(imread('PSF照片/参考组(1,2,3,4cm)/2.bmp'));
D1=D1(89:380,146:437);
I1=I1(89:380,146:437);
T1=T1(89:380,146:437);
% imshow(D1);
% figure,imshow(I1);
% figure,imshow(T1);
%% 相除1
% P1=D1/I1;
% I2=inv(P1)*T1;
% imshow(I2/255)
%% 相除2
% P1=I1/D1;
% I2=P1*T1;
% imshow(I2/255)
%% 相乘
% P1=D1*I1;
% I2=inv(T1)*P1;
% imshow(I2/255)
%% 卷积
P1=ifft2(fft2(D1)./fft2(I1));
I2=ifft2(fft2(T1)./fft2(P1));
I2=uint8(I2);
imshow(I2)