function a = normfixed1(A)
% Fixed Point function equivalent to MATLAB function norm(A)

[m,n] = size(A);                % Get size value of A
sum1 = 0;
    sum1 = fi(sum1,1,40,20);
    for j = 1:m
        sum1 = sum1+(A(j,1)^2); % Square each element and sum
    end
x = sqrt(sum1);                 % Calculate norm
a = fi(x,1,40,20);
end       
        