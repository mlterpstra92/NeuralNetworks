%N, P, delta, n_max, teacherVector, noise
alphas = 0.1:0.1:5;
N = 20;
delta = 1e-5;
n_max = 400;
teacherVector = ones(N, 1);
learning_curve = zeros(size(alphas));
innerlimit = 10;
parfor i=1:length(alphas)
    alpha = alphas(i);        
    disp(['Calculating minover for alpha = ', num2str(alpha)]);
    innervals = zeros(1, innerlimit);
    for j=1:innerlimit
        P = round(alpha * N);
        innervals(j) = minover_generalization_error(N, P, delta, n_max, teacherVector, 0);
    end
    learning_curve(i) = mean(innervals);
end

plot(alphas, learning_curve);