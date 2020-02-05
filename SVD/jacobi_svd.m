function [U,S,V]=jacobi_svd(A)
% [U S V]=jacobi_svd(A)
% A is original square matrix
% Singular values come back in S (diag matrix)
% orig matrix = U*S*V'
%
% One-sided Jacobi algorithm for SVD
% lawn15: Demmel, Veselic, 1989,
% Algorithm 4.1, p. 32

TOL=1.e-8;
MAX_STEPS=40;
n=size(A,1);
U=A;
V=eye(n);

for steps=1:MAX_STEPS
    converge=0;
    for j=2:n
        for k=1:j-1
        
            % compute [alpha gamma;gamma beta]=(k,j) submatrix of U'*U
            alpha=0;
            beta=0;
            gamma=0;

            for l=1:n
            alpha=alpha+(U(l,k))^2; 
            end

            for l=1:n
            beta=beta+(U(l,j))^2; 
            end

            for l=1:n
            gamma=gamma+(U(l,k))*(U(l,j)); 
            end

            converge=max(converge,abs(gamma)/sqrt(alpha*beta));
            % compute Jacobi rotation that diagonalizes
            % [alpha gamma;gamma beta]

            if gamma ~= 0
                zeta=(beta-alpha)/(2*gamma);
                t=sign(zeta)/(abs(zeta)+sqrt(1+zeta^2));
            else
            % if gamma=0, then zeta=infinity and t=0
                t=0;
            end

            c=1/sqrt(1+t^2);
            s=c*t;
            % update columns k and j of U
               
            for l=1:n
                T=U(l,k);
                U(l,k)=c*T-s*U(l,j);
                U(l,j)=s*T+c*U(l,j);
            end
            % update matrix V of right singular vectors
            
            for l=1:n
                T=V(l,k);   
                V(l,k)=c*T-s*V(l,j);
                V(l,j)=s*T+c*V(l,j);
            end
            
        end
    end

    if converge < TOL
        break;
    end
end

if steps >= MAX_STEPS
    error('jacobi_svd failed to converge!');
end

% the singular values are the norms of the columns of U
% the left singular vectors are the normalized columns of U
for j=1:n
    singvals(j)=norm(U(:,j));
    U(:,j)=U(:,j)/singvals(j);
end

S=diag(singvals);

end