function [LU] = LU_decompose(A)
    % Berechnet die LU-Zerlegung einer Matrix A
    %   
    % Parameter:
    % A - Zu zerlegende Matrix (n x n Matrix)
    %
    % Rückgabe:
    % LU - Zerlegungsprodukte L und U in einer Matrix LU
    
    % Speichern der Dimension n der Matrix A 
    n = size(A, 1);
    U = A;
    
    % Initialisierung von L als Einheitsmatrix der Dimension n
    L = eye(n,n);
    
    % Iteration über 1 bis n-1 zur Besetzung der
    % jeweisl i-ten Frobenius und inversen Frobenius-Matrizen
    for i = 1:n-1
        % Initialisierung der beiden Frobenius-Matrizen als Einheitmatrix
        G = eye(n,n);
        Ginv = eye(n,n);
        
        % Besetzen der i-ten Frobenius-Matrizen
        G(i+1:n,i) = - U(i+1:n,i)/U(i,i);
        Ginv(i+1:n,i) = U(i+1:n,i)/U(i,i);
        
        % Multiplikation der zuvor berechneten Matrizen mit den neu
        % berechneten 
        U = G * U;
        L = L * Ginv;
    end
    
    % Subtraktion einer Einheitsmatrix von L, um die Diagonalelemente 
    % auf Null zu setzen 
    L  = L - eye(n,n);
    
    % Addition der Matrizen L und U um nur eine Matrix LU zu generieren
    LU = L + U;
end