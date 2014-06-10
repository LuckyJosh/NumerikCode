function [x,e,v] = myBisect(f,x00,x0)


% Testen auf Bedingung f(x00) * f(x0) < 0
assert(f(x00)*f(x0) < 0, 'f(x00)*f(x0) ist nicht kleiner Null')
if x00 > x0
    temp = x00;
    x00 = x0;
    x0 = temp;
    disp('Grenzen wurden getauscht, sodass x00 < x0 gilt')
end
    

n = 2;
x(1) = x00;
x(2) = x0;
e(2) = x(2) - x(1);
eps = 1e-12;
while e(n) > eps
    
    x(n+1) = (x00 + x0)/2;
    v(n+1) = f(x(n+1));
    if f(x(n)) * f(x00) < 0
        x0 = x(n+1);
    elseif  f(x(n+1)) * f(x0) < 0
        x00 = x(n+1);
    end
    n= n + 1;
    e(n) = x(n) - x(n-1);
    
end

fprintf('Nullstelle mit der Genauigkeit %.2e',eps)
fprintf(' gefunden nach %i Iterationen!\n', n)



end

