function [x,e,v] = myNewton(f, df, x0)
% 
% Funktion zur Berechnung der Nullstelle der 
% Funktion f  unter Verwendung
% des Newtonverfahrens
%
% Parameter:
% f - Funktion deren Nullstelle berechnet 
%     werden soll (function_handle)
% df  - Ableitung der Funktion f (function_handle)
% x0  - Startwert (1x1 Matrix, Skalar)
%
% Rückgabewert:
% x - Iterationswerte der Nullstelle x_n
% e - Absoluter Fehler zweier Näherungen |x_n - x_n-1|
% v - Funktionswerte der Iterationswerte f(x_n)


    % Genauigkeit der Nullstell
    eps = 1e-12;
    
    % Initialisierung der Startwerte
    n = 1;
    x(1) = x0;
    v(1) = f(x0);
    e(1) = x0;
    
    % Iteration bis Genauigkeit oder 50 Iterationen erreicht sind
    while e(n) > eps && n < 50
        n = n + 1;
        % Berechnung der Iterationswerte
        x(n) = x(n-1) - v(n-1)/df(x(n-1));
        % Berechnung der Funktionswerte
        v(n) = f(x(n));
        % Berechnung des absoluten Fehlers
        e(n) = abs(x(n) - x(n-1));
    end
    
    % Ausgabe der Benötigten Iterationsschritte
    fprintf('Nullstelle mit der Genauigkeit %.2e',eps)
    fprintf(' gefunden nach %i Iterationen!\n', n-1)
end

