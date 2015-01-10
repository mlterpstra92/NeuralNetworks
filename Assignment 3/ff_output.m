function sigma = ff_output(xi, w_1, w_2)
%FF_OUTPUT Returns the output of the feedforwards network, using the weight
%vectors w_1 and w_2, and the input vector xi.

    % P might be larger than one.
    [~, P] = size(xi);
    
    % Repeat the weight vector on every column, since we might have more
    % input vectors than just one.
    w_1 = repmat(w_1, 1, P);
    w_2 = repmat(w_2, 1, P);
    
    sigma = tanh(dot(w_1, xi)) + tanh(dot(w_2, xi));
end

