function [dataset, labels] = generateDatasets(P, N, teacherPerceptron, noise)
    % P is the number of patterns
    % N is the number of neurons
    % this function generates P patterns for N neurons with a label S
    if nargin < 4
        noise = 0;
    end
    if nargin < 3
        teacherPerceptron = ones(N, 1);
    end
    dataset = randn(N, P);
    noiseVector = (rand(1, P) > noise) * 2 - 1;
    labels = sign(dot(dataset, repmat(teacherPerceptron, 1, size(dataset, 2)))) .* noiseVector;
end