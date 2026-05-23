clear; clc; clf;

% Dados (Vetores Coluna)
x_dados = [0.05; 0.15; 0.25; 0.40; 0.60; 0.85; 1.10; 1.40; 1.80; 2.20; 2.70; 3.20; 3.70; 4.00];
y_dados = [1.341; 1.625; 1.782; 1.854; 1.763; 1.521; 1.284; 1.052; 0.821; 0.654; 0.512; 0.403; 0.321; 0.285];

n = length(x_dados);
M = zeros(n, 5); % Matriz para 5 coeficientes

for i = 1:n
    xi = x_dados(i);
    yi = y_dados(i);
    % Modelo: (c1 + c2*x + c3*x^2) / (1 + c4*x + c5*x^2)
    % Linearizado: c1 + c2*x + c3*x^2 - c4*xy - c5*x^2y = y
    M(i,:) = [1, xi, xi^2, -xi*yi, -(xi^2)*yi];
end

% Resolve o sistema pelo erro mínimo entre todos os pontos (Mínimos Quadrados)
coef = M \ y_dados; 

% Gráfico
xr = min(x_dados):0.01:max(x_dados);
yr = (coef(1) + coef(2)*xr + coef(3)*xr.^2) ./ (1 + coef(4)*xr + coef(5)*xr.^2);

plot(x_dados, y_dados, 'ob'); hold on;
plot(xr, yr, 'r', 'LineWidth', 2); 

legend('Dados Fornecidos', 'Ajuste Racional');
xlabel('x'); ylabel('y');
grid on;

% Exibição dos resultados
fprintf('\nCoeficientes Encontrados:\n');
fprintf('a0 = %f\na1 = %f\na2 = %f\nb1 = %f\nb2 = %f\n', coef(1), coef(2), coef(3), coef(4), coef(5));


