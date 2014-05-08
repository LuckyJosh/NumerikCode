format short

function [c] = myNewtonInterpol(x,f)
  n = length(x);
  D = zeros(n, n);
  D(1:n) = f;
  # D(zeile, spalte)
 for j=[2:n] #Spalten
  for i=[j:n] # Zeilen
    D(i,j) = (D(i,j-1)-D(i-1,j-1))/(x(i) - x(i-(j-1)));
  end
 end
 c = diag(D);
end








myNewtonInterpol([0,1,3,4,6], [1,3,2,4,6])
