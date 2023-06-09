function y = printQueueTable(x, counter)
    
    y=x;
    row = size(x,2);  
    
    for (i = 1:row)
       if (y(10,i) <= 15 && counter == 3)
           lastRow = i; %See where counter 3 ends at items <= 15
       end;
    end;

    
    
    disp(      ' +-----------------------------------------------------------------------------------------------------------------------------+');
    disp(      ' |  No. | Cust No. | RN for Service  |  Service  |  Arrival Time  |  Time Service  |  Time Service  |  Waiting |   Total Time  |');
    disp(      ' |      |          |      Time       |   Time    |                |     Begins     |      Ends      |   Time   |     Spent     |');
    disp(      ' +-----------------------------------------------------------------------------------------------------------------------------+');
    
    if (counter == 3)
        for(i = 1:lastRow)
            printf(' |  %2.0f  |   %3.0f    |       %3.0f       |    %3.0f    |      %3.0f       |      %3.0f       |      %3.0f       |    %2.0f    |      %2.0f       | \n', y(1,i), y(2,i), y(3,i), y(4,i), y(9,i), y(5,i), y(6,i), y(7,i), y(8,i));
        end;
        if (lastRow == row)
            
        else
            disp(      ' +-----------------------------------------------------------------------------------------------------------------------------+');
            disp(      ' |      ! !Counter 3 will now turn into a Normal Counter to help alleviate the crowd in Counter 1 and Counter 2 Queues! !      |');
            disp(      ' +-----------------------------------------------------------------------------------------------------------------------------+');
            for(i = (lastRow + 1):row)
                printf(' |  %2.0f  |   %3.0f    |       %3.0f       |    %3.0f    |      %3.0f       |      %3.0f       |      %3.0f       |    %2.0f    |      %2.0f       | \n', y(1,i), y(2,i), y(3,i), y(4,i), y(9,i), y(5,i), y(6,i), y(7,i), y(8,i));
            end;
        end;
    
    else
        for(i = 1:row)
            printf(' |  %2.0f  |   %3.0f    |       %3.0f       |    %3.0f    |      %3.0f       |      %3.0f       |      %3.0f       |    %2.0f    |      %2.0f       | \n', y(1,i), y(2,i), y(3,i), y(4,i), y(9,i), y(5,i), y(6,i), y(7,i), y(8,i));
        end;
    end;
    
    disp(      ' +-----------------------------------------------------------------------------------------------------------------------------+');
    end