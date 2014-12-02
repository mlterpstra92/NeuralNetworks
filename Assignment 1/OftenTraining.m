function fractions = OftenTraining(N, alphas, nd, nmax )
%OFTENTRAINING Summary of this function goes here
%   Detailed explanation goes here
    clf;
    Ps = round(alphas * N);
    successes = zeros(size(Ps, 2), 1);
    parfor i=1:size(Ps, 2)
        for n=1:nd
            patterns = generateDatasets(Ps(i), N);
            if perceptronTraining(patterns, zeros(1, N), nmax)
                successes(i) = successes(i) + 1;
            end
        end
        disp(['P = ', num2str(Ps(i)), '/', num2str(Ps(end))]);
    end
    fractions = successes / nd;
    plot(alphas, fractions);
    
    hold on;
    plss = zeros(1, size(Ps, 2));
    for i = 1:size(Ps, 2)
        plss(i) = pls(Ps(i), N);
    end
    plot(alphas, plss, 'r');
    legend('Q_{l, s}', 'P_{l, s}');
    xlabel('\alpha');
    ylabel('Success');
    title(['Observed success rates vs. expected success rates for N = ', num2str(N), ', n_d = ', num2str(nd), ', n_{max} = ', num2str(nmax)]);
    saveas(1, ['success_rate_N_', num2str(N), '_nd_', num2str(nd), '_nmax_', num2str(nmax)], 'epsc');
end

