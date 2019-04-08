f = @(x) 1 ./ (1 + x.^2);
for n = 10:10:30
  x = linspace(-5,5,n + 1);
  y = f(x);
  coeffs = polyfit(x, y, n);
  steps = -5:0.0001:5;
  values = polyval(coeffs, steps);
  figure(n);
  plot(steps, values, x, y, 'r*',steps, f(steps), 'g');
end

