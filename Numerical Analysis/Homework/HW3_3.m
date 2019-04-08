f = @(x) x / 2 + 2 / x;
inits = [15, 5, -3, -13];
approx = zeros(4, 6);

for r = 1:4
  approx(r, 1) = f(inits(r));  
endfor 

for c = 2:6
  for r = 1:4
    approx(r, c) = f(approx(r, c - 1));
  endfor
endfor

approx
