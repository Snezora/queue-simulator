function y = generateRange(x, n, mode1, mode2, mode3)
    
    % n is the number of people, mode is mode. Simple.
    
    GN = []; % Random Generated Number for Interarrival Time
    GN = generateRNG(mode1,n);
    A = tableData(x);
    row = size(x,2);
    B = []; %Interarrival Time
    AR = []; %Arrival Time
    IG = []; % Random Generated Number for Number of Items
    IG = generateRNG(mode2,n);
    CustNo = []; % Just customer number
    ST = []; %Random Generated Number for Service Time
    ST = generateRNG(mode3,n);
    
    for(i = 1:n)
        for(j = 1:row)
            if(GN(i) >= A(4,j) && GN(i) <= A(5,j))
                CustNo(i) = i;
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
    
    y = [CustNo;GN;B;AR;IG;ST];
end