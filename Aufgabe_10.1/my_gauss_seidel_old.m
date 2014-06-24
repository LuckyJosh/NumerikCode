function [ x,numit ] = my_gauss_seidel( A,b,x0,exp,maxit )

% Dimension der Matrix A 
n = size(A,1);
% Diagonalelmente von A
a = diag(A);

% Matrix A ohne Diagonalelemente
A0 = tril(A,-1) + triu(A,1);

% Diagonalatrix der Matrix A
%A_diag = A - tril(A,-1) - triu(A,1);

% Norm der Matrix B als zum Test der Konvergenzbedingung ?
%q = norm(A_diag^(-1)*(A0));




x(1:n,1) = x0;
x_diff(1) = norm(x);
q(1) = 1;
k = 1;


while q(k) > eps && k-1 < maxit
    k = k + 1;
    x_ = x;
    y = zeros(n);
    y_ = x_;
    for i = 1:n

    elseif i == n
        
    else
        
    end
    
    x(i) = (b(i) - sl - sh)/a(i);
    end
    x_diff(k) = norm(x - x_);
    q(k) = x_diff(k)/x_diff(2);
    numit = k-1;
end

if k-1 == maxit
    fprintf('Die Berechnung wurde nach %i Iterationen abgebrochen!',k-1)
else
    fprintf('Die Berechnung wurde nach %i Iterationen erfolgreich beendet!', k-1)
end

end


