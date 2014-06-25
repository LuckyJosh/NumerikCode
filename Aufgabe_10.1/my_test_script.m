for n = 2:1:3

[A, b] = my_test_system(n);
[x1, numit1] = my_jacobi(A,b,b,1e-06,1e08);
[x2, numit2] = my_gauss_seidel(A,b,b,1e-06,1e08);
[x3, numit3] = my_sor(A,b,b,1e-06,1e08, 2/(1 + sin(pi/n)));   

plot(n, numit1)
hold on
plot(n, numit2)
hold on
plot(n, numit3)

end


