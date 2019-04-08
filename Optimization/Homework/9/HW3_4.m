f = @(x) exp(x(1)^2 + x(2)^2);
g = @(x) x(1) + x(2) + 4;
q = @(c) @(x) f(x) - (1 / c) * (1 / g(x));
seq = 10 .^ (0:10);
x0 = [0, 0];
eps = 10 ^ (-5);

for i = seq
    grad1 = @(x) 2 * x(1) * exp(x(1)^2 + x(2)^2) + (1 / i) * (1 / (g(x) ^ 2));
    grad2 = @(x) 2 * x(2) * exp(x(1)^2 + x(2)^2) + (1 / i) * (1 / (g(x) ^ 2));
    min = steepest_descent(q(i), grad1, grad2, x0, eps);
end

function result = GSS(f, a, b, gamma, eps)
  while (b - a) >= eps
    A = a + gamma * (b - a);
    B = b - gamma * (b - a);
    if f(A) < f(B)
        b = B;
    else 
        a = A;
    end
  end
  result = (a + b) / 2;  
end

function result = steepest_descent(f, g1, g2, x0, eps)
  result = x0;
  grad = @(x) [g1(x), g2(x)];
  g = grad(result);
  a = 0;
  b = 1;
  y = 0.25;
  i = 0;
  while  norm(g) > eps
    phi = @(alpha) exp((result(1) - alpha * g(1))^2 + (result(2) - alpha * g(2))^2);
    a0 = GSS(phi, a, b, y, eps);
    result = result - a0 * g;
    g = grad(result);
    i = i + 1;
  end
end


