function g=Moire_fringes(f)
[M,N,~] = size(f); %fΪ����ͼ��
F = fftshift(fft2(f)); % ͼ��Ƶ��
% figure;plot(abs(F(M/2+1,:))); % x��������
% ����n�װ��������ݲ����������޸�D0��n��ø��õ�Ч����
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
% �˲�
G = fftshift(F.*H);
g = real(ifft2(G));