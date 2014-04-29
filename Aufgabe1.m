format long 
disp("")
disp("Ausgabe Aubgabe a)")
disp("")

for n=[3:3:30]		    % For-Schleife die �ber 3, 6, 9..., 30 iteriert	
	x = -5.5;		        % Setzen des x-Werts
	sum_a = 0; 		      % Variable in der das Ergebnis aufsummiert wird
	for k = [0:n]	      % For-Schleife um das nächste Reihenglied zu berechnen
		sum_a = sum_a + ((x**k)/factorial(k));
	end             
	n                   % Ausgabe der Summandenanzahl n
	sum_a               % Ausgabe des Ergbnisses
end

disp("")
disp("Ausgabe Aubgabe b)")
disp("")

for n=[3:3:30]		    % For-Schleife die �ber 3, 6, 9..., 30 iteriert	
	x = 5.5;		        % Setzen des x-Werts
	sum_b = 0; 		      % Variable in der das Ergebnis aufsummiert wird
	for k =[0:n]	      % For-Schleife um das nächste Reihenglied zu berechnen
		sum_b = sum_b + ((x**k)/factorial(k));
	end
	n                   % Ausgabe der Summandenanzahl n
	sum_b = 1/sum_b;    % Invertierung der Summe 
  sum_b               % Ausgabe des Ergbnisses
end

disp("")
disp("Ausgabe Aubgabe c)")
disp("")

for n=[3:3:30]		    % For-Schleife die �ber 3, 6, 9..., 30 iteriert		
	x = -0.5;		        % Setzen des x-Werts
	sum_c = 0; 		      % Variable in der das Ergebnis aufsummiert wird
	for k =[0:n]	      % For-Schleife um das nächste Reihenglied zu berechnen
		sum_c = sum_c + ((x**k)/factorial(k));
	end
	n                   % Ausgabe der Summandenanzahl n
	sum_c = sum_c**11;  % Potenzierung der Summe 
  sum_c               % Ausgabe des Ergbnisses  
end


% Im Vergleich mit dem gegebenen Wert  exp(-5.5) = 0.0040867714 zeigt sich,
% dass f�r n = 30 alle drei Ans�tze das(bis auf die angegebene Stelle) gleiche Ergebnis 
% liefern.
% F�r n < 30 sind die Werte der drei Ans�tze, jedoch unterschiedlich und konvergieren 
% unterschiedlich schnell. So ist der erste Ansatz erst nach n=30 und der zweite erstnach n=24 
% Summanden bei der Genauigkeit die der dritte Ansatz schon bei n = 9 besitzt. 
% Der Grund daf�r ist, dass in der Summe des ersten Ansatzes zun�chst gro�e Zahlen 
% addiert und subtrahiert werden, die erst f�r gro�e n kleiner werden,
% sodass auch er Summenwert f�r keine n sehr gro� ist.
% Verbesserung wird in Ansatz zwei erziehlt in dem zun�chst der Summenwert der Inversen Summe berechnet
% und dannach durch Invertierung der gew�nschte Wert berechnet wird.
% Dies f�ht zu besseren Ergbnissen, da die Inverse Summe schneller w�chst und man durch die Invertierung des
% Summenwerts dann genauere Ergebnisse f�r kleiner n erh�lt.
% Der dritte Ansatz funktioniert noch besser, da hier sehr kleine Zahlen aufsummiert werden, die somit 
% schneller konvergieren und man durch Potentiern des Summenwerts schnon f�r kleine n genauere Ergebnisse erh�lt
