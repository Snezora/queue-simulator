function y = lcg(x, a, c, n) 
    A = [];
    m = 100; %max value
    
    for (i = 1:n)
        b = ceil(mod((a*x + c), m) + 1);
        x = b;
        A(i) = b;
        
    end;
    
  	y = A;
   
   end