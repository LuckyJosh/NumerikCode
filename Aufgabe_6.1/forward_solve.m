function z = forward_solve(LU, b)
%
%   
    n = size(LU, 1);
    L = LU - triu(LU) + eye(n,n);
    z = zeros(n,1);
    
    z(1:n) = b(1:n);
    for i = 1:n 
        for j = 1:n
            if i~=j
            z(i) = z(i) - L(i,j)*z(j);
            end
        end
    end
%    z(1:n, 1) = b(1:n) * L(1:n,1:n);
%    for k = n:-1:1
%        z(1:n, 1) = -b(circshift([1:n]',k)'); 
%    end
end

