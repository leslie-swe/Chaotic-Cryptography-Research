function [T, Z] = rks4(F, a, b, Za, M)
% Implementation of the 4th-Order Runge-Kutta Method

h = (b-a)/(M-1); % step size
T = linspace(a, b, M)'; % Time vector (as a column)
Z = zeros(M, length(Za)); % Matrix of solutions
Z(1,:) = Za; % Set the initial condition

for j = 1:(M-1)
    % Calculate the slopes k1, k2, k3, k4
    k1 = h * feval(F, T(j), Z(j,:));
    k2 = h * feval(F, T(j) + h/2, Z(j,:) + k1'/2);
    k3 = h * feval(F, T(j) + h/2, Z(j,:) + k2'/2);
    k4 = h * feval(F, T(j) + h, Z(j,:) + k3');
   
    % Transposing the sum of the k-vectors
    update_term = (k1 + 2*k2 + 2*k3 + k4)/6;
    Z(j+1, :) = Z(j, :) + update_term'; 
end