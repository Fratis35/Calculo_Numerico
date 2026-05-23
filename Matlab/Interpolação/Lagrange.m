clear; clc;

% Pontos
d = [0, 0.25 ,0.3894004; 
     1, 1.   ,0.7357589; 
     2, 1.75 ,0.6082088; 
     3, 2.5  ,0.4104250; 
     4, 3.25 ,0.2520324; 
     5, 4.   ,0.1465251; 
     6, 4.75 ,0.0821911];

x = d(:,2); 
y = d(:,3); 
N = length(x);
P = ones(N,1); 
xi = 2.10; % Valor a ser interpolado

for k=1:N
    for n=1:N
        if (abs(n-k) > 0)
            P(k) = P(k)*(xi-x(n))/(x(k)-x(n));
        end
    end
end

px = sum(P.*y); 

fprintf('O valor interpolado em xi = %.2f é: %f\n', xi, px);

figure(2); clf;
plot(x, y, 'ob'); hold on;
plot(xi, px, 'or', 'MarkerFaceColor', 'r');
xlabel('xi'); ylabel('yi');
grid on;
legend('Pontos Originais', 'Ponto Interpolado');


