function [partial] = IPprincipalcomponents (image, k)
  dim = size(image);
  K = dim(2);
  
  mx = (1 / K) * sum(image')';
  
  C = zeros(dim(1));
  
  for i = 1:K
    x = image(:,i);
    C += x * x';
  end
  
  C /= K;
  C -= mx * mx';
 
  [A, lam] = eig(C);  
  
  Y = A * (image - mx * (ones(1, dim(2))));
  
  partial = (A')(:,1:k) * Y(1:k,:) + mx * ones(1, dim(2));

end