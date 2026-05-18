clear
clc


x = [0.1; 0.15; 0.2; 0.6; 0.9; 1.1; 1.4; 1.5; 1.7; 2.1; 2.2; 2.3; 2.4; 2.7; 3.1; 3.2; 3.3; 3.4];
y = [1.048; 1.391; 1.32; 1.794; 2.155; 2.471; 2.705; 2.561; 2.605; 3.028; 3.01; 3.116; 3.163; 3.27; 3.35; 3.418; 3.50; 3.53];

p = 7; //Grau

n = max(size(x));
M = zeros(p+1, p+1);
v = zeros(p+1, 1);

for i = 1:(p+1)
    for j = 1:(p+1)
        M(i,j) = sum(x.^( (i-1) + (j-1) ));
    end
    v(i) = sum(y .* (x.^(i-1)));
end

coef = inv(M)*v; 

xr = min(x):0.01:max(x);
yr = zeros(xr);
for i = 1:(p+1)
    yr = yr + coef(i) * (xr.^(i-1));
end

//Erro
y_ajustado = zeros(x);
for i = 1:(p+1)
    y_ajustado = y_ajustado + coef(i) * (x.^(i-1));
end
e = y - y_ajustado;
e2 = sum(e.*e);

//Grafico
clf();
plot(x, y, 'o'); // Pontos originais
plot(xr, yr, 'm'); // Curva de ajuste
xlabel('xi'); ylabel('yi');
title("Ajuste Polinomial de Grau " + string(p) + " | Erro: " + string(e2));
legend(['Dados Reais', 'Polinômio p=' + string(p)]);
xgrid;

disp("Coeficientes (do menor grau para o maior):", coef);
disp("Erro total:", e2);
mprintf("Equação:\n")
for i = (p+1):-1:2
   mprintf("(%f*(x.^%i)) + ",coef(i),i-1) 
end
mprintf("(%f)",coef(1)) 

