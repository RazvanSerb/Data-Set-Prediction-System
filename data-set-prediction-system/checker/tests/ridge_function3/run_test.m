function run_test()
    fout = fopen("out", "w+");
    load("../../input/linear_cost_3");

    lambda = 15;

    [Error] = ridge_regression_cost_function(weights, y, X, lambda);
    
    fprintf(fout, "%f", Error)

    fclose(fout);
endfunction