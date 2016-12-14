function [input] = IPidwt(scale, DWT)
    l = length(DWT);
    input = zeros(l,1);
    
    for i = 1:scale
        l = l / 2;
    end
    
    sqrt2 = sqrt(2);
    for i = 1:scale
        for j = 1:l
            input(2 * j - 1) = 0.5 * (DWT(j) + DWT(j + l)) * sqrt2;
            input(2 * j)     = 0.5 * (DWT(j) - DWT(j+l)) * sqrt2;
        end
        DWT(1:2 * l) = input(1:2*l);
        l = l * 2;
    end


end