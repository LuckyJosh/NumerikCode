%   Funktion zu numerischen Berechnung von Intergralen 
%   mittels beliebgiger Quadraturformeln, mit den Parametern
%   
%   f - zu Integrierende Funktion (function_handle)
%   w - Quadraturgewichte der Stuetzstellen (1 x n - Matrix)
%   p - Stuetzstellen (1 x n - Matrix)
%   a - Intervallbeginn (1 x 1- Matrix bzw. Skalar)
%   b - Intervallende (1 x 1- Matrix bzw. Skalar)
%   N - Anzahl der Teilintervalle (1 x 1- Matrix bzw. Skalar) 
%   
%   und dem Rueckgabewert
%    
%   v - Quadraturergebnis
%   
%   Beispiel:
%   Quadratur des Polynoms f(x) = x^3 mit der Trapezregel 
%   ueber 4 Teilintervalle von 0 bis 4
%   f = @(x) x^3;
%   myQuadratur1D(f,[0.5 0.5], [0 1], 0, 4, 4);
%   
%   Ergibt den Wert: 68
%   Das Intergral von 0 bis 4 ueber f(x) ergibt: 64 
%   
%   Weiter Beispiele:
%   
%   Simpson-Regel: 
%   p = [0 0.5 1];  
%   w = [1/6 4/6 1/6];
%    
%   Milne-Regel:
%   p = [0 0.25 0.5 0.75 1];
%   w = [7/90 32/90 12/90 32/90 7/90];
%   
 
function [v]=myQuadratur1D(f,w,p,a,b,N);

  
  % Speichern der Anzahl an Stuetzstellen
  R = length(p);
  
  % Breite eines Teilintervals
  h = (b - a)/N;
  
  % Vektor der Teilintervall-Startpunkte
  % mit N- Eintraegen, zunaechst alle 0
  a_i = zeros(1, N);
  
  % Setzen des ersten Startpunkts auf a
  a_i(1) = a;
  
  % Wenn die Anzahl der Teilintervalle groesser
  % als 1 ist, werden die weitern Intervall-Startpunkte
  % in a_i gespeicher
  if N > 1 
    for k = [2:N]
      % Die folgenden Startpunkte berechnen sich aus
      % der Summe des letzten Startpunkts und der Intervallbreite h 
      a_i(k) = a_i(k-1) + h;
    end
  end
  
  % Setzen des Ergebnisses auf 0
  v = 0;
  
  % Iteration ueber alle Intervall-Startpunkte
  for a = a_i
    % Iteration ueber alle Stuetzstellen
    for i = [1:R]
      % Berechnung des Funktionswertes am Intervallstartpunt 
      % und aller folgenden Stuetzstellen
      % Multiplikation mit dem der Stuetzstelle entsprechendem Gewicht
      % Addition des Teilergebnisses zum bisherigen 
      v = v + w(i)*f(a + h*p(i));  
    end
  end
  % Multiplikation des Ergebnisses mit der Intervalllaenge
  v = v * h;
  end






