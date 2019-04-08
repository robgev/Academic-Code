x = [0 1/6 1/2];
f = @(x)sin(pi * x);
y = f(x);
plot(x, y, 'r*');
a = polyfit(x, y, 2)
xx = 0:0.01:1/2;
yy = polyval(a, xx);
hold on
plot(xx, yy, 'b');
plot(xx, f(xx), 'g');