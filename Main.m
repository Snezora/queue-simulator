function y = Main();
    
    A= [];
       
    printf('\n');
    disp(      '         +-------------------------------------------------------+         ');
    disp(      '         |    Counter No    |            Counter Type            |         ');
    disp(      '         +-------------------------------------------------------+         ');
    disp(      '         |        1         |           Normal Counter           |         ');
    disp(      '         +-------------------------------------------------------+         ');
    disp(      '         |        2         |           Normal Counter           |         ');
    disp(      '         +-------------------------------------------------------+         ');
    disp(      '         |        3         |          Express Counter           |         ');
    disp(      '         +-------------------------------------------------------+         ');
    printf('\n');
    printf('\n');
    
    disp(      '  +---------------------------------------------------------------------+');
    disp(      '  |                 Table of Service Time for Counter 1                 |');
    disp(      '  +---------------------------------------------------------------------+');
    disp(      '  |  Service time   |   Probability   |     CDF     |       Range       |');
    disp(      '  +---------------------------------------------------------------------+');
    tableC1 = [3, 4, 5, 6, 7
               0.1, 0.2, 0.4, 0.15, 0.15];
    printTable1(tableC1);
    pause
    
    printf('\n');
    disp(      '  +---------------------------------------------------------------------+');
    disp(      '  |                 Table of Service Time for Counter 2                 |');
    disp(      '  +---------------------------------------------------------------------+');
    disp(      '  |  Service time   |   Probability   |     CDF     |       Range       |');
    disp(      '  +---------------------------------------------------------------------+');
    tableC2 = [4, 5, 6, 7, 8
               0.1, 0.15, 0.35, 0.2, 0.2];        
    printTable1(tableC2);
    pause
    
    printf('\n');
    disp(      '  +---------------------------------------------------------------------+');
    disp(      '  |                 Table of Service Time for Counter 3                 |');
    disp(      '  +---------------------------------------------------------------------+');
    disp(      '  |  Service time   |   Probability   |     CDF     |       Range       |');
    disp(      '  +---------------------------------------------------------------------+');
    tableC3 = [2, 3, 4, 5, 6
               0.15, 0.2, 0.5, 0.1, 0.05];        
    printTable1(tableC3);
    pause
    
    printf('\n');
    disp(      '  +---------------------------------------------------------------------+');
    disp(      '  |                     Table of Inter-arrival Time                     |');
    disp(      '  +---------------------------------------------------------------------+');
    disp(      '  |  Interarrival   |   Probability   |     CDF     |       Range       |');
    disp(      '  |      Time       |                 |             |                   |');
    disp(      '  +---------------------------------------------------------------------+');
    tableIAT = [1, 2, 3, 4, 5, 6, 7, 8
               0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125];        
    printTable1(tableIAT);
    pause
    
    
    % --------------------------------------------------------------------------------------------------------- 
   
    % Getting User Input
    printf('\n');
    custNum = input('Please input the number of customer:');
    printf('\nTypes of random number generator:\n');
    printf('1. Linear Congruential Generator (LCG)\n');
    printf('2. Random Variate Generator for Exponential Distribution\n');
    printf('3. Random Variate Generator for Uniform Distribution\n');
    printf('4. Freemat built-in rand function\n');
        
    
    while true
        printf('\n');
        rngIAT = input('Please input the desired Random Number Generator type that you want to use for Interarrival Time:   ');
        printf('\n');
        itemRNG = input('Please input the desired Random Number Generator type that you want to use for Number of Items Acquired:   ');
        printf('\n');
        serviceTimeRNG = input('Please input the desired Random Number Generator type that you want to use for Service Time:   ');
        printf('\n');
        if (rngIAT == 1 | rngIAT == 2 | rngIAT == 3 | rngIAT == 4)
            if (itemRNG == 1 | itemRNG == 2 | itemRNG == 3 | itemRNG == 4)
                if (serviceTimeRNG == 1 | serviceTimeRNG == 2 | serviceTimeRNG == 3 | serviceTimeRNG == 4)
                    IAT = generateRange(tableIAT, custNum, rngIAT, itemRNG, serviceTimeRNG); % IAT = [CustNo;GN;B;AR (Arrival Time) ;IG (Items) ;ST (Service Time)]
                    break;
                end;
            end;
        else
            printf('Invalid Input!');
        end;
    end;
    
    %IAT(5,2) = The number of items carried by the customer in the 2nd position of the array
    
    
    %KEEP THIS IN MIND
    printTable2(IAT);
    rowIAT = size(IAT, 2);
    for (i = 1:rowIAT)
        if (IAT(5,i) <= 15)
            lastC3 = IAT(1,i);
        end;
    end;
        
    
    %Setup the queues
    queue1 = [];
    queue2 = [];
    queue3 = [];
    
    %Boolean (0 false | 1 true) to turn Counter 3 from Express to Normal
    turnNormal = 0;
    
    %Set up no. of items split to queues

    q1No = 1;
    q2No = 1;
    q3No = 1;
    for (i = 1:lastC3)
       if (IAT(5, i) <= 15)
            queue3(1, q3No) = q3No; % Number in terms of Queue
            queue3(2, q3No) = IAT(1, i); % Customer Number
            queue3(3, q3No) = IAT(6, i); % Customer RNG Service Time
            queue3(4, q3No) = IAT(4, i); % Customer Arrival Time
            queue3(5, q3No) = IAT(5, i); % Number of Items
            q3No = q3No + 1;
        else
            if (size(queue1, 2) == 0 && size(queue2, 2) == 0)
                queue1(1, q1No) = q1No;
                queue1(2, q1No) = IAT(1, i);
                queue1(3, q1No) = IAT(6, i);
                queue1(4, q1No) = IAT(4, i);
                queue1(5, q1No) = IAT(5, i);                
                q1No = q1No + 1;
            elseif (size(queue1, 2) <= size(queue2,2))
                queue1(1, q1No) = q1No;
                queue1(2, q1No) = IAT(1, i);
                queue1(3, q1No) = IAT(6, i);
                queue1(4, q1No) = IAT(4, i);
                queue1(5, q1No) = IAT(5, i);
                q1No = q1No + 1;
            elseif (size(queue1, 2) >= size(queue2,2))
                queue2(1, q2No) = q2No;
                queue2(2, q2No) = IAT(1, i);
                queue2(3, q2No) = IAT(6, i);
                queue2(4, q2No) = IAT(4, i);
                queue2(5, q2No) = IAT(5, i);
                q2No = q2No + 1;  
            end;
        end;
    end;
    
    %KEEP THIS IN MIND
    next_counter = 1; % Distribute equally
    for (i = (lastC3 + 1):rowIAT)
        if (next_counter == 1)
            queue1(1, q1No) = q1No;
            queue1(2, q1No) = IAT(1, i);
            queue1(3, q1No) = IAT(6, i);
            queue1(4, q1No) = IAT(4, i);
            queue1(5, q1No) = IAT(5, i);
            q1No = q1No + 1;
        elseif (next_counter == 2)
            queue2(1, q2No) = q2No;
            queue2(2, q2No) = IAT(1, i);
            queue2(3, q2No) = IAT(6, i);
            queue2(4, q2No) = IAT(4, i);
            queue2(5, q2No) = IAT(5, i);
            q2No = q2No + 1;
        else
            queue3(1, q3No) = q3No;
            queue3(2, q3No) = IAT(1, i);
            queue3(3, q3No) = IAT(6, i);
            queue3(4, q3No) = IAT(4, i);
            queue3(5, q3No) = IAT(5, i);
            q3No = q3No + 1;
        end;
        next_counter = mod(next_counter + 1, 3);
    end;         
    
    printf('\n');
    disp(      ' +---------------------------------------------------------------------------------------------------------------------------------+');
    disp(      ' +                                                Counter 1 Information                                                            +');
    disp(      ' +---------------------------------------------------------------------------------------------------------------------------------+');
    tableQ1 = [];
    tableQ1 = queueGenerator(queue1, tableC1, 1);
    
    printf('\n');
    disp(      ' +---------------------------------------------------------------------------------------------------------------------------------+');
    disp(      ' +                                                Counter 2 Information                                                            +');
    disp(      ' +---------------------------------------------------------------------------------------------------------------------------------+');
    tableQ2 = [];
    tableQ2 = queueGenerator(queue2, tableC2, 2);
    
    printf('\n');
    disp(      ' +---------------------------------------------------------------------------------------------------------------------------------+');
    disp(      ' +                                                Counter 3 Information                                                            +');
    disp(      ' +---------------------------------------------------------------------------------------------------------------------------------+');
    tableQ3 = [];
    tableQ3 = queueGenerator(queue3, tableC3, 3);
    

    
    
    printf('\n');
    disp(      ' +---------------------------------------------------------------------------------------------------------------------------------+');
    disp(      ' +                                                   Counter Tables                                                                +');
    disp(      ' +---------------------------------------------------------------------------------------------------------------------------------+');
    
    
    % TableQ(number) is basically what we will use to do the evaluation
    % If you look at queueGenerator, it will have y = [queueNo;custNo;RNG;ST;STB;STE;WT;TS;AR;IT];
    %Dictionary: (Let i be the row number in which u wanna access
    %tableQ1(1, i) = queueNo. in the Counter
    %tableQ1(4, i) = Service Time Duration
    %tableQ1(5, i) = Service Time Begin
    %tableQ1(6, i) = Service Time End
    %tableQ1(7, i) = Waiting Time
    %tableQ1(8, i) = Time Spent in the System
    %tableQ1(9, i) = Arrival Time of Customer
    %tableQ1(10, i) = Items by Customer
     
     
    printf('\n');
    printf('Counter 1: \n');
    printQueueTable(tableQ1, 1);
    printf('\n');
    printf('Counter 2: \n');
    printQueueTable(tableQ2, 2);
    printf('\n');
    printf('Counter 3: \n');
    printQueueTable(tableQ3, 3);
    
    %-------------------------------------------------------------------------------%
    % Average Waiting Time & Average Inter-arrival Time
    
    % Calculate average waiting time for each counter
    avgWaitingTime1 = sum(tableQ1(7, :)) / size(queue1, 2);
    avgWaitingTime2 = sum(tableQ2(7, :)) / size(queue2, 2);
    avgWaitingTime3 = sum(tableQ3(7, :)) / size(queue3, 2);
    
    % Calculate average inter-arrival time
    avgInterArrivalTime = (sum(IAT(3, :)) / size(IAT, 2));
    
    % Display the calculated metrics
    printf('\n');
    disp('Average Waiting Time:');
    disp(['Counter 1: ', num2str(avgWaitingTime1)]);
    disp(['Counter 2: ', num2str(avgWaitingTime2)]);
    disp(['Counter 3: ', num2str(avgWaitingTime3)]);
    
    % Calculate total waiting time across all counters
	totalWaitingTime = sum(tableQ1(7, :)) + sum(tableQ2(7, :)) + sum(tableQ3(7, :));
 
 	% Calculate average arrival time across all counters
	averageWaitingTime = totalWaitingTime / (size(queue1, 2) + size(queue2, 2) + size(queue3, 2));
 
    disp(['All Counter Average Waiting Time: ', num2str(averageWaitingTime)]);
    
    printf('\n');
    disp(['All Counter Average Inter-Arrival Time: ', num2str(avgInterArrivalTime)]);
    
    
    %-------------------------------------------------------------------------------%
    % Average Arrival Time & Time Spent
    
    % Calculate average arrival time for each counter
    avgArrivalTime1 = sum(tableQ1(9, :)) / size(queue1, 2);
    avgArrivalTime2 = sum(tableQ2(9, :)) / size(queue2, 2);
    avgArrivalTime3 = sum(tableQ3(9, :)) / size(queue3, 2);
    
    % Calculate average time spent for each counter
    avgTimeSpent1 = sum(tableQ1(8, :)) / size(queue1, 2);
    avgTimeSpent2 = sum(tableQ2(8, :)) / size(queue2, 2);
    avgTimeSpent3 = sum(tableQ3(8, :)) / size(queue3, 2);
    
    % Display the calculated metrics
    printf('\n');
    disp('Average Arrival Time:');
    disp(['Counter 1: ', num2str(avgArrivalTime1)]);
    disp(['Counter 2: ', num2str(avgArrivalTime2)]);
    disp(['Counter 3: ', num2str(avgArrivalTime3)]);
    
    % Calculate total arrival time across all counters
	totalArrivalTime = sum(tableQ1(9, :)) + sum(tableQ2(9, :)) + sum(tableQ3(9, :));
 
 	% Calculate average arrival time across all counters
	averageArrivalTime = totalArrivalTime / (size(queue1, 2) + size(queue2, 2) + size(queue3, 2));
 
    disp(['All Counter Average: ', num2str(averageArrivalTime)]);
    
    printf('\n');
    disp('Average Time Spent:');
    disp(['Counter 1: ', num2str(avgTimeSpent1)]);
    disp(['Counter 2: ', num2str(avgTimeSpent2)]);
    disp(['Counter 3: ', num2str(avgTimeSpent3)]);



	% Calculate total time spent across all counters
	totalTimeSpent = sum(tableQ1(8, :)) + sum(tableQ2(8, :)) + sum(tableQ3(8, :));



	% Calculate average time spent across all counters
	averageTimeSpent = totalTimeSpent / (size(queue1, 2) + size(queue2, 2) + size(queue3, 2));
 
    disp(['All Counter Average: ', num2str(averageTimeSpent)]);
 
    
    
    
    %-------------------------------------------------------------------------------%
    % Probability of waiting for each counter & Average Service Time
    
    % Calculate amount of waiting customers for each counter
    amountOfWait1 = getProbWait(tableQ1);
    amountOfWait2 = getProbWait(tableQ2);
    amountOfWait3 = getProbWait(tableQ3);
    
    % Calculate the probability for a customer to wait for each counter
    probWait1 = (amountOfWait1 / size(tableQ1, 2)) * 100;
    probWait2 = (amountOfWait2 / size(tableQ2, 2)) * 100;
    probWait3 = (amountOfWait3 / size(tableQ3, 2)) * 100;
    
    % Display the calculated metrics
    printf('\n');
    disp('Probability of Waiting:');
    disp(['Counter 1: ', num2str(probWait1), '%']);
    disp(['Counter 2: ', num2str(probWait2), '%']);
    disp(['Counter 3: ', num2str(probWait3), '%']);
    
    
    
    % Calculate average service time for each counter
    avgServiceTime1 = sum(tableQ1(4, :)) / size(queue1, 2);
    avgServiceTime2 = sum(tableQ2(4, :)) / size(queue2, 2);
    avgServiceTime3 = sum(tableQ3(4, :)) / size(queue3, 2);
    
    % Display the calculated metrics
    printf('\n');
    disp('Average Service Time:');
    disp(['Counter 1: ', num2str(avgServiceTime1)]);
    disp(['Counter 2: ', num2str(avgServiceTime2)]);
    disp(['Counter 3: ', num2str(avgServiceTime3)]);
    totalServiceTime = sum(tableQ1(4, :)) + sum(tableQ2(4, :)) + sum(tableQ3(4, :));
    averageServiceTime = totalServiceTime / (size(queue1, 2) + size(queue2, 2) + size(queue3, 2));
    disp(['All Counter Average: ', num2str(averageServiceTime)]);
    
    printf('\n');
    printf('\n');
    printf('\n');
    
    disp(      '         Average Waiting Time                                    Average Arrival Time       ');
    disp(      ' +----------------------------------+                   +----------------------------------+');
    disp(      ' |   Counter    |      Average      |                   |   Counter    |      Average      |');
    disp(      ' |     No       |    Waiting Time   |                   |     No       |    Arrival Time   |');
    disp(      ' +----------------------------------+                   +----------------------------------+');
    printAverageTable(avgWaitingTime1, avgWaitingTime2, avgWaitingTime3, averageWaitingTime, avgArrivalTime1, avgArrivalTime2, avgArrivalTime3, averageArrivalTime);
    
    printf('\n');
    printf('\n');
    disp(      '          Average Time Spent                                     Average Service Time       ');
    disp(      ' +----------------------------------+                   +----------------------------------+');
    disp(      ' |   Counter    |      Average      |                   |   Counter    |      Average      |');
    disp(      ' |     No       |     Time Spent    |                   |     No       |    Service Time   |');
    disp(      ' +----------------------------------+                   +----------------------------------+');
    printAverageTable(avgTimeSpent1, avgTimeSpent2, avgTimeSpent3, averageTimeSpent, avgServiceTime1, avgServiceTime2, avgServiceTime3, averageServiceTime);
    
    printf('\n');
    printf('\n');
    disp(      '      Average Inter-arrival Time                                Probability of Waiting      ');
    disp(      ' +----------------------------------+                   +----------------------------------+');
    printf(    ' |   Average    |       %3.0f         |                   |   Counter    |  Probability of   |\n', avgInterArrivalTime ); 
    disp(      ' +----------------------------------+                   |     No       |    Waiting (%)    |');
    disp(      ' (Look at top for more accurate calc)                   +----------------------------------+');
    printf(    '                                                        |      1       |       %3.0f         |\n',probWait1);
    printf(    '                                                        |      2       |       %3.0f         |\n',probWait2);  
    printf(    '                                                        |      3       |       %3.0f         |\n',probWait3);
    disp(      '                                                        +----------------------------------+');
    disp(      '                                                        (Look at top for more accurate calc)');
    end
    
    
    
            
    
        