function [U,S,V]=jacobi_svdfixed1(A)
% Fixed Point function equivalent to MATLAB function svd(A) implemented
% using 1-sided Jacobi algorithm

[m,n]=size(A);               % Get size of matrix A
U=A;                         % Assign U as A
V=eyefixed1(n);              % Assign V as identity matrix of size n
count=5;                     % Number of sweeps
%%
while(count>=1)
    
    for i = 1:n-1

        for j = i+1:n

             a = normfixed1(U(:,i));    % Calculate norm of ith column
             b = normfixed1(U(:,j));    % Calculate norm of jit column
                
                
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
                %compute submatrix of U'U
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
                    
                    c1 = fi(c,1,40,20);
                    s1 = fi(s,1,40,20);
                    %% 
                    % update columns i and j of U
                    T1 = U(:,i);
                    U(:,i)=c1*T1-s1*U(:,j);
                    U(:,j)=s1*T1+c1*U(:,j);
                    
                    % update matrix V of right singular vectors
                    T2 = V(:,i);
                    V(:,i)=c1*T2-s1*V(:,j);
                    V(:,j)=s1*T2+c1*V(:,j);


        end 

    end
count = count - 1;
end

%%
%singular values are the norms of the columns of U
for j=1:n
    singvals(j)=normfixed1(U(:,j));
    singvals1=fi(singvals(j),1,40,20);
    if (singvals > 0)
     U(:,j) = U(:,j)/singvals1;
    end 
    
end

U = fi(U,1,40,20);
S=diagfixed1(singvals);     % Arrange singular values along the diagonal of S
end

