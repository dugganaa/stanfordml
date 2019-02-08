function [J, grad] = costFunction(theta, X, y)
%COSTFUNCTION Compute cost and gradient for logistic regression
%   J = COSTFUNCTION(theta, X, y) computes the cost of using theta as the
%   w.r.t. to the parameters.

% Initialize some useful values
m = length(y); % number of training examples

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta
%
% Note: grad should have the same dimensions as theta
%

h0 = sigmoid(X * theta);
J = -1/m * (sum(y .* log(h0) + (1-y) .* (log(1 - h0))));
for i=1:size(X,2)
    grad = (1/m) * (sum((h0 - y) .* X));
    disp(grad);
end


% =============================================================

end
