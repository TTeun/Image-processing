% Also compute a binary ‘difference’ image diff_opening.tif in which 
% a pixel is ‘on’ if and only if the opening of angio_noise.tif differs 
% from the original image angio.tif at that pixel. Count the number of ‘on’
% pixels in the ‘difference’ image.

function [diff_opening , n_pix] = IPdifference(img_check, img)
    [M, N]= size(img);
    diff_opening = zeros(M, N);
    
    for i = 1: M
        for j = 1 : N
            if img_check(i,j) ~= img(i,j)
                diff_opening(i,j) = 1 ;
            end
        end
    end
    
    n_pix= sum(diff_opening(:));
    
end