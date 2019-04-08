a = [0, 0, 0];
b = [pi, 1, pi];
n = [2, 4, 10, 20, 50, 100];
f1 = @(x) sin(x);
f2 = @(x) exp(x);
f3 = @(x) atan(x);
f = {f1, f2, f3};

approximations = zeros(3, 6, 2);
exact_values = zeros(1, 3);
for i = 1:3
    for j = 1:6
        approximations(i, j, 1) = Trapezoid_Uniform(f{i},a(i),b(i),n(j));
        approximations(i, j, 2) = Simpson_Uniform(f{i},a(i),b(i),n(j));
    end
    exact_values(i) = integral(f{i},a(i),b(i));
end

approximations
exact_values

function result = Trapezoid_Uniform(f, a, b, n) 
    points = linspace(a, b, n + 1);
    sums = movsum(f(points), 2,'Endpoints','discard');
    h = (b - a) / n;
    result = (h * sum(sums())) / 2;
end

function result = Simpson_Uniform(f, a, b, n) 
    points = linspace(a, b, 2*(n + 1));
    sums = movsum(f(points), 3,'Endpoints','discard');
    h = (b - a) / (2 * n);
    result = (h * sum(sums(1:2:end))) / 3;
end
