function w = minover( delta, n_max, P, N, xi, S)
    if nargin < 5
        [xi, S] = generateDatasets(P, N, ones(N, 1));
    end
    w = zeros(N, 1);
    t = 0;
    while true
        [~, mu] = determineMinimalOverlap(w, xi, S);
        w_new = w + ((xi(:, mu) * S(mu)) / N);
        change = any(abs(w_new - w) > delta);
        t = t + 1;
        if change == false || t >= n_max * P
            break
        end
        %abs(w - w_new)
        w = w_new;
    end
end

