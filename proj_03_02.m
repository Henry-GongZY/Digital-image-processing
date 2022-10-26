% 读取图片
img = imread('./Images/Fig3.08(a).jpg');
% 绘制图片
subplot(2,2,1);
imshow(img);
% 绘制直方图
subplot(2,2,2);
imhist(img);
% 直方图均衡化
img1 = histeq(img,256);
subplot(2,2,3);
imshow(img1);
subplot(2,2,4);
imhist(img1);