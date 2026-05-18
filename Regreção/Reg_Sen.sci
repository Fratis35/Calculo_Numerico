clear; clc; clf();

x = [0; 0.5; 1.0; 1.5; 2.0; 2.5; 3.0; 3.5; 4.0]; 
y = [1.1; 1.9; 2.4; 1.8; 0.9; 0.2; 0.3; 1.1; 2.0];
x = x(:); y = y(:); 

frequencias = 0.1:0.01:3.0;
melhor_erro = %inf;
w_ideal = 1.5;

for w_teste = frequencias
    c = cos(w_teste * x);
    s = sin(w_teste * x);
    M = [sum(ones(x)), sum(c), sum(s); 
         sum(c), sum(c.^2), sum(c.*s); 
         sum(s), sum(c.*s), sum(s.^2)];
    v = [sum(y); sum(y.*c); sum(y.*s)];
    coef_t = M \ v;
    y_aj = coef_t(1) + coef_t(2)*c + coef_t(3)*s;
    erro = sum((y - y_aj).^2);
    if erro < melhor_erro then
        melhor_erro = erro;
        w_ideal = w_teste;
        coef = coef_t;
    end
end

// Montando a string da função para exibição
texto_funcao = "f(x) = " + string(coef(1)) + " + (" + string(coef(2)) + ")*cos(" + string(w_ideal) + "x) + (" + string(coef(3)) + ")*sin(" + string(w_ideal) + "x)";

// Curva para o gráfico
xr = 0:0.01:4;
yr = coef(1) + coef(2)*cos(w_ideal*xr) + coef(3)*sin(w_ideal*xr);

plot(x, y, 'ob'); 
plot(xr, yr, 'r', 'thickness', 2);
title([texto_funcao]); // Mostra a função no título
xgrid;

// Mostra a função no console
mprintf("\n--- Equação Final ---\n");
mprintf("%s\n", texto_funcao);
mprintf("\nErro Total: %f\n", melhor_erro);
