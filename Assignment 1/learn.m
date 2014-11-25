function [weights, taken] = learn( dataset, weights, numNeurons)
%LEARN Summary of this function goes here
%   Detailed explanation goes here 
    xsi = dataset(1:length(dataset)-1);
    label = dataset(end);
    taken = true;
    if dot(weights, xsi * label) <= 0
        taken = false;
        %disp('asdf');
        weights = weights + ((xsi * label) / numNeurons);
    end
end

