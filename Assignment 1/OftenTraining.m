function fractions = OftenTraining(numNeurons, alphas, nd, nmax )
%OFTENTRAINING Summary of this function goes here
%   Detailed explanation goes here
    Ps = alphas * numNeurons;
    allSuccesses = [];
    for numPatterns=Ps
        numSuccesses = 0;
        for n=nd
            patterns = generateDatasets(round(numPatterns), numNeurons);
            if perceptronTraining(patterns, zeros(1, numNeurons), nmax)
                numSuccesses = numSuccesses + 1;
            end
        end
        allSuccesses = [allSuccesses; numSuccesses];
    end
    fractions = allSuccesses / nd;
    plot(alphas, fractions);
end

