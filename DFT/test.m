a = imread('./Images/Fig3.04(a).jpg');
a = im2double(a);

subplot(1,2,1);
imshow(a);
title('原图');
c = fft2(a);
d = mydft2(a);

error = sum(sum((real(c)-real(d)).^2));
if error < 0.0001
    fprintf('DFT一致!\n');
else
    fprintf('DFT不一致!\n');
end

e = ifft2(c);
f = myidft2(c);

error = sum(sum((real(e)-real(f)).^2));
if error < 0.0001
    fprintf('iDFT一致!\n');
else
    fprintf('iDFT不一致!\n');
end

subplot(1,2,2);
imshow(f)
title('变换图')