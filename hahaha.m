clc;%x139-381=243,y176-422=247
clear all
clf
 XX1=imread('51.bmp');XX1=rgb2gray(XX1);
 XX2=imread('52.bmp');XX2=rgb2gray(XX2);
 XX3=imread('53.bmp');XX3=rgb2gray(XX3);
 XX4=imread('54.bmp');XX4=rgb2gray(XX4);
 for b=1:247
     for a=1:243
         X1(a,b)=XX1(a+175,b+138);
     end
 end
 for b=1:247
     for a=1:243
         X2(a,b)=XX2(a+175,b+138);
     end
 end
 for b=1:247
     for a=1:243
         X3(a,b)=XX3(a+175,b+138);
     end
 end
 for b=1:247
     for a=1:243
         X4(a,b)=XX4(a+175,b+138);
     end
 end
 figure(1);imshow(X1);
 figure(2);imshow(X2);
 figure(3);imshow(X3);
 figure(4);imshow(X4);
 
 [M N]=size(X1);
 I1=double(X1);
 I2=double(X2);
 I3=double(X3);
 I4=double(X4);

for b=1:N
    for a=2:M
        Dfp(a,b)=I1(a,b)*cos(2*pi*0/4)+I2(a,b)*cos(2*pi*1/4)+I3(a,b)*cos(2*pi*2/4)+I4(a,b)*cos(2*pi*3/4)  + b*I1(a,b)*sin(2*pi*0/4)+b*I2(a,b)*sin(2*pi*1/4)+b*I3(a,b)*sin(2*pi*2/4)+b*I4(a,b)*sin(2*pi*3/4); 
    end
end
    
for b=1:N
    for a=1:M
        sum=0;
        for bb=1:N
            for aa=1:M
                sum=sum+Dfp(aa,bb)*exp(j*2*pi*((aa-1)/M*a+(bb-1)/N*b));
            end
        end
        I(a,b)=sum;
    end
end
             %四步相移法计算出相位 
figure(5);
imshow(I);