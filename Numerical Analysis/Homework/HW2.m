f=@(x) exp(x) - 3 * x;
eps = 10 ^ (-4); # Error tolerance

function x0 = bisection(f,a,b)
  x0 = (a + b) / 2;  
  while (b - a) >= eps
    if f(x0) == 0
      break;
    endif
    if f(a) * f(x0) < 0
       b = x0;
     else 
       a = x0;
    endif
    x0 = (a + b) / 2;
  endwhile
end

r1 = bisection(f, 0, log(3));
r2 = bisection(f, log(3), 2);

r1
r2


