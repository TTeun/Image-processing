% The algorithm iteratively determines the best global threshold of input 
% image 'img' by binning the pixel values into two bins. Then taking the 
% mean of these bins, which are use to calculate a new threshold value T.
% When the difference between the previous T and new T is zero, the best
% value of T is attained and the algorithm stops. 

function [output, T] = IPautothresh(img)
    % Determine image size
    [M,N] = size(img);
    % Convert to double, since 
    img_double = im2double(img);
    % Reshape image to 1D array, make looping easier
    img_reshape = reshape(img_double, 1, M*N);
    
    % Initial estimate of T
    T_old = 0.1 ;
    % Setting dT (the stop criteria) to a non zero value
    dT = 10 ;
    
    % Automated threshold selection
    while dT ~= 0
        % Creating empty 'bins'
        G1 = [];
        G2 = [];
        % Looping and binning of the pixels values in 1D array
        for i = 1 : M*N
            if img_reshape(i) > T_old
                G1(end+1) = img_reshape(i);
            elseif img_reshape(i) <= T_old 
                G2(end+1) = img_reshape(i);
            end
        end
        % Determinig the mean of the bins
        if isempty(G1) == 1
            m1 = 0 ;
            m2 = mean(G2) ;
        elseif isempty(G2) == 1
            m1 = mean(G1) ; 
            m2 = 0 ;
        else 
            m1 = mean(G1) ;
            m2 = mean(G2) ;
        end
        % Calculating new threshold value T
        T_new = 0.5 * ( m1 + m2 ) ;
        % Determining dT
        dT = T_new-T_old ;
        % Set current T values as the previous T value
        T_old = T_new ;
    end
    % Making a binary image of input image with the obtained T value, then
    % outputting the result.
    T = int8( T_old*255 );
    output = imbinarize(img_double, T_old) ;
end