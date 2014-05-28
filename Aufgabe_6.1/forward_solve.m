function z = forward_solve(LU, b)
% Funktion zur Berechnung des Vorwärtseinsetzen für
% die Lösung eines LGS mit der LU-Zerlegung
%   
% Parameter:
% LU - Matrizen L und U der LU-Zerlegung in einer Matrix (n x n Matrix)
%
% b - Rechte-Seite des zu lösenden LGS (n x 1 Matrix)
%
% Ausgabe:
%
% z - Lösung des Vorwärtseinseten und somit Lösung des
%     LGS Lz = b (n x 1 Matrix)

    % Dimension der Matrix
    n = size(LU, 1);
    
    % Extrahiern der Matrix L aus der Gesamtmatrix LU
    L = tril(LU, -1) + eye(n,n);
    
    % Setzen des Lösungsvektors auf b
    z = b;
    
    % Negieren aller Matrix Einträge außer der Diagonalen  
    L = -1 * L + 2*eye(n,n);
    
    % Iteration über die Zeilen der Matrix
    for i=1:n
       % Berechnung der Einträge des Lösungsvektors 
       z(i) = L(i, 1:n) * z(1:n); 
    end
  
end

