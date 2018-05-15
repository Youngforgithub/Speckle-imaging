clear;clc
%% 读取数据
cm1_1=imread('1cm/1cm（1）.bmp');
cm1_2=imread('1cm/1cm（2）.bmp');
cm1_3=imread('1cm/1cm（3）.bmp');
cm1_4=imread('1cm/1cm（4）.bmp');

%% 图片处理

cm1_11=rgb2gray(cm1_1);
cm1_12=rgb2gray(cm1_2);
cm1_13=rgb2gray(cm1_3);
cm1_14=rgb2gray(cm1_4);

cm1_11=double(cm1_11(180:420,140:380));%裁剪投影图片
cm1_12=double(cm1_12(180:420,140:380));%裁剪投影图片
cm1_13=double(cm1_13(180:420,140:380));%裁剪投影图片
cm1_14=double(cm1_14(180:420,140:380));%裁剪投影图片

D=(cm1_11-cm1_13)+1i*(cm1_12-cm1_14);

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
%% 计算参数1
cg=contrast(cm1_11);
LumAve = sum(sum(cm1_11))/numel(cm1_11);%平均亮度
f=10*pi;%频率

k=1;%与探测器有关的因子？？
% syms x y fx fy;
% P1=exp(-1i*2*pi*(fx*x+fy*y));
% R=0*x+0*y+1;%反射因子;
% D=2*cg*LumAve*int(int(R*P1,x,[1,241]),y,[1,241]);
% I=zeros(241,241);
% for m=1:241
%     for n=1:241
%         m
%         n
%         I=int(int(D*exp(1i*2*pi*(fx*m+fy*n)),[-inf,inf]),[-inf,inf]);
%         I(m,n)=double(I);
%     end
% end
%% 计算参数2
% midP1=cos(0.2*x+0.2*y);
% midP2=cos(0.2*x+0.2*y+pi/2);
% midP3=cos(0.2*x+0.2*y+pi);
% midP4=cos(0.2*x+0.2*y+pi*3/2);
% 
% D1=LumAve*k*int(int(R,[1,241]),[1,241])+cg*k*int(int(R*midP1,[1,241]),[1,241]);
% D2=LumAve*k*int(int(R,[1,241]),[1,241])+cg*k*int(int(R*midP2,[1,241]),[1,241]);
% D3=LumAve*k*int(int(R,[1,241]),[1,241])+cg*k*int(int(R*midP3,[1,241]),[1,241]);
% D4=LumAve*k*int(int(R,[1,241]),[1,241])+cg*k*int(int(R*midP4,[1,241]),[1,241]);

%% 成像
Image=ifft2(D)/(2*cg*k);
imshow(Image,[]);