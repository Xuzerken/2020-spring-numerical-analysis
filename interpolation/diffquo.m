function [p] = diffquo(x, y)
%print a difference quotient table

m = length(x);
p = zeros(m, m+1);
p(:,1) = x;
p(:,2) = y;
for k = 3:m+1
    p(k-1:m,k) = diff(p(k-2:m, k-1)) ./ (x(k-1 :m) - x(1: m+2-k));
end
end
