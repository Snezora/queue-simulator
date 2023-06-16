function y = AvgIntArrTime(n,x);
    counter = 1
    sum = 0
    while (counter <= n)
        sum = sum + x(counter)
        counter = counter + 1
    avg = sum / n
    disp('Average Inter-Arrival Time: ', avg)