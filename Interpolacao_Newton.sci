clear
clc

// Pontos (x,y): 
x = [0.05; 0.75; 1.25; 2.20; 3.30]; 
y = [1.0488088; 1.5811388; 1.8708287; 2.32379; 2.7568098];
// Calculando as diferenças: 
dx = diff(x); 
dy = diff(y)./dx; 
dx2 = x(3:$)-x(1:$-2); 
dy2 = diff(dy)./dx2; 
dx3 = x(4:$)-x(1:$-3); 
dy3 = diff(dy2)./dx3; 
dx4 = x(5:$)-x(1:$-4); 
dy4 = diff(dy3)./dx4;
// Preparado para mostrar os dados: 
dx = [dx; 0]; 
dx2 = [dx2; 0; 0]; 
dx3 = [dx3; 0; 0]; 

dy = [dy; 0]; 
dy2 = [dy2; 0; 0]; 
dy3 = [dy3; 0; 0; 0]; 
dy4 = [dy4; 0; 0; 0; 0];
disp([x, y, dy, dy2, dy3, dy4]);

// Calculando o valor de f(x = 1,70): 

function px = f(xk)
    px = y(1) + dy(1).*(xk-x(1)) + dy2(1).*(xk-x(1)).*(xk-x(2)) + dy3(1).*(xk-x(1)).*(xk-x(2)).*(xk-x(3)) + dy4(1).*(xk-x(1)).*(xk-x(2)).*(xk-x(3)).*(xk-x(4)); 
endfunction
xk = 0.01:0.01:3.5; 

clf(); 
plot(x,y,'ob',xk,f(xk),'r'); 
xlabel('xi'); 
ylabel('yi'); 
legend('ontos','f(x) - reta');
xgrid;
