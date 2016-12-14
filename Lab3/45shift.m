function [H] = shift(M, N)

    
    % Obtain the padded sizes
    P = 2*M;
    Q = 2*N;

    H = zeros(P, Q);
    
    % Computing H(u,v)
    T = 1 ;
    a = 0.1 ;
    b = 0.1 ;
    
    for u = 1:P
        for v = 1:Q
          H(u,v) = 1/(pi * (u*a + v*b)) * sin( pi * (u*a + v*b) ) * exp(-i * pi * (u*a + v*b));
        end
    end
    
end