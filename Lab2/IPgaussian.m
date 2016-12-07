function [H] = IPgaussian(D0, M, N)
  P = 2*M;
  Q = 2*N;
  D_sq = zeros(M, N);
  for i = 1:M
    for j = 1:N
      D_sq(i,j) = (i - P / 2)^2 + (j - Q / 2)^2;
    end
  end
  H = exp( -D_sq / (2 * D0 * D0) );

end
