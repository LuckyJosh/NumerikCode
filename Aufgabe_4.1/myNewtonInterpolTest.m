% Erstellen der Plots f�r die drei geforderten n
% in einer jeweils eigenen figure 
function myNewtonInterpolTest()
    for n=[7, 12, 17]
        figure;
        myNewtonInterpolRunge(n);
    end
end
