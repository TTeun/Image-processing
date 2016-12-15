% This function takes the Fourier Transform of an degraded image img as 
% input. The result is a Wiener filtered image.
% As an comparison it also outputs the result by using the Inverse filter
% technique.

function [img_wiener, img_inverse] = IPwiener(img, H)
    % Determining the size of the image 
    [P, Q] = size(img);
    M = P /2;
    N = Q /2;
    
    % Applying Wiener filter and Inverse filter
    F = zeros(P, Q, 'double');  
    FI = zeros(P, Q, 'double');  
    K = .05 ;
    for u = -N:N-1
        for v = -M:M-1
          h = H(u+N+1,v+M+1) ;
          g1 = img(u+N+1,v+M+1);
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
end