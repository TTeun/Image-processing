function [out] = IPgradient(x)
    
    horizontal_mask = [1,2,1;0,0,0;-1,-2,-1];
    vertical_mask = [-1,0,1;-2,0,2;-1,0,1];

    y = im2double(IPfilter(x, vertical_mask));
    z = im2double(IPfilter(x, horizontal_mask));
    
    out = im2uint8((y.^2 + z.^2).^(1/2));        
end