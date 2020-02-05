function S= transposedfixed1(A)
% Fixed Point function equivalent to MATLAB function A'

[m,n]=size(A);              % Get size of matrix A
 A1=fi(A,1,40,20);
for i=1:m
    for j=1:n
        S(j,i)=A1(i,j);     % Interchange elements of the matrix
     end
end