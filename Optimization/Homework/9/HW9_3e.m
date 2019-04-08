f = @(x) -(x(1) + 1) * x(2);
g = @(x) x(1) + x(2) - 3;
q = @(c) @(x) f(x) + c * (g(x)^2);
exact_min = [1, 2];
seq = 10 .^ (0:10);

for i = seq
    min = fminsearch(q(i), [3,3]);
    err = norm(min - exact_min);
    min
    err
end

