clear 
clc


fa = @(x) (x.^2).*exp(-x);
fb = @(x) (x.^2 + 1).^-1;
fc = @(x) sin(x)./(x);
fd = @(x) log(x);

itv = 10e-3;

% a
ini = 0;
fim = 5;
k = ini:itv:fim;
disp("A:")
disp(trapz(k, fa(k))) % Equivalente ao inttrap
disp(trapz(k, interp1(k, fa(k), k, 'spline'))) % Equivalente aproximado ao intsplin
disp(integral(fa, ini, fim)) % Equivalente ao intg e integrate

% b
ini = 0;
fim = 10e4;
k = ini:itv:fim;

disp("B:")
disp(trapz(k, fb(k)))
disp(trapz(k, interp1(k, fb(k), k, 'spline')))
disp(integral(fb, ini, fim))

% c
ini = 10e-4;
fim = pi; 
k = ini:itv:fim;

disp("C:")
disp(trapz(k, fc(k)))
disp(trapz(k, interp1(k, fc(k), k, 'spline')))
disp(integral(fc, ini, fim))

% d
ini = 1;
fim = 5;
k = ini:itv:fim;

disp("D:")
disp(trapz(k, fd(k)))
disp(trapz(k, interp1(k, fd(k), k, 'spline')))
disp(integral(fd, ini, fim))


