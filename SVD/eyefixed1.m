function V= eyefixed1(n)
% Fixed Point function equivalent to MATLAB function eye(n)

a=fi(1,1,40,20);        % Set a=1
b=fi(0,1,40,20);        % Set b=0
for i=1:n
    for j=1:n
        if i==j
        V(i,j)=a;       % Set diagonal elements as a
        else V(i,j)=b;  % Set the other elements as b
        end
    end
end