%  Funktion zur Erstellung des Plots zum Vergleich der 
%  der Genauigkeit der Quadraturformeln.
%  
%  Parameter:
%  n - Grad des Polynoms
%  f - Polynom (function_handle)
%  I_f - Analytische Lösung
%  W - Gewichte aller drei Quadraturformeln
%  P - Quadraturpunkte aller drei Quadraturformeln 
%  a - Intervallanfang
%  b - Intervallende
%  N - Anzahl der Teilintervalle

function myPolynomVergleich(n, f, I_f, W, P, a, b, N)

  % Berechnung der Abweichung für jedes N und jede Quadratur
  for i = [1:length(N)]
    R_T(i) = abs(I_f - myQuadratur1D(f, W(1:2), P(1:2), a, b, N(i)));
    R_S(i) = abs(I_f - myQuadratur1D(f, W(3:5), P(3:5), a, b, N(i)));
    R_M(i) = abs(I_f - myQuadratur1D(f, W(6:10), P(6:10), a, b, N(i)));
  end
  % Plot der Abweichung gegen das jeweilige N
  figure;
  t = strjoin({'Abweichung der Quadraturen','Ploynom ', num2str(n), '. Grades'});
  title(t); 
  hold on;
  
  %bar(N, [R_T; R_S; R_M]','stacked');
  stem(N, R_T, 'r');
  stem(N, R_S, 'b');
  stem(N, R_M, 'g');
  xlabel('Anzahl der Teilintervalle N');
  ylabel('Absolute Abweichung er Quadratur vom Polynom');
  legend('Trapez-Regel', 'Simpson-Regel', 'Milne-Regel');
  set(gca,'yscal','log', 'xscal', 'log');
  hold off;

end