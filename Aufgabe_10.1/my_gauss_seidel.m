function [ x,numit ] = my_gauss_seidel( A,b,x0,exp,maxit )

% Dimension der Matrix A 
n = size(A,1);

% Untere Dreiecksmatrix von A  + Diagonalatrix von A
DL = tril(A);
norm(inv(DL)*(A - DL))
% Setzen der Starwerte
k = 1;
x = x0;

% Anfangsdefekt
d0 = b - A*x0;
d = d0;

while norm(d)/norm(d0) > eps && k-1 < maxit
    k = k + 1;
    x_ = x;
    x = x_ + [DL\d];
    d = b - A*x;
end

% Anzahl der Iterationen
numit = k-1;

% Ausgaben: Warnung über Abbruch ab 100 Iterationen, sonst Anzahl der
% gebrauchten Iterationen

if k-1 == maxit
    fprintf('Die Berechnung wurde nach %i Iterationen abgebrochen!',k-1)
else
    fprintf('Die Berechnung wurde nach %i Iterationen erfolgreich beendet!', k-1)
end

end
