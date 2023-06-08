function y = ed(n, m) 
    % n is the number of iterations, m is the limit 
    A = randexp(m * ones(1, n)); % generate n values from an exponential distribution with mean m 
    A = ceil(A); % loop through A and check if any value exceeds 100 
    for i = 1:n 
        while A(i) > 100 
            A(i) = ceil(randexp(m)); % regenerate the value 
        end 
    end 
    y = A; 
end