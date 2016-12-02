function [fft, real_part, real_part_abs] = fouriertransform(x)
    x = im2double(x);
    
    fft = fftshift(fft2(x));
    
    real_part = real(fft);
    real_part_abs = im2uint8(abs(real_part));
end