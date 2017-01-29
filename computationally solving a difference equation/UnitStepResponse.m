% plotting the unit step response of a difference equation
% y(k+1)+0.5y(k)=x(k) where y(0)=0 and x(k) is a unit step sequence

num = [0 1];
den = [1 0.5];

x = ones(1,41);
v = [0 40 0 1.2];

axis(v);
k = 0:40;

y = filter(num,den,x);

plot(k,y,'o')

grid
title('Unit-Step Response')
xlabel('k')
ylabel('y(k)')