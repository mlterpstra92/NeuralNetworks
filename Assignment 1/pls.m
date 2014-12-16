function prob = pls(P, N)
    
    % Make sure P is an integer. (Otherwise we can't take the binomial)
    P = round(P);
    
    if P <= N
        prob = 1;
    else
        prob = 0;
        for i=0:N-1
            % Turn off warnings for too large coefficients (results seem
            % exact enough)
            warning('off', 'MATLAB:nchoosek:LargeCoefficient');
            prob = prob + nchoosek(P-1, i);
            warning('on', 'MATLAB:nchoosek:LargeCoefficient');
        end
        prob = 2^(1-P) * prob;
    end
end