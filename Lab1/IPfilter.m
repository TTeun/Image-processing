% Function applies filter (m) to an image (x), which are given as arguments
% to the function
function [out] = IPfilter(x,m)
    % Converting the image to obtain more precision
    x = im2double(x);
    

    % Number of rows
    row =  length(x(:,1));
    % Number of columns
    col = length(x(1,:));

    % Shifting entire image
    % Up
    x_u = [ x(2:row, :); x(1, :) ];
    % Down''
    x_d = [ x(row, :) ; x(1:row-1, :)];
    % Left
    x_l = [ x(:, 2:col) x(:,1)]; 
    % Right
    x_r = [ x(:, col) x(:, 1:col-1)];

    %Diagonal
    % Up and left
    x_ul = [ x_u(: ,2:col) x_u(:,1)];
    % Up and right
    x_ur = [ x_u(:, col) x_u(:, 1:col-1)];
    % Down and left
    x_dl = [ x_d(: ,2:col) x_d(:,1)];
    % Down and right
    x_dr = [ x_d(:, col) x_d(:, 1:col-1)];

    % Determin devisor to normalize mask
    devisor = sum(sum(m));
    if devisor == 0
        devisor = 1;
    end
    
    % Normalize the mask
    m = (1/devisor).*m ;

    % Applying mask to image to obain final result
    final = (x_ul * m(1,1) + x_u * m(1,2) + x_ur*m(1,3) + x_l*m(2,1) + x*m(2,2) + x_r*m(2,3) + x_dl*m(3,1) + x_d*m(3,2) + x_dr*m(3,3));
    out=im2uint8(final);
end

