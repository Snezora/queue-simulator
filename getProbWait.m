function y = getProbWait(x)
    
    row = size(x,2); 
   total = 0; 
    
    for (i = 1:row)
            if x(7,i) > 0 % compare the element with 0
                count = count + 1; % increment the count by 1
            end;
    end;
    
    y= count;
    end
   
    
    