function [LU] = LU_decompose(A)
% Berechnet die LU-Zerlegung einer Matrix A
% 
% Parameter:
% A - Zu zerlegende Matrix (n x n Matrix)
%
% R�ckgabe:
% LU - Zerlegungsprodukte L und U in einer Matrix
%

n = size(A, 1);
A_diag = diag(A);

q(1:n) = A(1:n,1)/A_diag(1) 


end

