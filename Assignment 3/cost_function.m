function cost = cost_function( xis, w_1, w_2, taus )
%COST_FUNCTION Returns the value of the cost function, given the input
%vectors xis, weight vectors w_1 and w_2, and training labels taus.
    P = length(taus);
    cost = sum((ff_output(xis, w_1, w_2) - taus).^2) / (2 * P);
end

