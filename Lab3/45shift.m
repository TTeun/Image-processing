function [out] = IPfilter(x)
    % Converting the image to double
    x = im2double(x);
    
    % Taking the Fourier transform 
    fft_x = fft2(x);
    
    % Shifting the image
    fft_shift_x = fftshift(fft_x);
    
    % Determining the size of the image 
    [M, N] = size(x);
    
    
    % Computing H(u,v)
    T = 1 ;
    a = 0.1 ;
    b = 0.1 ;
    
    
    
    
    out = uint8(x);

end