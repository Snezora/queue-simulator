function y = lcg(x, a, c, n, m) 
    % n is the number of iterations, m is the limit
    A = [];
    
    for (i = 1:n)
        x = mod((a*x + c), m); % remove ceil function
        A(i) = x;
        
    end;
    
  	y = A;
   
   end
   
 