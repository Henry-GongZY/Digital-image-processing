clear;
clc;
close all;

img = imread('0343a.bmp');
subplot(241);
imshow(img);title("原图像");

% 滤波
filter = ones(3,3) / 9;
[m,n,c] = size(img);
result = zeros(m,n,c);

% pad
img1 = img;
img1 = [img1(1,:,:);img1;img1(m,:,:)];
img1 = [img1(:,1,:),img1,img1(:,n,:)];
[m,n,c] = size(img);
% conv
for i=1:m
    for j=1:n
        for k=1:3
            tmp = double(img1(i:i+2,j:j+2,k));
            M = tmp.*filter;
            result(i,j,k) = sum(M(:));
        end
    end
end

img2=uint8(result);
subplot(242);
imshow(img2);title("滤波图像");

imgd = imread('0343d.bmp');
subplot(243);
imshow(imgd);title("0343d");

A=2;
img4=immultiply(img,A);
img4=img4-img2;
img4=im2uint8(img4);
subplot(245);
imshow(img4);title("A=2");

A=2.3;
img4=immultiply(img,A);
img4=img4-img2;
img4=im2uint8(img4);
subplot(246);
imshow(img4);title("A=2.3");

A=2.5;
img4=immultiply(img,A);
img4=img4-img2;
img4=im2uint8(img4);
subplot(247);
imshow(img4);title("A=2.5");

A=3;
img4=immultiply(img,A);
img4=img4-img2;
img4=im2uint8(img4);
subplot(248);
imshow(img4);title("A=3");