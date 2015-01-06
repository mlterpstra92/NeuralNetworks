function [e_g] = minover_generalization_error( N, P, delta, n_max, teacherVector, noise)
    % Generate the dataset, by using the teacher perceptron (and noise)
    [xi, S] = generateDatasets(P, N, teacherVector, noise);
    
    % Perform the minover algorithm, using the given parameters
    [w_det, errors] = minover(delta, n_max, P, N, xi, S, teacherVector);
    
    diff = sign(xi' * w_det) == S';
    numDiffs = length(find(diff == 0));
    if numDiffs > 0
        warning('Did not converge properly! There are differences.');
    end
    
    % Return the generalization error of the final weight vector.
    e_g = errors(end);
end