% This function computes the Gaussian Low Pass Transfer function, given a
% cut off frequency D0, and the dimension M, N. The returned matrix will
% have dimensions [2*M, 2*N]

function [H] = IPgaussian(D0, M, N)
  % Obtain the padded sizes
  P = 2*M;
  Q = 2*N;

  D_sq = zeros(P, Q);
  % D_sq will be equal to D(u,v).^2, where D(u,v) is the distance from 
  % point (u,v) to the center point (P/2, Q/2).
  for i = 1:P
    for j = 1:Q
      D_sq(i,j) = (i - P / 2)^2 + (j - Q / 2)^2;
    end
  end
  
  % Then we compute H(u,v) = exp(-D(u,v)^2 / 2 * D0^2) =
  % exp(-D_sq / 2 * D0 * D0)
  H = exp( -D_sq / (2 * D0 * D0) );
end
