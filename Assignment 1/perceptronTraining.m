
function success = perceptronTraining(datasets, weights, nmax)
%PERCEPTRONTRAINING Summary of this function goes here
%   Detailed explanation goes here
    [numPatterns, numNeurons] = size(datasets);
    numNeurons = numNeurons - 1; % column is the number of neurons + the label
    
    for i=1:nmax
        success = true;
        for j=1:numPatterns
            [weights, taken] = learn(datasets(j,:), weights, numNeurons);
            success = success && taken;
        end
        if success
            disp('success');
            break;
        end
    end
end

