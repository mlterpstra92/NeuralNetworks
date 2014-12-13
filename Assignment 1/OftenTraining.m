function fractions = OftenTraining(N, alphas, nd, nmax )
%OFTENTRAINING Summary of this function goes here
%   Detailed explanation goes here
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
end

