% Function to take the fourier transform of an image x
function [out, average] = fouriertransform(x)
    % Convert it to doubles 
    y = im2double(x);
    
    % Determine size input image
    [ M, N ] = size(y);
    
    % Calculate the 2D Fourier transform
    fft_image = fft2(y);
    
    % Center it 
    fft_shift = fftshift(fft_image);
    
    % Calculate average, by taking the first component and normalizing this
    % by using the size of the images. Then multiply with the total number
    % of intensity levels, i.e. 255, to obtain the average intensity level 
    % of the image
    average = fft_image(1,1)/(M*N)*256;
   
    % Calculating the Fourier Spectrum by taking the absolute value
    out = uint8( (real(fft_shift).^2 + imag(fft_shift).^2 ).^(1/2) ); 
end