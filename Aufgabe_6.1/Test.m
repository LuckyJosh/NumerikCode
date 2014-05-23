U = [3 1 6; 1 1 1; 2 1 5];
n = size(U,1);
G = eye(n,n);


for i = 1:n-1
    for j= i+1:n
        G(j,i) = - U(j,i)/U(i,i);
    end
end

disp(G)

for i = 1:n-1
        G(i+1:n,i) = - U(i+1:n,i)/U(i,i);
end

disp(G)

%i = 1:n-1';
%G(i+1:n,i) = - U(i+1:n,i)/U(i,i);
%disp(G)

m = zeros(2);
for i = 1:3
    for j = 1:3
        for k = 1:3
            for l = 1:3
                m(:) = [i j; k  l];
            end
        end
    end
end

disp(m)