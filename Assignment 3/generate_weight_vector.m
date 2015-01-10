function w = generate_weight_vector(N)
%GENERATE_WEIGHT_VECTOR Generates a random real-valued N-dimensional weight
% vector with magnitude 1
    
    % Minus 0.5, because then they can be negative as well.
    w = rand(N, 1) - 0.5;
    
    % Makes sure the norm is 1.
    w = w / norm(w);
end