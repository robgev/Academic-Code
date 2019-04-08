f1 = @(x) x .^ 5;
n1 = [1,2,10];
f2 = @(x) x .^ (-1) .* sin(x);
n2 = [1,2,3,4];

for i = 1:3
    CGQR(f1, 0, 1, n1(i))
end

for i = 1:4
    CGQR(f2, 0, 1, n2(i))
end

function result = GQR(f, a, b, n)
   roots;
   weights;
   half_length = (b - a) / 2;
   midpoint = (b + a) / 2;
   actual_weights = half_length .* quadrature_weights{n+1};
   actual_nodes = half_length .* legendre_roots{n+1} + midpoint;
   result = sum(actual_weights .* f(actual_nodes));
end

function result = CGQR(f, a, b, n)
    intervals = linspace(a, b, n + 1);
    result = 0;
    for i = 1:n
        result = result + GQR(f, intervals(i), intervals(i+1), 3);
    end
end
