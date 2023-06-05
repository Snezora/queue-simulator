function y = ud(n)
    A=[];
    a = 0;
    b = 100; %max value

    A = (a + (b - a) * rand(1,n));

    A = round(A);
    y = A;
    end