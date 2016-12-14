% This function takes an image img as input. It passed this image to the 
% function 'shift(x)' (the other file for explanation on this function).
% 'shift(x)' shifts the image and adds Gaussian noise to the image.
% This result is Wiener filtered and given as an output.
% As an comparison it also outputs the result by using the Inverse filter
% technique.

function [img_wiener, img_inverse] = IPwiener(img)
    % Determining the size of the image 
    [M, N] = size(img);
    
    % Determine the sizes need for padding
    P = 2 * M ;
    Q = 2 * N ;
    
    % Apply 45 degree shift and add Gaussian noise with shift-function
    % Note that H that is returned is already in Fourier Domain
    [H, g, s, O] = shift(img);
    
    % Applying Wiener filter and Inverse filter
    F = zeros(P, Q, 'double');  
    FI = zeros(P, Q, 'double');  
    K = .1 ;
    for u = -N:N-1
        for v = -M:M-1
          h = H(u+N+1,v+M+1) ;
          g1 = g(u+N+1,v+M+1);
          F(u+N+1,v+M+1) = ( 1/h ) * ( abs(h)^2 / (abs(h)^2 + K ) ) * g1 ;
          FI(u+N+1,v+M+1) = ( 1/h ) * g1 ;
        end
    end
    
    % Perform inverse operations
    fft_res_img = ifftshift(F);
    fft_res_img2 = ifft2(fft_res_img);

    fft_res_imgI = ifftshift(FI);
    fft_res_imgI2 = ifft2(fft_res_imgI);
    
    % Slicing to obtain the Wiener and Inverse filtered image
    img_wiener = fft_res_img2(1:M, 1:N);
    img_inverse = fft_res_imgI2(1:M, 1:N);
    
    imshow(img_wiener);
end