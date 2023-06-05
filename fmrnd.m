function y = fmrnd(n)
    y = [];
    r = 0;
    m = 100; %max value
    
    for(i = 1:n)
        r = rand(1);
        if r > 0
            y = [y, ceil(r * m)];
        else
            y = [y, ceil((1/m) * m)];
        end;
        
    end;
    end