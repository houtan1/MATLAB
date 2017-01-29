% partial fraction expansion (decomposition) using residue function
% have X(s) = (s+3)/(s+1)(s+2) want it expanded as
% X(s) = A/(s+1) + B/(s+2)
% going one step back X(s) = (s+3)/(s^2+3s+2)

% start with X(s) = b/a then

b = [1 3];
a = [1 3 2];
[r,p,k] = residue(b,a)

% gives r = [-1 2] p = [-2 -1] k = []
% so X(s) = -1/(s+2) + 2/(s+1)