clear; clc;

% Pontos (x,y)
x = [0.05; 0.75; 1.25; 2.20; 3.30]; 
y = [1.0488088; 1.5811388; 1.8708287; 2.32379; 2.7568098];

% Calculando as diferenças divididas
dx = diff(x); 
dy = diff(y)./dx; 

dx2 = x(3:end)-x(1:end-2); 
dy2 = diff(dy)./dx2; 

dx3 = x(4:end)-x(1:end-3); 
dy3 = diff(dy2)./dx3; 

dx4 = x(5:end)-x(1:end-4); 
dy4 = diff(dy3)./dx4;

% Definindo a função (como função anônima para facilitar no MATLAB)
f = @(xk) y(1) + dy(1).*(xk-x(1)) + ...
          dy2(1).*(xk-x(1)).*(xk-x(2)) + ...
          dy3(1).*(xk-x(1)).*(xk-x(2)).*(xk-x(3)) + ...
          dy4(1).*(xk-x(1)).*(xk-x(2)).*(xk-x(3)).*(xk-x(4));

% Preparando dados para exibição (opcional)
disp('   x        y        dy       dy2      dy3      dy4');
disp([x(1) y(1) dy(1) dy2(1) dy3(1) dy4(1)]); % Mostra apenas os coeficientes do topo

% Gráfico
xk = 0.01:0.01:3.5;
figure(1); clf;
plot(x,y,'ob', xk, f(xk), 'r');
xlabel('xi'); ylabel('yi');
legend('Pontos','f(x) - Polinômio');
grid on;


