function y = ud(n, m)
    
    % n is the number of iterations, m is the limit 

    A=[];
    a = 0;

    
    A = (a + (m - a) * rand(1,n));

    A = round(A);
    y = A;
    end