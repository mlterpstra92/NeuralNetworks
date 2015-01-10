function [xis, taus] = generate_dataset(N, P, input_limits, output_limits)
%GENERATE_DATASET Generates P random real-valued N-dimensional input
% vectors with limits input_limts and P random real-valued training labels
% with limits output_limits.
    xis = generate_input_vectors(N, P, input_limits);
    taus = output_limits(1) + (output_limits(2) - output_limits(1)) * rand(1, P);
end

