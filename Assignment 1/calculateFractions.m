% The different sizes of the perceptrons that we will train.
Ns = [25, 50, 100];

% Values for alpha where the fraction of succesfull datasets will be
% calculated. Number of patterns per dataset will be P = alpha * N.
alphas = 0.7:0.1:3;

% The number of independently generated datasets used per value of N
% (Higher = better statistical result)
n_D = 200;

% Maximal number of sweeps through the dataset before giving up separating
% the dataset.
n_max = 500;

% 'fractions' is a matrix containing one row for every N in Ns.
% The rows contain the fractions of succesfully trained datasets for that
% size, as a function of alpha.
fractions = zeros(length(Ns), length(alphas));
for i = 1:length(Ns)
    N = Ns(i);
    disp(['Training network of size N = ', num2str(N), '...']);
    fractions(i, :) = OftenTraining(N, alphas, n_D, n_max);
    disp(['... Finished training network of size N = ', num2str(N)]);
end

% 'expected' is a matrix containing one row for every N in Ns.
% The rows contain the expected fractions for that size, as a function of
% alpha.
expected = zeros(length(Ns), length(alphas));
for i = 1:length(Ns)
    N = Ns(i);
    for j = 1:length(alphas)
        alpha = alphas(j);
        P = round(alpha * N);
        % Calculate the probability of linear separability for these values
        % of P and N.
        expected(i, j) = pls(P, N);
    end
end

% Save the calculated fractions (and the parameters) to fracs.mat, so that
% we can edit our plots later, if we want.
save fracs.mat Ns alphas n_D n_max fractions expected

plotFractions;