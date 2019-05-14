function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%
bestPredMean = 1;
bestC = 0;
bestSigma = 0;
maxVals = 30;
while C < maxVals
    disp("Hello");
    sigma = 0.03;
    while sigma < maxVals
        model = svmTrain(X, y, C, @(x1, x2) gaussianKernel(x1, x2, sigma), 1e-3, 20);
        predictions = svmPredict(model,Xval);
        predMean = mean(double(predictions ~= yval));
        fprintf("\nPredMean for C: %f, sigma: %f, is: %f",C,sigma, predMean);
        if predMean < bestPredMean
            bestPredMean = predMean;
            bestC = C;
            bestSigma = sigma;
        end
        if (mod(sigma,0.03) == 0)
            sigma = ((sigma/3)*10);
        else
            fprintf("\nmod sigma, 0.03: %f", mod(sigma,0.03));
            sigma = sigma * 3;
        end
    end
    if (mod(C,0.03) == 0)
        C = ((C/3)*10);
    else
        C = C * 3;
    end
end
fprintf("\nFINAL C: %f, FINAL SIGMA: %f", C, sigma);
C = bestC;
sigma = bestSigma;
fprintf("\nC is %f",C);
fprintf("\nSigma is %f",sigma);






% =========================================================================

end
