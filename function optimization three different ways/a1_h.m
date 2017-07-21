function z = a1_h(x)
%A1_H Summary of this function goes here
%   Detailed explanation goes here
x1 = x(1);
x2 = x(2);
x3 = x(3);
x4 = x(4);

z11 = 2 + 1200*(x1 - x4)^2;
z12 = 20;
z13 = 0;
z14 = -1200*(x1 - x4)^2;

z21 = 20;
z22 = 200 + 12*(x2 - 2*x3)^2;
z23 = -24*(x2 - 2*x3)^2;
z24 = 0;

z31 = 0;
z32 = -24*(x2 - 2*x3)^2;
z33 = 10 + 48*(x2 - 2*x3)^2;
z34 = -10;

z41 = -1200*(x1 - x4)^2;
z42 = 0;
z43 = -10;
z44 = 10 + 1200*(x1 - x4)^2;

z = [z11, z12, z13, z14; z21, z22, z23, z24; z31, z32, z33, z34;...
    z41, z42, z43, z44];

end

