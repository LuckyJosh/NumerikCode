disp("")
disp("Ausgabe 2")
disp("")

x = single([0.8:5e-05:1.2]); % Definieren der x Werte mit Datentyp single 
p_f = (x.-1).**7;            % Faktorisierte Darstellung des Polynoms 
p_h = ((((((((((((x.-7).*x).+21).*x).-35).*x).+35).*x).-21).*x).+7).*x).-1; % Horner Darstellung des Polynoms


plot(x, p_h, "r") % Plot der Horner Darstellung
hold on
plot(x, p_f) % und er faktoriesierten Darstellung in einem Plot
legend( "horner","faktor") % Legende zur Untesrscheidung beider Plots

% Die Auswertung des Polynoms mittels der Hornerform führt 
% für den Datentyp single zu Oszillation der Funktionswerte 
% um die x-Achse.
% Dies liegt daran, dass in der Hornerform mehr Operationen durchgeführt
% und dabei mehr Rundungsfehler gemacht werden.