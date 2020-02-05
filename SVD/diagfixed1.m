function S= diagfixed1(A)
% Fixed Point function equivalent to MATLAB function diag(A)

[m,n]=size(A);
A1=fi(A,1,40,20);
for i=1:n
    for j=1:n
        if i==j
            S(i,j)=A1(1,j);
        else
            S(i,j)=0;
        end
     end
end