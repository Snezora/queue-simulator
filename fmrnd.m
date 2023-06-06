function y = fmrnd(n , m)
    % n is the number of iterations, m is the limit/max value
    y = [];
    r = 0;
    
    for(i = 1:n)
        r = rand(1);
        if r > 0
            y = [y, ceil(r * m)];
        else
            y = [y, ceil((1/m) * m)];
        end;
        
    end;
    end