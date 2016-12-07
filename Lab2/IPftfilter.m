function [image] = IPftfilter(x, H)
    % Convert to double
    y = im2double(x);
    
    % Determine size input image
    [ M, N ] = size(y);

    % Calculate the 2D Fourier transform
    fft_image = fft2(y);
    
    % Shift the spectrum
    fft_image = fftshift(fft_image);
       
    fft_image = H.* fft_image;

    % Perform inverse operations
     fft_image = ifftshift(fft_image);
    fft_image = real(ifft2(fft_image));
    
     
    imshow(fft_image);

end