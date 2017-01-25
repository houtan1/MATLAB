%-- relational operators
% matlab logic codes 1 for true and 0 for false
% pi > 3 gives 1 for true
pi > 3

test = pi > 3

% a logical array or matrix can also exist
x = [5 10 15;
    12 2 4;
    3 30 99];

t = x > 6

y = x';

t = x > y

%-- combining logical operations
% and & returns true if both are true or both are false
w = (pi > 5) & (0 < 6)

% or | returns true if at least one element is true
w = (pi > 5) | (0 < 6)

%-- logical indexing
% can extract the array elements where the index is true
x1 = x(:,1)
c = x1(x1 > 9)

% can use those elements to replace values
x(x>5) = 99