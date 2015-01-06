function [w, errors] = minover( delta, n_max, P, N, xi, S, teacherVector)
    if nargin < 5
        [xi, S] = generateDatasets(P, N, ones(N, 1));
    end
    w = zeros(N, 1);
    errors = [determineError(w, teacherVector)];
    t = 1;
    changes = ones(1, P);
    while true
        [~, mu] = determineMinimalOverlap(w, xi, S);
        w_new = w + ((xi(:, mu) * S(mu)) / N);
        errors = [errors determineError(w_new, teacherVector)];
        change = (1 - dot(w, w_new) / (norm(w)*norm(w_new)));
        changes(mod(t, P) + 1) = change;
        t = t + 1;
        if (all(changes < delta))
            break
        elseif t >= n_max * P
            disp('Your time has passed');
            break
        end
        w = w_new;
    end
end

