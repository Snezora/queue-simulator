function y = lcg(x, a, c, n) 
    A = [];
    for (i = 1:n)
        b = ceil(mod((a*x + c), 10000) + 1);
        A(i) = b;
        x = b;
    end;
  	y = A;