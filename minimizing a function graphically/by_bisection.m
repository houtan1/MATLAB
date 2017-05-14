%--------------------------------------------------------------------------
% Minimizing a function graphically by bisection
% Q 1.2
% minimize   f(x) = x2 - 8/x1
% subject to c1(x) = x1/5 - x2 >= 0
%            c2(x) = 16 - (x1 - 5)^2 - x2^2 >= 0
%--------------------------------------------------------------------------
% Setup the problem. Hold should be on. Minor grid axis is on. Aspect
% ratio is 1 to 1 to 1.
%--------------------------------------------------------------------------
figure(2);
pbaspect([1 1 1]);
hold on;
grid on;
grid minor;
%--------------------------------------------------------------------------
% plot c1(x) = x2 = x1/5
%--------------------------------------------------------------------------
two_x1 = [-100:1:100];
two_x2 = (two_x1)/5;
plot (two_x1, two_x2);
%--------------------------------------------------------------------------
% plot c2(x) = (x1 - 5)^2 + x2^2 = 16
% done by hand, a circle of radius 4 centered at [5 0]
%--------------------------------------------------------------------------
x = 5;
y = 0;
r = 4;
th = 0:pi/50:2*pi;
xunit = r * cos(th) + x;
yunit = r * sin(th) + y;
plot(xunit, yunit);
%--------------------------------------------------------------------------
% plot the exponential for the function f(x) = x2 = 8/x1 (and shifted - c)
%--------------------------------------------------------------------------
fx1 = [-100:1:100];
f = 8./fx1;
plot (fx1, f);
c = 8;
fx2 = [-100:1:100];
f2 = (8./fx1) - c;
plot (fx2, f2);
c = 9;
fx2 = [-100:1:100];
f2 = (8./fx1) - c;
plot (fx2, f2);
hold off
%--------------------------------------------------------------------------
% [MODIFIED] ex1_5_new.m by W.-S. Lu
% This function uses a bisection method to identify
% radius r with which the contour circle tangents to 
% the parabola, see the analysis in Example 1.5 of the
% lecture notes. Using this r, the function also computes 
% the minimizer of the constrained optimization problem.
% Input: epsi -- acceptable tolerance for the uncertainty
%                range for radius r.
% Outputs:  x -- the minimizer
%           r -- value of the radius 
%           k -- number of iterations used.
% Example: [x,r,k] = ex1_5_new(1e-8);
epsi = 1e-27;
rl = -9;
ru = -6;
d = ru - rl;
k = 0;
while d > epsi,
  r = 0.5*(rl+ru);
  rts = roots([1 -10 (9+r.^2) 16.*r 64]);
  im1 = imag(rts(1));
  im2 = imag(rts(3));
    if im1*im2 ~= 0,
      rl = r;
    else
      ru = r;
    end
  d=d/2; 
  k = k+1;
end
r = ru;
disp('the roots with the final ru are')
rts=roots([1 -10 (9+r^2) 16*r 64])
xc = [];
for i = 1:4,
    if imag(rts(i)) == 0,
    xc = [xc rts(i)];
    end
end
x1 = mean(xc);
x2 = 8./x1;
disp('the optimized value of r is')
r = sqrt((x1-5)^2+x2^2)
disp('the minimizer is')
x = [x1 x2]'
disp('number of iterations used:')
k