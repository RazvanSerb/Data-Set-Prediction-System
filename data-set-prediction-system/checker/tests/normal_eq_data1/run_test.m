function run_test()
    fout = fopen("out", "w+");
    load("../../input/normal_eq1");
    
    tol = 1e-10;
    max_iter = 200;

    [Theta] = normal_equation(X, y, tol, max_iter);
    
    for i = 1 : length(Theta)
        fprintf(fout, "%e\n", Theta(i));
    endfor

    fclose(fout);
endfunction