% Function that dialates an image img given a certain structuring element
% se. The output is the dialated image
function [dilated_img] = IPdilate(img, se )
    [M , N ] = size(img) ;
    new_img = zeros(M+2,N+2); 
    
    for i = 2:M+1
        for j = 2:N+1
            if img(i-1,j-1) == 1
                new_img(i-1,j-1) = se(1,1);
                new_img(i-1,j) = se(1,2);
                new_img(i-1,j+1) = se(1,3);
                new_img(i,j-1) = se(2,1);
                new_img(i,j) = se(2,2);
                new_img(i,j+1) = se(2,3);
                new_img(i+1,j-1) = se(3,1);
                new_img(i+1,j) = se(3,2);
                new_img(i+1,j+1) = se(3,3);        
            end
        end
    end
    dilated_img = new_img(2:M+1, 2:N+1);
   
end