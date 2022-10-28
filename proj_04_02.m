f=imread('./Images/Fig3.04(a).jpg');
F=fft2(f);
[M,N]=size(f);

s=sum(sum(abs(F(1:M,1:N))));
average_value_of_imagine= s / (M * N);
S=log(1 + abs(F));
figure;
plot(S);
title('二维图像显示幅度谱')

x=0:1:255;
y=0:1:255;
[x,y]=meshgrid(x,y);
figure;
mesh(S);
title('三维图像显示幅度谱')
 
Q=angle(F);
figure;
plot(Q);
title('二维图像显示相位谱') 
 
x=0:1:255;
y=0:1:255;
[x,y]=meshgrid(x,y);
figure;
mesh(Q);
title('三维图形显示相位谱')