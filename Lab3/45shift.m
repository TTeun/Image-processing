function [image] = 45shift(x)
    % Converting the image to double
    x = im2double(x);
    
    % Taking the Fourier transform 
    fft_x = fft2(x);
    
    % Shifting the image
    fft_shift_x = fftshift(fft_x);
    
    % Determining the size of the image 
    [M, N] = size(x);
    
    % Obtain the padded sizes
    P = 2*M;
    Q = 2*N;

    H = zeros(P, Q);
    
    % Computing H(u,v)
    T = 1 ;
    a = 0.1 ;
    b = 0.1 ;
    
    for u = 1:P
        for v = 1:Q
          H(u,v) = 1/(pi * (u*a + v*b)) * sin( pi * (u*a + v*b) ) * exp(-i * pi * (u*a + v*b));
        end
    end
    
    convolution = H .* fft_shift_x
    
    % Perform inverse operations
    fft_image = ifftshift(convolution);
    fft_image = real(ifft2(fft_image));
    
    image = fft_image(1:M, 1:N);
end