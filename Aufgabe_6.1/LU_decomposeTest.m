% Skript zum Testen der der Implementierung der Funktionen 
% LU_decompose, forward_solve und backward_solve

% Erstellen von 5 Zufallsmatrizen, verschiedener Dimension
M = cell(1,5);
for i = 1:5
   M{i} = rand(2+i) * ceil(rand(1)*10);
end

% Zufällige rechte Seiten des Gleichungsystems, mit übereinstimmender
% Dimension
b = cell(1,5);
for i = 1:5
   b{i} = rand(2+i,1) * ceil(rand(1)*10);
end

% Berechnung der Lösung des Gleichungssystems Mx = b durch die 
% LU-Zerlegung => x und dem MATLAB "\" Operator => X 
x = cell(1,5);
X = cell(1,5);
for i = 1:5
    LU = LU_decompose(M{i});
    x{i} = backward_solve(LU, forward_solve(LU, b{i}));
    X{i} = M{i}\b{i};
end    

% Ausgabe der Ergebnisse
for i = 1:5
    fprintf('%i. Ergbnis der LU-Zerlegung:\n',i);
    disp(x{i});
    fprintf('\n %i. Ergbnis mit M\\b:\n', i);
    disp(X{i});
end