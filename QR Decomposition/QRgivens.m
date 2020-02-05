function [Q,R] = QRgivens(A)

%%
[m,n] = size(A);            % get size of A
R = A;                      % assign R as A
Q = eye(m);                 % assign Q as identity matrix of size m

%%
 for j = 1:n
    for i = m:-1:(j+1)
      G = eye(m);           % create matrix G as identity matrix of size m
      a = R(i,j);
      b = R(i-1,j);
      
      % compute the rotation submatrix
      if a~= 0
        if abs(a)>abs(b)
            t = b/a; 
            s = 1/sqrt(1 + t^2);
            c = s*t;
        else
            t = a/b;
            c = 1/sqrt(1 + t^2);
            s = c*t;
        end
    else
        c = 1;
        s = 0;
    end
%%
      G([i-1,i],[i-1,i]) = [c -s;s c];
      R = G'*R;
      Q = Q*G;
    end
  end

end
