function [image] = shift(x)
    % Converting the image to double
    x = im2double(x);
    
    % Determining the size of the image 
    [M, N] = size(x);
    
    % Obtain the padded sizes
    P = 2*M;
    Q = 2*N;
    
    % Pad input image
    img_pad = zeros(P, Q);
    img_pad(1:M, 1:N) = x;
    
    % Taking the Fourier transform 
    fft_x = fft2(img_pad);
    
    % Shifting the image
    fft_shift_x = fftshift(fft_x);
    imshow(fft_shift_x)

    H = zeros(P, Q);
    
    % Computing H(u,v)
    T = 1 ;
    a = 0.1 ;
    b = 0.1 ;
    
    for u = 1:P
        for v = 1:Q
          C = pi * (u * a + v * b) ;
          H(u,v) = ( T / C  ) * sin( C ) * exp(-1i * C );
        end
    end
    
    convolution = fft_shift_x;
    imshow(convolution)
    
    % Perform inverse operations
    fft_image = ifftshift(convolution);
    imshow(fft_image)
    fft_image = real(ifft2(fft_image));
    imshow(fft_image)
    
    max(max(fft_image))
    
    image = fft_image(1:M, 1:N);
    imshow(image)
end