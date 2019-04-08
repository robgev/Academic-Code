f1 = @(x) x^3 - 3*x + 1;
fder1 = @(x) 3 * x^2 - 3;
x01 = 2;

f2 = @(x) x^3 - 2 * sin(x);
fder2 = @(x) 3 * x^2 - 2 * cos(x);
x02 = 1/2;

# eps = 10 ^ (-10); # Error tolerance


function ret = newton(f, fder, x0)
  ret = x0 - f(x0) / fder(x0);
end

function ret = secant(f, x0, x1)
  ret = x1 - f(x1) * (x1 - x0) / (f(x1) - f(x0));
end

function [ xn, xs0, xs1 ]  = compare_approximations(f, fder, x0, fname)
  file_id = fopen( fname, 'wt' );
  xn = x0;
  xs0 = x0;
  xs1 = newton(f, fder, x0);
  i = 0;
  while xs1 ~= xs0 && (f(xs1) ~= 0 || f(xn) ~= 0)
    i++;
    xn = newton(f, fder, xn);
    temp = xs1;
    xs1 = secant(f, xs0, xs1);
    xs0 = temp;
    fprintf(file_id, 'The approx. no: n = %d\n', i)
    fprintf(file_id, "Newton's Method Approx.: x%d = %f\n", i, xn)
    fprintf(file_id, "Newton's Method Value.: f(x%d) = %f\n", i, f(xn))
    fprintf(file_id, "Secants Method Approx.: x%d = %f\n", i, xs0)
    fprintf(file_id, "Secants Method Value.: f(x%d) = %f\n\n", i, f(xs0))
  end
  fclose(file_id);
end

compare_approximations(f1, fder1, x01, 'results_1.txt');
compare_approximations(f2, fder2, x02, 'results_2.txt');