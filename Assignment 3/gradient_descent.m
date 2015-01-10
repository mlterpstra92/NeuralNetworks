N = 50;
P = 5000;

% Generate the dataset
input_limits = [-3, 3];
output_limits = [-1, 1];
[xis, taus] = generate_dataset(N, P, input_limits, output_limits);

% Initialize the weight vectors
w_1 = generate_weight_vector(N);
w_2 = generate_weight_vector(N);