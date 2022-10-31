close all;
clc;
clear;

img = imread('./Images/Fig0448(a)(characters_test_pattern).tif');
img = mat2gray(img);
subplot(2,4,1);
imshow(img);
title('原图像');

[M, N] = size(img);
P = 2 * M;
Q = 2 * N;

% add zeros to the image
img_fp = zeros(P, Q);
img_fp(1:M, 1:N) = img(1:M, 1:N);
subplot(2,4,2);
imshow(img_fp);
title('填充后的图像')

% img = img * (-1)^(x+y)
img_f = zeros(P, Q);
for x = 1:P
    for y = 1:Q
        img_f(x, y) = img_fp(x, y) .* (-1)^(x+y);
    end
end
subplot(2,4,3);
imshow(img_f);
title('用(-1)^(x+y)相乘的结果')

img_F = fft2(img_f); 
img_FP = sqrt(real(img_F).^2 + imag(img_F).^2);
subplot(2,4,4);
imshow(img_FP);
title('上一步得到图像的DFT的谱图')

% Generate filter function
[M, N] = size(img);
P = 2 * M;
Q = 2 * N;

%截止频率
D0 = 100;                             
H = zeros(P, Q);
for i = 1:P
    for j = 1:Q
        H(i, j) = exp(-((i-P/2)^2 + (j-Q/2)^2) / (2 * D0^2));
    end
end

subplot(2,4,5);
imshow(H);
title('高斯低通滤波函数');

img_G = img_F .* H;
img_GP = sqrt(real(img_G).^2 + imag(img_G).^2);
subplot(2,4,6);
imshow(img_GP);
title('乘积HF的谱图')

% do ifft
% I only wanna real part
img_g = real(ifft2(img_G));

% img = img * (-1)^(x+y)
for x = 1:P
    for y = 1:Q
        img_g(x, y) = img_g(x, y) .* (-1)^(x+y); 
    end
end

img_o = img_g(1:M, 1:N);

subplot(2,4,7);
imshow(img_o);
title('高斯低通滤波后的图像');

img_D = img - img_o;
subplot(2,4,8);
imshow(img_D);
title('原图像减去高斯低通滤波后得到的锐化图像');