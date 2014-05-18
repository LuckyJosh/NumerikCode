% 
%     Funktion zur Berechnung der Funktionswerte des Newton-Interpolationspolynoms
%     durch die Punkte (x/f) an den Stellen X.
%     
%     Parameter:
%     X - x-Werte an denen die Funktionswerte berechnet werden (n x 1 Matrix)
%     x - x-Werte der Konten, durch die das Interpolationspolynom geht
%     f - y-Werte der Knoten, durch die das Interpolationspolynom geht
%     
%     Ausgabe:
%     P - Werte des Interpolationspolynom an den Stellen X
%  
function [P] = myNewtonPolynomial(X, x, f)
  % Anzahl der Knoten
  n = length(x);
  
  % Newtonpolynom Koeffizienten zu den gegebenen Knoten 
  c = myNewtonInterpol(x, f);
  
  % Absolutes Gleid des Interpolationspolynoms
  % Mit dem nullten Newtonbasispolynom N_0 = 1
	P = c(1) *  1;
  
  % Iteration über die Indizes der fogenden Knoten
	for i = [2:n]
    % Variable zur Speicherung des Polynomwertes
		prod = 1;
    % Obere Grenze der Multiplikation in der Definition der Basispolynome
    k = i-1;
    % Berechnung der Newtonbasispolynome
	while k > 0
		prod = prod.*(X-x(k));
		k = k - 1;
    end
    % Multiplikation mit dem  jeweiligen Koeffizienten des Basispolynoms
    % Summation aller berechneten Monome   
		P = P+ prod.*c(i);
	end
end
