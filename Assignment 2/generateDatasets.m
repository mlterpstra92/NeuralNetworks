function [dataset, labels] = generateDatasets(P, N, teacherPerceptron)
    % P is the number of patterns
    % N is the number of neurons
    % this function generates P patterns for N neurons with a label S
    if nargin < 3
        teacherPerceptron = ones(N, 1);
    end
    dataset = randn(N, P);
    labels = sign(dot(dataset, repmat(teacherPerceptron, 1, size(dataset, 2))));
end