function y = generateRNG(mode, n)
    
    A =[];
    x = fmrnd(1,100);
    a = fmrnd(1,100);
    c = fmrnd(1,100);
    
    if(mode == 1)
        A = lcg(x, a, c, n, 100);

    elseif(mode == 2)
       A = ed(n, 100);
      
    elseif(mode == 3)
       A = ud(n, 100);
      
    elseif(mode == 4)
       A = fmrnd(n,100); 
       
    end;
    
    y = A;