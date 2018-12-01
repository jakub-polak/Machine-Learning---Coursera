


for i = 1:K
   C(:, i) = idx == i;
end
Csum = sum(C);

mi = zeros(K, 1);
for i = 1:K
   mi(i, :) = (1/Csum(i)) * sum(X(C(:, i)));
end