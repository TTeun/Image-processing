% Function that erodes an image img given a certain structuring element
% se_com. The output is the eroded image
% Here the IPdilate is taken as example. However, we now dilate the
% complement of the image (by se_comlecting where image intensity = 0) by the
% inverse_com of the structuring element
function [dilated_img] = IPerode(img, se )
    [M , N ] = size(img) ;
    new_img = zeros(M+2,N+2); 
    img_com = imcomplement(img);
    se_com = rot90(se,2);
   
    for i = 2:M+1
        for j = 2:N+1
%             Note that we are interested in the complement of img
            if img_com(i-1,j-1) == 1
%                 Note that the structing element is flipped
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
    dilated_img = imcomplement( new_img(2:M+1, 2:N+1) );
   
end