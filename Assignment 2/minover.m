function [w, errors] = minover( delta, n_max, P, N, xi, S, teacherVector)
    if nargin < 5
        [xi, S] = generateDatasets(P, N, ones(N, 1));
    end
    w = zeros(N, 1);
    errors = [determineError(w, teacherVector)];
    t = 1;
    changes = ones(1, P);
    while true
        % Determine which element is the least stable
        [~, mu] = determineMinimalOverlap(w, xi, S);
        
        % Update the student weight vector
        w_new = w + ((xi(:, mu) * S(mu)) / N);
        % Store the generalized error
        errors = [errors determineError(w_new, teacherVector)];
        % Store the angle between the old and new vector as measure for
        % change
        change = (1 - dot(w, w_new) / (norm(w)*norm(w_new)));
        changes(mod(t, P) + 1) = change;
        t = t + 1;
        % If there are P epochs without significant change, exit
        if (all(changes < delta))
            break
        % If too many epochs have passed, exit
        elseif t >= n_max * P
            disp('Your time has passed');
            break
        end
        % Stabilize further with new weight vector
        w = w_new;
    end
end

