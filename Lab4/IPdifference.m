% Also compute a binary ‘difference’ image diff_opening.tif in which 
% a pixel is ‘on’ if and only if the opening of angio_noise.tif differs 
% from the original image angio.tif at that pixel. Count the number of ‘on’
% pixels in the ‘difference’ image.

function [diff_opening , n_pix] = IPdifference(img_check, img)
    diff_opening = !(img_check == img);
    
    n_pix= sum(diff_opening(:));
    
end