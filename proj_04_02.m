I=imread('./Images/a.png');
X=rgb2gray(I);

[M,N]=size(X);
Y=fft2(X);
K=fftshift(Y);
T=ifftshift(K);
origin=ifft2(T);
origin=uint8(origin);
imf=abs(K);
average=K(floor(M/2)+1,floor(N/2));

subplot(2,3,1);
imshow(I);
title('原始图像');

subplot(2,3,2);
imshow(X);
title('灰度图像');

subplot(2,3,3);
imshow(K);
title('傅里叶变换并居中后');

subplot(2,3,4);
imshow(origin);
title('傅里叶逆变换结果');

subplot(2,3,5);
imshow(log(1+imf),[]);
title('光谱图');