% Function takes an image and noise impulse (Pa = Pb) as input, using this 
% the median mask will be applied
function [out, image_noise] = IPmedian(image, Pb)
    % Converting the image to obtain more precision
    x = imnoise(im2double(image), 'salt & pepper', Pb);
    image_noise = x ;
    
    % Number of rows
    row =  length(x(:,1));
    % Number of columns
    col = length(x(1,:));

    % Shifting entire image Up
    x_u = [ x(2:row, :); x(1, :) ];
    % Down''
    x_d = [ x(row, :) ; x(1:row-1, :)];
    % Left
    x_l = [ x(:, 2:col) x(:,1)]; 
    % Right
    x_r = [ x(:, col) x(:, 1:col-1)];

    %Diagonal
    % Up and left
    x_ul = [ x_u(: ,2:col) x_d(:,1)];
    % Up and right
    x_ur = [ x_u(:, col) x_u(:, 1:col-1)];
    % Down and left
    x_dl = [ x_d(: ,2:col) x_d(:,1)];
    % Down and right
    x_dr = [ x_d(:, col) x_d(:, 1:col-1)];

    % Create an empty data cube where we will stack the different images
    A = zeros(row, col, 9);
    
    % Insert the (shifted) images to enable sort along 3 dimension
    A(:, :, 1) = x_ul(:, :);
    A(:, :, 2) = x_u(:, :);
    A(:, :, 3) = x_ur(:, :);
    A(:, :, 4) = x_l(:, :);
    A(:, :, 5) = x(:, :);
    A(:, :, 6) = x_r(:, :);
    A(:, :, 7) = x_dl(:, :);
    A(:, :, 8) = x_d(:, :);
    A(:, :, 9) = x_dr(:, :);
    
    % Sort along the 3rd dimension
    A_sort = sort(A,3);
    
    % Obtain median mask, which is the end result of the filter
    m = A_sort(:, :, 5);
    out=im2uint8(m);
end