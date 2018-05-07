function g=Moire_fringes(f)
[M,N,~] = size(f); %f为含噪图像
F = fftshift(fft2(f)); % 图像频域
% figure;plot(abs(F(M/2+1,:))); % x方向横截线
% 构造n阶巴特沃兹陷波器，可以修改D0和n获得更好的效果。
u = 0:(M-1);
v = 0:(N-1);
[V,U] = meshgrid(v,u);
D0 = 10;
n = 2;
v0 = 113;
v1 = 145;
D1 = abs(V-v0);
D2 = abs(V-v1);
H = 1./(1+(D0^2./(D1.*D2)).^n); 
% 滤波
G = fftshift(F.*H);
g = real(ifft2(G));