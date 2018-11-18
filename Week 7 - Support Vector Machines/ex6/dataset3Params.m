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
sigma = 0.1;

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

% Try different SVM Parameters here
C = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30];
sigma = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30];

%% Both at once

error = zeros(length(C));
for i = 1:length(C)
    for j = 1:length(sigma)
        model= svmTrain(X, y, C(i), @(x1, x2) gaussianKernel(x1, x2, sigma(j)));
        pred = svmPredict(model, Xval);
        error(i, j) = mean(double(pred ~= yval));
    end
end

%% Indexes
min_error = min(min(error))
for i = 1:length(error)
    for j = 1:length(error)
        if error(i,j) == min_error
            i
            j
            fprintf('Minimal error at C = %.2f and Sigma = %.2f', C(i), sigma(j));
            C = C(i);
            sigma = sigma(j);
        end
    end
end





% =========================================================================

end
