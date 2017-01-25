% Calculate A
A = randn(1)

if (A > 0.5)
    % Calculate B only if A is greater than 0.5
    B = sqrt(A)
else
    % Set B to 0 if condition is not met
    B = 0
end
