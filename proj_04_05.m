% Correlation in the Frequency Domain
close all;
clc;
clear;


f1 = imread('./Images/Fig4.41(a).jpg');
f2 = imread('./Images/Fig4.41(b).jpg');
f1 = rgb2gray(f1);
f2 = rgb2gray(f2);

[M1, N1] = size(f1);
[M2, N2] = size(f2);
% P=M1+ M2-1;Q= N1+ N2-1;
P = 400;Q = 400;
fp1 = zeros(P, Q);
fp2 = zeros(P, Q);
fp1(1:M1, 1:N1) = f1(1:M1, 1:N1);
fp2(1:M2, 1:N2) = f2(1:M2, 1:N2);

for x = 1:P
    for y = 1:Q
        fp1(x, y) = fp1(x, y) .* (-1)^(x+y);
        fp2(x, y) = fp2(x, y) .* (-1)^(x+y);
    end
end

% 傅里叶变换
Fp1 = fft2(fp1);
Fp2 = fft2(fp2);

% 求共轭
Fp = Fp2 .* conj(Fp1);

% 傅里叶变换
fp = ifft2(Fp);

% 乘以(-1)^(x+y)
for x = 1:P
    for y = 1:Q
        fp(x, y) = fp(x, y) .* (-1)^(x+y);
    end
end

fp = real(fp);
fp = mat2gray(fp);

% 显示结果
subplot(2,2,1);
imshow(f1);title('Fig4.41(a)');
subplot(2,2,2);
imshow(f2);title('Fig4.41(b)');
subplot(2,2,3);
imshow(fp);title('result');

max_value = max(max(fp));
[row col] = find(fp == max_value);

disp(['max value is : ', num2str(max_value)]);
disp(['row: ', num2str(row), ' col: ', num2str(col)]);