%N, P, delta, n_max, teacherVector, noise
alphas = 0.1:0.1:5;
N = 20;
delta = 1e-5;
n_max = 100;
noise = 0;
teacherVector = ones(N, 1);
learning_curve = zeros(size(alphas));
innerlimit = 100;
parfor i=1:length(alphas)
    alpha = alphas(i);        
    disp(['Calculating minover for alpha = ', num2str(alpha)]);
    innervals = zeros(1, innerlimit);
    P = round(alpha * N);
    for j=1:innerlimit
        innervals(j) = minover_generalization_error(N, P, delta, n_max, teacherVector, noise);
    end
    learning_curve(i) = mean(innervals);
end

plot(alphas, learning_curve);
xlabel('\alpha');
ylabel('\epsilon_g');
title(['Learning curve for N = ', num2str(N), ', \lambda = ', num2str(noise)]);