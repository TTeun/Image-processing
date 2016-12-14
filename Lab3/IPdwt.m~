% Function to calculate the J-scale discrete De Haar wavelet transform
% J is given to the function as scale and the input is the original
% function

function [DWT] = IPdwt(scale, input)
    l = length(input);
    
    % Initialize a vector of zeros
    DWT = zeros(l,1);
    % Store this constant which will be needed several tims
    sqrt2 = sqrt(2);
    for i = 1:scale
        
        for j = 1:(l / 2)
            DWT(j) = input(2*j - 1) + input(2*j);
        end
        for j = 1:(l / 2)
            DWT(j + (l / 2)) = input(2*j - 1) - input(2*j);
        end
        input = DWT / sqrt2;
        l = l / 2;
    end

    DWT = DWT / sqrt2;
end