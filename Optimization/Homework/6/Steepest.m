f = @(x) 100 * (x(2) - x(1)^2)^2 + (1 - x(1))^2;
g1 = @(x) -400 * (x(2) - x(1)^2) * x(1) - 2 * (1 - x(1));
g2 = @(x) 200 * (x(2) - x(1)^2);
x0 = [0, 0];
eps = 10 ^ (-5);
min = steepest_descent(f, g1, g2, x0, eps)
% i = 8805
% This happens because we approximate alpha and use it
% for descent in some certain direction. Whereas in case of 
% newton everything is more exact, i. e. jumps over the min 
% are not possible for example

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
    phi = @(alpha) 100 * ((result(2) - alpha * g(2)) - (result(1) - alpha * g(1))^2) .^ 2 + (1 - (result(1) - alpha * g(1))) ^ 2;
    a0 = GSS(phi, a, b, y, eps);
    result = result - a0 * g;
    g = grad(result);
    i = i + 1;
  end
  i
end
