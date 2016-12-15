% Function to perform inverse J-scale discrete De Haar wavelet transform. The DWT is
% and J is passed as scale.

function [input] = IPidwt(scale, DWT)
    % Get length and Initialize vector.
    l = length(DWT);
    input = zeros(l,1);

    % We first undo the last transformation, which acts on the first l / 2^scale
    % elements
    for i = 1:scale
        l = l / 2;
    end

    sqrt2 = sqrt(2);
    for i = 1:scale
        for j = 1:l
            % Get odd elements by summing sum and difference
            input(2 * j - 1) = 0.5 * (DWT(j) + DWT(j + l)) * sqrt2;
            % Get even elements by subtracting sum and difference
            input(2 * j)     = 0.5 * (DWT(j) - DWT(j+l)) * sqrt2;
        end
        DWT(1:2 * l) = input(1:2*l);
        l = l * 2; % Repeat for segment twice as big
    end


end
