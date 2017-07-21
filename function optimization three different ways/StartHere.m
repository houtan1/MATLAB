x0a = [-2; -1; 1; 2];
x0b = [200; -200; 100; -100];
epsi = 1e-6;

%[xs, fs, k] = steep_desc3('a1_f', 'a1_g', x0a, epsi);
%[xs, fs, k] = steep_desc3('a1_f', 'a1_g', x0b, epsi);

d = 0.1;
%[xs, fs, k] = newton('a1_f', 'a1_g', 'a1_h', x0a, d, epsi);
%[xs, fs, k] = newton('a1_f', 'a1_g', 'a1_h', x0b, d, epsi);

%[xs, fs, k] = gauss_newton('a1_f', 'a1_g', 'a1_j', x0a, epsi);
%[xs, fs, k] = gauss_newton('a1_f', 'a1_g', 'a1_j', x0b, epsi);

% Timing Newton and Gauss-Newton methods using CPUtime and 1000 iterations.
t0 = cputime;
for i = 1:1000
    newton('a1_f', 'a1_g', 'a1_h', x0a, d, epsi);
end
tf = cputime;
t1 = (tf - t0)/1000;

t0 = cputime;
for i = 1:1000
    newton('a1_f', 'a1_g', 'a1_h', x0b, d, epsi);
end
tf = cputime;
t2 = (tf - t0)/1000;

t0 = cputime;
for i = 1:1000
    gauss_newton('a1_f', 'a1_g', 'a1_j', x0a, epsi);
end
tf = cputime;
t3 = (tf - t0)/1000;

t0 = cputime;
for i = 1:1000
    gauss_newton('a1_f', 'a1_g', 'a1_j', x0b, epsi);
end
tf = cputime;
t4 = (tf - t0)/1000;