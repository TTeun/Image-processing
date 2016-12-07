% This function takes an input image x, and a filter kernel which is
% given in the frequency domain as  a transfer function H.

function [image] = IPftfilter(x, H)

    % Convert to double
    y = im2double(x);
    
    % Determine size input image
    [ M, N ] = size(y);
    
    % Determine padded sizes
    P = 2 * M;
    Q = 2 * N;
    
    % Pad is filled with zeros
    pad = zeros(P,Q);
    
    % Put image in top left corner of pad
    pad(1:M, 1:N) = y;

    % Calculate the 2D Fourier transform
    fft_image = fft2(pad);
    
    % Shift the spectrum so that it macthes layout of the kernel. Kernel
    % has high values near its center.
    fft_image = fftshift(fft_image);
       
    % Perform the convolution of shifted spectrum with the Gaussian
    % Low-Pass Transfer Function
    fft_image = H.* fft_image;

    % Perform inverse operations
    fft_image = ifftshift(fft_image);
    fft_image = real(ifft2(fft_image));
    
    image = fft_image(1:M, 1:N);
end