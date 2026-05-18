clear; clc; clf();

//Dados:
x_dados = [0.05; 0.15; 0.25; 0.40; 0.60; 0.85; 1.10; 1.40; 1.80; 2.20; 2.70; 3.20; 3.70; 4.00];

y_dados = [1.341; 1.625; 1.782; 1.854; 1.763; 1.521; 1.284; 1.052; 0.821; 0.654; 0.512; 0.403; 0.321; 0.285];



n = max(size(x_dados));
M = zeros(n, 5); // Matriz para 5 coeficientes

for i = 1:n
    xi = x_dados(i);
    yi = y_dados(i);
    // Modelo: (c1 + c2*x + c3*x^2) / (1 + c4*x + c5*x^2)
    M(i,:) = [1, xi, xi^2, -xi*yi, -(xi^2)*yi];
end

// Resolve o sistema pelo erro mínimo entre todos os pontos
coef = M \ y_dados; 

xr = min(x_dados):0.01:max(x_dados);
yr = (coef(1) + coef(2)*xr + coef(3)*xr.^2) ./ (1 + coef(4)*xr + coef(5)*xr.^2);

plot(x_dados, y_dados, 'ob'); // Pontos em azul
plot(xr, yr, 'r', 'thickness', 2); // Curva de ajuste em vermelho

legend(['Dados Fornecidos', 'Ajuste Racional']);
xlabel('x'); ylabel('y');
xgrid;

mprintf("\nCoeficientes Encontrados:\n");
mprintf("a0 = %f\na1 = %f\na2 = %f\nb1 = %f\nb2 = %f\n", coef(1), coef(2), coef(3), coef(4), coef(5));
