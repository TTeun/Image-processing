% This function takes an image x as input. It then calculates the shifted
% image by 45 degrees to upper left corner of the original.
% In addition to this the function add Gaussian noise to the shifted image.
%
% Output:
% 1. Transfer function H, used to shift the image
% 2. Shifted image with noise
% 3. Shifted image without noise
function [H, img_shift_noise, img_shift] = shift(x)
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

    % Calculate the convolution
    convolution = H .* fft_shift_x;
    
    % Perform inverse operations to obtain the shifted image
    fft_image = ifftshift(convolution);
    fft_image2 = ifft2(fft_image);
    
    % Slicing to obtain the shifted image
    img_shift = fft_image2(1:M, 1:N);
    
    % Create empty noise array. 
    noise = zeros(P, Q, 'double');
    
    % Applying noise to noise array
    % Mean and variance, where N is the number of greylevel you your 
    % variance to have
    mean = 0 ;
    N = 10 ;
    var = (1/255) * N ; 
    
    % Applying the noise
    noise_g = imnoise(noise, 'gaussian', mean , var);
    
    % Taking the Fourier Transform of the noise, such that we can add it to
    % the shifted image. Where we use the linearity of the Fourier
    % Transform
    fft_noise = fft2(noise_g);
    fft_noise2 = fftshift(fft_noise);
    
    % The original image, shifted and with Gaussian noise
    img_shift_noise = convolution + fft_noise2 ;    
end
