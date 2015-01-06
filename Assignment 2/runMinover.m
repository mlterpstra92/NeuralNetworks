N = 20;
P = 3*N;
delta = 10^-4;
teacherVector = ones(N, 1);
[xi, S] = generateDatasets(P, N, teacherVector, .1);
[w_det, errors] = minover(delta, 200, P, N, xi, S, teacherVector);
diff = sign(xi' * w_det) == S';
numDiffs = length(find(diff == 0));
disp([num2str(numDiffs), ' differences']);
if numDiffs > 0
    disp(num2str(diff));
end
plot(1:length(errors), errors)