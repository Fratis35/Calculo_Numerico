clear
clc

// Pontos (xi, yi) disponíveis: 
x = [0.1; 0.15; 0.2; 0.6; 0.9; 1.1; 1.4; 1.5; 1.7; 2.1; 2.2;2.3; 2.4; 2.7; 3.1; 3.2]; 
y = [1.24; 1.304; 1.566; 2.548; 2.86; 3.443; 3.875; 4.133; 4.374; 5.187; 5.475; 5.852; 5.721; 6.345; 7.208; 7.312];

// Cálculos: 
M = [max(size(x)), sum(x);sum(x), sum(x.*x)]; 
v = [sum(y); sum(x.*y)]; 
ab = inv(M)*v;
// reta: 
xr = 0.05:0.01:3.4; 
yr = ab(1) + ab(2)*xr; 
close; 
plot(x,y,'o',xr,yr,'m'); 
xlabel('xi'); 
ylabel('yi'); 
legend('ontos','f(x) - reta');
Sr = y - ab(1) - ab(2)*x; Sr = sum(Sr.*Sr); 
yb = mean(y); Sy = y - yb; Sy = sum(Sy.*Sy); 
r = sqrt((Sy - Sr)/Sy); 
disp(r);
