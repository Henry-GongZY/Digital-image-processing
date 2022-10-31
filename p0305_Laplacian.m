clear;
clc;
close all;

img=imread('Fig0338(a)(blurry_moon).tif');
[m,n]=size(img);

filter = [-1,-1,-1;-1,8,-1;-1,-1,-1];
img_1 = imfilter(img,filter,"replicate");

img_2 = double(img_1);
img_2 = (img_2 + 255)/2;
img_2 = uint8(img_2);

img_3 = img_1 + img;

figure;
subplot(221);
imshow(img);
title('原图');
subplot(222);
imshow(img_1); 
title('拉普拉斯滤波图像');
subplot(223);
imshow(img_2);
title('标定图像');
subplot(224);
imshow(img_3);
title('拉普拉斯增强图像');