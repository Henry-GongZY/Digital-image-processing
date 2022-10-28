function img = TD_FFT(img, core, display)

if display==1
    subplot(1,3,1);
    imshow(img);
    title('原图像');
    subplot(1,3,2);
    imshow(core);
    title('滤波核');
end

[x,y] = size(img);
p = x * 2;
q = y * 2;

% add zeros to the image
img_fp = zeros(p, q);
img_fp(1:x, 1:y) = img(1:x, 1:y);

% img = img * (-1)^(x+y)
for X = 1:p
    for Y = 1:q
        img_fp(X, Y) = img_fp(X, Y) .* (-1)^(X + Y);
    end
end

% do fft
img_fp = fft2(img_fp);

img_fp = img_fp.*core;

% do ifft
img_fp = ifft2(img_fp);

% I only wanna real
img_fp = real(img_fp);

% img = img * (-1)^(x+y)
for X = 1:p
    for Y = 1:q
        img_fp(X, Y) = img_fp(X, Y) .* (-1)^(X + Y);
    end
end

img = img_fp(1:x, 1:y);

if display==1
    subplot(1,3,3)
    imshow(img);
    title('输出图像');
end

end