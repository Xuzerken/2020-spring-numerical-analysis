function [y] = Lag(a, b, x)
n = length(a);
m = length(x);
l = ones(m,n);

for i = [1:n]
    for j = [1:n]
        if(j~=i)
            l(:,i) = l(:,i).*(x-a(j))/(a(i)-a(j));
        end
    end
end
y = l*b;
end
