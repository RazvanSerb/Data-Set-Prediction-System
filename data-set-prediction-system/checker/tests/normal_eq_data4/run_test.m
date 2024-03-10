function run_test()
    fout = fopen("out", "w+");
    [Y InitialMatrix] = parse_csv_file("../../input/Housing.csv");
    [FeatureMatrix] = prepare_for_regression(InitialMatrix);

    tol = 1e-18;
    [m n] = size(FeatureMatrix);
    max_iter = 1250;
    [Theta] = normal_equation(FeatureMatrix, Y, tol, max_iter);
    
    for i = 1 : length(Theta)
        fprintf(fout, "%e\n", Theta(i));
    endfor

    fclose(fout);
endfunction