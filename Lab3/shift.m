function [H] = shift(M, N)

    P = 2*M;
    Q = 2*N;

    H = zeros(P, Q);
    
    % Computing H(u,v)
    T = 1 ;
    a = 0.1 ;
    b = 0.1 ;
    
    for u = 1:P
        for v = 1:Q
          C = pi * (u * a + v * b) ;
          H(u,v) = ( T / C  ) * sin( C ) * exp(-1i * C );
        end
    end
    
end