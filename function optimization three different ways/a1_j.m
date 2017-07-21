function z = a1_j(x)
%A1_J Summary of this function goes here
%   Detailed explanation goes here
x1 = x(1);
x2 = x(2);
x3 = x(3);
x4 = x(4);

z11 = 1;
z12 = 10;
z13 = 0;
z14 = 0;

z21 = 0;
z22 = 0;
z23 = sqrt(5);
z24 = -sqrt(5);

z31 = 0;
z32 = 2*(x2 - 2*x3);
z33 = -4*(x2 - 2*x3);
z34 = 0;

z41 = 20*(x1 - x4);
z42 = 0;
z43 = 0;
z44 = -20*(x1 - x4);

z = [z11, z12, z13, z14; z21, z22, z23, z24; z31, z32, z33, z34;...
    z41, z42, z43, z44];

end

