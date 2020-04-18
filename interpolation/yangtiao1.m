function [yp] = yangtiao1(x, y, xp)
%cubic spline interpolation, for the first condition

n = length(x);
m = length(xp);
h = diff(x);

a = ones(1,n-1);
b = ones(1,n-1);
d = ones(1,n);

p = diffquo(x,y(2:n+1));
a(1:n-2) = h(1:n-2)./(h(1:n-2)+h(2:n-1));
b(2:n-1) = 1-a(1:n-2);
d(2:n-1) = p(3:n,4);
d(1) = 6*(p(2,3)-y(1))/h(1);
d(n) = 6*(y(n+2)-p(n,3))/h(n-1);
A = 2*eye(n)+diag(a,-1)+diag(b,1);
M = runafter(A,d);
yp = zeros(1,m);

for i = 1:m
    for j = 1:n-1
        if(xp(i)>=x(j)&&xp(i)<=x(j+1))
            xx = xp(i);
            hh = h(j);
            s = M(j);
            t = M(j+1);
            yp(i) = s*(x(j+1)-xx)^3/(6*hh) + t*(xx - x(j))^3/(6*hh) + (y(j+1) - s*hh^2/6)*(x(j+1) - xx)/hh +(y(j+1+1) - t*hh^2/6)*(xx - x(j))/hh;
        end
    end
end

    
end

