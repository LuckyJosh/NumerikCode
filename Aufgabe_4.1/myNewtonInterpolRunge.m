
%   Funktion zum Testen der Funktionen 'myNewtonInterpol'
%   und 'myNewtonPolynomial'.
%   Dabei wird die Rungefunktion
%   jeweils einmal mittels n aequidistanter Knoten und 
%   n Tschebyscheff-Knoten interpoliert.
%   Die Funktionsverläufe von Rungefunktion und beider 
%   Interpolationspolynome, inklusiver der verwendeten Knoten,  
%   werden in einem Plot dargestellt. 
%   Ausserdem werden die maximalen Fehler der Interpolationspolynome 
%   ausgegeben.  
%   
%   Parameter:
%   n - Anzahl der Knoten 
  

function myNewtonInterpolRunge(n)

% Definition der Runge Funktion 
runge = @(x) 1./(((x.^2).*25)+1);

% äquidistante Knoten und Funktionswerte der Rungefunktion
x_a = linspace(-1, 1, n + 1); 
y_a = runge(x_a);

% Funktion zur Berechnung der Tschebyscheff Knoten 
tscheby = @(i, n) cos((((2.*i)+1).*pi)/(2*n + 2));

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
plot(x_a, y_a, 'rx', 'markersize',20);

%Plot der Tschebyscheff Knoten
plot(x_t, y_t, 'bx', 'markersize',20);

% Bestimmung der Funktionswerte des Newtoninterpolationspolynoms durch die äquidistanten Knoten
P_a = myNewtonPolynomial(X, x_a, y_a);
% Plot des Newtoninterpolationspolynoms
plot(X, P_a, 'r')

% Bestimmung der Funktionswerte des Newtoninterpolationspolynoms durch die Tschebyscheff Knoten
P_t = myNewtonPolynomial(X, x_t, y_t);
% Plot des Newtoninterpolationspolynoms
plot(X, P_t, 'b')

% Plot-Legende 
xlabel('x')
ylabel('y')
legend('Runge Funktion', 'Äquidistante Konten', 'Tschebyscheff Knoten','Interpolation Äquidist.', 'Interpolation Tschebyscheff', 'location', 'south');
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
    fprintf('\nAnzahl der Knoten n = %d \n', n)
    fprintf('Maximaler Fehler des Interpolationspolynoms mit aequidistanten Knoten\n R_a = %f \n', max(R_a) )
    fprintf('Maximaler Fehler des Interpolationspolynoms mit Tschebytscheff Knoten\n R_t = %f \n', max(R_t) )
end
