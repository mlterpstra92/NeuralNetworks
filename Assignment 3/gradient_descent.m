close all;

t_max = 1000;
learning_rate = 0.01;
P = 100; % The size of the training set

% Load the dataset
data3 = load('data3');
xis = data3.xi;
taus= data3.tau;

% Retrieve the dimensions from the dataset
[N, total_examples] = size(xis);
Q = total_examples - P; % The size of the test set

% Split the dataset to training and test sets
training_examples = xis(:, 1:P);
training_taus = taus(1:P);
test_examples = xis(:, P + 1:end);
test_taus = taus(P + 1:end);

% Initialize the weight vectors
w_1 = generate_weight_vector(N);
w_2 = generate_weight_vector(N);

training_costs = zeros(1, t_max);
test_costs = zeros(1, t_max);

for t=1:t_max
    for i=1:P
        % Take a random example
        nu = randi(P);
        xi_nu = training_examples(:, nu);
        tau_nu = training_taus(nu);
        
        % Perform a gradient descent step using the random example
        [w_1, w_2] = gradient_descent_step(w_1, w_2, xi_nu, tau_nu, learning_rate);
    end
    
    % Store the cost functions at this time step
    training_cost = cost_function(training_examples, w_1, w_2, training_taus);
    training_costs(t) = training_cost;
    
    test_cost = cost_function(test_examples, w_1, w_2, test_taus);
    test_costs(t) = test_cost;
    
    if mod((t/t_max)*100, 5) == 0
        disp([num2str((t/t_max)*100), '%']);
    end
end

plot(1:t_max, training_costs);
hold on;
plot(1:t_max, test_costs, 'r');
xlabel('t');
ylabel('E');
ylim([0, max([test_costs(:); training_cost(:)])]);
title({'Cost functions', ['\eta = ', num2str(learning_rate), ', P = ', num2str(P)], });
legend('Training cost', 'Test cost');

figure;
bar(w_1);
xlim([0.5, 50.5]);
title('Weight vector w_1');

figure;
bar(w_2);
xlim([0.5, 50.5]);
title('Weight vector w_2');