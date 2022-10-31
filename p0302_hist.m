clear;
clc;
close all;

img = imread('Fig0308(a)(fractured_spine).tif');
subplot(2,2,1);
imshow(img);title("原图像");

subplot(2,2,2);
imhist(img);title("原图像直方图");

% histogram equalization
img1 = histeq(img,256);
subplot(2,2,3);
imshow(img1);title("直方图均衡化后的图像");

subplot(2,2,4);
imhist(img1);title("直方图均衡化后的直方图");
