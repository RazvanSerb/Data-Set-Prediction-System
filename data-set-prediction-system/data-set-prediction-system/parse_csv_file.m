% path -> a relative path to the .csv file

% Y -> the vector with all actual values
% InitialMatrix -> the matrix that must be transformed

function [Y, InitialMatrix] = parse_csv_file(file_path)
  StringVector = textread(file_path, '%s', 'Delimiter', ',', 'HeaderLines', 1);
  fin = fopen(file_path, 'r');
  [m, n] = size(csvread(fin)); m--;
  Y = zeros(m, 1);
  InitialMatrix = cell(m, n - 1);
  for i = 1 : m
    Y(i) = str2num(cell2mat(StringVector(n * (i-1) + 1)));
    for j = 2 : n
      InitialMatrix(i, j - 1) = StringVector(n * (i-1) + j);
    endfor
  endfor
endfunction
