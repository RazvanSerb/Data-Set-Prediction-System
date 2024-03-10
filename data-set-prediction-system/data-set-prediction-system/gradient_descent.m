% FeatureMatrix -> the matrix with all training examples
% Y -> the vector with all actual values
% n -> the number of predictors
% m -> the number of trainings
% alpha -> the learning rate
% iter -> the number of iterations

% Theta -> the vector of weights

function [Theta] = gradient_descent(FeatureMatrix, Y, n, m, alpha, iter)
  Theta = zeros(n + 1, 1);
  H = zeros(m, 1);
  for i = 1 : m;
    for j = 1 : n
      H(i) = H(i) + FeatureMatrix(i, j) * Theta(j + 1);
    endfor
  endfor
  J = zeros(n, 1);
  for j = 1 : n
    J(j) = 0;
    for i = 1 : m
      J(j) = J(j) + (H(i) - Y(i)) * FeatureMatrix(i, j);
    endfor
    J(j) = J(j) / m;
  endfor
  step = 1;
  while (step <= iter)
    for j = 1 : n
      Theta(j + 1) = (Theta(j + 1) - alpha * J(j));
    endfor
    step++;
  endwhile
endfunction
