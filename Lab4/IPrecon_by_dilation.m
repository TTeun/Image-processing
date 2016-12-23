function [output] = IPrecon_by_dilation(f, mask, se)
    n_wpixels_mask = sum(mask(:));
    n_wpixels_f = sum(f(:));

    while n_wpixels_mask ~= n_wpixels_f
        dilated = IPdilate(f , se);
        X = dilated & mask;
        imshow(X)
        
        f = X; 
        n_wpixels_f = sum(X(:)) ;
        
    output = X ;

end
