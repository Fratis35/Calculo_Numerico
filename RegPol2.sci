clear
clc

// Pontos (xi, yi) disponíveis: 
x = [0.1; 0.15; 0.2; 0.6; 0.9; 1.1; 1.4; 1.5; 1.7; 2.1; 2.2; 2.3; 2.4; 2.7; 3.1; 3.2; 3.3; 3.4]; 
y = [1.048; 1.391; 1.32; 1.794; 2.155; 2.471; 2.705; 2.561; 2.605; 3.028; 3.01; 3.116; 3.163; 3.27; 3.35; 3.418; 3.50; 3.53];

// Cálculos: 
M = [max(size(x)), sum(x), sum(x.*x); sum(x), sum(x.*x), sum(x.*x.*x); sum(x.*x), sum(x.*x.*x), sum(x.*x.*x.*x)]
v = [sum(y); sum(x.*y); sum(x.*y.*x)]; 
abc = inv(M)*v;

// parábola: 
xr = 0.05:0.01:3.6; 
yr = abc(1) + abc(2)*xr + abc(3)*xr.*xr; 
plot(x,y,'o',xr,yr,'m'); 
xlabel('xi'); ylabel('yi'); 
legend('pontos','f(x) - 2o. grau');
