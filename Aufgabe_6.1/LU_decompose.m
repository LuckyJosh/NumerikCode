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
    U = A;
    
    L = eye(n,n);
    for i = 1:n-1
        G = eye(n,n);
        Ginv = eye(n,n);
        G(i+1:n,i) = - U(i+1:n,i)/U(i,i);
        Ginv(i+1:n,i) = U(i+1:n,i)/U(i,i);
        U = G * U;
        L = L * Ginv;
    end
    L  = L - eye(n,n);
    LU = L+U;
end