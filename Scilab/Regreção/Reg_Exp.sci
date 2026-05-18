clear; clc;
x = [0.1; 0.5; 1.0; 1.5; 2.0; 2.5];
y = [1.25; 1.70; 2.50; 3.61; 5.23; 7.55];

z = log(y); // Ajustamos o logaritmo de y
M = [sum(ones(x)), sum(x); sum(x), sum(x.^2)];
v = [sum(z); sum(z.*x)];

res = M\v;
a = exp(res(1)); // Voltando do logaritmo
b = res(2);

xr = 0:0.01:max(x);
yr = a * exp(b*xr);

//clf(); 
plot(x,y,'o', xr, yr, 'g');
title("Exponencial: y = " + string(a) + " * e^(" + string(b) + "x)");
xgrid;

//Com a0:

//clear; clc;

// Pontos de teste
x = [0.1; 0.5; 1.0; 1.5; 2.0; 2.5];
y = [2.25; 2.70; 3.50; 4.61; 6.23; 8.55]; // (Exemplo onde a0 aproximado é 1)

n = max(size(x));

// Para manter o seu estilo de matriz M e vetor v:
// Vamos usar um truque: f(x) = a0 + a1*exp(k*x) 
// Se k for conhecido ou estimado, o sistema fica linear.
// Aqui vamos estimar um k inicial para montar a matriz:
k_estimado = 0.8; 

// Montagem da Matriz M para encontrar [a0; a1]
// Coluna 1: Termo constante (1)
// Coluna 2: Termo exponencial (exp(k*x))
ex = exp(k_estimado * x);

M = [sum(ones(x)), sum(ex); 
     sum(ex),      sum(ex.^2)];

v = [sum(y); 
     sum(y .* ex)];

coef = M\v;

a0 = coef(1);
a1 = coef(2);

// Gráfico e Resultados
xr = 0:0.01:max(x);
yr = a0 + a1 * exp(k_estimado * xr);

//clf();
plot(x,y,'ob'); // Pontos originais
plot(xr, yr, 'r'); // Curva de ajuste

title("Ajuste Exponencial: y = " + string(a0) + " + (" + string(a1) + ") * e^(" + string(k_estimado) + "x)");
legend(['Dados Reais', 'Ajuste a0 + a1*e^(kx)']);
xgrid;

disp("Coeficientes encontrados:");
disp("a0 = " + string(a0));
disp("a1 = " + string(a1));
