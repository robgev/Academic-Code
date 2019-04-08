x = 0:0.001:10
y = sin(x .^ 2) + e .^ (0.1 * x)
z = 1 + e .^ (0.1 * x)
t = -1 + e .^ (0.1 * x)
plot(x, y, 'b')
hold on
plot(x, z, 'r', x, t, 'r')
