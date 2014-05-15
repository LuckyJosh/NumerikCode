format long

function [c] = myNewtonInterpol(x,f)
  %{
  Funktion zur Berechnung der Koeffizienten des Newtoninterolationspolynoms
  durch die Knoten (x|f).
  
  Parameter:
  x - x-Wert der Knoten, durch die das Interpolationspolynom geht (1 x n Matrix)
  f - y-Wert der Knoten, durch die das Interpolationspolynom geht (1 x n Matrix)
  
  Ausgabe:
  c - Newtoninterpolationskoeffitienten
  %}
  
  if length(x) ~= length(f)
    error("Die Parameter x und f muessen die selbe Dimension haben!")
  end
  
  % Anzahl der Punktepaare 
  n = length(x);
  
  % Erstellen einer n x n Nullmatrix zur Verwendung
  % als dividierte Differenzen (div. Diff.) Tabelle
  D = zeros(n, n);
  
  % Die erstes Spalte entspricht den Funktionswerten f(x_i)
  D(1:n) = f;
  
  % Iteration über die Spalten der div. Diff. Tabelle
  for j=[2:n] 
    % Iteration über alle Zeilen, beginnend mit der j-ten, pro Spalte
    % damit über alle Zellen die auf oder unterhalb der 'Hauptdiagonalen'
    % liegen.
    for i=[j:n]
      % Berechnung jedes Eintrags nach Definition der div. Diffs.
      % Der Wert einer Zelle ergibt sich aus der Division der
      % Differenzen (1) und (2)
      % (1) Differenz der Eintäge der Zellen 'links' und 'links oben'
      %  von der zu füllenden Zelle aus
      % (2) "Leider fällt mir hierzu keine schlüssige Beschreibung ein :("      
      D(i,j) = (D(i,j-1)-D(i-1,j-1))/(x(i) - x(i-(j-1)));
    end
  end
  % Die Koeffizienten des Interpolationspolynoms sind die 
  % Diagonalelemente der Matrix
  c = diag(D);
endfunction 


function [P] = myNewtonPolynomial(X, x, f)
	%{
    Funktion zur Berechnung der Funktionswerte des Newton-Interpolationspolynoms
    durch die Punkte (x/f) an den Stellen X.
    
    Parameter:
    X - x-Werte an denen die Funktionswerte berechnet werden (n x 1 Matrix)
    x - x-Werte der Konten, durch die das Interpolationspolynom geht
    f - y-Werte der Knoten, durch die das Interpolationspolynom geht
    
    Ausgabe:
    P - Werte des Interpolationspolynom an den Stellen X
  %}
   
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
		prod = prod.*(X.-x(k));
		k = k - 1;
    end
    % Multiplikation mit dem  jeweiligen Koeffizienten des Basispolynoms
    % Summation aller berechneten Monome   
		P = P.+ prod.*c(i);
	end
endfunction


function myNewtonInterpolTest(n)
%{
  Funktion zum Testen der Funktionen 'myNewtonInterpol'
  und 'myNewtonPolynomial'.
  Dabei wird die Rungefunktion
  jeweils einmal mittels n aequidistanter Knoten und 
  n Tschebyscheff-Knoten interpoliert.
  Die Funktionsverläufe von Rungefunktion und beider 
  Interpolationspolynome, inklusiver der verwendeten Knoten,  
  werden in einem Plot dargestellt. 
  Ausserdem werden die maximalen Fehler der Interpolationspolynome 
  ausgegeben.  
  
  Parameter:
  n - Anzahl der Knoten 
  
%}



% Definition der Runge Funktion 
runge = @(x) 1./(((x.^2).*25).+1);

% äquidistante Knoten und Funktionswerte der Rungefunktion
x_a = linspace(-1, 1, n + 1); 
y_a = runge(x_a);

% Funktion zur Berechnung der Tschebyscheff Knoten 
tscheby = @(i, n) cos((((2.*i).+1).*pi)/(2*n + 2));

% Berechnung der Tschebyscheff Knoten für i = 0,...,n
% und die Funktionswerte der Rungefunktion
i = [0:n];
x_t = tscheby(i,n);
y_t = runge(x_t);


% Zum plotten verwendete X-Werte
X = linspace(-1,1,1000);

% Plot der Rungefunktion
plot(X, runge(X), 'g');
hold on

% Plot der äquidistanten Knoten
plot(x_a, y_a, 'rx', "markersize",20);

%Plot der Tschebyscheff Knoten
plot(x_t, y_t, 'bx', "markersize",20);

% Bestimmung der Funktionswerte des Newtoninterpolationspolynoms durch die äquidistanten Knoten
P_a = myNewtonPolynomial(X, x_a, y_a);
% Plot des Newtoninterpolationspolynoms
plot(X, P_a, "r")

% Bestimmung der Funktionswerte des Newtoninterpolationspolynoms durch die Tschebyscheff Knoten
P_t = myNewtonPolynomial(X, x_t, y_t);
% Plot des Newtoninterpolationspolynoms
plot(X, P_t, "b")

% Plot-Legende 
xlabel("x")
ylabel("y")
legend("Runge Funktion", "Äquidistante Konten", "Tschebyscheff Knoten","Interpolation Äquidist.", "Interpolation Tschebyscheff", "location", "south");
t = strjoin({'Newtoninterpolation mit äquidistanten und Tschebyscheff Knoten n = ', num2str(n)});
title(t);

% Anlegen des Gitters
D = linspace(-1,1, 101);

% Iteration über die Indizes des Gitters
for i = [1: length(D)]
    % Berechnung des Fehlers zwischen Runge-Funktion und Interpolationpolynom
    % sowohl für die äquidistanten als auch für die Tschebyscheff Knoten 
    % für jedes Element des Gitters 
    R_a(i) = abs(runge(D(i)) - myNewtonPolynomial(D(i), x_a, y_a));
    R_t(i) = abs(runge(D(i)) - myNewtonPolynomial(D(i), x_t, y_t));
end
    % Ausgabe des jeweils maximalen Fehlers
    printf("\nAnzahl der Knoten n = %d \n", n)
    printf("Maximaler Fehler des Interpolationspolynoms\
mit aequidistanten Knoten\n R_a = %f \n", max(R_a) )
    printf("Maximaler Fehler des Interpolationspolynoms\
mit Tschebytscheff Knoten\n R_t = %f \n", max(R_t) )
endfunction


% Erstellen der Plots für die drei geforderten n
% in einer jeweils eigenen figure 
for n=[7, 12, 17]
    figure;
    myNewtonInterpolTest(n);
end
