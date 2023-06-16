function y = test()
    ticType = [1 2 3 1 3 2 2];  % Example ticket types for customers
ticPurchased = [2 3 1 2 1 4 2];  % Example number of tickets purchased by each customer
serviceTime = [2 3 5];  % Example service time for each server
arrivalTime = getArrivalTime(serviceTime);  % Calculate arrival time for each customer

% Simulate the queue system
nCustomers = size(ticType, 2);
ticServer = zeros(2, nCustomers);  % Initialize ticServer to track assigned server for each customer
totalServiceTime = zeros(1, nCustomers);  % Track total service time for each customer
waitTime = zeros(1, nCustomers);  % Track wait time for each customer

for i = 1:nCustomers
    server = getFromRange(serviceTime, 'uniform', 1);  % Assign a server to the customer randomly
    ticServer(:, i) = [ticType(i); server];
    
    lastEndTime = getLastEndTime(server, ticServer);  % Get the end time of the last customer served by the assigned server
    
    if arrivalTime(i) < lastEndTime
        waitTime(i) = lastEndTime - arrivalTime(i);  % Calculate wait time if customer has to wait
    end
    
    totalServiceTime(i) = serviceTime(server);  % Calculate total service time for each customer
    ticServer(5, i) = arrivalTime(i) + totalServiceTime(i);  % Update the end time for the assigned server
end

% Calculate probability of wait and average service time for each server
servers = unique(ticServer(2, :));
nServers = numel(servers);
probWait = zeros(1, nServers);
avgServiceTime = zeros(1, nServers);

for i = 1:nServers
    server = servers(i);
    serverIndices = find(ticServer(2, :) == server);
    nCustomersServer = numel(serverIndices);
    
    probWait(i) = sum(waitTime(serverIndices) > 0) / nCustomersServer;  % Calculate probability of wait for the server
    avgServiceTime(i) = sum(totalServiceTime(serverIndices)) / nCustomersServer;  % Calculate average service time for the server
end

% Display the results
disp("Results of the simulation:");
disp("----------------------------");
disp("Customer | Wait Time | Total Service Time");
for i = 1:nCustomers
    disp([num2str(i), "         ", num2str(waitTime(i)), "       ", num2str(totalServiceTime(i))]);
end

disp("----------------------------");
disp("Probability of wait for each server:");
for i = 1:nServers
    disp(["Server ", num2str(servers(i)), ": ", num2str(probWait(i))]);
end

disp("----------------------------");
disp("Average service time for each server:");
for i = 1:nServers
    disp(["Server ", num2str(servers(i)), ": ", num2str(avgServiceTime(i))]);
end