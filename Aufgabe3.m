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
endfunction 

function  [P] = myNewtonPolynomial(X, x, c)
	n = length(x);
	P = c(1) *  1;
	for i = [2:n]
		prod = 1;
    k = i-1;
		while k > 0
		prod = prod.*(X.-x(k));
		k = k - 1;
    end
		P = P.+ prod.*c(i);
	end
endfunction




# Runge Funktion 
#runge = @(x) 1./(((x.^2).*25).+1);


# äquidistant
#n = 4;
#x_a = linspace(-1,1, n + 1);
#x_a
#y_a = runge(x_a)

# Tschebyscheff
#tscheby = @(i, n) cos((((2.*i).+1).*pi)/(2*n + 2)) ;
#n = 4;
#i = [0:n];
#x_t = tscheby(i,n)
#y_t = runge(x_t)



function myNewtonInterpolTest()
# Runge Funktion 
runge = @(x) 1./(((x.^2).*25).+1);
n = 17;
# äquidistant
x_a = linspace(-1,1, n + 1);
y_a = runge(x_a);

# Tschebyscheff
tscheby = @(i, n) cos((((2.*i).+1).*pi)/(2*n + 2));
i = [0:n];
x_t = tscheby(i,n)
y_t = runge(x_t)

#X-Werte
X = linspace(-1,1,100);

#Plot Runge
plot(X, runge(X), 'g');
hold on
#Plot Äquidistante Knoten
plot(x_a, y_a, 'rx', "markersize",20);
hold on
#Plot Tschebyscheff Knoten
plot(x_t, y_t, 'bx', "markersize",20);
hold on
# Plot-Legende 
legend("Runge Funktion", "Äquidistante Konten", "Tschebyscheff Knoten");

#Newton Polynom, Äquidistant
P_a = myNewtonPolynomial(X, x_a, myNewtonInterpol(x_a, y_a));
plot(X, P_a, "r")

#Newton Polynom, Tschebytscheff
P_t = myNewtonPolynomial(X, x_t, myNewtonInterpol(x_t, y_t));
plot(X, P_t, "b")

endfunction


myNewtonInterpolTest()
#c = myNewtonInterpol([0,1,3,4,6], [1,3,2,4,6]);
#X = linspace(-10,10, 1000);
#p = myNewtonPolynomial(X, [0,1,3,4,6], c);
#plot([0,1,3,4,6], [1,3,2,4,6], "rx")
#hold on
#plot(X, p)
