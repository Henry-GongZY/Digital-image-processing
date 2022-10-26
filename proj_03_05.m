% read in picture
img = imread("Images\Fig3.40(a).jpg");
subplot(2,2,1)
imshow(img);
title('input');

% set filter mask
w = [-1,-1,-1;-1,8,-1;-1,-1,-1];
% filter
img_output = imfilter(img,w,"replicate");
subplot(2,2,2)
imshow(img_output);
title('output')

% add
img_plus = imadd(img, img_output);
subplot(2,2,3)
imshow(img_plus)
title('plus')