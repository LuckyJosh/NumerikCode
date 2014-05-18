%   Funktion zur Berechnung der Koeffizienten des Newtoninterolationspolynoms
%   durch die Knoten (x|f).
%   
%   Parameter:
%   x - x-Wert der Knoten, durch die das Interpolationspolynom geht (1 x n Matrix)
%   f - y-Wert der Knoten, durch die das Interpolationspolynom geht (1 x n Matrix)
%   
%   Ausgabe:
%   c - Newtoninterpolationskoeffitienten
%   
function [c] = myNewtonInterpol(x,f)

  
  if length(x) ~= length(f)
    error('Die Parameter x und f muessen die selbe Dimension haben!')
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
      % (2) 'Leider fällt mir hierzu keine schlüssige Beschreibung ein :('      
      D(i,j) = (D(i,j-1)-D(i-1,j-1))/(x(i) - x(i-(j-1)));
    end
  end
  % Die Koeffizienten des Interpolationspolynoms sind die 
  % Diagonalelemente der Matrix
  c = diag(D);
end 