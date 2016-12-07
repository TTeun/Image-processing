function [H] = IPgaussian(D0, M, N)
  % Obtain the padded sizes
  P = M;
  Q = N;
  % This matrix will be D(u,v).^2
  D_sq = zeros(M, N);
  % We fill it first with the squares of the distances
  for i = 1:M
    for j = 1:N
      D_sq(i,j) = (i - P / 2)^2 + (j - Q / 2)^2;
    end
  end
  % Then we compute H(u,v) = exp(-D^2 / 2 * D0^2)
  H = exp( -D_sq / (2 * D0 * D0) );

end
