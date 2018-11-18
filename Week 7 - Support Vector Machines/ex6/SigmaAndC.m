
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
        end
    end
end




%% Plot errors
% Train the SVM
model= svmTrain(X, y, 1, @(x1, x2) gaussianKernel(x1, x2, 0.1));
visualizeBoundary(X, y, model);