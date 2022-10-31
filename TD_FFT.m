% This is proj_04_01
function img_o = TD_FFT(img, core, display)

if display==1
    subplot(1,3,1);
    imshow(img);
    title('原图像');
    subplot(1,3,2);
    imshow(core);
    title('滤波核');
end

[M,N] = size(img);
P = M * 2;
Q = N * 2;

% add zeros to the image
img_fp = zeros(P, Q);
img_fp(1:M, 1:N) = img(1:M, 1:N);

img_f = zeros(P, Q);
% img = img * (-1)^(x+y)
for x = 1:P
    for y = 1:Q
        img_f(x, y) = img_fp(x, y) .* (-1)^(x + y);
    end
end

% do fft
img_F = fft2(img_f);

img_G = img_F .* core;

% do ifft
% I only wanna real part
img_g = real(ifft2(img_G));

% img = img * (-1)^(x+y)
for x = 1:P
    for y = 1:Q
        img_g(x, y) = img_g(x, y) .* (-1)^(x + y);
    end
end

img_o = img_g(1:M, 1:N);

if display==1
    subplot(1,3,3)
    imshow(img);
    title('高斯低通滤波后的图像');
end

end