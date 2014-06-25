function [ x,numit ] = my_jacobi( A,b,x0,eps,maxit)


% Dimension der Matrix A 
n = size(A,1);

% Diagonalatrix der Matrix A
D = A - tril(A,-1) - triu(A,1);

% Setzen der Starwerte
k = 1;
x = x0;

% Anfangsdefekt
d0 = b - A*x0;
d = d0;

while norm(d)/norm(d0) > eps && k-1 < maxit
    k = k + 1;
    x_ = x;
    x = x_ + [D\d];
    d = b - A*x;
end

% Anzahl der Iterationen
numit = k-1;

% Ausgaben: Warnung über Abbruch ab 100 Iterationen, sonst Anzahl der
% gebrauchten Iterationen

if k-1 == maxit
    fprintf('Die Berechnung wurde nach %i Iterationen abgebrochen!\n',k-1)
else
    fprintf('Die Berechnung wurde nach %i Iterationen erfolgreich beendet!\n', k-1)
end

end

