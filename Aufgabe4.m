format long

function [v]=myQuadratur1D(f,w,p,a,b,N)
  %{
   
  Funktion zu numerischen Berechnung von Intergralen 
  mittels beliebgiger Quadraturformeln, mit den Parametern
  
  f - zu Integrierende Funktion (function_handle)
  w - Quadraturgewichte der Stuetzstellen (1 x n - Matrix)
  p - Stuetzstellen (1 x n - Matrix)
  a - Intervallbeginn (1 x 1- Matrix bzw. Skalar)
  b - Intervallende (1 x 1- Matrix bzw. Skalar)
  N - Anzahl der Teilintervalle (1 x 1- Matrix bzw. Skalar) 
  
  und dem Rueckgabewert
   
  v - Quadraturergebnis
  
  Beispiel:
  Quadratur des Polynoms f(x) = x^3 mit der Trapezregel 
  ueber 4 Teilintervalle von 0 bis 4
  f = @(x) x^3;
  myQuadratur1D(f,[0.5 0.5], [0 1], 0, 4, 4);
  
  Ergibt den Wert: 68
  Das Intergral von 0 bis 4 ueber f(x) ergibt: 64 
  
  Weiter Beispiele:
  
  Simpson-Regel: 
  p = [0 0.5 1];  
  w = [1/6 4/6 1/6];
   
  Milne-Regel:
  p = [0 0.25 0.5 0.75 1];
  w = [7/90 32/90 12/90 32/90 7/90];
  
  %}
  
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
endfunction

function myPolynomVergleich(n, f, I_f, W, P, a, b, N)
%{
 Funktion zur Erstellung des Plots zum Vergleich der 
 der Genauigkeit der Quadraturformeln.
 
 Parameter:
 n - Grad des Polynoms
 f - Polynom (function_handle)
 I_f - Analytische Lösung
 W - Gewichte aller drei Quadraturformeln
 P - Quadraturpunkte aller drei Quadraturformeln 
 a - Intervallanfang
 b - Intervallende
 N - Anzahl der Teilintervalle
%}
  
  % Berechnung der Abweichung für jedes N und jede Quadratur
  for i = [1:length(N)]
    R_T(i) = abs(I_f - myQuadratur1D(f, W(1:2), P(1:2), a, b, N(i)));
    R_S(i) = abs(I_f - myQuadratur1D(f, W(3:5), P(3:5), a, b, N(i)));
    R_M(i) = abs(I_f - myQuadratur1D(f, W(6:10), P(6:10), a, b, N(i)));
  end
  % Plot der Abweichung gegen das jeweilige N
  figure;
  t = strjoin({"Abweichung der Quadraturen","Ploynom ", num2str(n), ". Grades"});
  title(t); 
  hold on;
  %bar(N, [R_T; R_S; R_M]',"stacked");
  stem(N, R_T, "r");
  stem(N, R_S, "b");
  stem(N, R_M, "g");
  xlabel("Anzahl der Teilintervalle N")
  ylabel("Absolute Abweichung er Quadratur vom Polynom")
  legend("Trapez-Regel", "Simpson-Regel", "Milne-Regel")
  hold off;

endfunction

function myQuadratur1DTest()
  %{
    Funktion zum Testen der Funktion 'myQuadratur1D'.
    Der Test wird mit den vier Funktionen
    f_2(x) = x^2, f_3(x) = x^3, f_4(x) = x^4 und 
    f_5(x) = x^5 unter Verwendung aller Quadraturformeln
    durchgeführt.
    
    Die Abweichungen der Quadraturformeln von den Funktionen 
    werden in einem Plot veranschaulicht. 
  %}

  
  % Integrationsintervall von a bis b
  a = 0;
  b = 2;

  % Polynom 2. Grades
  f_2 = @(x) x^2; % I(f) = 8/3
  % Analytisches Ergebnis
  I_f_2 = 8/3;

  % Polynom 3. Grades
  f_3 = @(x) x^3; % I(f) = 4
  % Analytisches Ergebnis
  I_f_3 = 4;

  % Polynom 4. Grades
  f_4 = @(x) x^4; % I(f) = 6.4
  % Analytisches Ergebnis
  I_f_4 =  6.4;

  % Polynom 5. Grades
  f_5 = @(x) x^5; % I(f) = 32/3
  % Analytisches Ergebnis
  I_f_5 = 32/3;

  % Quadraturpunkte und -gewichte der jeweiligen Quadraturformel
  p_T = [0 1]; % Trapez-Regel
  w_T = [0.5 0.5]; % Trapez-Regel

  p_S = [0 1/2 1]; % Simpson-Regel
  w_S = [1/6 4/6 1/6]; % Simpson-Regel

  p_M = [0 1/4 1/2 3/4 1]; % Milne-Regel
  w_M = [7/90 32/90 12/90 32/90 7/90]; % Milne-Regel

  % Anzahl der Teilintervalle
  N = [10, 100, 1000];
  
  % Vergleich der Genauigkeit für das Polynom 2. Grades
  myPolynomVergleich(2, f_2, I_f_2, [w_T, w_S, w_M], [p_T, p_S, p_M], a, b, N)

  % Vergleich der Genauigkeit für das Polynom 3. Grades
  myPolynomVergleich(3, f_3, I_f_3, [w_T, w_S, w_M], [p_T, p_S, p_M], a, b, N)

  % Vergleich der Genauigkeit für das Polynom 4. Grades
  myPolynomVergleich(4, f_4, I_f_4, [w_T, w_S, w_M], [p_T, p_S, p_M], a, b, N)

  % Vergleich der Genauigkeit für das Polynom 5. Grades
   myPolynomVergleich(5, f_5, I_f_5, [w_T, w_S, w_M], [p_T, p_S, p_M], a, b, N)


end


myQuadratur1DTest()

% Der Vergleich der Abweichungen vom Polynom zeigt zum einen,
% das die Genauigkeit der Quadratur mit zunehmender Anzahl an Teilintervallen zu nimmt. 
% Weiter lässt sich erkennen, dass die Trapezregel für Polynome 
% höheren Grades immer ungenauer wird.
% Dahingegen sind die Simpson- und Milne-Regel auf bei Polynomen 
% so genau, dass nur ein sehr geringer Unterschied besteht.
% Da der Fehler der Milne-Regel von der 6. Ableitung der Funktion abhängt,
% wird f von dieser sogar exakt integriert.    

