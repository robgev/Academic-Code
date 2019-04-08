f = @(x) 100 * (x(2) - x(1)^2)^2 + (1 - x(1))^2;
g1 = @(x) -400 * (x(2) - x(1)^2) * x(1) - 2 * (1 - x(1));
g2 = @(x) 200 * (x(2) - x(1)^2);
x0 = [0, 0];
eps = 10 ^ (-5);
min = newton(f, g1, g2, x0, eps)

function result = newton(f, g1, g2, x0, eps)
  result = x0;
  grad = @(x)[g1(x), g2(x)];
  h11 = @(x) 1200 * x(1)^2 - 400 * x(2) + 2;
  h12 = @(x) -400 * x(1);
  h22 = @(x) 200;
  g = grad(result);
  i = 0;
  while  norm(g) > eps
    H = [ 
        h11(result), h12(result);
        h12(result), h22(result)
    ];
    d = mtimes(-inv(H),  grad(result).');
    result = result + d.';
    g = grad(result);
    i = i + 1;
  end
  i
end
