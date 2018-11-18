clc
theta = test_theta;

m = length(y);

%((lambda/2*m) * sum(theta(2:end, :).^2))

h0 = sigmoid(X * theta);
% 
% gradx = (1/m) * sum((h0 - y)*X);
% 

% grad = (1/m) * X' * (h0 - y)
% 
% for i = 2:length(grad)
%     grad(i) = grad(i) + (lambda/m)*theta(i);
% end
% 

% lambda = 100;
% [cost, grad] = costFunctionReg(test_theta, X, y, lambda)

lambda = 10

J1 = (1/m) * sum(-(log(h0)'*y)  - log(1-h0)'*(1-y))

J2 = ((lambda/2*m) * sum(theta(2:end, :).^2))
