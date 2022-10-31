function [output] = mydft2(image)
% The 2D DFT algorithm implemented by myself

%image = im2double(image); 
%image = rgb2gray(image);
[M,N] = size(image);

% Matrixs needed for 2D DFT:
Wm = exp(-j*2*pi/M);
Wn = exp(-j*2*pi/N);
Em = zeros(M);
En = zeros(N);     
Gm = zeros(M)+Wm;
Gn = zeros(N)+Wn; 
output = zeros(M,N);

fprintf('2D DFT start:\n');
for row = 0:M-1
    for col = 0:M-1
        Em(row+1,col+1) = row * col;
        Gm(row+1,col+1) = Gm(row+1,col+1)^Em(row+1,col+1);
    end
end

for row = 0:N-1
    for col = 0:N-1
        En(row+1,col+1) = row * col;
        Gn(row+1,col+1) = Gn(row+1,col+1)^En(row+1,col+1);
    end
end

output = real(Gm * image * Gn);

end

