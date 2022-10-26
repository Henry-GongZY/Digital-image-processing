% 读取图片
img = imread("Images\Fig3.40(a).jpg");
subplot(2,2,1)
imshow(img);
title('input');

% 设置滤波mask
w = [-1,-1,-1;-1,8,-1;-1,-1,-1];
% 滤波
img_output = imfilter(img,w,"replicate");
subplot(2,2,2)
imshow(img_output);
title('output')

% 叠加
img_plus = imadd(img, img_output);
subplot(2,2,3)
imshow(img_plus)
title('plus')