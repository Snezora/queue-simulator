function x = probGen(n)
    

    % Generate n random numbers that sum to 1
    % Input: n - the number of random numbers to generate
    % Output: x - a row vector of n random numbers

    x = rand(1,n); % Generate n random numbers based on n
    x = x / sum(x); % Normalize them to sum to 1

end
