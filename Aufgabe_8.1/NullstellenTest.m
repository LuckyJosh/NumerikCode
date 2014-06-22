% Definition der Testfunktion und Ableitung als function_handle
g = @(x) (cos(2*x))^2 - x^2;
dg = @(x) 2*cos(2*x)*-1*sin(2*x)*2-2*x;

% Startwerte
x00 = 0;
x0 = 0.75;

% Aufruf der Funktionen
[x_b, e_b, v_b] = myBisect(g, x00, x0);
[x_n, e_n, v_n] = myNewton(g, dg, x0);

xlabel('Anzahl der Iterationsschritte n')
ylabel('Absoluter Fehler |x_{n} - x_{n-1}|')
semilogy(1:length(e_b(2:end)),e_b(2:end), 1:length(e_n(2:end)),e_n(2:end))
legend('Bisectionsverfahren', 'Newtonverfahren')