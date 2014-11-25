function prob = pls(P, N)
%PLS Summary of this function goes here
%   Detailed explanation goes here
if P <= N
    prob = 1;
else
    prob = 0;
    factpminus1 = factorial(P - 1);
    for i=0:N-1
        prob = prob + factpminus1 / (factorial(i) * factorial(P - 1 - i));
    end
    prob = 2^(1-P) * prob;
end

end

