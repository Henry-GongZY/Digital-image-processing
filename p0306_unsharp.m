clear;
clc;
close all;

img = imread('0343a.bmp');
figure;
subplot(221);
imshow(img);title("原图像");

filter=fspecial('average',[3,3]);%3*3均值滤波
img2=imfilter(img,filter);
subplot(222);
imshow(img2);title("滤波图像");

A=3;
img3=immultiply(img,A);
img4=img3-img2;
img4=im2uint8(img4);
subplot(223);
imshow(img4);title("最终图像");

imgd = imread('0343d.bmp');
subplot(224);
imshow(imgd);title("0343d");