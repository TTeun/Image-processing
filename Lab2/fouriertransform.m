% Function to take the fourier transform of an image x
function [out] = fouriertransform(x)
    % Convert it to doubles 
    y = im2double(x);
    [ M, N ] = size(x);
    
    % Take the 2D fourier transform of the image (fft2) and center it by fftshift
    fft_shift = fftshift(fft2(y));
   
    out = uint8(abs(real(fft_shift)));
end