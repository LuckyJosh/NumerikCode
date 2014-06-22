A = [5,3,0;3,4,1;0,1,6];
b = [1;2;3];
X = A\b
x0 = [1;1;1];
[x, numit] = my_jacobi(A,b,x0,1e-06,100)
[x, numit] = my_gauss_seidel(A,b,x0,1e-06,1)