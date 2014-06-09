function x = backward_solve(LU, z)
% Funktion zur Berechnung des R�ckw�rtseinsetzen f�r
% die L�sung eines LGS mit der LU-Zerlegung
%   
% Parameter:
% LU - Matrizen L und U der LU-Zerlegung in einer Matrix (n x n Matrix)
%
% z - L�sungsvektor des Vorw�rtseinsetzen (n x 1 Matrix)
%
% Ausgabe:
%
% x - L�sung des LGS Uy = x und damit Ax = b (n x 1 Matrix)
    
    % Dimension der Matrix LU
    n = size(LU, 1);
    
    % Extraktion der Matrix U aus LU
    U = triu(LU);
    
    % n x n Matrix deren Elemente der i-ten Zeile jeweils 
    % den Wert des i-ten Diagonalelements der Matrix U
    U_diag = repmat(diag(U), 1, n);
    
    % Division i-ten Zeilen, der Matrix U und der Vektors
    % z durch das i-te Diagonalelement der Matrix U
    % => Hauptdiagonale der Matrix U mit Einsen besetzt
    U(1:n,1:n) = U(1:n,1:n)./U_diag(1:n,1:n);
    x(1:n,1) = z(1:n,1)./U_diag(1:n,1);
    
    % Negieren alle Matrixeintr�ge au�er die der Hauptdiagonale
    U = -1 * U + 2*eye(n,n);
    
    % R�ckw�rtsiteration �ber die Zeilen der Matrix
    for i=n:-1:1
       % Berechnung der Elemente des L�sungsvektors
       x(i) = U(i, n:-1:1) * x(n:-1:1); 
    end
end

