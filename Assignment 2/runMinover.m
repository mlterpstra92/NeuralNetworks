N = 20;
P = 3*N;
delta = 10^-6;
teacherVector = ones(N, 1);
[xi, S] = generateDatasets(P, N, teacherVector);
w_det = minover(delta, 200, P, N, xi, S);
diff = sign(xi' * w_det) == S';
numDiffs = length(find(diff == 0));
disp([num2str(numDiffs), ' differences']);
if numDiffs > 0
    disp(num2str(diff));
end
disp(['Generalization error: ', num2str(acos(dot(w_det, teacherVector) / (norm(w_det)*norm(teacherVector))) / pi)]);