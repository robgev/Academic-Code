syms x1 x2
f = (x1^2 + 1) ^ 2 + x2^2;
grad = gradient(f, [x1, x2]);
sd = -1 * grad;
x0 = [10, 6];
eps = 10 ^ (-6);
while norm(double(subs(grad, [x1, x2], x0))) >= eps
    phi_point = @(a) x0 + a * double(subs(sd, [x1, x2], x0)) .';
    phi = @(a) double(subs(f, [x1, x2], phi_point(a)));
    line_search_min_alpha = GSS(phi, 0, 10^6, 0.25, eps);
    x0 = x0 + line_search_min_alpha * double(subs(sd, [x1, x2], x0)) .';
end
x0  

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
