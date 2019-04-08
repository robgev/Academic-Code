f = @(x) atan(x);
x = [-2, -1, -0.5, 0, 0.3, 0.7, 1, 1.5, 2, 3];
% a.
coeffs = polyfit(x, f(x), length(x) - 1);

% b.
points = [0.3, 0.9, 2.8];
for i = points 
    error = abs(f(i) - polyval(coeffs, i));
    error
end

% c.
steps = -2:0.0001:3;
values = polyval(coeffs, steps);
figure('Name', 'Function graph and interpolation points');
plot(steps, values, x, f(x), 'r*', steps, f(steps), 'g');

% d.
figure('Name', 'Error function of |f(x) - P(x)|');
plot(steps, f(steps) - values);

% e.
error_steps = -2:0.01:3;
error_values = polyval(coeffs, error_steps);
maximal_error = max(abs(f(error_steps) - error_values));
maximal_error