function xis = generate_input_vectors(N, P, limits)
%GENERATE_INPUT_VECTORS Returns P N-dimensional real-valued input vectors.
%The values in the input vectors will be limited by the values in limits.
    if nargin < 3
        limits = [0, 1];
    elseif nargin < 2
        error('generate_input_vectors needs at least 2 arguments');
    end
    
    if length(limits) ~= 2
        error('generate_input_vectors needs 2 values in limits.');
    end
    
    xis = limits(1) + (limits(2) - limits(1)) * rand(N, P);
end

