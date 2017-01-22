%-- computationally solving a difference equation
%-- with a unit step response

%-- Original difference equation:
% x(k+2)-x(k+1)+0.25x(k)=u(k+2)

num = [1 0 0 0];
den = [1 -2 1.25 -0.25];

u = [1 zeros(1,41)];

x = filter(num,den,u);

%-- the columns 1 to 42 show increasing values from 1.0 flattening at 4.0
%-- let's graph this

%%u = ones(1,41);
v = [0 40 0 5];
axis(v);
k = 0:41;
%%x = filter(num,den,u);
plot(k,x,'o');
grid
title('unit step resp')
xlabel('k')
ylabel('x(k)')
axis([0 45 0 5])