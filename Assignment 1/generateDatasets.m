function matrix = generateDatasets(P, N)
    % P is the number of patterns
    % N is the number of neurons
    % this function generates P patterns for N neurons with a label S
    matrix = randn(P, N);
    labels = randi(2, P, 1) * 2 - 3; % randi returns number between 1 and 2 but we want it to be -1 or 1
                                     % so multiply by two gives 2 or 4.
                                     % Substract 3 gives either -1 or 1
    matrix = [matrix, labels];
end