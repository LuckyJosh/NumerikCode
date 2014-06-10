function [x,e,v] = myBisect(f,x00,x0)


% % Testen auf Bedingung f(x00) * f(x0) < 0
% assert(f(x00)*f(x0) < 0, 'f(x00)*f(x0) ist nicht kleiner Null')
% if x00 > x0
%     temp = x00;
%     x00 = x0;
%     x0 = temp;
%     disp('Grenzen wurden getauscht, sodass x00 < x0 gilt')
% end
eps = 1e-12;
n = 2;


x(1) = x00;
x(2) = x0;
e(2) = x(2) - x(1);
v(1) = f(x00);
v(2) = f(x0);

while e(n) > eps
    n= n + 1;
    x(n) = (x00 + x0)/2;
    v(n) = f(x(n));
    if f(x(n)) * f(x00) < 0
        x0 = x(n);
    elseif  f(x(n)) * f(x0) < 0
        x00 = x(n);
    end
    e(n) = abs(x(n) - x(n-1));   
end

fprintf('Nullstelle mit der Genauigkeit %.2e',eps)
fprintf(' gefunden nach %i Iterationen!\n', n-2)



end

