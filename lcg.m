function y = lcg(x, a, c, n, m) 
    % n is the number of iterations, m is the limit
    A = [];
    
    for (i = 1:n)
        b = ceil(mod((a*x + c), m) + 1);
        x = b;
        A(i) = b;
        
    end;
    
  	y = A;
   
   end