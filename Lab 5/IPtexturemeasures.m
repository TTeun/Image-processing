function [mean, var_norm, R, skew, U, avg_ent] = IPtexturemeasures(img)
    % Determine image size
    [M,N] = size(img);
    % Determine slice size
    M_new = M-99 ;
    N_new = N-99 ;
    DIM = 100 ;
    % Select lower, right quadrant 
    img_slice = img(M_new:M, N_new:N);
    % Reshape image to 1D array, with lentgh 10000 (100*100)
    img_reshape = reshape(img_slice, 1, DIM * DIM );  
    
    % Own histogram function because histcounts does not seem to work
    % properly
    hist_img = zeros(1, 256); 
    bins = 1 : 256 ;
    for i = 1 : DIM * DIM
       I_val = img_reshape(i) ;
       hist_img(I_val+1) = hist_img(I_val+1) + 1 ;
    end 
    % Normalize histogram    
    hist_norm = hist_img / sum(hist_img) ;
    
    % Texture measures
    % First moment: mean
    mean = sum( hist_norm .* bins ) ;
    
    % Second moment: variance and R
    var = sum( (bins - mean).^2 .* hist_norm ) ; 
    var_norm = var / (255)^2 ;
    R = 1 - 1 / ( 1 + var_norm ) ;
    
    % Third moment: skewness (normalized)
    skew = sum( (bins - mean).^3 .* hist_norm ) / (255^3) ;
    
    % Uniformity
    U = sum( hist_norm.^2 ) ;
    
    % Average entropy
    avg_ent = 0 ;
    for i = 1 : 256
        if hist_norm( i ) > 0
            avg_ent = avg_ent - hist_norm( i ) * log2(hist_norm( i )) ;
        end
    end
end
