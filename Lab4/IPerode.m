% Function that erodes an image img given a certain structuring element
% se_com. The output is the eroded image
% Here the IPdilate is taken as example. However, we now dilate the
% complement of the input image by the structuring element B (so not flipped B)
function [eroded_img] = IPerode(img, se )
    [M , N ] = size(img) ;
    
    % Taking the complement of the input image 
    img_com = imcomplement(img);
    
    % Padding the complement image
    new_img = zeros(M+2,N+2);
    new_img(2:M+1 , 2:N+1) = img_com ;
    
    % Apply dilate the complement image. 
    % Where we loop over the pixels and check if the values are 1. 
    % If so, we apply the structuring element to that pixel by and taking
    % the union. 
    for i = 2:M+1
        for j = 2:N+1
           if img_com(i-1,j-1) == 1
                % Taking the union between the most recent "new_img" and
                % the structuring element
                new_img(i-1:i+1,j-1:j+1) = new_img(i-1:i+1,j-1:j+1) | se;
           end
        end
    end
    
    % Taking the complement of the result to obtain the erode image, which
    % is given as an output
    eroded_img = imcomplement( new_img(2:M+1, 2:N+1) );
   
end