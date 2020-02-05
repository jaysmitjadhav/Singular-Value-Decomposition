function [U,S,V]=jacobi_svd1(A)
% Floating Point function equivalent to MATLAB function svd(A) implemented
% using 1-sided Jacobi algorithm

[m,n]=size(A);                      % Get size of matrix A
U = A;                              % Assign U as A
V=eye(n);                           % Assign V as identity matrix of size n
count=5;                            % Number of sweeps

%%
while(count>=1)
    
    for i = 1:n-1
    
        for j = i+1:n

             a = norm(U(:,i),2);    % Calculate norm of ith column
             b = norm(U(:,j),2);    % Calculate norm of jit column
             
                % Assure the singular values will appear in decreasing order in S
                % swap columns i and j of U and V
                if a < b

                temp(:,j) = U(:,j);
                U(:,j) = U(:,i);
                U(:,i) = temp(:,j);

                temp1(:,j) = V(:,j);
                V(:,j) = V(:,i);
                V(:,i) = temp1(:,j);

                end
                
                %% 
                % Compute submatrix of U'U
                x=0;
                y=0;
                w=0;

                for k=1:m
                x=x+(U(k,i))^2; 
                end

                for k=1:m
                y=y+(U(k,j))^2; 
                end

                for k=1:m
                w=w+(U(k,i))*(U(k,j)); 
                end
                %% 
                % Compute the Jacobi rotation that diagonalizes the
                % submatrix
                if w ~= 0
                    alpha=(y-x)/(2*w);

                    if alpha>=0
                        t = 1/(abs(alpha)+sqrt(1+alpha^2));
                    else
                        t = -(1/(abs(alpha)+sqrt(1+alpha^2)));
                    end

                    c=1/sqrt(1+t^2);
                     s=c*t;
                else
                     c=1;
                     s=0;
                end
                %%   
                    % update columns i and j of U
                    T = U(:,i);
                    U(:,i)=c*T-s*U(:,j);
                    U(:,j)=s*T+c*U(:,j);
                    
                    % update matrix V of right singular vectors
                    T = V(:,i);
                    V(:,i)=c*T-s*V(:,j);
                    V(:,j)=s*T+c*V(:,j);


        end 

    end
count = count - 1;
end
%%
%singular values are the norms of the columns of U
for j=1:n
    singvals(j)=norm(U(:,j),2);
    if (singvals(j) > 0)
     U(:,j) = U(:,j)/singvals(j);
    end 
end

S=diag(singvals);           % Arrange singular values along the diagonal of S
end

