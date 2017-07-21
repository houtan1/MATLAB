function z = a1_g(x)
%A1-G Summary of this function goes here
%   Detailed explanation goes here
x1 = x(1);
x2 = x(2);
x3 = x(3);
x4 = x(4);

z1 = 2*(x1 + 10*x2) + 400*(x1 - x4)^3;
z2 = 20*(x1 + 10*x2) + 4*(x2 - 2*x3)^3;
z3 = 10*(x3 - x4) - 8*(x2 - 2*x3)^3;
z4 = -10*(x3 - x4) - 400*(x1 - x4)^3;

z = [z1; z2; z3; z4];
end

