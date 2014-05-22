function [LU] = LU_decompose(A)
% Berechnet die LU-Zerlegung einer Matrix A
% 
% Parameter:
% A - Zu zerlegende Matrix (n x n Matrix)
%
% Rückgabe:
% LU - Zerlegungsprodukte L und U in einer Matrix
%

n = size(A, 1);
A_diag = diag(A);
A_orig = A;

G = cell(1, n-1);

Q = zeros(n-1, n-1); 

Q(1:n-1,) = -A(2,1)/A(1,1)

for i = 1:n
    G{i} = [1 0 0; -A(2,1)/A(1,1) 1 0; -A(3,1)/A(1,1) 0 1];
    disp(G{i})
    A = G{i} * A;


end

