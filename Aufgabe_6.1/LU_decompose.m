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

    G = cell(1, n-1);
    Ginv = cell(1, n-1);

    for i = 1:n-1
        G{i} = eye(n,n);
        Ginv{i} = eye(n,n);
        for j= i+1:n
            G{i}(j,i) = - U(j,i)/U(i,i);
            Ginv{i}(j,i) = - G{i}(j,i);
        end
        U = G{i} * U;
    end

    L = eye(n,n);
    for i = n-1: -1: 1
        L = Ginv{i} * L;
    end
    L  = L - eye(n,n);

    LU = L+U;
end

