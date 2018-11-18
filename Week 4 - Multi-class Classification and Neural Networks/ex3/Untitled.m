



X = [ones(m, 1) X];

z2 = X * Theta1';

a2 = sigmoid(z2);

a2 = [ones(m,1) a2];

z3 = a2 * Theta2';

h0 = sigmoid(z3);

for i = 1:length(h0)
    for j = 1:length(h0(1,:))
        if h0(i, j) == max(h0(i, :))
            p(i) = j;
        end
    end
end