N = 20;
P = 50;
noise = 0.1;
delta = 10^-5;
teacherVector = ones(N, 1);
[xi, S] = generateDatasets(P, N, teacherVector, noise);
[w_det, errors] = minover(delta, 200, P, N, xi, S, teacherVector);

diff = sign(xi' * w_det) == S';
numDiffs = length(find(diff == 0));
disp([num2str(numDiffs), ' differences']);

flipped = length(find((sign(xi' * teacherVector) == S') == 0));

plot(1:length(errors), errors);
xlabel('t');
ylabel('\epsilon_g(t)');
title(['Generalization error for N = ', num2str(N), ', P = ', num2str(P), ', \lambda = ' num2str(noise), ' (', num2str(flipped), ' flipped )']);
ylim([0, max(errors)]);