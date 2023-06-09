function y = queueGenerator(queue, counter, x)
    
    %Setup Counter Data
    c = tableData(counter);
    CN = size(counter, 2);
    
    %queue 1 = Queue No. | 2 = Customer No. | 3 = Service Time | 4 = Arrival Time
    
    %Customer Number
    custNo = [];
    %Queue Number
    queueNo = [];
    %RN for Service Time
    RNG = [];
    %Arrival Time
    AR = [];
    %Service Time
    ST = [];
    %Service Time Begin
    STB = [];
    %Service Time End
    STE = [];
    %Waiting Time
    WT = [];
    %Time Spent
    TS = [];
    
    rows = size(queue, 2);
    for (i = 1:rows)
        for (j = 1:CN)
             if (queue(3, i) >= c(4, j) && queue(3,i) <= c(5,j))
                 ST(i) = c(1,j);
                 queueNo(i) = i;
                 custNo(i) = queue(2,i);
                 RNG(i) = queue(3,i);
                 AR(i) = queue(4,i);
                 if (i == 1)
                     queue(4,i) = 0;
                     STB(i) = 0;
                     STE(i) = STB(i) + ST(i);
                     WT(i) = 0;
                     TS(i) = ST(i) + WT(i);
                     printf('\n');
                     printf('Customer %d has arrived at Counter %d at minute %d, this is Customer No. %d for this counter \n', queue(2,i), x, AR(i), queue(1,i));
                     printf('Service for Customer No. %d has started at minute %d \n', queue(1,i), STB(i));
                     printf('Departure of Customer No. %d at minute %d \n', queue(1,i), STE(i));
                     pause;
                 else
                     %If the Arrival Time is less than the last Customer Service End Time
                     if (queue(4, i) < STE(i-1))
                         STB(i) = STE(i-1);
                         STE(i) = STB(i) + ST(i);
                         WT(i) = STB(i) - queue(4,i);
                         TS(i) = ST(i) + WT(i);
                         printf('\n');
                         printf('Customer %d has arrived at Counter %d at minute %d, this is Customer No. %d for this counter \n', queue(2,i), x, AR(i), queue(1,i));
                         printf('Customer No. %d waited %d minutes to wait for the previous customer to end their service at minute %d \n', queue(1,i), WT(i), STE(i-1));
                         printf('Service for Customer No. %d has started at minute %d \n', queue(1,i), STB(i));
                         printf('Departure of Customer No. %d at minute %d \n', queue(1,i), STE(i));
                         pause;
                     % If the Arrival Time is not less than the last Customer Service End Time
                     else
                         STB(i) = queue(4,i);
                         STE(i) = STB(i) + ST(i);
                         WT(i) = 0;
                         TS(i) = ST(i) + WT(i);
                         printf('\n');
                         printf('Customer %d has arrived at Counter %d at minute %d, this is Customer No. %d for this counter \n', queue(2,i), x, AR(i), queue(1,i));
                         printf('Service for Customer No. %d has started at minute %d \n', queue(1,i), STB(i));
                         printf('Departure of Customer No. %d at minute %d \n', queue(1,i), STE(i));
                         pause;
                     end;
                 end;
             end;
        end;
    end;
    
    y = [queueNo;custNo;RNG;ST;STB;STE;WT;TS;AR];
    end
                 
        
    
    