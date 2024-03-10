function run_test()
    fout = fopen("out", "w+");
    load("../../input/linear_cost_2");

    lambda = 10;

    [Error] = lasso_regression_cost_function(weights, y, X, lambda);
    
    fprintf(fout, "%f", Error)

    fclose(fout);
endfunction