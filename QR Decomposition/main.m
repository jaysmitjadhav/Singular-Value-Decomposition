clc;
close all;
clear all;
%%
A = randn(4)            % Input matrix A

tic
[q,r] = QRhouse(A)      % Householder QR decomposition
toc
tic
[Q1,R1] = QRgivens(A)   % Givens Rotations QR decomposition
toc

[Q,R] = qr(A)           % MATLAB QR decomposition
%%
% Error in Q for Householder algorithm
[m,n]=size(Q);
for i=1:m
    for j=1:n
        errorQ(i,j)= abs(q(i,j))-abs(Q(i,j));   
    end
end
% Error in R for Householder algorithm
[m,n]=size(R);
for i=1:m
    for j=1:n
        errorR(i,j)= abs(r(i,j))-abs(R(i,j));   
    end
end
%%
% Error in Q for Givens Rotations
[m,n]=size(Q);
for i=1:m
    for j=1:n
        errorQ1(i,j)= abs(Q1(i,j))-abs(Q(i,j));   
    end
end

% Error in R for Givens Rotations
[m,n]=size(R);
for i=1:m
    for j=1:n
        errorR1(i,j)= abs(R1(i,j))-abs(R(i,j));   
    end
end
%%
subplot(2,2,1)
plot(errorQ)
title('Error in Q Householder algorithm')
subplot(2,2,2)
plot(errorR)
title('Error in R Householder algorithm')
subplot(2,2,3)
plot(errorQ1)
title('Error in Q Givens Rotations')
subplot(2,2,4)
plot(errorR1)
title('Error in R Givens Rotations')