% Function that dialates an image img given a certain structuring element
% se_com. The output is the dialated image
function [dilated_img] = IPdilate(img, se )
    [M , N ] = size(img) ;
    
    % Padding the imput image
    new_img = zeros(M+2,N+2);
    new_img(2:M+1 , 2:N+1) = img ;
    
    % Flipping the structuring element
    se_flip = rot90(se,2);
    
    % Apply the dilation. 
    % Where we loop over the pixels and check if the values are 1. 
    % If so, we apply the (flipped) structuring element to that pixel by 
    % taking the union. 
    for i = 2:M+1
        for j = 2:N+1
           if img(i-1,j-1) == 1
                % Taking the union between the most recent "new_img" and
                % the structuring element
                new_img(i-1:i+1,j-1:j+1) = new_img(i-1:i+1,j-1:j+1) | se_flip ;
           end
        end
    end
    
    % The final result is given as an output
    dilated_img = new_img(2:M+1, 2:N+1);
   
end