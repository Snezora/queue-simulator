function y = generateRange(x, n, mode1, mode2)
    
    % n is the number of people, mode is mode. Simple.
    
    GN = [];
    GN = generateRNG(mode1,n);
    A = tableData(x);
    row = size(x,2);
    B = [];
    AR = [];
    IG = []; % initialize an empty vector for IG
    IG = generateRNG(mode2,n); % generate n random numbers using mode 2
    
    for(i = 1:n)
        for(j = 1:row)
            if(GN(i) >= A(4,j) && GN(i) <= A(5,j))
                B(i) = A(1,j);
                if (i == 1)
                    GN(i) = 0;
                    B(i) = 0;
                    AR(i) = 0;
                else
                    AR(i) = AR(i-1) + B(i);
                end;
                break;
            end;
        end;        
    end;
    
    y = [GN;B;AR;IG]; % append IG to the end of y
end