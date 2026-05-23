clear; clc; 

% Exponencial simples
x = [0.1; 0.5; 1.0; 1.5; 2.0; 2.5]; 
y = [1.25; 1.70; 2.50; 3.61; 5.23; 7.55]; 

z = log(y); 
M = [sum(ones(size(x))), sum(x); sum(x), sum(x.^2)]; 
v = [sum(z); sum(z.*x)]; 

res = M\v; 
a = exp(res(1)); 
b = res(2); 

xr = 0:0.01:max(x); 
yr = a * exp(b*xr); 

figure(1); clf;
plot(x,y,'o', xr, yr, 'g'); 
title(["Exponencial: y = " + num2str(a) + " * e^(" + num2str(b) + "x)"]); 
grid on; 

% Exponencial com a0
x = [0.1; 0.5; 1.0; 1.5; 2.0; 2.5]; 
y = [2.25; 2.70; 3.50; 4.61; 6.23; 8.55]; 

k_estimado = 0.8; 
ex = exp(k_estimado * x); 

M = [sum(ones(size(x))), sum(ex); sum(ex), sum(ex.^2)]; 
v = [sum(y); sum(y .* ex)]; 

coef = M\v; 
a0 = coef(1); 
a1 = coef(2); 

xr = 0:0.01:max(x); 
yr = a0 + a1 * exp(k_estimado * xr); 

figure(2); clf;
plot(x,y,'ob'); hold on;
plot(xr, yr, 'r'); 
title(["Ajuste Exponencial: y = " + num2str(a0) + " + (" + num2str(a1) + ") * e^(" + num2str(k_estimado) + "x)"]); 
legend('Dados Reais', 'Ajuste a0 + a1*e^(kx)'); 
grid on; 

disp("Coeficientes encontrados:"); 
disp(["a0 = " + num2str(a0)]); 
disp(["a1 = " + num2str(a1)]);



