%     Funktion zum Testen der Funktion 'myQuadratur1D'.
%     Der Test wird mit den vier Funktionen
%     f_2(x) = x^2, f_3(x) = x^3, f_4(x) = x^4 und 
%     f_5(x) = x^5 unter Verwendung aller Quadraturformeln
%     durchgeführt.
%     
%     Die Abweichungen der Quadraturformeln von den Funktionen 
%     werden in einem Plot veranschaulicht. 

function myQuadratur1DTest()

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


% Der Vergleich der Abweichungen vom Polynom zeigt zum einen,
% das die Genauigkeit der Quadratur mit zunehmender Anzahl an Teilintervallen zu nimmt. 
% Weiter lässt sich erkennen, dass die Trapezregel für Polynome 
% höheren Grades immer ungenauer wird.
% Dahingegen sind die Simpson- und Milne-Regel auf bei Polynomen 
% so genau, dass nur ein sehr geringer Unterschied besteht.
% Da der Fehler der Milne-Regel von der 6. Ableitung der Funktion abhängt,
% wird f von dieser sogar exakt integriert.    

