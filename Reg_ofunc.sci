clc; clf(); 

// pontos ‘‘experimentais'': 
x_dados = [0.05; 0.15; 0.25; 0.40; 0.60; 0.85; 1.10; 1.40; 1.80; 2.20; 2.70; 3.20; 3.70; 4.00];

y_dados = [1.341; 1.625; 1.782; 1.854; 1.763; 1.521; 1.284; 1.052; 0.821; 0.654; 0.512; 0.403; 0.321; 0.285];
 // adição de ruído 

plot(xr,yr,'o');

M = zeros(5,5); 
vy = zeros(5,1); 
xk = xr(2:5:$); // pontos espaçados 
yk = yr(2:5:$); 
for k=1:5
    x = xk(k); x2 = x*x; 
    y = yk(k); 
    M(k,:) = [1, x, x2, -x*y, -x2*y];
     vy(k) = y;
end 
c = inv(M)*vy; // cálculo dos coeficientes 
disp(c);

/// Gráfico da nova função obtida: 
x = 0:0.01:4; 
y = (c(1) + c(2)*x + c(3)*x.*x)./(1 + c(4)*x + c(5)*x.*x); 
plot(x,y,'k'); 
legend('pontos','função com racional'); 
xlabel('x'); ylabel('f(x)');
xgrid;
