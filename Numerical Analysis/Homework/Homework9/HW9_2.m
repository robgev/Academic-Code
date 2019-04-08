f = @(x) x^2 - 6 * x;
GSS(f, -3, 5, 1/4, 10^(-3))

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
