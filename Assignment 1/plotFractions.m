% Load all variables from fracs.mat
load fracs

% -----------------------------------------------------------------------
% | PLOT EVERY NETWORK SUCCESS RATE SEPARATELY WITH THEIR EXPECTED S.R. |
% -----------------------------------------------------------------------

for i = 1:length(Ns)
    N = Ns(i);
    figure;
    plot(alphas(:), fractions(i, :), 'b');
    hold on;
    plot(alphas(:), expected(i, :), 'k');
    
    h_legend = legend('Q_{l,s}', 'P_{l,s}');
    set(h_legend, 'FontSize', 16, 'FontName', 'FixedWidth');
    legend boxoff;
    
    xlabel('\alpha', 'FontSize', 20);
    ylabel('Success rate', 'FontSize', 20, 'FontName', 'FixedWidth');
    title({'Observed success rates vs. expected success rates', ['N = ', num2str(N), ', n_D = ', num2str(n_D), ', n_{max} = ', num2str(n_max)]}, 'FontSize', 16, 'FontName', 'FixedWidth');
    
    print(gcf, '-depsc', ['success_rate_N_', num2str(N), '_nd_', num2str(n_D), '_nmax_', num2str(n_max)]);
end

% ------------------------------------------
% | PLOT ALL OUR SUCCESS RATES IN ONE PLOT |
% ------------------------------------------

% This code expects three sizes of the network.
assert(length(Ns) == 3);

figure;
hold on;
colors = ['b', 'r', 'k'];
for i = 1:length(Ns)
    N = Ns(i);
    plot(alphas, fractions(i, :), colors(i));
end

h_legend = legend(['N = ', num2str(Ns(1))], ['N = ', num2str(Ns(2))], ['N = ', num2str(Ns(3))]);
set(h_legend, 'FontSize', 16, 'FontName', 'FixedWidth');
legend boxoff; % Otherwise the larger font doesn't fit in the box :(

xlabel('\alpha', 'FontSize', 20);
ylabel('Success rate', 'FontSize', 20, 'FontName', 'FixedWidth');
title(['Success rates, n_D = ', num2str(n_D), ', n_{max} = ', num2str(n_max)], 'FontSize', 16, 'FontName', 'FixedWidth');

print(gcf, '-depsc', ['success_rates_N_', num2str(Ns(1)), '_', num2str(Ns(2)), '_', num2str(Ns(3)), '_nd_', num2str(n_D), '_nmax_', num2str(n_max)]);

% -------------------------------------------
% | PLOT EXPECTED SUCCESS RATES IN ONE PLOT |
% -------------------------------------------

figure;
hold on;
colors = ['b', 'r', 'k'];
for i = 1:length(Ns)
    N = Ns(i);
    plot(alphas, expected(i, :), colors(i));
end

h_legend = legend(['N = ', num2str(Ns(1))], ['N = ', num2str(Ns(2))], ['N = ', num2str(Ns(3))]);
set(h_legend, 'FontSize', 16, 'FontName', 'FixedWidth');
legend boxoff; % Otherwise the larger font doesn't fit in the box :(

xlabel('\alpha', 'FontSize', 20);
ylabel('Success rate', 'FontSize', 20, 'FontName', 'FixedWidth');
title('Expected success rates','FontSize', 20);

print(gcf, '-depsc', ['expected_success_rates_N_', num2str(Ns(1)), '_', num2str(Ns(2)), '_', num2str(Ns(3))]);