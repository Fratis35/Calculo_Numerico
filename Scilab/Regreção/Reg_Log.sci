clear; clc;

x = [0.1; 0.5; 1.1; 1.5; 2.2; 3.1; 3.8];
y = [0.05; 1.21; 2.35; 2.70; 3.41; 3.90; 4.25];

// Transformação: tratamos ln(x) como uma nova variável
z = log(x); 
M = [sum(ones(x)), sum(z); sum(z), sum(z.^2)];
v = [sum(y); sum(y.*z)];

coef = M\v; // coef(1) é a0, coef(2) é a1

xr = 0.1:0.01:max(x);
yr = coef(1) + coef(2)*log(xr);

clf(); 
plot(x,y,'o', xr, yr, 'r');
title("Ajuste Logarítmico: y = " + string(coef(1)) + " + " + string(coef(2)) + " * ln(x)");
xgrid;
disp("Ajuste Logarítmico: y = " + string(coef(1)) + " + " + string(coef(2)) + " * ln(x)");
