syms x1 x2
f = (x1^2 + 1) ^ 2 + x2^2;
grad = gradient(f, [x1, x2]);
x0 = [10, 6];
eps = 10 ^ (-6);
armijo_eps = 0.25;
almijo_tau = 0.5;
while norm(double(subs(grad, [x1, x2], x0))) >= eps
    g = double(subs(grad, [x1, x2], x0));
    sd = -g;
    phi = @(a) double(subs(f, [x1, x2], x0 + a * sd .'));
    armijo_alpha = 2;
    while phi(armijo_alpha) > phi(0) + armijo_eps * armijo_alpha * (g' * sd)
        armijo_alpha = almijo_tau * armijo_alpha;
    end 
    x0 = x0 + armijo_alpha * double(subs(sd, [x1, x2], x0)) .';
end
x0  

