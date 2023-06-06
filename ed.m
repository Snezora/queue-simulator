function y = ed(n, m)
    % n is the number of iterations, m is the limit
    r = 0;
    A = [];
    
        for (i = 1:n)
        r = rand(1);
        
            if(r > 0)
                A = [A,(-1) * log(1-r) * (m/-log((1/m)))];
            else
                A = [A,(-1) * log(1-(1/m)) * (m/-log((1/m)))];
            end;
            
        end;
    
    A = ceil(A);
    y = A;
    
    end