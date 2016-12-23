% Function that dialates an image img given a certain structuring element
% se_com. The output is the dialated image
function [dilated_img] = IPdilate(img, se )
    [M , N ] = size(img) ;
    new_img = zeros(M+2,N+2); 
    se_com = rot90(se,2);
    
    for i = 2:M+1
        for j = 2:N+1
            if img(i-1,j-1) == 1
                new_img(i-1,j-1) = se_com(1,1);
                new_img(i-1,j) = se_com(1,2);
                new_img(i-1,j+1) = se_com(1,3);
                new_img(i,j-1) = se_com(2,1);
                new_img(i,j) = se_com(2,2);
                new_img(i,j+1) = se_com(2,3);
                new_img(i+1,j-1) = se_com(3,1);
                new_img(i+1,j) = se_com(3,2);
                new_img(i+1,j+1) = se_com(3,3);        
            end
        end
    end
    dilated_img = new_img(2:M+1, 2:N+1);
   
end