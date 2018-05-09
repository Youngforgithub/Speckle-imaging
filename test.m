clear all;clc
z=ones(300,300);
for x=1:300
    for y=1:300
        f=1+sin(0.2*x+0.2*y+pi*3/2);
        z(x,y)=255/2*f;
    end
end
imshow(z,[])