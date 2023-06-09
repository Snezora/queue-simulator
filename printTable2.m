function y = printTable2(x)
    
    y=x;
    
    row = size(x,2);  
    disp(      ' +-----------------------------------------------------------------------+');
    disp(      ' |  No.  |      RN for       |  Interarrival  |  Arrival  |  RN for No.  |');
    disp(      ' |       | Interarrival Time |      Time      |   Time    |   of Items   |');
    disp(      ' +-----------------------------------------------------------------------+');

    for(i = 1:row)
        printf(' |  %2.0f   |        %3.0f        |       %2.0f       |    %3.0f    |      %2.0f      | \n', y(1,i), y(2,i), y(3,i), y(4,i), y(5,i));
    end
    
    disp(      ' +-----------------------------------------------------------------------+');
    end