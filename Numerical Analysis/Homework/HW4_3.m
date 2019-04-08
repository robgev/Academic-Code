f = @(x) 2 + sin(x) - x;
g = @(x) 2 + sin(x);

eps = 10^(-3);

x0 = 2 * pi / 3;
x1 = g(x0);                       

while abs(x1-x0) >= eps
    x0 = x1;
    x1 = g(x0);
end

x1
f(x1)