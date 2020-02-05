clc;
close all;
clear all;
%%
A = randn(4)                            % Input matrix A

[U,S,V] = jacobi_svd1(A)                % Floating Point function
[Ufx,Sfx,Vfx] = jacobi_svdfixed1(A)     % Fixed Point function
[u,s,v] = svd(A)                        % MATLAB fuction  

%%
%Error in Floating Point function and MATLAB function for S
[m,n]=size(S);
for i=1:m
    for j=1:n
        error1(i,j)= abs(S(i,j))-abs(s(i,j));   
    end
end

%Error in Floating Point function and Fixed Point function for S
[m,n]=size(S);
for i=1:m
    for j=1:n
        error2(i,j)= abs(S(i,j))-abs(Sfx(i,j));  
    end
end

%% 
% Error in Floating Point function and MATLAB function for U
[m,n]=size(U);
for i=1:m
    for j=1:n
        error3(i,j)= abs(U(i,j))-abs(u(i,j));   
    end
end

%Error in Floating Point function and Fixed Point function for U
[m,n]=size(U);
for i=1:m
    for j=1:n
        error4(i,j)= abs(U(i,j))-abs(Ufx(i,j));  
    end
end
%%
% Error in Floating Point function and MATLAB function for V
[m,n]=size(V);
for i=1:m
    for j=1:n
        error5(i,j)= abs(V(i,j))-abs(v(i,j));   
    end
end

%Error in Floating Point function and Fixed Point function for V
[m,n]=size(V);
for i=1:m
    for j=1:n
        error6(i,j)= abs(V(i,j))-abs(Vfx(i,j));  
    end
end
%% 
subplot(3,2,1)
plot(error1)
title('Error in Floating Point function and MATLAB function for S')
subplot(3,2,2)
plot(error2)
title('Error in Floating Point function and Fixed Point function for S')
subplot(3,2,3)
plot(error3)
title('Error in Floating Point function and MATLAB function for U')
subplot(3,2,4)
plot(error4)
title('Error in Floating Point function and Fixed Point function for U')
subplot(3,2,5)
plot(error5)
title('Error in Floating Point function and MATLAB function for V')
subplot(3,2,6)
plot(error6)
title('Error in Floating Point function and Fixed Point function for V')