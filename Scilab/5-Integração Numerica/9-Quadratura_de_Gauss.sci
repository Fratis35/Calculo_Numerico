clear
clc
clf()

function y = f(x)
    y = exp(x) .* cos(x) 
endfunction

a = 0;   // Limite inferior
b = 1;   // Limite superior

k = a:0.01:b
plot(k,f(k))
xgrid

n_pontos = 3; 


select n_pontos
case 2 then
    t = [-1/sqrt(3), 1/sqrt(3)];
    w = [1, 1];
    
case 3 then
    t = [-sqrt(3/5), 0, sqrt(3/5)];
    w = [5/9, 8/9, 5/9];
    
case 4 then
    // Valores numéricos aproximados para 4 pontos
    t = [-0.8611363116, -0.3399810436, 0.3399810436, 0.8611363116];
    w = [0.3478548451, 0.6521451549, 0.6521451549, 0.3478548451];
    
else
    error("Número de pontos inválido! Escolha 2, 3 ou 4.");
end

//Mudança de variável para adaptar o intervalo [a, b] para [-1, 1]
x = ((b - a) / 2) * t + ((b + a) / 2);

//Avalia a função nos novos pontos
f_avaliada = f(x);

resultado = ((b - a) / 2) * sum(w .* f_avaliada);

printf("Resultado com %d pontos: %.10f\n", n_pontos, resultado);
