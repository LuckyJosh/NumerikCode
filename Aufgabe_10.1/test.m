n = 3;

[A, b] = my_test_system(n);

A = [3, 1 ,0 , -1; 1 ,5 ,2, 0; 0, 2, 4, 1;-1, 0, 1, 6];
b = [1,1,1]';
X = A\b
[x, numit] = my_jacobi(A,b,b,1e-06,1e08)
[x, numit] = my_gauss_seidel(A,b,b,1e-06,1e08)
[x, numit] = my_sor(A,b,b,1e-06,1e08, 2/(1 + sin(pi/n)))
