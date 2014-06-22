function [x,e,v] = myNewton(f, df, x0)
    
    eps = 1e-12;
    
    n=1;
    x(1) = x0;
    v(1) = f(x0);
    e(1) = x0;
    while e(n) > eps
        n = n + 1;
        x(n) = x(n-1) - f(x(n-1))/df(x(n-1));
        v(n) = f(x(n));
        e(n) = abs(x(n) - x(n-1));
    end
    
    fprintf('Nullstelle mit der Genauigkeit %.2e',eps)
    fprintf(' gefunden nach %i Iterationen!\n', n-2)
end

