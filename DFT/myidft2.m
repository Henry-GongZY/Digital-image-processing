function [image] = myidft2(input)
% The 2D iDFT algorithm implemented by myself

[M,N] = size(input);

% Matrixs needed for 2D iDFT:
Wm = exp(-j*2*pi/M);
Wn = exp(-j*2*pi/N);
Em = zeros(M);
En = zeros(N);
Gm = zeros(M)+Wm;
Gn = zeros(N)+Wn;
image = zeros(M,N);

fprintf('2D iDFT start:\n'); 
for row = 0:M-1
    for col = 0:M-1
        Em(row+1,col+1) = -row * col;
        Gm(row+1,col+1) = Gm(row+1,col+1)^Em(row+1,col+1);
    end
end
Gm = Gm/M;

for row = 0:N-1
    for col = 0:N-1
        En(row+1,col+1) = -row * col;
        Gn(row+1,col+1) = Gn(row+1,col+1)^En(row+1,col+1);
    end
end
Gn = Gn/N;

image = real(Gm * input * Gn);

end

