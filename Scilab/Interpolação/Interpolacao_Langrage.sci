/// Pontos: 
d = [0., 0.25 ,0.3894004;1., 1., 0.7357589 ;2. ,1.75 ,0.6082088; 3. ,2.5, 0.4104250; 4. ,3.25 ,0.2520324 ;5., 4. ,0.1465251 ;6. ,4.75, 0.0821911];
x = d(:,2); // x: 2a. coluna

y = d(:,3); // y: 3a. coluna 
P = ones(x); // Produtório - inicialização 
N = max(size(x)); // Número de pontos 

xi = 2.10; // valor a ser interpolado 
  
for k=1:N
    for n=1:N 
        if (abs(n-k)>0)
            then 
            P(k) = P(k)*(xi-x(n))/(x(k)-x(n));
        end; 
    end
end 
px = sum(P.*y); // ponto calculado
disp(px)
clf();
plot(x, y, 'ob'); // Pontos originais
plot(xi,px,'or');
xlabel('xi'); ylabel('yi');
xgrid;
