function [k_mu, mu] = determineMinimalOverlap(w, xi, S)
    P = size(xi, 2);
    ks = zeros(1, P);
    for i=1:P
        ks(i) = determineOverlap(w, xi(:, i), S(i));
    end
    [k_mu, mu] = min(ks);
end

