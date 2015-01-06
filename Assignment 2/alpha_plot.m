%N, P, delta, n_max, teacherVector, noise
alphas = 0.1:0.1:5;
N = 20;
delta = 1e-5;
n_max = 400;
teacherVector = ones(N, 1);
learning_curve = zeros(size(alphas));

parfor i=1:length(alphas)
    alpha = alphas(i);
    P = round(alpha * N);
    disp(['Calculating minover for alpha = ', num2str(alpha)]);
    learning_curve(i) = minover_generalization_error(N, P, delta, n_max, teacherVector, 0);
end

plot(alphas, learning_curve);