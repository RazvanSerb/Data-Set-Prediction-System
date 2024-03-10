% InitialMatrix -> the matrix that must be transformed

% FeatureMatrix -> the matrix with all training examples

function [FeatureMatrix] = prepare_for_regression(InitialMatrix)
  [m, n] = size(InitialMatrix);
  num_max_lines = m;
  num_max_columns = 0;
  for i = 1 : m
    num_columns = 0;
    for j = 1 : n
      num_columns++;
      if (strcmp(InitialMatrix(i, j), "unfurnished"))
        num_columns++;
      elseif (strcmp(InitialMatrix(i, j), "semi-furnished"))
        num_columns++;
      elseif (strcmp(InitialMatrix(i, j), "furnished"))
        num_columns++;
      endif
    endfor
    if (num_columns > num_max_columns)
      num_max_columns = num_columns;
    endif
  endfor
  FeatureMatrix = zeros(num_max_lines, num_max_columns);
  x = 1; y = 1;
  for i = 1 : m
    y = 1;
    for j = 1 : n
      if (strcmp(InitialMatrix(i, j), "no"))
        FeatureMatrix(x, y) = 0;
      elseif (strcmp(InitialMatrix(i, j), "yes"))
        FeatureMatrix(x, y) = 1;
      elseif (strcmp(InitialMatrix(i, j), "unfurnished"))
        FeatureMatrix(x, y) = 0;
        y++;
        FeatureMatrix(x, y) = 1;
      elseif (strcmp(InitialMatrix(i, j), "semi-furnished"))
        FeatureMatrix(x, y) = 1;
        y++;
        FeatureMatrix(x, y) = 0;
      elseif (strcmp(InitialMatrix(i, j), "furnished"))
        FeatureMatrix(x, y) = 0;
        y++;
        FeatureMatrix(x, y) = 0;
      else
        FeatureMatrix(x, y) = str2num(cell2mat(InitialMatrix(i, j)));
      endif
      y++;
    endfor
    x++;
  endfor
endfunction
