function [H, image] = shift(x)
    % Converting the image to double
    x = im2double(x);
    
    % Determining the size of the image 
    [M, N] = size(x);
    
    % Obtain the padded sizes
    P = 2 * M;
    Q = 2 * N;
    
    pad = zeros(P, Q);
    pad(1:M, 1:N) = x;
   
    % Taking the Fourier transform 
    fft_x = fft2(pad);
    
    % Shifting the image
    fft_shift_x = fftshift(fft_x);
   
    H = zeros(P, Q, 'double');
    
    % Computing H(u,v)
    T = 1 ;
    a = 0.1 ;
    b = 0.1 ;
    
    for u = -N:N-1
        for v = -M:M-1
          C = pi * (u * a + v * b) + eps ;
          H(u+N+1,v+M+1) = (1 / C) * (sin(C)) * exp(-1j * C);
        end
    end

    convolution = H .* fft_shift_x;
    
    % Perform inverse operations
    fft_image = ifftshift(convolution);
    fft_image2 = ifft2(fft_image);

    image = fft_image2(1:M, 1:N);
end