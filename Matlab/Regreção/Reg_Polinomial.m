x = [0.1; 0.15; 0.2; 0.6; 0.9; 1.1; 1.4; 1.5; 1.7; 2.1; 2.2; 2.3; 2.4; 2.7; 3.1; 3.2; 3.3; 3.4]; 
y = [1.048; 1.391; 1.32; 1.794; 2.155; 2.471; 2.705; 2.561; 2.605; 3.028; 3.01; 3.116; 3.163; 3.27; 3.35; 3.418; 3.50; 3.53]

// Cálculos: 
M = [max(size(x)), sum(x);sum(x), sum(x.*x)]; 
v = [sum(y); sum(x.*y)]; ab = inv(M)*v;

xr = x(1):0.01:x(max(size(x))); 

// reta: 
yr = ab(1) + ab(2)*xr; 
close; plot(x,y,'o',xr,yr,'m'); 
xlabel('xi'); ylabel('yi'); 
yri = ab(1) + ab(2)*x; 
e = y - yri; 
e2r = sum(e.*e);

// Cálculos: 
M = [max(size(x)), sum(x), sum(x.*x);sum(x), sum(x.*x), sum(x.*x.*x); sum(x.*x), sum(x.*x.*x), sum(x.*x.*x.*x)];
v = [sum(y); sum(x.*y); sum(x.*y.*x)]; abc = inv(M)*v;
// parábola: 
yr = abc(1) + abc(2)*xr + abc(3)*xr.*xr; 
plot(xr,yr,'m'); 
yri = abc(1) + abc(2)*x + abc(3)*x.*x; 
e = y - yri; e2p = sum(e.*e);

M = [max(size(x)), sum(x), sum(x.*x), sum(x.*x.*x); 
  sum(x), sum(x.*x), sum(x.*x.*x), sum(x.*x.*x.*x);
  sum(x.*x), sum(x.*x.*x), sum(x.*x.*x.*x), sum(x.*x.*x.*x.*x);
  sum(x.*x.*x), sum(x.*x.*x.*x), sum(x.*x.*x.*x.*x), sum(x.*x.*x.*x.*x.*x)]
v = [sum(y); sum(x.*y); sum(x.*y.*x); sum(x.*y.*x.*x)]; 
f = inv(M)*v;

// cúbica: 
yr = f(1) + f(2)*xr + f(3)*xr.*xr + f(4)*xr.*xr.*xr; 
plot(xr,yr,'k'); 
yri = f(1) + f(2)*x + f(3)*x.*x + f(4)*x.*x.*x; 
e = y - yri; e2c = sum(e.*e);
legend('pontos','f(x) - reta','f(x) - 2o. grau','f(x) - 3o. grau'); 
title(['Soma dos erros (r, p, c): ',string([e2r, e2p, e2c])]);

