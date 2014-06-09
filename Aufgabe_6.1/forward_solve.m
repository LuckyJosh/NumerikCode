function z = forward_solve(LU, b)
% Funktion zur Berechnung des Vorw�rtseinsetzen f�r
% die L�sung eines LGS mit der LU-Zerlegung
%   
% Parameter:
% LU - Matrizen L und U der LU-Zerlegung in einer Matrix (n x n Matrix)
%
% b - Rechte-Seite des zu l�senden LGS (n x 1 Matrix)
%
% Ausgabe:
%
% z - L�sung des Vorw�rtseinseten und somit L�sung des
%     LGS Lz = b (n x 1 Matrix)

    % Dimension der Matrix
    n = size(LU, 1);
    
    % Extrahiern der Matrix L aus der Gesamtmatrix LU
    L = tril(LU, -1) + eye(n,n);
    
    % Setzen des L�sungsvektors auf b
    z = b;
    
    % Negieren aller Matrix Eintr�ge au�er der Diagonalen  
    L = -1 * L + 2*eye(n,n);
    
    % Iteration �ber die Zeilen der Matrix
    for i=1:n
       % Berechnung der Eintr�ge des L�sungsvektors 
       z(i) = L(i, 1:n) * z(1:n); 
    end
  
end

