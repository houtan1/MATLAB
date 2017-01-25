% Create data
dx = 0.1;
x = 0:dx:4*pi;
y = sin(x);

% Plot data
plot(x,y)
ylabel('sine')
xlabel('radians')