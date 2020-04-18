function [x] = runafter(A,f)
% runafter method for diagnal dominant three-diagnal matrix
%   Detailed explanation goes here

n = length(f);
a = diag(A,-1);
b = diag(A);
c = diag(A,1);
beta = zeros(1, n-1);
y = zeros(1,n);
x = zeros(1,n);

for i = 1:n-1
    if i==1
        beta(i) = c(1)/b(1);       
    else
        beta(i) = c(i)/(b(i) - a(i-1)*beta(i-1));        
    end
end

for i = 1:n
    if i ==1
        y(i) = f(i)/b(i);
    else
        y(i) = (f(i) - a(i-1)*y(i-1))/(b(i) - a(i-1)*beta(i-1));
    end
end

for i = n:-1:1
    if i==n
        x(i) = y(i);
    else
        x(i) = y(i) - beta(i)*x(i+1);
    end
end

        


end

