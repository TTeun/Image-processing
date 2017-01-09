% Function that dialates an image img given a certain structuring element
% se_com. The output is the dialated image
function [dilated_img] = IPdilate(img, se )
    [M , N ] = size(img) ;
    new_img = zeros(M+2,N+2);
    new_img(2:M+1 , 2:N+1) = img ;
    se_flip = rot90(se,2);
    
    for i = 2:M+1
        for j = 2:N+1
           if img(i-1,j-1) == 1
                se_padded = zeros(M+2 , N+2);
                se_padded(i-1:i+1,j-1:j+1) = se_flip ;
                new_img = new_img | se_padded ;
           end
        end
    end
    
    dilated_img = new_img(2:M+1, 2:N+1);
   
end