clear; clc; clf;

% Dados (Garante que sejam vetores coluna)
x = [0; 0.5; 1.0; 1.5; 2.0; 2.5; 3.0; 3.5; 4.0];
y = [1.1; 1.9; 2.4; 1.8; 0.9; 0.2; 0.3; 1.1; 2.0];
x = x(:); y = y(:);

% Busca da melhor frequência (w) para maior precisão
frequencias = 0.1:0.01:3.0;
melhor_erro = inf;
w_ideal = 1.5;

for w_teste = frequencias
    c = cos(w_teste * x);
    s = sin(w_teste * x);
    
    % Montagem da Matriz M e vetor v (estilo Mínimos Quadrados)
    M = [sum(ones(size(x))), sum(c), sum(s);
         sum(c), sum(c.^2), sum(c.*s);
         sum(s), sum(c.*s), sum(s.^2)];
    v = [sum(y); sum(y.*c); sum(y.*s)];
    
    % Coeficientes para este w_teste
    coef_t = M \ v;
    
    % Cálculo do erro quadrático
    y_aj = coef_t(1) + coef_t(2)*c + coef_t(3)*s;
    erro = sum((y - y_aj).^2);
    
    % Guarda o melhor resultado
    if erro < melhor_erro
        melhor_erro = erro;
        w_ideal = w_teste;
        coef = coef_t;
    end
end

% Gerando a curva suave para o gráfico
xr = 0:0.01:4;
yr = coef(1) + coef(2)*cos(w_ideal*xr) + coef(3)*sin(w_ideal*xr);

% Plotagem
plot(x, y, 'ob', 'MarkerFaceColor', 'b'); hold on;
plot(xr, yr, 'r', 'LineWidth', 2);
grid on;

title(['Ajuste Senoidal: w = ' num2str(w_ideal) ' | Erro: ' num2str(melhor_erro)]);
xlabel('x'); ylabel('f(x)');
legend('Dados Reais', 'Ajuste Otimizado');

% Exibição dos resultados no console
fprintf('\n--- Ajuste de Alta Precisão (MATLAB) ---\n');
fprintf('Frequência (w) encontrada: %f\n', w_ideal);
fprintf('a0 (Constante) = %f\n', coef(1));
fprintf('a1 (cos)       = %f\n', coef(2));
fprintf('a2 (sin)       = %f\n', coef(3));
fprintf('Erro Total     = %f\n', melhor_erro);

