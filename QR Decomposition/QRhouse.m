function [Q,R]=QRhouse(A)
% Floating Point function equivalent to MATLAB function qr(A) implemented
% using householder algorithm

[m,n]=size(A);              % get size of A
R=A;                        % assign R as A
Q=eye(m);                   % assign Q as identity matrix of size m

%%
for i=1:m
    v=zeros(m,1);           % create zero column vector v
    v(i:m,1)= R(i:m,i);
    a=norm(v);              % norm of v
    v(i)=v(i)+a;            % update v
    s=norm(v);              % norm of updated v
    if s~=0 
        w=v/s;              % normalize v
        u=2*R'*w;
        R=R-w*u';           
        Q=Q-2*Q*w*w';       
    end
end
end