function x = backward_solve(LU, z)
%
%   
    n = size(LU, 1);
    U = triu(LU);
    U_diag = repmat(diag(U), 1, n);
    
    x(1:n,1) = z(1:n,1)./U_diag(1:n,1);
    U(1:n,1:n) = U(1:n,1:n)./U_diag(1:n,1:n);
    U = -1 * U + 2*eye(n,n);
    
    for i=n:-1:1
       x(i) = U(i, n:-1:1) * x(n:-1:1); 
    end
    
    
%     z(1:n) = b(1:n);
%     for i = 1:n 
%         for j = 1:n
%             if i~=j
%             z(i) = z(i) - L(i,j)*z(j);
%             end
%         end
%     end
%    z(1:n, 1) = b(1:n) * L(1:n,1:n);
%    for k = n:-1:1
%        z(1:n, 1) = -b(circshift([1:n]',k)'); 
%    end
end

