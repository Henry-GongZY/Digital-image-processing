clear;
clc;
close all;

img = imread('Fig0308(a)(fractured_spine).tif');
figure;
subplot(321);
imshow(img);title("原图像");
subplot(322);
imhist(img);title("原图像直方图");
img1 = histeq(img);
subplot(323);
imshow(img1);title("直方图均衡化后的图像");
subplot(324);
imhist(img1);title("直方图均衡化后的直方图");


% histogram equalization
bins = 256;
nbin = imhist(img,bins)';
% Generate cumulative hgram
% cum   - Cumulative bincounts of input
cum = cumsum(nbin);
cum = cum/(numel(img));
sk = cum * 255.0;
sk = round(sk);
[row,col] = size(img);
img2 = zeros(row,col);
for i=1:row
    for j=1:col
        img2(i,j) = sk(1,img(i,j)+1)-1;
    end
end
img2 = uint8(img2);
subplot(325);
imshow(img2);title("实现直方图均衡化");

subplot(326);
imhist(img2);title("直方图均衡化后的直方图");


