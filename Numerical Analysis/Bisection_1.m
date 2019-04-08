# clear all
# clc
f=@(x) x^3 - 3*x - 10;
tol = 10 ^ (-4); # Error tolerance
a = 1;
b = 3;
x0 = (a + b) / 2;

while (b - a) >= tol
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

x0
