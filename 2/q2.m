P = [1 0 0 0 0; 2/3 0 1/3 0 0; 0 2/3 0 1/3 0; 0 0 2/3 0 1/3; 0 0 0 0 1];
x = markova(P, 1, 1000, 100);
printf("P(0) = %.3f \nP(4) = %.3f\n", x(1), x(5));