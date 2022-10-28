img = imread('./Images/Fig3.04(a).jpg');
img = mat2gray(img);

% Generate filter function
[M,N] = size(f);
P = 2 * M;
Q = 2 * N;
alf = 100;
H = zeros(P, Q);
for i = 1:P
    for j = 1:Q
        H(i, j) = exp(-((i-P/2)^2 + (j-Q/2)^2) / (2 * alf^2));
    end
end

TD_FFT(img, H, 1);