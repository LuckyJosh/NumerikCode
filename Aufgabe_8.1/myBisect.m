
function [x,e,v] = myBisect(f,x00,x0)
% 
% Funktion zur Berechnung der Nullstelle der 
% Funktion f im Intervall [x00, x0] unter Verwendung
% des Bisektionsverfahrens
%
% Parameter:
% f - Funktion deren Nullstelle berechnet 
%     werden soll (function_handle)
% x00 - Intervallanfang (1x1 Matrix, Skalar)
% x0  - Intervallende (1x1 Matrix, Skalar)
%
% Rückgabewert:
% x - Iterationswerte der Nullstelle x_n
% e - Absoluter Fehler zweier Näherungen |x_n - x_n-1|
% v - Funktionswerte der Iterationswerte f(x_n)


% Genauigkeit der Iteration
eps = 1e-12;

% Initialisierung der Anfangswerte
n = 1;
x(1) = x00;
e(1) = x0 - x00;
v(1) = f(x00);

% Iteration bis Genauigkeit erreicht ist
while e(n) > eps 
    n = n + 1;
    
    % Berechnung des Intervallmittelpunkts
    x(n) = (x00 + x0)/2;
    
    % Berechnung der Funktionswerte
    v(n) = f(x(n));
    
    % Testen in welchem Intervall die Nullstelle liegt  
    if f(x(n)) * f(x00) < 0
        x0 = x(n);
    elseif  f(x(n)) * f(x0) < 0
        x00 = x(n);
    end
    % Berechnung des absoluten Fehlers
    e(n) = abs(x(n) - x(n-1));   
end
% Ausgabe der Anzahl der benötigten Iterationen
fprintf('Nullstelle mit der Genauigkeit %.2e',eps)
fprintf(' gefunden nach %i Iterationen!\n', n-1)



end

