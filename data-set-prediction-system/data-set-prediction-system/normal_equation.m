% FeatureMatrix -> the matrix with all training examples
% Y -> the vector with all actual values
% tol -> the learning rate
% iter -> the number of iterations
% tol -> the tolerance level for convergence of the conjugate gradient method

% Theta -> the vector of weights

function [Theta] = normal_equation(FeatureMatrix, Y, tol, iter)
  [m, n] = size(FeatureMatrix);
  Theta = zeros(n + 1, 1);
  A = (FeatureMatrix') * FeatureMatrix;
  b = (FeatureMatrix') * Y;
  x = zeros(n, 1);
  ok = 1;
  for j = 1 : n
    if (det(A(1 : j,  1 : j)) < 0)
      ok = 0;
      break;
    endif
  endfor
  if (ok)
    r = b - A * x;
    v = r;
    tol_squared = tol ^ 2;
    step = 1;
    while ((step <= iter) && (((r') * r) > tol_squared))
      t = ((r') * r) / ((v') * A * v);
      x = x + t * v;
      r_prev = r; 
      r = r - t * A * v;
      s = ((r') * r) / ((r_prev') * r_prev);
      v = r + s * v;
      step++;
    endwhile
  endif
  Theta(2 : (n + 1)) = x;
endfunction