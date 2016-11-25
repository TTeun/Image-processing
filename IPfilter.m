function [out] = IPfilter(x,m)
    x = im2double(x);

    row =  length(x(:,1));
    col = length(x(1,:));

    % Shifting entire image
    x_u = [ x(2:row, :); x(1, :) ];
    x_d = [ x(row, :) ; x(1:row-1, :)];
    x_l = [ x(:, 2:col) x(:,1)]; 
    x_r = [ x(:, col) x(:, 1:col-1)];

    %Diagonal
    x_ul = [ x_u(: ,2:col) x_d(:,1)];
    x_ur = [ x_u(:, col) x_u(:, 1:col-1)];
    x_dl = [ x_d(: ,2:col) x_d(:,1)];
    x_dr = [ x_d(:, col) x_d(:, 1:col-1)];

    devisor = sum(sum(m));
    if devisor == 0
        devisor = 1;
    end

    final = (1/devisor)*(x_ul * m(1,1) + x_u * m(1,2) + x_ur*m(1,3) + x_l*m(2,1) + x*m(2,2) + x_r*m(2,3) + x_dl*m(3,1) + x_d*m(3,2) + x_dr*m(3,3));
    out=im2uint8(final);
end

