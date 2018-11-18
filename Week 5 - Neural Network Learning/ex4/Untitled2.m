%% dane

clear all

il = 2;              % input layer
hl = 2;              % hidden layer
nl = 4;              % number of labels
nn = [ 1:18 ] / 10;  % nn_params
X = cos([1 2 ; 3 4 ; 5 6]);
y = [4; 2; 3];
lambda = 4;
%% ss
hidden_layer_size = hl;
input_layer_size = il;
nn_params = nn;
num_labels = nl;
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));

% Setup some useful variables
m = size(X, 1);
         
% You need to return the following variables correctly 
J = 0;
Theta1_grad = zeros(size(Theta1));
Theta2_grad = zeros(size(Theta2));


% ====================== YOUR CODE HERE ======================
% Instructions: You should complete the code by working through the
%               following parts.
%
% Part 1: Feedforward the neural network and return the cost in the
%         variable J. After implementing Part 1, you can verify that your
%         cost function computation is correct by verifying the cost
%         computed in ex4.m
%
% Part 2: Implement the backpropagation algorithm to compute the gradients
%         Theta1_grad and Theta2_grad. You should return the partial derivatives of
%         the cost function with respect to Theta1 and Theta2 in Theta1_grad and
%         Theta2_grad, respectively. After implementing Part 2, you can check
%         that your implementation is correct by running checkNNGradients
%
%         Note: The vector y passed into the function is a vector of labels
%               containing values from 1..K. You need to map this vector into a 
%               binary vector of 1's and 0's to be used with the neural network
%               cost function.
%
%         Hint: We recommend implementing backpropagation using a for-loop
%               over the training examples if you are implementing it for the 
%               first time.
%
% Part 3: Implement regularization with the cost function and gradients.
%
%         Hint: You can implement this around the code for
%               backpropagation. That is, you can compute the gradients for
%               the regularization separately and then add them to Theta1_grad
%               and Theta2_grad from Part 2.
%

% DECODE - Y
for i = 1:size(y, 1)
    y_new(i, y(i)) = 1;
end
y = y_new;


m = size(X, 1);
         

% FORWARD
X = [ones(m,1) X];
a1 = X;
z2 = a1 * Theta1';
a2 = sigmoid(z2);
a2 = [ones(m, 1) a2];

z3 = a2 * Theta2';
a3 = sigmoid(z3);

h0 = a3;

% BACK

% krok 2
d3 = a3 - y;

% krok 3
sgZ = sigmoidGradient(z2)
d2 = d3 * Theta2
d2 = d2(:, 2:end)
d2 = d2 .* sgZ

% krok 4
Delta2 = 0;
Delta1 = 0;



Delta2 = Delta2 + d3'*a2;
Delta1 = Delta1 + d2'*a1;

Delta2(:,2:end) = Delta2(:,2:end) + (lambda/m)*Theta2(:,2:end) ;
Delta1(:,2:end) = Delta1(:,2:end) + (lambda/m)*Theta1(:,2:end) ;


% krok 5

Theta1_grad = (1/m)*Delta1;
Theta2_grad = (1/m)*Delta2;


J = (1/m) * sum(sum((-y.*log(h0) - (1-y).*log(1-h0))));
Theta1 = Theta1(:, 2:end);
Theta2 = Theta2(:, 2:end);

reg = (lambda/(2*m))*(sum(sum(Theta1.^2))+sum(sum(Theta2.^2)));

J = J + reg;





% -------------------------------------------------------------

% =========================================================================

% Unroll gradients
grad = [Theta1_grad(:) ; Theta2_grad(:)];
