% Function that erodes an image img given a certain structuring element
% se_com. The output is the eroded image
% Here the IPdilate is taken as example. However, we now dilate the
% complement of the input image by the structuring element B (so not flipped B)
function [eroded_img] = IPerode(img, se )
    [M , N ] = size(img) ;
    new_img = zeros(M+2,N+2); 
    img_com = imcomplement(img);
   
%   Apply the structuring element to the complement of the image
    for i = 2:M+1
        for j = 2:N+1
            if img_com(i-1,j-1) == 1
                new_img(i-1,j-1)    = se(1,1);
                new_img(i-1,j)      = se(1,2);
                new_img(i-1,j+1)    = se(1,3);
                new_img(i,j-1)      = se(2,1);
                new_img(i,j)        = se(2,2);
                new_img(i,j+1)      = se(2,3);
                new_img(i+1,j-1)    = se(3,1);
                new_img(i+1,j)      = se(3,2);
                new_img(i+1,j+1)    = se(3,3);         
            end
        end
    end
    dilated_img = imcomplement( new_img(2:M+1, 2:N+1) );
   
end