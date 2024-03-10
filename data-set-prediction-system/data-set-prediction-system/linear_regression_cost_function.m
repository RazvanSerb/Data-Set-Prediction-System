% Theta -> the vector of weights
% Y -> the vector with all actual values
% FeatureMatrix -> the matrix with all training examples

% Error -> the error of the regularized cost function

function [Error] = linear_regression_cost_function(Theta, Y, FeatureMatrix)
  [m, n] = size(FeatureMatrix);
  H = zeros(m, 1);
  for i = 1 : m;
    for j = 1 : n
      H(i) = H(i) + FeatureMatrix(i, j) * Theta(j + 1);
    endfor
  endfor
  Error = 0;
  for i = 1 : m
    Error = Error + (H(i) - Y(i)) ^ 2;
  endfor
  Error = Error / (2 * m);
endfunction
