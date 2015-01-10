% Generate the dataset
input_limits = [-3, 3];
output_limits = [-1, 1];
[xis, taus] = generate_dataset(50, 5000, input_limits, output_limits);

% Initialize the weight vectors
