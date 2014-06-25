function [ A,b ] = my_test_system( n )


% Erstellen des Vektors b
b = ones(n^2,1);



% n x n Einheitsmatrx
Id = diag(ones(n,1));

% n x n Einsmatrix
E = ones(n);

% Besetzen der Submatrix T
T = - E + tril(E,-2) + triu(E,2) + 5*eye(n); 

% Besetzen der Matrix
A = zeros(n^2);
for i = 1:n:n^2
    if i < n^2-n
        A(i+n:i+(2*n-1),i:i+(n-1)) = -Id(1:n, 1:n);
        A(i:i+(n-1),i+n:i+(2*n-1)) = -Id(1:n, 1:n);
    end
    A(i:i+(n-1),i:i+(n-1)) = T(1:n, 1:n); 
end
end

