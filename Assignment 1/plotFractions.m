% Load all variables from fracs.mat
load fracs

% Plot every network size separately
for i = 1:length(Ns)
    N = Ns(i);
    figure;
    plot(alphas(:), fractions(i, :), 'b');
    hold on;
    plot(alphas(:), expected(i, :), 'k');
    legend('Q_{l, s}', 'P_{l, s}');
    xlabel('\alpha');
    ylabel('Success');
    title(['Observed success rates vs. expected success rates for N = ', num2str(N), ', n_D = ', num2str(n_D), ', n_{max} = ', num2str(n_max)]);
    print(gcf, '-depsc', ['success_rate_N_', num2str(N), '_nd_', num2str(n_D), '_nmax_', num2str(n_max)]);
end

% All our data in 1 plot (without expectations)

% This code expects three sizes of the network.
assert(length(Ns) == 3);

figure;
hold on;
colors = ['b', 'r', 'g'];
for i = 1:length(Ns)
    N = Ns(i);
    plot(alphas(:), fractions(i, :), colors(i));
    xlabel('\alpha');
    ylabel('Success');
    title(['Success rates, n_D = ', num2str(n_D), ', n_{max} = ', num2str(n_max)]);
    print(gcf, '-depsc', ['success_rate_N_', num2str(N), '_nd_', num2str(n_D), '_nmax_', num2str(n_max)]);
end

legend(['N = ', num2str(Ns(1))], ['N = ', num2str(Ns(2))], ['N = ', num2str(Ns(3))]);