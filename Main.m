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
    ticServiceTimeProb1 = [3, 4, 5, 6, 7
                           0.1, 0.2, 0.4, 0.15, 0.05];
    printTable1(ticServiceTimeProb1);
    pause
    
    printf('\n');
    disp(      '  +---------------------------------------------------------------------+');
    disp(      '  |                 Table of Service Time for Counter 2                 |');
    disp(      '  +---------------------------------------------------------------------+');
    disp(      '  |  Service time   |   Probability   |     CDF     |       Range       |');
    disp(      '  +---------------------------------------------------------------------+');
    ticServiceTimeProb2 = [4, 5, 6, 7, 8
                           0.1, 0.15, 0.35, 0.2, 0.2];        
    printTable1(ticServiceTimeProb2);
    pause
    
    printf('\n');
    disp(      '  +---------------------------------------------------------------------+');
    disp(      '  |                 Table of Service Time for Counter 3                 |');
    disp(      '  +---------------------------------------------------------------------+');
    disp(      '  |  Service time   |   Probability   |     CDF     |       Range       |');
    disp(      '  +---------------------------------------------------------------------+');
    ticServiceTimeProb2 = [2, 3, 4, 5, 6
                           0.15, 0.2, 0.5, 0.1, 0.05];        
    printTable1(ticServiceTimeProb2);
    pause
    
    % Getting User Input
    printf('\n');
    custNum = input('Please input the number of customer:');
    printf('\nTypes of random number generator:\n');
    printf('1. Linear Congruential Generator (LCG)\n');
    printf('2. Random Variate Generator for Exponential Distribution\n');
    printf('3. Random Variate Generator for Uniform Distribution\n');
    printf('4. Freemat built-in rand function\n');