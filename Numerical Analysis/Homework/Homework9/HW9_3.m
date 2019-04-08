gamma = 9000;
f = @(x) 4 * x(1)^2 + x(2)^2; 
pen_func = @(x) f(x) + gamma * (x(2) - x(1) - 1)^2;
min_point = fminsearch(pen_func, [0, 0]);
min_point