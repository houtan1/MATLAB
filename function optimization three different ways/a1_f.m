function z = a1_f(x)
%A1_F Summary of this function goes here
%   Detailed explanation goes here
x1 = x(1);
x2 = x(2);
x3 = x(3);
x4 = x(4);

z = (x1 + 10*x2)^2 + 5*(x3 - x4)^2 + (x2 - 2*x3)^4 + 100*(x1 - x4)^4;
end

