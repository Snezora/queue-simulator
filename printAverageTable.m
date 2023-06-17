function y=printAverageTable(x,y,z,avg, x1, y1, z1, avg1)
    
    
    printf(' |  Counter 1   |        %3.0f        |                   |  Counter 1   |        %3.0f        |\n', x, x1);
    printf(' |  Counter 2   |        %3.0f        |                   |  Counter 2   |        %3.0f        |\n', y, y1);
    printf(' |  Counter 3   |        %3.0f        |                   |  Counter 3   |        %3.0f        |\n', z, z1);
    disp(      ' +----------------------------------+                   +----------------------------------+');
    printf(' |   Average    |        %3.0f        |                   |   Average    |        %3.0f        |\n', avg, avg1);
    disp(      ' +----------------------------------+                   +----------------------------------+');
    disp(      ' (Look at top for more accurate calc)                   (Look at top for more accurate calc)');
    
    end