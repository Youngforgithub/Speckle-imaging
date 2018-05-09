clear;clc
%% 读取数据
cm1_1=imread('1cm/1cm（1）.bmp');
cm1_2=imread('1cm/1cm（2）.bmp');
%% 去除莫尔条纹
% cm1_11=rgb2hsv(cm1_1);
% cm1_11(:,:,3)=Moire_fringes(cm1_11(:,:,3));
% cm1_11=hsv2rgb(cm1_11);
% figure,
% subplot(1,2,1),imshow(cm1_1);
% subplot(1,2,2),imshow(cm1_11);
% cm1_21=rgb2hsv(cm1_2);
% cm1_21(:,:,3)=Moire_fringes(cm1_21(:,:,3));
% cm1_21=hsv2rgb(cm1_21);
% figure,
% subplot(1,2,1),imshow(cm1_2);
% subplot(1,2,2),imshow(cm1_21);
% figure,
% subplot(1,2,1),imshow((cm1_1-cm1_2),[]);
% subplot(1,2,2),imshow((cm1_11-cm1_21),[]);
% cm1_3=cm1_1-cm1_2;
% cm1_31=rgb2hsv(cm1_3);
% cm1_31(:,:,3)=Moire_fringes(cm1_31(:,:,3));
% cm1_31=hsv2rgb(cm1_31);
% figure,
% subplot(1,2,1),imshow(cm1_3,[]);
% subplot(1,2,2),imshow(cm1_31,[]);
%% 计算参数
cm1_11=rgb2gray(cm1_1);
cg=contrast(cm1_11);
LumAve = sum(sum(cm1_11))/numel(cm1_11);%平均亮度
f=10*pi;%频率
cm1_11=cm1_11(180:420,140:380);%裁剪投影图片
k=1;%与探测器有关的因子？？
syms x y fx fy;
P1=exp(-j*2*pi*(fx*x+fy*y));
R=0*x+0*y+1;%反射因子;
D=2*cg*LumAve*int(int(R*P1,x,[1,241]),y,[1,241]);
I=zeros(241,241);
for m=1:241
    for n=1:241
        m
        n
        I=int(int(D*exp(1i*2*pi*(fx*m+fy*n)),[-inf,inf]),[-inf,inf]);
        I(m,n)=double(I);
    end
end