clear all;clc
z=ones(300,300);
for x=1:300
    for y=1:300
        f=1+sin(2*pi*512*x/10+2*pi*512/10*y+pi*3/2);
        z(x,y)=255/2*f;
    end
end
imshow(z,[])