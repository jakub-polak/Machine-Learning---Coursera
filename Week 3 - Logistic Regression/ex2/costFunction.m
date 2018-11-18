function [J, grad] = costFunction(theta, X, y)
%COSTFUNCTION Compute cost and gradient for logistic regression
%   J = COSTFUNCTION(theta, X, y) computes the cost of using theta as the
%   parameter for logistic regression and the gradient of the cost
%   w.r.t. to the parameters.

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta
%
% Note: grad should have the same dimensions as theta
%

h0 = sigmoid(X * theta);

J = (1/m) * sum(-(log(h0)'*y)  - log(1-h0)'*(1-y));

grad(1) = (1/m) * X(:, 1)' *(h0 - y);
grad(2) = (1/m) * X(:, 2)' *(h0 - y);
grad(3) = (1/m) * X(:, 3)' *(h0 - y);




% =============================================================

end
