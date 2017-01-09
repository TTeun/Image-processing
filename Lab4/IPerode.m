% Function that erodes an image img given a certain structuring element
% se_com. The output is the eroded image
% Here the IPdilate is taken as example. However, we now dilate the
% complement of the input image by the structuring element B (so not flipped B)
function [eroded_img] = IPerode(img, se )
    [M , N ] = size(img) ;
    img_com = imcomplement(img);
    new_img = zeros(M+2,N+2);
    new_img(2:M+1 , 2:N+1) = imcomplement(img) ;
    
    for i = 2:M+1
        for j = 2:N+1
           if img_com(i-1,j-1) == 1
                se_padded = zeros(M+2 , N+2);
                se_padded(i-1:i+1,j-1:j+1) = se ;
                new_img = new_img | se_padded ;
           end
        end
    end
    
    eroded_img = imcomplement( new_img(2:M+1, 2:N+1) );
   
end