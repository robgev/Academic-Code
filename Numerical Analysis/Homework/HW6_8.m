function coeffs = least_squares(xs, ys) 
    f = @(x) sum((x(1) .* xs + x(2) - ys) .^ 2);
    starting_coeffs = [0,0];
    coeffs = fminsearch(f,starting_coeffs);
endfunction

x = [ 0,0.5000,1.0000,1.5000,2.0000,2.5000,3.0000,3.5000,4.0000,4.5000,5.0000 ];
y = [ 0.2124,1.2448,1.3962,2.4794,2.6790,4.4033,4.8407,3.6054,5.4757,5.0382,5.8457 ];
coeffs = least_squares(x, y);
range = -1:0.001:6;
plot(x, y, 'r*', range, coeffs(1) * range + coeffs(2), 'g');