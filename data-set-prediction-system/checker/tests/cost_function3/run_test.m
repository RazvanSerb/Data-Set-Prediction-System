function run_test()
    fout = fopen("out", "w+");
    load("../../input/linear_cost_3");

    [Error] = linear_regression_cost_function(weights, y, X);
    
    fprintf(fout, "%f", Error)

    fclose(fout);
endfunction