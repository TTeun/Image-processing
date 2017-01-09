% Function that calculates the opening by reconstruction of an input image
% f (the marker) , using the input mask and structuring element
function [output] = IPrecon_by_dilation(f, mask, se)    
    % Set start statement to true 
    start = true ;
    
    % Opening by reconstruction
    % We use the number of pixels in the mask as the stability criterium
    while start == true
        % Set reminder "old" f in f_old
        f_old = f ; 
        
        % Dilate the mask with the structuring element
        dilated = IPdilate(f , se);
        
        % Take the intersection of the result with the mask
        X = dilated & mask;
        
        % Set X as the new marker
        f = X;
        
        % Compare previous with new result
        if f == f_old 
            start = false ;
        end
    end
    
    output = X ;
    
end
